---
title: Implicit vs Explicit TLS in FTPS
description: A dive in FTPS 2 TLS modes known as Implicit and Explicit TLS.
layout: post
language: en
tag: ftp
---

The secure extension of FTP otherwise known as FTPS take its root from 1997 with [RFC959](https://datatracker.ietf.org/doc/id/draft-murray-auth-ftp-ssl-00.txt) and was later [refined in 2001](https://datatracker.ietf.org/doc/html/draft-murray-auth-ftp-ssl-07) before taking its latest form in 2005 with [RFC4217](https://www.rfc-editor.org/rfc/rfc4217.html). Those RFCs have defined various modes for FTPS known as Implicit and Explicit TLS.

Before we dive in, the gist of Explicit vs Implicit lies in the name, with explicit, the [FTP client](/online-ftp-client.html) need to request the usage of a secure communication exlicitly whereas in implicit mode it is already assumed the connection to the server must happen through TLS like you would do on your browser when visiting an HTTPS website.

## Recap on TLS

In TLS we need to go through a serie of steps to initiate the secure connection, first of we need to get through a TCP Handshake to establish the connection between the client and the server. When the connection is established we must initiate a [TLS Handshake](https://www.cloudflare.com/learning/ssl/what-happens-in-a-tls-handshake/) which starts with the client sending a ["Client Hello" message](https://en.wikipedia.org/wiki/Server_Name_Indication#Encrypted_Client_Hello).

That's all we need to know about TLS to fully grasp the difference between Explicit and Implicit TLS but if you want to dig deeper and enter the wonderfull world of TLS1.3, RSA, Diffie Hellman, you can checkout this introduction video on TLS:

<iframe width="560" height="315" src="https://www.youtube.com/embed/j9QmMEWmcfo?si=KwPn3CpS-Ve4zqSr" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

## Implicit TLS

When you visit an HTTPS website, your browser choose by default to implicitly use port 443 and the entire connection is made from there. That's exactly the same with FTPS with Implicit TLS except it's not port 443 that was registered to the [IANA](https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml) but [port 990](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers).

By the moment the TCP handshake completes and the connection is established, the TLS handshake must start with the client sending a TLS Hello to the server. In the case where such message isn't received, the server will drop the connection:


<div class="terminal">
<span class="prompt">~ # </span>telnet test.rebex.net 990<br>
<span class="stdout">
Trying 194.108.117.16...<br>
Connected to test.rebex.net.<br>
Escape character is '^]'.<br>
HELP<br>
Connection closed by foreign host.<br>
</span>
</div>

Effectively, Implicit TLS prevents client from using an insecure connection either by mistake or lazyness as the connecting client must understand TLS to be able to do anything on that server:

<div class="terminal">
<span class="prompt">~ # </span>openssl s_client -connect test.rebex.net:990<br>
<span class="stdout">
CONNECTED(00000003)<br>
depth=2 C = US, O = Internet Security Research Group, CN = ISRG Root X1<br>
verify return:1<br>
depth=1 C = US, O = Let's Encrypt, CN = R3<br>
verify return:1<br>
depth=0 CN = test.rebex.net<br>
verify return:1<br>
---<br>
Certificate chain<br>
 0 s:CN = test.rebex.net<br>
   i:C = US, O = Let's Encrypt, CN = R3<br>
   a:PKEY: rsaEncryption, 3072 (bit); sigalg: RSA-SHA256<br>
   v:NotBefore: Nov 26 09:47:16 2023 GMT; NotAfter: Feb 24 09:47:15 2024 GMT<br>
 1 s:C = US, O = Let's Encrypt, CN = R3<br>
   i:C = US, O = Internet Security Research Group, CN = ISRG Root X1<br>
   a:PKEY: rsaEncryption, 2048 (bit); sigalg: RSA-SHA256<br>
   v:NotBefore: Sep  4 00:00:00 2020 GMT; NotAfter: Sep 15 16:00:00 2025 GMT<br>
---<br>
Server certificate<br>
-----BEGIN CERTIFICATE-----<br>
....<br>
....<br>
-----END CERTIFICATE-----<br>
subject=CN = test.rebex.net<br>
issuer=C = US, O = Let's Encrypt, CN = R3<br>
---<br>
No client certificate CA names sent<br>
Peer signing digest: SHA256<br>
Peer signature type: RSA-PSS<br>
Server Temp Key: X25519, 253 bits<br>
---<br>
SSL handshake has read 3385 bytes and written 400 bytes<br>
Verification: OK<br>
---<br>
New, TLSv1.3, Cipher is TLS_AES_256_GCM_SHA384<br>
Server public key is 3072 bit<br>
Secure Renegotiation IS NOT supported<br>
Compression: NONE<br>
Expansion: NONE<br>
No ALPN negotiated<br>
Early data was not sent<br>
Verify return code: 0 (ok)<br>
---<br>
220 Rebex FTP Server ready.<br>
</span>
</div>

In practice, Implicit TLS is the lesser use TLS mode when it comes to FTPS as the IETF [did deprecate it](https://datatracker.ietf.org/doc/html/draft-murray-auth-ftp-ssl-07#appendix-A): "This approach is not favoured by the IETF and should not be used for new FTP-TLS implementations."

## Explicit TLS

This mode doesn't have a dual in the HTTPS world. The idea behind explicit is you start connecting to your FTPS server like you would do on your FTP server, typically on port 21 and then ask the server to switch to a secure connection using the AUTH command.

<div class="terminal">
<span class="prompt">~ # </span>telnet test.rebex.net 21<br>
<span class="stdout">
Trying 194.108.117.16...<br>
Connected to test.rebex.net.<br>
Escape character is '^]'.<br>
220 Rebex FTP Server ready.<br>
</span>
AUTH TLS<br>
<span class="stdout">
234 Switching to TLS.<br>
</span>
</div>

It's only from that point onward that client can initiate the TLS handshake by sending the TLS Hello. AUTH TLS isn't the only available security mechanism, it's the most popular but they were some other ones like "AUTH SSL" which got deprecated in 2001 and [GSSAPI](https://en.wikipedia.org/wiki/Generic_Security_Services_Application_Program_Interface) which is defined in [RFC2228](https://datatracker.ietf.org/doc/html/rfc2228)
