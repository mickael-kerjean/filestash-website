---
title: Debunking the "FTP is insecure" myth
description: Among all the file transfer protocols FTP is one of the oldest but is far from being a legacy protocol
layout: post
language: en
tag: ftp
---

Many people incorrectly claim that in the ecosystem of file transfer protocol, FTP is insecure, or worse, that it has been replaced by SFTP [1](https://www.freecodecamp.org/news/what-is-ftp-file-transfer-protocol-and-ftp-server-meaning/#are-ftp-servers-secure){:rel="nofollow"}, [2](https://www.sharetru.com/blog/key-advantages-and-disadvantages-of-ftp#:~:text=FTP%20is%20inherently%20an%20non,FTP%20like%20FTPS%20or%20SFTP.){:rel="nofollow"}, [3](https://www.galaxkey.com/blog/whats-wrong-with-using-ftp-for-transferring-large-files/){:rel="nofollow"}, [4](https://community.spiceworks.com/topic/2106681-how-unsafe-is-ftp){:rel="nofollow"}, ...etc... These allegations are wrong at so many levels.

First of, SFTP and FTPS are two completely different protocols, they are quite literally an apple to orange comparaison between 2 fruits and 2 file transfer protocols with nothing else in common.

If someone were to create a web application today and expose the login page via HTTP, it wouldn't be accurate to blame the HTTP protocol for being insecure; rather, the sys admin/devops/dev should have used HTTPS instead.

The background is exactly the same with FTP. HTTP was created a long time ago when encryption was not a widespread concern. Over time, the HTTP protocol has seen dozens of [RFCs](https://developer.mozilla.org/en-US/docs/Web/HTTP/Resources_and_specifications) that have expanded the base protocol to keep it relevant. The latest of these, at the time of writing, is the introduction of [HTTP/3](https://www.ietf.org/rfc/rfc9114.txt), which is less than a year old.

If we dig through history, there were some early work to bring security onto FTP before TLS was invented with RFCs about "FTP Security Extensions" and work dating back from as [early as 1996](https://datatracker.ietf.org/doc/id/draft-murray-auth-ftp-ssl-00.txt) and 1997 with [RFC2228](https://datatracker.ietf.org/doc/html/rfc2228).

TLS was only introduced in 1999 with [RFC2246](https://www.ietf.org/rfc/rfc2246.txt) and it took about a year more for HTTPS to be introduced with [RFC2818](https://datatracker.ietf.org/doc/html/rfc2818) as "HTTP over TLS". FTP did catchup with HTTP less than a year later with [this RFC](https://datatracker.ietf.org/doc/html/draft-murray-auth-ftp-ssl-07) that only got finalised a couple years later as [RFC4217](https://datatracker.ietf.org/doc/html/rfc4217) otherwise known as "Securing FTP with TLS".

In the wild FTPS is often defined with various TLS mode known as [implicit and explicit TLS]({% post_url 2023-12-07-explicit-tls-and-implicit-tls-in-ftp %}) and most servers (if not all) do support those security mechanism to the point that if you see a FTP server not supporting FTPS, it simply shows lazyness on the part of the administrator, not a flaw in the underlying protocol.

To complete the parallel with HTTPS, for the last few years, google has been showing warning in the browser when a user is accessing an HTTP only website:

<img class="fancy" src="https://www.eff.org/files/banner_library/http_warning.png" />

In the same way, most [FTP clients](https://www.filestash.app/online-ftp-client.html) will first attempt to use FTPS and will show scary warning messages to servers that don't properly support FTPS like this:

<img class="fancy" src="https://i.stack.imgur.com/BM6gq.png" />
