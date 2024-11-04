---
title: Free FTP server
description: A curated list of free FTP server, free FTP hosting to create your site and other online servers
layout: post
permalink: /free-ftp.html
tags: ftp guide
language: en
---

A curated list of hosting companies that provides [free FTP server](#fully-managed--online-ftp-servers) as part of their free plan along with [free server software](#free-server-software) you can install on your own hardware and publicly accessible [FTP servers](#ftp-server-with-anonymous-access) that allow anonymous access.

## Fully managed / online FTP servers

Some hosting companies are offering free FTP storage coming with FTP access such as:

- [**TinkerHost.net**](https://tinkerhost.net/): 5GB worth of storage space, PHP & .htaccess support, FTP & MySQL access, and a [lot more](https://tinkerhost.net/free)

- [**Byet.host**](https://byet.host/): 5GB worth of storage space, 10MB maximum file size, PHP, MySQL, and a [lot more](https://byet.host/free-hosting)

- [**000webhost**](https://www.000webhost.com/): 300MB space, 3GB bandwith, PHP MySQL, no ads

- [**Infinityfree.net**](https://infinityfree.net/): 5GB storage and 100MB bandwidth, 10MB maximum file size

- [**profreehost.com**](https://profreehost.com/): 5GB storage and 100MB bandwidth, 10MB maximum file size



## FTP server with anonymous access

A lot of publicly available FTP servers allow anonymous access which mean you can connect to those even without any account at all. Among them:
- [ftp.gnu.org]({% post_url 2019-11-26-ftp-web-client %}#connect=ftp.gnu.org)
- [ftp.pureftpd.org]({% post_url 2019-11-26-ftp-web-client %}#connect=ftp.gnu.org)
- [ftp.vim.org]({% post_url 2019-11-26-ftp-web-client %}#connect=ftp.gnu.org)
- [ftp.slackware.com]({% post_url 2019-11-26-ftp-web-client %}#connect=ftp.gnu.org)


## Free Server software

A lot of the FTP servers can be used for free. The most popular ones are:

- [Filezilla FTP server](https://filezilla-project.org/)
- [ProFTPd](http://www.proftpd.org/)
- [PureFTPd](https://www.pureftpd.org/project/pure-ftpd/)
- [vsFTPd](https://security.appspot.com/vsftpd.html)
- [WinSCP](https://winscp.net/eng/download.php) (Windows Only)

If you want to dig your options deeper, wikipedia also list [a few more options](https://en.wikipedia.org/wiki/Comparison_of_FTP_server_software_packages)

## Other freebies

Our [online FTP client]({% post_url 2019-11-26-ftp-web-client %}) makes it possible to transform your FTP server into an online file manager:

[![screenshot of Filestash](/img/posts/2020-07-08-free-ftp-server-online.png)](https://www.filestash.app/online-ftp-client.html)


<div class="related">
    <div class="title">
        Related Pages <br>
        <img src="https://mickael.kerjean.me/assets/img/arrow_bottom.png"/>
    </div>
    <div class="related_content">
        <a href="{% post_url 2019-11-26-ftp-web-client %}"><h3 class="no-anchor">Online FTP Client</h3></a><a href="{% post_url 2020-08-04-ftp-testing-tool %}"><h3 class="no-anchor">FTP Test Tool</h3></a><a href="{% post_url 2020-07-06-ftp-from-the-command-line %}"><h3 class="no-anchor">FTP Commands</h3></a><a href="{% post_url 2020-09-29-doing-ftp-with-curl %}"><h3 class="no-anchor">FTP with curl</h3></a><a href="{% post_url 2021-08-07-ftp-with-telnet %}"><h3 class="no-anchor">FTP with telnet</h3></a>
    </div>
</div>

<style>
.related{ text-align:center;margin-top:50px;}
.related .title{
    font-size: 1.5em;
    margin-top: 30px;
}
.related .title img{
    animation: bounce 1s infinite alternate;
    width: 16px;
    height: 17px;
}
.related .related_content { margin-top:5px; }
.related .related_content h3 {
    background: var(--bg-color);
    padding: 50px 0;
    border-radius: 5px;
    margin: 0!important;
}
.related .related_content a{
    display: inline-block;
    box-sizing: border-box;
    width: 33%;
    padding: 5px;
    text-decoration: none!important;
}
.related .related_content a:hover{
    transform: scale(1.1);
    transition: ease 0.3s transform;
}
.related .related_content a:hover h3{
    background: var(--emphasis-primary);
    transition: ease 0.3s background;
}

@media only screen and (max-width: 550px) {
    .related .related_content a{ width: 100%; }
}
@keyframes bounce {
    from {
        transform: translate3d(0,0,0);
    }
    to {
        transform: translate3d(0,-8px,0);
    }
}
</style>
