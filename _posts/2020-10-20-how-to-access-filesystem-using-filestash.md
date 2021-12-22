---
layout: post
title: How to access your filesystem using Filestash?
language: en
tags: guide
---

If you want a quick solution to access your filesystem using Filestash, you can use the [local plugin](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_backend_local) which as its name implies makes it possible to work from a filesystem.

<!--
<style>
#main ol li p { margin: 0; }
#main ol { margin-top: -15px; }
</style>

## Background

Before digging further, I need to share some confidence and tell you what Filestash actually is and more importantly what it is not. Filestash is a UI that talk to your backend, it's essentially acting as a proxy to your data and try to be as efficient as possible at this particular task. As such Filestash does not manage documents directly but undirectly via some backend plugins which try to support almost any protocols or cloud platform. With that in mind, there's 2 big area for which Filestash doesn't have an opinion on and rely on your backend instead:

1. Authentication: you wouldn't want any random bloke of the internet to log in and mess your filesystem, wouldn't you? There's many solutions to authenticate users and just so many way to do that from SAML, IDC, LDAP, Mysql DB ...

2. Authorisation which is who can see what and how we manage access controls and all that stuff.

Delegating those aspects to your backend is an admission to 2 facts of life:

1. there's no one true way to handle authentication and authorisation and you can never get everyone to agree on a best way to do that. As such, integrating with your existing backend and delegating those responsabilities to it makes a lot of sense, on one hand there's no need to reinvent a worse wheel and on another hand, you get maximum flexibility

2. there's an almost infinite combination of backend that can accomodate almost any needs. Take openSSH which is the backend we will use to demonstrate how you can effectively access your local filesystem, it can use PAM for authentication, has a range of options for a lot of use case and can diretly leverage the linux access control which has been battle tested for many years by essentially every serious server there is.


## Solution to access the local filesystem

For simple use case that don't need anything fancy, you probably have nothing extra to install as your existing SSH server already contains a builtin and enabled by default SFTP server. In fact, SFTP stands for SSH file transfer protocol and that server installed almost everywhere by default is OpenSSH.

All in all, to access your local filesystem, you should be able to connect to it via SFTP by using the IP or domain of your server and the very same credentials you use to connect to it via SSH. For example, this is what i looks like when I do that and navigate to the location of the server where the page you're reading is stored:

![sftp example](/img/posts/2020-10-20-how-to-access-filesystem-using-filestash-1.png)

If you want to give this a try, give it a spin from our [demo](https://demo.filestash.app/)

*Tips and tricks*: for additional flexibility on your SFTP server, you have a range of configuration available from `/etc/ssh/sshd_config`. For example, if you don't want to expose that server to the internet, you can change `bind_addr 127.0.0.1`

## Some other solutions

There's a lot of backend that are available in the ecosystem of software that run on Linux. OpenSSH is quite a solid starting point. If you want more control when it comes to authentication, [linux PAM](https://en.wikipedia.org/wiki/Linux_PAM) is quite a reference and can integrate with potentially anything you throw at it. Another server I like quite a lot is ProFTPd as the range of available configuration makes it the swiss knife from which almost anything can be done. If you ever need more choice in backend, you can manage your filesystem via a range of other backend Filestash is known to work with like:
- Filezilla FTP server
- pureFTP
- vsftp
- Apache webdav
- Samba
- Minio
-->
