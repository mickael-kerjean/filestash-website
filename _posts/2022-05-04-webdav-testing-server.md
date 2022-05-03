---
title: A WebDAV testing server
description: A Webdav server you can run right after downloading it and without configuration
layout: post
permalink: /webdav-server.html
tags: webdav
language: en
---

In this post, we will be running a webdav server on Linux that is as simple as possible and made from a single binary. If you're looking for a fully featured webdav server for more complex and flexible workload, check our guide to set up a webdav server using [nginx]({% post_url 2021-12-09-nginx-webdav %}) or [apache]({% post_url 2022-03-04-apache-webdav %}) instead.

**Step1**: download the webdav binary
<div class="terminal">
<span class="prompt">~/$ </span>curl -O https://archive.kerjean.me/public/2022/webdav.bin<br>
<span class="stdout">
Running server on http://localhost:8080/<br>
</span>
<span class="prompt">~/$ </span>chmod +x webdav.bin<br>
</div>

**Step2**: run it
<div class="terminal">
<span class="prompt">~/$ </span>./webdav.bin<br>
<span class="stdout">
Running server on http://localhost:8080/
</span>
</div>

That's it, you're done. The code for this webdav server can be found on [github](https://gist.github.com/mickael-kerjean/f2f034bdad5e077edcbfdff649d52d68)

To go a bit further, you can mount the server from your machine with something like davfs. To do this:
<div class="terminal">
<span class="prompt">~/$ </span>sudo apt-get install davfs2<br>
<span class="stdout">
Reading package lists... Done<br>
Building dependency tree... Done<br>
Reading state information... Done<br>
The following packages were automatically installed and are no longer required:<br>
&nbsp;&nbsp;libhiredis0.14 libmemcached11 libmemcachedutil2 proftpd-doc<br>
Use 'sudo apt autoremove' to remove them.<br>
The following additional packages will be installed:<br>
&nbsp;&nbsp;libneon27<br>
The following NEW packages will be installed:<br>
&nbsp;&nbsp;davfs2 libneon27<br>
0 to upgrade, 2 to newly install, 0 to remove and 150 not to upgrade.<br>
Need to get 244 kB of archives.<br>
After this operation, 626 kB of additional disk space will be used.<br>
...<br>
</span>
</div>

and mount it in your machine:

<div class="terminal">
<span class="prompt">~/$ </span>sudo mount -t davfs http://127.0.0.1:8080 /mnt/<br>
<span class="stdout">
Please enter the username to authenticate with server<br>
http://127.0.0.1:8080 or hit enter for none.<br>
&nbsp;&nbsp;Username:</span>&nbsp;<span class="stdout"><br>
Please enter the password to authenticate user  with server<br>
http://127.0.0.1:8080 or hit enter for none.<br>
&nbsp;&nbsp;Password:</span>&nbsp;<span class="stdout"><br>
</span>
</div>

Or you can use a webdav client like [Filestash]({% post_url 2021-10-18-webdav-client %}):

<a href="{% post_url 2021-10-18-webdav-client %}"><img alt="screenshot filestash" src="/img/screenshots/viewerpage.png" class="fancy"></a>

<div class="related">
    <div class="title">
        Related Articles<br>
        <img src="https://mickael.kerjean.me/assets/img/arrow_bottom.png"/>
    </div>
    <div class="related_content">
        <a href="{% post_url 2021-12-09-nginx-webdav %}"><h3 class="no-anchor">Nginx WebDAV</h3></a><a href="{% post_url 2022-03-04-apache-webdav %}"><h3 class="no-anchor">Apache WebDAV</h3></a><a href="{% post_url 2022-01-15-webdav-test-tool %}"><h3 class="no-anchor">WebDAV test</h3></a><a href="{% post_url 2021-10-18-webdav-client %}"><h3 class="no-anchor">WebDAV client</h3></a></div>
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
