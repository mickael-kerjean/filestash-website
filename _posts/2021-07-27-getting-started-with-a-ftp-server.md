---
title: The What, Why, & How of FTP servers
description: Everything you need to know about FTP, from what is an FTP server to how you can use one to create your own site and everything in between
layout: post
language: en
tags: ftp guide
permalink: /what-is-ftp.html
---


## What is FTP?

FTP was invented to solve the problem of transfering files over a network [more than 50 years ago]({% post_url 2021-04-16-ftp-is-50-years-old %}) before internet as we know it even existed. Fun fact, it was invented by the same [MIT student](https://en.wikipedia.org/wiki/Abhay_Bhushan) who also work on the early version of emails. He named this invention short for "File Transfer Protocol" and that became over time a standard [millions of people still use today](https://www.shodan.io/search?query=ftp).

<img class="fancy" src="/img/posts/2021-07-27-getting-started-with-a-ftp-server_0.png" />

The protocol has evolved throughout the years with many different version of the protocol coming to life. Just to cite an example, the secure extension of FTP named FTPS in the same way HTTPS is the secure extension of HTTP with both leveraging the same underlying technology


## How to access your FTP server?

Assuming you have a FTP server somewhere you know either its ip address or have a domain name, you can access such server through a tool called an FTP client. Depending on what you are trying to do, you will find different type of client:
- command line based client: [ftp]({% post_url 2020-07-06-ftp-from-the-command-line %}) or [lftp](https://lftp.yar.ru/)
- desktop application: [Filezilla](https://filezilla-project.org/), [cyberduck](https://cyberduck.io/)
- web application: [Filestash]({% post_url 2019-11-26-ftp-web-client %})

<img alt="screenshot of Filestash when uploading" class="fancy" src="/img/screenshots/feature1.png" />

The role of those clients is to talk to your server using the FTP protocol and perform the action you want to do on that server. For example if you have a wordpress hosting and want to change your theme, you will be able to use that client to update some data on your server.


## How does FTP works?

FTP is a standard which has evolved over time to take advantage of technologic advanced we've had over the last 50 years. In its currently used format, the protocol is an entirely TCP based service without any UDP components. What makes FTP different is how it uses 2 connections, a first one for the control exchange which runs typically on port 21 and another one for data exchange which is typically using port 20 and random port > 1024.

The model as described in RFC959:
```
                                            -------------
                                            |/---------\|
                                            ||   User  ||    --------
                                            ||Interface|<--->| User |
                                            |\----^----/|    --------
                  ----------                |     |     |
                  |/------\|  FTP Commands  |/----V----\|
                  ||Server|<---------------->|   User  ||
                  ||  PI  ||   FTP Replies  ||    PI   ||
                  |\--^---/|                |\----^----/|
                  |   |    |                |     |     |
      --------    |/--V---\|      Data      |/----V----\|    --------
      | File |<--->|Server|<---------------->|  User   |<--->| File |
      |System|    || DTP  ||   Connection   ||   DTP   ||    |System|
      --------    |\------/|                |\---------/|    --------
                  ----------                -------------

                  Server-FTP                   USER-FTP 

legend: 
- PI: "protocol interpreter"
- DTP: "data transfer process"
```

If you want to know more about all the intricasies of FTP, its mode and commands, a good starting point is [RFC959](https://datatracker.ietf.org/doc/html/rfc959). If you feel like an historian, you might want to read the very first [RFC114](https://tools.ietf.org/html/rfc114) and if that's still not enough you want to dig through <a href="https://tools.ietf.org/html/rfc697">RFC 697</a>, <a href="https://tools.ietf.org/html/rfc765">RFC 765</a>, <a href="https://tools.ietf.org/html/rfc1579">RFC 1579</a>, <a href="https://tools.ietf.org/html/rfc1635">RFC 1635</a>, <a href="https://tools.ietf.org/html/rfc1639">RFC 1639</a>, <a href="https://tools.ietf.org/html/rfc1738">RFC 1738</a>, <a href="https://tools.ietf.org/html/rfc2228">RFC 2228</a>, <a href="https://tools.ietf.org/html/rfc2389">RFC 2389</a>, <a href="https://tools.ietf.org/html/rfc2428">RFC 2428</a>, <a href="https://tools.ietf.org/html/rfc2577">RFC 2577</a>, <a href="https://tools.ietf.org/html/rfc2640">RFC 2640</a>, <a href="https://tools.ietf.org/html/rfc3659">RFC 3659</a>, <a href="https://tools.ietf.org/html/rfc5797">RFC 5797</a>, <a href="https://tools.ietf.org/html/rfc7151">RFC 7151</a>.

**FTPS vs SFTP**: FTPS and SFTP both enabled secure file exchange over a network but the way they work under the hood are completly different in the same way apples and oranges taste very different despite both being a fruit.

<!--
**How to setup an FTP site?**: WIP
-->

<div class="related">
    <div class="title">
        Related Pages <br>
        <img src="https://mickael.kerjean.me/assets/img/arrow_bottom.png"/>
    </div>
    <div class="related_content">
    <a href="{% post_url 2019-11-26-ftp-web-client %}"><h3 class="no-anchor">Online FTP Client</h3></a><a href="{% post_url 2020-08-04-ftp-testing-tool %}"><h3 class="no-anchor">FTP Testing Tool</h3></a><a href="{% post_url 2020-09-29-doing-ftp-with-curl %}"><h3 class="no-anchor">FTP with curl</h3></a>
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
