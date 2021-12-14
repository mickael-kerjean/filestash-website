---
title: How to create a FTP server with ftplib in python
description: step by step instructions to setup a FTP server ready under a minute using python and ftplib
layout: post
tags: ftp guide
permalink: /ftplib.html
language: en
---

Python has a one liner from which you can create a FTP server using [ftplib](https://docs.python.org/3/library/ftplib.html).


First things first, let's install the required dependency:
<div class="terminal">
<span class="prompt">~/$ </span>pip3 install pyftpdlib<br>
<span class="stdout">
Collecting pyftpdlib<br/>
  Downloading pyftpdlib-1.5.6.tar.gz (188 kB)<br/>
     |████████████████████████████████| 188 kB 6.4 MB/s<br/>
Building wheels for collected packages: pyftpdlib<br/>
  Building wheel for pyftpdlib (setup.py) ... done<br/>
  Created wheel for pyftpdlib: filename=pyftpdlib-1.5.6-py3-none-any.whl size=125586 sha256=ef64dcea9ebb19497a7f9d91f8b084a321c3ef909b0f5e3470f2ec9ccd66b958<br/>
  Stored in directory: /home/mickael/.cache/pip/wheels/54/9f/5f/50eae5deee54c11cd059c5bda2ebd7dcd461d81b5c89f50f75<br/>
Successfully built pyftpdlib<br/>
Installing collected packages: pyftpdlib<br/>
Successfully installed pyftpdlib-1.5.6<br/>
</span>
</div>

To serve the current directory via FTP:
<div class="terminal">
<span class="prompt">~/$ </span>python3 -m pyftpdlib -w --user=username --password=password<br>
<span class="stdout">
[I 2021-12-14 22:48:48] concurrency model: async<br/>
[I 2021-12-14 22:48:48] masquerade (NAT) address: None<br/>
[I 2021-12-14 22:48:48] passive ports: None<br/>
[I 2021-12-14 22:48:48] >>> starting FTP server on 0.0.0.0:2121, pid=1070306 <<<<br/>
[I 2021-12-14 22:49:04] 127.0.0.1:36230-[] FTP session opened (connect)<br/>
[I 2021-12-14 22:49:08] 127.0.0.1:36230-[username] USER 'username' logged in.<br/>
</span>
</div>

To make sure everything is running fine:
<div class="terminal">
<span class="prompt">~/$ </span>curl --user username:password ftp://127.0.0.1:2121/<br>
<span class="stdout">
drwxr-xr-x  10 mickael  mickael      4096 Nov 22 08:29 Documents<br/>
drwxr-xr-x   3 mickael  mickael     16384 Dec 14 06:35 Downloads<br/>
</span>
</div>

For a FTP client that's more modern for your users, check our online [FTP client]({% post_url 2019-11-26-ftp-web-client %}):

<a href="{% post_url 2019-11-26-ftp-web-client %}"><img class="fancy" src="https://www.filestash.app/img/screenshots/viewerpage.png" alt="screenshot of the Filestash webdav client" style="margin-top: -15px;" /></a>

<div class="related">
    <div class="title">
        Our Tools<br>
        <img src="https://mickael.kerjean.me/assets/img/arrow_bottom.png"/>
    </div>
    <div class="related_content">
        <a href="{% post_url 2021-10-18-webdav-client %}"><h3 class="no-anchor">Webdav Client</h3></a><a href="{% post_url 2019-11-26-ftp-web-client %}"><h3 class="no-anchor">FTP Client</h3></a><a href="{% post_url 2020-04-30-sftp-browser %}"><h3 class="no-anchor">SFTP Client</h3></a><a href="{% post_url 2019-11-21-s3-browser %}"><h3 class="no-anchor">S3 Explorer</h3></a>
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
     width: calc(33% - 10px);
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
