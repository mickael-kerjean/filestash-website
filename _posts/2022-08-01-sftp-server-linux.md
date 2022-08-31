---
title: Setup a SFTP server on ubuntu under 1 minute
description: Instructions to create a SFTP server
layout: post
tags: sftp guide
language: en
permalink: /sftp-server-linux.html
---

SFTP is a great choice to securely transfer file accross a network. The most ubiquitous SFTP server there is is [openssh](https://en.wikipedia.org/wiki/OpenSSH) which we will be installing in this guide.


## Basic setup

Assuming the machine you run your server from is running ubuntu, open up a terminal and type:

<div class="terminal">
<span class="prompt">~/$ </span>sudo apt install -y openssh-server<br>
<span class="stdout">
Reading package lists... Done<br/>
Building dependency tree... Done<br/>
Reading state information... Done<br/>
...<br/>
Updating certificates in /etc/ssl/certs...<br/>
0 added, 0 removed; done.<br/>
Running hooks in /etc/ca-certificates/update.d...<br/>
done.<br/>
</span>
<span class="prompt">~/$ </span>sudo service ssh start<br>
<span class="stdout">
 * Starting OpenBSD Secure Shell server sshd &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ OK ]<br/>
</span>
</div>

You're done. By default this server will use the user / password setup in your machine.

## Making it more fancy

By default this server will use the user / password setup in your machine so you can use standard tools to manage users like this:
<div class="terminal">
<span class="prompt">~/$ </span>sudo adduser test<br>
<span class="stdout">
Adding user `test' ...<br/>
Adding new group `test' (1000) ...<br/>
Adding new user `test' (1000) with group `test' ...<br/>
Creating home directory `/home/test' ...<br/>
Copying files from `/etc/skel' ...<br/>
New password: <br/>
Retype new password: <br/>
passwd: password updated successfully<br/>
Changing the user information for test<br/>
Enter the new value, or press ENTER for the default<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Full Name []: <br/>
&nbsp;&nbsp;&nbsp;&nbsp;Room Number []: <br/>
&nbsp;&nbsp;&nbsp;&nbsp;Work Phone []: <br/>
&nbsp;&nbsp;&nbsp;&nbsp;Home Phone []: <br/>
&nbsp;&nbsp;&nbsp;&nbsp;Other []: <br/>
Is the information correct? [Y/n] </span>Y<span class="stdout"><br/>
</span>
<span class="prompt">~/$ </span>sudo deluser test<br>
<span class="stdout">
Removing user `test' ...<br/>
Warning: group `test' has no more members.<br/>
Done.<br/>
</span>
</div>

There's tons of configuration options you can opt in from this server config file located under `/etc/ssh/sshd_config`. If you make some change, don't forget to restart the server:

<div class="terminal">
<span class="prompt">~/$ </span>sudo service ssh restart<br>
<span class="stdout">
 * Restarting OpenBSD Secure Shell server sshd &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ OK ]<br/>
</span>
</div>

<div class="related">
    <div class="title">
        Related pages<br>
        <img src="https://mickael.kerjean.me/assets/img/arrow_bottom.png"/>
    </div>
    <div class="related_content">
        <a href="{% post_url 2020-04-30-sftp-browser %}"><h3 class="no-anchor">SFTP Client</h3></a><a href="{% post_url 2020-08-31-sftp-online-test %}"><h3 class="no-anchor">SFTP Testing Tool</h3></a><a href="{% post_url 2022-04-01-sftp-curl %}"><h3 class="no-anchor">SFTP with curl</h3></a><a href="{% post_url 2020-07-02-man-sftp %}"><h3 class="no-anchor">SFTP manual</h3></a>
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
