---
title: A simple SFTP server for testing
description: A SFTP server you can run right after downloading it and without configuration
layout: post
permalink: /simple-sftp-server.html
tags: sftp
language: en
---

In this post, we will be running a sftp server we've build to be as simple as possible. It's [open source](https://gist.github.com/mickael-kerjean/4d5aa508d45df5e1bfacb14432b83e62), made from a single binary and so bare bone it fits in a single file with less than 100 line of code, leaving you a bit of room to extend it for your needs (or not) with no headache so you can enjoy the rest of your day.

If you're looking for a fully featured SFTP server with all the bells and whistles check our guide on [setting up a full fledge SFTP server]({% post_url 2022-08-01-sftp-server-linux %}).

So let's get on with it:

**Step1**: download the sftp binary
<div class="terminal">
<span class="prompt">~/$ </span>curl -O https://archive.kerjean.me/public/2022/sftp.bin<br>
<span class="stdout">
  % Total&nbsp;&nbsp;&nbsp;&nbsp;% Received % Xferd&nbsp;&nbsp;Average Speed&nbsp;&nbsp;&nbsp;Time&nbsp;&nbsp;&nbsp;&nbsp;Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Time&nbsp;&nbsp;Current<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Dload&nbsp;&nbsp;Upload&nbsp;&nbsp;&nbsp;Total&nbsp;&nbsp;&nbsp;Spent&nbsp;&nbsp;&nbsp;&nbsp;Left&nbsp;&nbsp;Speed<br/>
100 4892k&nbsp;&nbsp;100 4892k&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;601k&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;0:00:08&nbsp;&nbsp;0:00:08 --:--:--&nbsp;&nbsp;943k<br/>
</span>
<span class="prompt">~/$ </span>chmod +x sftp.bin<br>
</div>

**Step2**: run it
<div class="terminal">
<span class="prompt">~/$ </span>./sftp.bin<br>
<span class="stdout">
Listening on [::]:2022
</span>
</div>


That's it, you're done, you can already connect to the server to make sure everything is fine:
<div class="terminal">
<span class="prompt">~/$ </span>sftp -P 2022 anonymous@127.0.0.1<br>
<span class="stdout">
The authenticity of host '[127.0.0.1]:2022 ([127.0.0.1]:2022)' can't be established.<br>
RSA key fingerprint is SHA256:+/SnmXxy1tzUaKaosZNUZf+edw8dZ8GIOzCBXyKjQcI.<br>
Are you sure you want to continue connecting (yes/no/[fingerprint])? </span>yes<span class="stdout"><br>
Warning: Permanently added '[127.0.0.1]:2022' (RSA) to the list of known hosts.<br>
anonymous@127.0.0.1's password: <br>
Connected to 127.0.0.1.<br>
</span>
<span class="prompt">sftp> </span>pwd<br>
<span class="stdout">
Remote working directory: /home/mickael/Downloads<br/>
</span>
</div>

If you have a hard time converting everbody to the CLI, check our [SFTP client]({% post_url 2020-04-30-sftp-browser %}) the people you work with will love:

<a href="{% post_url 2020-04-30-sftp-browser %}"><img alt="screenshot filestash" src="/img/screenshots/viewerpage.png" class="fancy"></a>

<div class="related">
    <div class="title">
        Related pages<br>
        <img src="https://mickael.kerjean.me/assets/img/arrow_bottom.png"/>
    </div>
    <div class="related_content">
        <a href="{% post_url 2020-04-30-sftp-browser %}"><h3 class="no-anchor">SFTP Client</h3></a><a href="{% post_url 2020-08-31-sftp-online-test %}"><h3 class="no-anchor">SFTP Testing Tool</h3></a><a href="{% post_url 2020-07-01-sftp-example %}"><h3 class="no-anchor">SFTP by examples</h3></a><a href="{% post_url 2020-07-02-man-sftp %}"><h3 class="no-anchor">SFTP manual</h3></a>
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


