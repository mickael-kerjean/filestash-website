---
title: What the latest OpenSSH security issue is actually about
description: Running a simple SMB server on debian or ubuntu under 2 minutes
layout: post
language: en
tags: sftp
---

[CVE-2024-6387](https://www.qualys.com/2024/07/01/cve-2024-6387/regresshion.txt) is a scary security flaw in the world most used SSH and SFTP server: [OpenSSH](https://github.com/openssh/openssh-portable). It allows unauthenticated remote code execution as root and is affecting many millions of internet-facing servers.

OpenSSH did publish a [patch](https://github.com/openssh/openssh-portable/commit/81c1099d22b81ebfd20a334ce986c4f753b0db29). If that's not done already, let's install the [new release](https://www.openssh.com/txt/release-9.8):
<div class="terminal">
<span class="prompt">~/$ </span>sudo apt update && sudo apt install openssh-server<br>
<span class="stdout">
Hit:1 http://deb.debian.org/debian bookworm InRelease<br>
Hit:2 http://security.debian.org/debian-security bookworm-security InRelease<br>
Hit:3 http://deb.debian.org/debian bookworm-updates InRelease<br>
Hit:4 https://linux.dell.com/repo/community/openmanage/930/bionic bionic InRelease<br>
Reading package lists... Done<br>
Building dependency tree... Done<br>
Reading state information... Done<br>
94 packages can be upgraded. Run 'apt list --upgradable' to see them.<br>
W: http://linux.dell.com/repo/community/openmanage/930/bionic/dists/bionic/InRelease: Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg), see the DEPRECATION section in apt-key(8) for details.<br>
Reading package lists... Done<br>
Building dependency tree... Done<br>
Reading state information... Done<br>
The following additional packages will be installed:<br>
&nbsp;&nbsp;libssl3 openssh-client openssh-sftp-server openssl<br>
Suggested packages:<br>
&nbsp;&nbsp;keychain libpam-ssh monkeysphere ssh-askpass molly-guard ufw<br>
The following packages will be upgraded:<br>
&nbsp;&nbsp;libssl3 openssh-client openssh-server openssh-sftp-server openssl<br>
5 upgraded, 0 newly installed, 0 to remove and 89 not upgraded.<br>
Need to get 4,952 kB of archives.<br>
After this operation, 1,024 B of additional disk space will be used.<br>
Do you want to continue? [Y/n]</span>Y<span class="stdout"><br>
Get:1 http://security.debian.org/debian-security bookworm-security/main amd64 openssh-sftp-server amd64 1:9.2p1-2+deb12u3 [65.8 kB]<br>
Get:2 http://deb.debian.org/debian bookworm/main amd64 libssl3 amd64 3.0.13-1~deb12u1 [2,022 kB]<br>
Get:3 http://security.debian.org/debian-security bookworm-security/main amd64 openssh-server amd64 1:9.2p1-2+deb12u3 [456 kB]<br>
Get:4 http://security.debian.org/debian-security bookworm-security/main amd64 openssh-client amd64 1:9.2p1-2+deb12u3 [991 kB]<br>
Get:5 http://deb.debian.org/debian bookworm/main amd64 openssl amd64 3.0.13-1~deb12u1 [1,418 kB]<br>
Fetched 4,952 kB in 2s (2,032 kB/s)<br>
Reading changelogs... Done<br>
Preconfiguring packages ...<br>
(Reading database ... 74084 files and directories currently installed.)<br>
Preparing to unpack .../libssl3_3.0.13-1~deb12u1_amd64.deb ...<br>
Unpacking libssl3:amd64 (3.0.13-1~deb12u1) over (3.0.11-1~deb12u2) ...<br>
Preparing to unpack .../openssh-sftp-server_1%3a9.2p1-2+deb12u3_amd64.deb ...<br>
Unpacking openssh-sftp-server (1:9.2p1-2+deb12u3) over (1:9.2p1-2+deb12u2) ...<br>
Preparing to unpack .../openssh-server_1%3a9.2p1-2+deb12u3_amd64.deb ...<br>
Unpacking openssh-server (1:9.2p1-2+deb12u3) over (1:9.2p1-2+deb12u2) ...<br>
Preparing to unpack .../openssh-client_1%3a9.2p1-2+deb12u3_amd64.deb ...<br>
Unpacking openssh-client (1:9.2p1-2+deb12u3) over (1:9.2p1-2+deb12u2) ...<br>
Preparing to unpack .../openssl_3.0.13-1~deb12u1_amd64.deb ...<br>
Unpacking openssl (3.0.13-1~deb12u1) over (3.0.11-1~deb12u2) ...<br>
Setting up libssl3:amd64 (3.0.13-1~deb12u1) ...<br>
Setting up openssl (3.0.13-1~deb12u1) ...<br>
Setting up openssh-client (1:9.2p1-2+deb12u3) ...<br>
Setting up openssh-sftp-server (1:9.2p1-2+deb12u3) ...<br>
Setting up openssh-server (1:9.2p1-2+deb12u3) ...<br>
rescue-ssh.target is a disabled or a static unit not running, not starting it.<br>
ssh.socket is a disabled or a static unit not running, not starting it.<br>
Processing triggers for man-db (2.11.2-2) ...<br>
Processing triggers for libc-bin (2.36-9+deb12u4) ...<br>
</span>
</div>

The security flaw is a signal handler race condition in sshd (aka the openssh daemon). In its default configuration, whenever a client does not authenticate within ["LoginGraceTime"](https://github.com/openssh/openssh-portable/blob/30c8c81da2169e78357d08dbb0ddd823b60e93bc/sshd_config#L31) seconds, openssh server will call the [SIGALARM handler](https://github.com/openssh/openssh-portable/blob/30c8c81da2169e78357d08dbb0ddd823b60e93bc/sshd-session.c#L1213) in an asynchronous way but this handler does use some non async signal safe functions, oops.

To exploit the issue, the security team who reported the issue did manage to find a path that when interrupted at the right time by SIGALRM, leaves sshd in an inconsistent state, state that is then exploited inside the SIGALRM handler.

Practically speaking, they were able to do exactly this by interrupting a call to both a free() and malloc() with a SIGALRM within the sshd public-key parsing code, leaving the heap in an inconsistent state, and exploit this inconsistent state in another call to free() and malloc(), within the syslog calls of the SIGALRM handler.

The Qualys report goes onto great details about the exploitation of such issue which is nothing less than amazing:

```
------------------------------------------------------------------------
Theory
------------------------------------------------------------------------

    But that's not like me, I'm breaking free
        -- The Interrupters, "Haven't Seen the Last of Me"

The SIGALRM handler of this OpenSSH version calls packet_close(), which
calls buffer_free(), which calls xfree() and hence free(), which is not
async-signal-safe:

------------------------------------------------------------------------
 302 grace_alarm_handler(int sig)
 303 {
 ...
 307         packet_close();
------------------------------------------------------------------------
 329 packet_close(void)
 330 {
 ...
 341         buffer_free(&input);
 342         buffer_free(&output);
 343         buffer_free(&outgoing_packet);
 344         buffer_free(&incoming_packet);
------------------------------------------------------------------------
 35 buffer_free(Buffer *buffer)
 36 {
 37         memset(buffer->buf, 0, buffer->alloc);
 38         xfree(buffer->buf);
 39 }
------------------------------------------------------------------------
 51 xfree(void *ptr)
 52 {
 53         if (ptr == NULL)
 54                 fatal("xfree: NULL pointer given as argument");
 55         free(ptr);
 56 }
------------------------------------------------------------------------

Consequently, we started to read the malloc code of this Debian's glibc
(2.2.5), to see if a first call to free() can be interrupted by SIGALRM
and exploited during a second call to free() inside the SIGALRM handler
(at lines 341-344, above). Because this glibc's malloc is not hardened
against the unlink() technique pioneered by Solar Designer in 2000, we
quickly spotted an interesting code path in chunk_free() (which is
called internally by free()):

------------------------------------------------------------------------
1028 struct malloc_chunk
1029 {
1030   INTERNAL_SIZE_T prev_size; /* Size of previous chunk (if free). */
1031   INTERNAL_SIZE_T size;      /* Size in bytes, including overhead. */
1032   struct malloc_chunk* fd;   /* double links -- used only if free. */
1033   struct malloc_chunk* bk;
1034 };
------------------------------------------------------------------------
2516 #define unlink(P, BK, FD)                                           \
2517 {                                                                   \
2518   BK = P->bk;                                                       \
2519   FD = P->fd;                                                       \
2520   FD->bk = BK;                                                      \
2521   BK->fd = FD;                                                      \
2522 }                                                                   \
------------------------------------------------------------------------
3160 chunk_free(arena *ar_ptr, mchunkptr p)
....
3164 {
3165   INTERNAL_SIZE_T hd = p->size; /* its head field */
....
3177   sz = hd & ~PREV_INUSE;
3178   next = chunk_at_offset(p, sz);
3179   nextsz = chunksize(next);
....
3230   if (!(inuse_bit_at_offset(next, nextsz)))   /* consolidate forward */
3231   {
....
3241       unlink(next, bck, fwd);
....
3244   }
3245   else
3246     set_head(next, nextsz);                  /* clear inuse bit */
....
3251     frontlink(ar_ptr, p, sz, idx, bck, fwd);
------------------------------------------------------------------------

To exploit this code path, we arrange for sshd's heap to have the
following layout (chunk_X, chunk_Y, and chunk_Z are malloc()ated chunks
of memory, and p, s, f, b are their prev_size, size, fd, and bk fields):

-----|---+---------------|---+---------------|---+---------------|-----
 ... |p|s|f|b|  chunk_X  |p|s|f|b|  chunk_Y  |p|s|f|b|  chunk_Z  | ...
-----|---+---------------|---+---------------|---+---------------|-----
                             |<------------->|
                                 user data

- First, if a call to free(chunk_Y) is interrupted by SIGALRM *after*
  line 3246 but *before* line 3251, then chunk_Y is already marked as
  free (because chunk_Z's PREV_INUSE bit is cleared at line 3246) but it
  is not yet linked into its doubly-linked list (at line 3251): in other
  words, chunk_Y's fd and bk pointers still contain user data (attacker-
  controlled data).

- Second, if (inside the SIGALRM handler) packet_close() calls
  free(chunk_X), then the code block at lines 3230-3244 is entered
  (because chunk_Y is marked as free) and chunk_Y is unlink()ed (at line
  3241): a so-called aa4bmo primitive (almost arbitrary 4 bytes mirrored
  overwrite), because chunk_Y's fd and bk pointers are still attacker-
  controlled. For more information on the unlink() technique and the
  aa4bmo primitive:

  https://www.openwall.com/articles/JPEG-COM-Marker-Vulnerability#exploit
  http://phrack.org/issues/61/6.html#article

- Last, with this aa4bmo primitive we overwrite the glibc's __free_hook
  function pointer (this old Debian version does not have ASLR, nor NX)
  with the address of our shellcode in the heap, thus achieving remote
  code execution during the next call to free() in packet_close().

------------------------------------------------------------------------
Practice
------------------------------------------------------------------------

    Now they're taking over and they got complete control
        -- The Interrupters, "Liberty"

To mount this attack against sshd, we interrupt a call to free() inside
sshd's parsing code of a DSA public key (i.e., line 144 below is our
free(chunk_Y)) and exploit it during one of the free() calls in
packet_close() (i.e., one of the lines 341-344 above is our
free(chunk_X)):

------------------------------------------------------------------------
136 buffer_get_bignum2(Buffer *buffer, BIGNUM *value)
137 {
138         u_int len;
139         u_char *bin = buffer_get_string(buffer, &len);
...
143         BN_bin2bn(bin, len, value);
144         xfree(bin);
145 }
------------------------------------------------------------------------

Initially, however, we were never able to win this race condition (i.e.,
interrupt the free() call at line 144 at the right time). Eventually, we
realized that we could greatly improve our chances of winning this race:
the DSA public-key parsing code allows us to call free() four times (at
lines 704-707 below), and furthermore sshd allows us to attempt six user
authentications (AUTH_FAIL_MAX); if any one of these 24 free() calls is
interrupted at the right time, then we later achieve remote code
execution inside the SIGALRM handler.

------------------------------------------------------------------------
678 key_from_blob(u_char *blob, int blen)
679 {
...
693         switch (type) {
...
702         case KEY_DSA:
703                 key = key_new(type);
704                 buffer_get_bignum2(&b, key->dsa->p);
705                 buffer_get_bignum2(&b, key->dsa->q);
706                 buffer_get_bignum2(&b, key->dsa->g);
707                 buffer_get_bignum2(&b, key->dsa->pub_key);
------------------------------------------------------------------------

With this improvement, we finally won the race condition after ~1 month:
we were happy (and did a root-shell dance), but we also felt that there
was still room for improvement.
```

wow
