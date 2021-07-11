---
title: FTP is 50 years old
description: FTP was first published the 16th of April 1971
layout: post
tags: ftp
language: en
---

The 16th of April 1971 is not only the date when the Rolling Stone first released [Brown Sugar](https://en.wikipedia.org/wiki/Brown_Sugar_(Rolling_Stones_song)), it is also marked with the publication of [RFC 114](https://tools.ietf.org/html/rfc114) marking the birthday of FTP. 

<iframe width="560" height="315" src="https://www.youtube.com/embed/3B0Y3LUqr1Q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Back in those days, the Vietnam war is at the forefront of the news, TCP/IP didn't exist yet, Jimi Hendrix died 6 months ago, telnet was the new cool kid and some of the most influential rock n roll artists were about to release masterpieces while FTP was using a network protocol called [NCP](https://en.wikipedia.org/wiki/Network_Control_Program).

Over the years, the FTP protocol got refined with 16 different revisions*(\*1)* adding support with TCP/IP, a secure extension also known as FTPS which is leveraging the same tech as HTTPS and more recent addition like IPv6 support.

Fifty years after its inception, FTP is still going very strong with [millions of FTP server still being exposed on the internet](https://www.shodan.io/search?query=ftp) which is fairly amazing considering the bad press it gets from so many people and companies like [Dropbox writing on how bad FTP is](https://www.dropbox.com/ftp) conflating the protocol to a full-fledge product. Not to mention the closest thing they got to the FTP protocol is their far less shinny proprietary API that is only usable if Dropbox is kind enough to grant you a key.

In 2021, what seems to be acknowledged as progress take the form of proprietary protocols made behind closed doors and without any RFC whatsoever. Instead, vendors wanting to create competing servers are left reverse engineering SDKs as how [Minio](https://min.io/) did with S3.

Also, how could we touch the topic of FTP without pointing at the most [infamous comment on hacker news](https://news.ycombinator.com/item?id=8863) which has been a major inspiration source when creating Filestash. Indeed, I believe it shouldn't matter which protocol the tool my mum uses my mum's tool is using, as soon as this tool is easy to use, she can transfer those photos she wants to share, open up videos and do all the other things that shouldn't require her to know about a protocol as our job as engineers is to abstract away all those complicated stuff so that by the magics of abstraction, someone accessing their bank account from the comfort of their browser isn't expected to pick a cipher when negotiating SSL.

<a href="/online-ftp-client.html"><img src="/img/screenshots/viewerpage.png" style="height: 350px;border: 9px solid #0000001a;border-radius: 5px;object-fit: cover;"/></a>

**(\*1) FTP over the years**:
- [RFC 114](https://tools.ietf.org/html/rfc114) (April 1971)
- [RFC 697](https://tools.ietf.org/html/rfc697) (July 1975): CWD Command
- [RFC 765](https://tools.ietf.org/html/rfc765) (June 1980): TCP/IP
- [RFC 959](https://tools.ietf.org/html/rfc959) (October 1985): File Transfer Protocol
- [RFC 1579](https://tools.ietf.org/html/rfc1579) (February 1994): Firewall-Friendly FTP
- [RFC 1635](https://tools.ietf.org/html/rfc1635) (May 1994): How to Use Anonymous FTP
- [RFC 1639](https://tools.ietf.org/html/rfc1639) (June 1994): FTP Operation Over Big Address Records
- [RFC 1738](https://tools.ietf.org/html/rfc1738) (December 1994): Uniform Resource Locators
- [RFC 2228](https://tools.ietf.org/html/rfc2228) (October 1997): FTP Security Extensions
- [RFC 2389](https://tools.ietf.org/html/rfc2389) (August 1998): Feature negotiation mechanism for the File Transfer Protocol
- [RFC 2428](https://tools.ietf.org/html/rfc2428) (September 1998): Extensions for IPv6, NAT, and Extended passive mode
- [RFC 2577](https://tools.ietf.org/html/rfc2577) (May 1999): FTP Security Considerations
- [RFC 2640](https://tools.ietf.org/html/rfc2640) (July 1999): Internationalization of the File Transfer Protocol
- [RFC 3659](https://tools.ietf.org/html/rfc3659) (March 2007): Extensions to FTP
- [RFC 5797](https://tools.ietf.org/html/rfc5797) (March 2010): FTP Command and Extension Registry
- [RFC 7151](https://tools.ietf.org/html/rfc7151) (March 2014): File Transfer Protocol HOST Command for Virtual Hosts

