---
title: SFTP by examples
description: Examples, uses cases and tools to efficiently use SFTP
layout: post
permalink: /sftp-by-example.html
tags: sftp guide
language: en
---

The install base of SFTP server is massive, you can find it on almost every linux server making it the lingua franca for any file transfer related task.

## What is SFTP

SFTP which stands for SSH File Transfer Protocol is a [standard](https://www.sftp.net/specification) that defines a way by which one can access, transfer or manage some files over a network. The specificity of SFTP over other protocols is in how it leverages SSH for transport.

Beware not to confuse SFTP with [FTPS]({% post_url 2019-11-26-ftp-web-client %}) or [FTP]({% post_url 2019-11-26-ftp-web-client %}) which despite sounding similar are entirely [different protocols](https://www.sftp.net/sftp-vs-ftps) that happen to share a similar use case when it comes to transfer files over a network.

## Usage examples

SFTP can be use whenever you need to access / manage / transfer files. There's so many different usage one can't list them all but only give a few examples:

1. transfer a log file stored on a server

2. mount a remote filesystem onto your machine using another software like [SSHFS](https://en.wikipedia.org/wiki/SSHFS)

3. browse through the filesystem over a server

4. a low tech alternative to Dropbox when used with other software like [Filestash]({% post_url 2020-04-30-sftp-browser %}):

[![](https://qph.fs.quoracdn.net/main-qimg-b1263917f542141ff92c0b88b025368c)]({% post_url 2020-04-30-sftp-browser %})

## SFTP Tooling

There's a large ecosystem of tools from which you can use SFTP. Depending on what you're trying to achieve, you might use:

- **CLI tools**: `sftp` is widely available but another great option is `lftp`
- **Libraries**: all mainstram programming language have libraries to support SFTP
- **Server**: a lot of option from openssh, proftpd and [many more](https://www.sftp.net/servers)
- **Desktop client**: cyberduck, filezilla, winscp and [many more](https://www.sftp.net/clients)
- **Web client**: Filestash, MonstaFTP

## Getting started with SFTP

The best way to get started with SFTP is to either:

- use a publicly available SFTP servers like [test.rebex.net](https://demo.filestash.app/login?type=sftp&hostname=test.rebex.net&username=demo&password=password&port=22) or [demo.wftpserver.com](https://demo.filestash.app/login?type=sftp&hostname=demo.wftpserver.com&username=demo-user&password=demo-user&port=2222)

- setup your own server from any cloud provider like [Hetzner](https://www.hetzner.com/), [Digital Ocean](https://www.digitalocean.com/), [Linode](https://www.linode.com/), [AWS EC2](https://aws.amazon.com/ec2/). Upon installation, they will provide you with a fully functional SSH and SFTP access

<div class="related">
    <div class="title">
        Related Pages <br>
        <img src="https://mickael.kerjean.me/assets/img/arrow_bottom.png"/>
    </div>
    <div class="related_content">
        <a href="{% post_url 2020-04-30-sftp-browser %}"><h3 class="no-anchor">SFTP Browser</h3></a><a href="{% post_url 2020-06-29-sftp-as-a-service %}"><h3 class="no-anchor">SFTP as a service</h3></a>
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
