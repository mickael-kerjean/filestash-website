---
title: How to use FTP from the command line
description: A guide to use and manage your FTP server from the CLI
layout: post
permalink: /ftp-from-the-command-line.html
tags: ftp guide
language: en
---

This guide is giving examples of how to use the `ftp` command line tool to:
1. [Connect to a FTP server](#connect-to-a-server-from-the-cli)
2. [Basic of navigations](#navigate-and-access-a-folder)
3. [Upload a file to the FTP server](#upload-a-file-to-the-ftp-server)
4. [Download a file from a FTP server](#download-a-file-from-the-ftp-server)
5. [Other tips and tricks](#other-tips-and-tricks)

## Connect to a server from the CLI

<div class="terminal">
<span class="prompt">~/$ </span>ftp -i example.com<br>
<span class="stdout">
Connected to example.com.<br>
Name (example.com:mickael): </span>anonymous<br>
<span class="stdout">
331 Password required for example.com.<br>
Password:<br>
230 User anonymous logged in.<br>
Remote system type is UNIX.<br>
Using binary mode to transfer files.<br>
ftp><br>
</span>
</div>

## Navigate and access a folder

<div class="terminal">
<span class="prompt">ftp> </span>ls<br>
<span class="stdout">
200 PORT command successful.<br>
150 Opening ASCII mode data connection for file list<br>
drwx------   7 web site     4096 Jun  9 07:12 .<br>
drwx------   7 web site     4096 Jun  9 07:12 ..<br>
-rw-r--r--   1 web site      312 Jun 12  2017 .htaccess<br>
drwx------   3 web site     4096 Jul  5  2020 public<br>
226 Transfer complete.<br></span>
<span class="prompt">ftp> </span>cd public<br>
<span class="stdout">
250 CWD command successful.
</span><br>
<span class="prompt">ftp> </span>pwd<br>
<span class="stdout">
257 "/public" is current directory.
</span>
</div>

## Manage content

### Create a local file

<div class="terminal">
<span class="prompt">ftp> </span>lpwd<br>
<span class="stdout">
Local directory is /home/mickael/<br>
</span>
<span class="prompt">ftp> </span>lcd Documents<br>
<span class="stdout">
Local directory now /home/mickael/Documents<br>
</span>
<span class="prompt">ftp> </span>!ls<br>
<span class="stdout">
/bin/bash
</span><br>
<span class="prompt">ftp> </span>!touch test.txt<br>
<span class="stdout">
/bin/bash
</span><br>
<span class="prompt">ftp> </span>!ls<br>
<span class="stdout">
/bin/bash<br>
test.txt
</span><br>
</div>

### Create / Delete a folder

<div class="terminal">
<span class="prompt">ftp> </span>mkdir test<br>
<span class="stdout">
257 "/trash" - Directory successfully created<br>
</span>
<span class="prompt">ftp> </span>rmdir test<br>
<span class="stdout">
250 RMD command successful<br>
</span>
</div>


### Upload a file to the FTP server
<div class="terminal">
<span class="prompt">ftp> </span>put test.txt<br>
<span class="stdout">
---> PORT 192,168,100,33,147,71<br>
200 PORT command successful.<br>
---> STOR test.txt<br>
150 Opening BINARY mode data connection for test.txt<br>
226 Transfer complete<br>
</span>
</div>

### Download a file from the FTP server

<div class="terminal">
<span class="prompt">ftp> </span>get test.txt<br>
<span class="stdout">
---> TYPE I<br>
200 Type set to I<br>
---> PORT 192,168,100,33,156,59<br>
200 PORT command successful.<br>
---> RETR test.txt<br>
150 Opening BINARY mode data connection for test.txt<br>
226 Transfer complete.<br>
</span>
</div>

### Delete a file

<div class="terminal">
<span class="prompt">ftp> </span>delete test.txt<br>
<span class="stdout">
---> DELE test.txt
250 DELE command successful.
</span>
</div>

### Other tips and tricks

- the `ftp` command can quickly reach its limits if you need to operate on folder with subfolders to either delete something recursively or copy some folders over. The [lftp](https://lftp.yar.ru/) tool support all those use case.

- exit the server:
<div class="terminal">
<span class="prompt">ftp> </span>quit<br>
<span class="prompt">~/$ </span><br>
</div><br>

- Not connected error. Example and resolution:
<div class="terminal">
<span class="prompt">ftp> </span>pwd<br>
<span class="stdout">
Not connected.
</span><br>
<span class="prompt">ftp> </span>open<br>
<span class="stdout">
Connected to example.com.<br>
Name (example.com:mickael): </span>anonymous<br>
<span class="stdout">
230 User anonymous logged in.<br>
Remote system type is UNIX.<br>
Using binary mode to transfer files.<br>
</span>
<span class="prompt">ftp> </span>pwd<br>
<span class="stdout">
257 "/" is current directory.<br>
</span>
</div>

<div class="related">
    <div class="title">
        Related Pages <br>
        <img src="https://mickael.kerjean.me/assets/img/arrow_bottom.png"/>
    </div>
    <div class="related_content">
        <a href="{% post_url 2019-11-26-ftp-web-client %}"><h3 class="no-anchor">Online FTP Client</h3></a><a href="{% post_url 2020-09-29-doing-ftp-with-curl %}"><h3 class="no-anchor">FTP with curl</h3></a><a href="{% post_url 2021-08-07-ftp-with-telnet %}"><h3 class="no-anchor">FTP with telnet</h3></a><a href="{% post_url 2020-08-04-ftp-testing-tool %}"><h3 class="no-anchor">FTP Testing Tool</h3></a>
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
