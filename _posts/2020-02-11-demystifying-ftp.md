---
layout: post
title: Demystifying FTP
description: Answering all the questions about the nearly 50 year old protocol
---

FTP isn't just back, it never left. After all those years, FTP isn't close to being leaving anytime soon. With over [8.3 million FTP servers](https://www.shodan.io/search?query=port%3A21&language=en) sitting on the public internet, FTP is still nearly 50 years after its inception alive and well.

In the age of cloud computing, I get to see a lot of misconceptions and lies about FTP, some of those are even spread by very large companies like Box which claim FTP is ["bulky and outdated"](https://www.box.com/en-gb/cloud-storage/ftp-alternative) and Dropbox writing about ["tired old FTP server"](https://www.dropbox.com/ftp) and how ["FTP are only easy to use for IT manager"](https://www.dropbox.com/ftp).

In this post, I will try to answer all the questions and misconceptions often associated with the use of FTP:

- [What does FTP stand for?](#what-does-ftp-stand-for)
- [What is FTP protocol?](#what-is-ftp-protocol)
- [What is FTP used for?](#what-is-ftp-used-for)
- [What is FTP server?](#what-is-ftp-server)
- [What is FTP client?](#what-is-ftp-client)
- [What does FTP do?](#what-does-ftp-do)
- [is FTP is dead?](#is-ftp-dead)
- [Is FTP unsecure?](#is-ftp-unsecure)
- [Is FTP outdated?](#is-ftp-outdated)
- [Is FTP bulky?](#is-ftp-bulky)
- [Is FTP hard to use?](#is-ftp-hard-to-use)
- [Which FTP server to choose?](#which-ftp-server-to-choose)
- [Which FTP client to use?](#which-ftp-client-to-use)

<style>
#main h2{
  font-size: 22px;
  line-height: 20px;
  margin-bottom: 0px;
  margin-top: 20px;
  padding: 30px 0 10px 0;
}
#main p{ margin-top: 0px; }

#main ul{
    margin: 0 0 150px 0;
    padding: 10px;
    background: var(--emphasis-primary);
    border-radius: 5px;
}
#main ul li{
  display: inline-block;
  padding: 0 20px;
}
#main ul li a{ color: inherit; }
</style>

## What does FTP stand for?

FTP stands for "File Transfer Protocol"

## What is FTP Protocol?

FTP is a protocol that defines how two machines (known as the client and the server) can communicate over a network to transfer files. It has been defined in many different [RFCs](https://en.wikipedia.org/wiki/File_Transfer_Protocol#History_of_FTP_servers)

## What is FTP used for?

FTP is used to transfer files over a network

## What is FTP server?

An FTP server is a server software that implements the FTP protocol (example: [PureFTPd](https://www.pureftpd.org/project/pure-ftpd/), [bftpd](http://bftpd.sourceforge.net/), [proFTPd](http://proftpd.org/), [Filezilla server](https://filezilla-project.org/download.php?type=server), ...). It is used to enable the sharing of files between different parties over a network.

## What is FTP client?

An FTP client is a software that can be used to access an FTP server. Example: [Filezilla FTP](https://filezilla-project.org/), [Filestash](/online-ftp-client.html), [Cyberduck](https://cyberduck.io/), ...

## What does FTP do?

FTP is a means by which two machines can transfer files over a network.

## Is FTP dead

No, FTP is alive and well. If we account only for the visible side of the iceberg, there are 8.3 million FTP servers exposed to the internet which is about the entire population of Switzerland.

## Is FTP unsecure?

While it is true that FTP wasn't initially created with security in mind, the protocol got refined in 2005 to support TLS with [RFC4217](https://tools.ietf.org/html/rfc4217)

## Is FTP outdated?

Being invented [18 years before Time Berners Lee invented HTTP](https://en.wikipedia.org/wiki/File_Transfer_Protocol), it is very true that FTP has passed the test of time but what is old isn't necessarily outdated. In 2020, we can account on the public internet [8.3 million FTP server](https://www.shodan.io/search?query=port%3A21&language=en) and all popular FTP software are being actively maintained

## Is FTP bulky?

No. In fact, FTP was created at a time where nobody could afford the hardware to run anything bulky.

## Is FTP hard to use?

FTP is a protocol, not an end-user application. On the many software available for FTP, some are great for IT professionals ([Filezilla FTP](https://www.shodan.io/search?query=port%3A21&language=en)) and others are great for everyone else ([Filestash](/online-ftp-client.html), [Cyberduck](https://cyberduck.io/))

## Which FTP server to choose?

Out of [8.3 million FTP server exposed on the internet](https://www.shodan.io/search?query=port%3A21), the most popular server software are:
1. [PureFTPd](https://www.pureftpd.org/project/pure-ftpd/) with 26% of market share
2. [Bftpd](http://bftpd.sourceforge.net/) with 9% of market share
3. [Microsoft FTPD](https://www.microsoft.com/en-us/download/details.aspx?id=14045) with 9% of market share
4. [proFTPd](http://proftpd.org/) with 7% of market share

## Which FTP client to use?

FTP clients are available in 2 flavors:
1. desktop application: [Filezilla FTP](https://filezilla-project.org/), [Cyberduck](https://cyberduck.io/), ...
2. web application: [Filestash](/online-ftp-client.html), ...

<div style="height:500px;">
