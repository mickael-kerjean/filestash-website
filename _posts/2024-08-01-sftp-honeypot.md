---
title: Running an SFTP Honeypot
description: Setup a SFTP honeypot to detect potential issues in your network
layout: post
language: en
tags: sftp
---

Honeypots are great tools to detect an intrusion in your network. The idea is to setup some fake services that have no other purpose than logging the activity of an attacker.

In this post, we will setup one of such tool that goes with the name of [Cowrie SSH honeypot](https://github.com/cowrie/cowrie) and can be used not only for SSH but also SFTP. Setting it up is as simple as:

<div class="terminal">
<span class="prompt">~ # </span>docker pull cowrie/cowrie:latest<br>
<span class="stdout">
latest: Pulling from cowrie/cowrie<br>
f531499c6b73: Already exists<br>
e8d9a567199d: Already exists<br>
...<br>
...<br>
0bdabdbb5012: Already exists<br>
eecb68a89556: Already exists<br>
4f4fb700ef54: Already exists<br>
Digest: sha256:ca5bdeb93cc53b79b0784cfb59c00626a5dcb393e06d35be0dc7ad13b85e32f2<br>
Status: Downloaded newer image for cowrie/cowrie:latest<br>
docker.io/cowrie/cowrie:latest<br>
</span>
</div>

followed by:

<div class="terminal">
<span class="prompt">~ # </span>docker run -p 2222:2222 cowrie/cowrie:latest<br>
<span class="stdout">
...<br>
2024-08-06T06:39:08+0000 [-] Python Version 3.11.2 (main, May  2 2024, 11:59:08) [GCC 12.2.0]<br>
2024-08-06T06:39:08+0000 [-] Twisted Version 24.3.0<br>
2024-08-06T06:39:08+0000 [-] Cowrie Version 2.5.0<br>
2024-08-06T06:39:08+0000 [-] Loaded output engine: jsonlog<br>
2024-08-06T06:39:08+0000 [twisted.scripts._twistd_unix.UnixAppLogger#info] twistd 24.3.0 (/cowrie/cowrie-env/bin/python3 3.11.2) starting up.<br>
2024-08-06T06:39:08+0000 [twisted.scripts._twistd_unix.UnixAppLogger#info] reactor class: twisted.internet.epollreactor.EPollReactor.<br>
2024-08-06T06:39:08+0000 [-] CowrieSSHFactory starting on 2222<br>
2024-08-06T06:39:08+0000 [cowrie.ssh.factory.CowrieSSHFactory#info] Starting factory <cowrie.ssh.factory.CowrieSSHFactory object at 0x7fdfc0264c10><br>
2024-08-06T06:39:08+0000 [-] Generating new RSA keypair...<br>
2024-08-06T06:39:08+0000 [-] Generating new ECDSA keypair...<br>
2024-08-06T06:39:08+0000 [-] Generating new ed25519 keypair...<br>
2024-08-06T06:39:08+0000 [-] Ready to accept SSH connections<br>
</span>
</div>

Now that our honeypot is running, anybody connecting to it via any kind of [SFTP client]({% post_url 2020-04-30-sftp-browser %}) and attempting to run anything like this:


<div class="terminal">
<span class="prompt">~ # </span>sftp -P 2222 root@localhost<br>
<span class="stdout">
root@localhost's password: <br>
Connected to localhost.<br>
sftp> </span>put virus.bin<span class="stdout"><br>
Uploading virus.bin to /root/virus.bin<br>
virus.bin                                    100%  200   133.1KB/s   00:00    <br>
sftp> </span>exit<br>
<span class="prompt">~ # </span>
</div>

will logs the entire conversation in the honeypot for you to review. In the case above we got:
```
2024-08-06T06:45:54+0000 [cowrie.ssh.factory.CowrieSSHFactory] No moduli, no diffie-hellman-group-exchange-sha1
2024-08-06T06:45:54+0000 [cowrie.ssh.factory.CowrieSSHFactory] No moduli, no diffie-hellman-group-exchange-sha256
2024-08-06T06:45:54+0000 [cowrie.ssh.factory.CowrieSSHFactory] New connection: 172.17.0.1:47890 (172.17.0.3:2222) [session: e8b0ede018b3]
2024-08-06T06:45:54+0000 [HoneyPotSSHTransport,2,172.17.0.1] Remote SSH version: SSH-2.0-OpenSSH_9.2p1 Debian-2+deb12u3
2024-08-06T06:45:54+0000 [HoneyPotSSHTransport,2,172.17.0.1] SSH client hassh fingerprint: aae6b9604f6f3356543709a376d7f657
2024-08-06T06:45:54+0000 [cowrie.ssh.transport.HoneyPotSSHTransport#debug] kex alg=b'curve25519-sha256' key alg=b'ssh-ed25519'
2024-08-06T06:45:54+0000 [cowrie.ssh.transport.HoneyPotSSHTransport#debug] outgoing: b'aes128-ctr' b'hmac-sha2-256' b'none'
2024-08-06T06:45:54+0000 [cowrie.ssh.transport.HoneyPotSSHTransport#debug] incoming: b'aes128-ctr' b'hmac-sha2-256' b'none'
2024-08-06T06:45:54+0000 [cowrie.ssh.transport.HoneyPotSSHTransport#debug] NEW KEYS
2024-08-06T06:45:54+0000 [cowrie.ssh.transport.HoneyPotSSHTransport#debug] starting service b'ssh-userauth'
2024-08-06T06:45:54+0000 [cowrie.ssh.userauth.HoneyPotSSHUserAuthServer#debug] b'root' trying auth b'none'
2024-08-06T06:45:56+0000 [cowrie.ssh.userauth.HoneyPotSSHUserAuthServer#debug] b'root' trying auth b'password'
2024-08-06T06:45:56+0000 [HoneyPotSSHTransport,2,172.17.0.1] Could not read etc/userdb.txt, default database activated
2024-08-06T06:45:56+0000 [HoneyPotSSHTransport,2,172.17.0.1] login attempt [b'root'/b'test'] succeeded
2024-08-06T06:45:56+0000 [HoneyPotSSHTransport,2,172.17.0.1] Initialized emulated server as architecture: linux-x64-lsb
2024-08-06T06:45:56+0000 [cowrie.ssh.userauth.HoneyPotSSHUserAuthServer#debug] b'root' authenticated with b'password'
2024-08-06T06:45:56+0000 [cowrie.ssh.transport.HoneyPotSSHTransport#debug] starting service b'ssh-connection'
2024-08-06T06:45:56+0000 [cowrie.ssh.connection.CowrieSSHConnection#debug] got channel b'session' request
2024-08-06T06:45:56+0000 [cowrie.ssh.session.HoneyPotSSHSession#info] channel open
2024-08-06T06:45:56+0000 [cowrie.ssh.connection.CowrieSSHConnection#debug] got global b'no-more-sessions@openssh.com' request
2024-08-06T06:45:56+0000 [SSHChannel session (0) on SSHService b'ssh-connection' on HoneyPotSSHTransport,2,172.17.0.1] request_env: LANG=en_US.UTF-8
2024-08-06T06:45:56+0000 [twisted.conch.ssh.session#info] Asking for subsystem "b'sftp'"
2024-08-06T06:45:56+0000 [cowrie.shell.avatar.CowrieUser#debug] Subsystem lookup: {b'sftp': <class 'twisted.conch.ssh.filetransfer.FileTransferServer'>}
2024-08-06T06:45:56+0000 [twisted.conch.ssh.filetransfer.FileTransferServer#info] dispatching: INIT requestId=3
2024-08-06T06:45:56+0000 [twisted.conch.ssh.filetransfer.FileTransferServer#info] dispatching: REALPATH requestId=1
2024-08-06T06:46:06+0000 [twisted.conch.ssh.filetransfer.FileTransferServer#info] dispatching: OPEN requestId=2
2024-08-06T06:46:06+0000 [HoneyPotSSHTransport,2,172.17.0.1] SFTP openFile: b'/root/virus.bin'
2024-08-06T06:46:06+0000 [twisted.conch.ssh.filetransfer.FileTransferServer#info] dispatching: WRITE requestId=4
2024-08-06T06:46:06+0000 [twisted.conch.ssh.filetransfer.FileTransferServer#info] dispatching: CLOSE requestId=3
2024-08-06T06:46:06+0000 [twisted.conch.ssh.filetransfer.FileTransferServer#info] closing: b'\x00\x00\x00\x03' b'8760330431421'
2024-08-06T06:46:06+0000 [HoneyPotSSHTransport,2,172.17.0.1] SFTP Uploaded file "virus.bin" to var/lib/cowrie/downloads/370e0efc52f7577cbe99b7a8f5229e03fca23a81872be3f4b2d58198a1ed5fcc
2024-08-06T06:47:04+0000 [cowrie.ssh.connection.CowrieSSHConnection#info] sending close 0
2024-08-06T06:47:04+0000 [cowrie.ssh.session.HoneyPotSSHSession#info] remote close
2024-08-06T06:47:04+0000 [HoneyPotSSHTransport,2,172.17.0.1] Got remote error, code 11 reason: b'disconnected by user'
2024-08-06T06:47:04+0000 [HoneyPotSSHTransport,2,172.17.0.1] avatar root logging out
2024-08-06T06:47:04+0000 [cowrie.ssh.transport.HoneyPotSSHTransport#info] connection lost
2024-08-06T06:47:04+0000 [HoneyPotSSHTransport,2,172.17.0.1] Connection lost after 69 seconds
```

As you can see from the logs, the file transferred by the attacker is made available on the container under `var/lib/cowrie/downloads/` so you can apply any kind of forinsics you want.
