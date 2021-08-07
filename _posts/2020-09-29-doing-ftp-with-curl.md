---
title: How to use curl for FTP?
description: A cheat sheet with all the FTP related commands available from curl - examples to upload files, download file, list files, delete file, etc...
layout: post
permalink: /ftp-with-curl.html
tags: ftp guide
language: en
---

<style>
h2 { margin-bottom: 5px; }
</style>

curl is the goto tool for anything HTTP related but you can also use it for your FTP and FTPS tasks. This post is a cheat sheet with a list of common curl commands you can use to:
1. [upload files on your FTP server](#uploading-a-file-to-your-ftp-server)
2. [download file stored on an FTP server](#downloading-files-on-an-ftp-server)
3. [authenticate to your FTP server](#connect-with-your-username-and-password)
4. [list files on your FTP server](#list-files-on-an-ftp-server)
5. [delete files on your FTP server](#delete-files-on-an-ftp-server)

## List files on an FTP server
<div class="terminal">
<span class="prompt">~/$ </span>curl ftp://ftp.slackware.com<br>
<span class="stdout">
lrwxrwxrwx    1 0        0              17 Jun 15  2015 debian -> pub/debian/debian<br>
lrwxrwxrwx    1 0        0              18 Jun 15  2015 debian-cd -> pub/debian-cdimage<br>
lrwxrwxrwx    1 0        0              18 Jun 15  2015 debian-cdimage -> pub/debian-cdimage<br>
drwxr-xr-x    2 0        0              56 May 12  2016 lost+found<br>
drwxr-xr-x    4 0        0            4096 Jun 30 16:58 pub<br>
-rw-r--r--    1 0        0             754 May 13  2015 welcome.msg<br>
</span>
<span class="prompt">~/$ </span>curl ftp://ftp.slackware.com/debian-cd/<br>
<span class="stdout">
drwxr-sr-x    9 3064     1199         4096 Sep 27 00:23 10.6.0<br>
drwxr-xr-x    5 3064     1199           58 Sep 27 00:23 10.6.0-live<br>
lrwxrwxrwx    1 3064     1199            6 Sep 27 00:29 current -> 10.6.0<br>
lrwxrwxrwx    1 3064     1199           12 Sep 27 00:29 current-live -> 10.6.0-live/<br>
-rw-r--r--    1 3064     1199        15496 Sep 29 04:12 ls-lR.gz<br>
drwxr-xr-x    4 3064     1199           42 May 23  2005 project<br>
</span>
</div>

## Downloading files on an FTP server
<div class="terminal">
<span class="prompt">~/$ </span>curl ftp://ftp.slackware.com/welcome.msg<br>
<span class="stdout">
---------------------------------------------------------------------------<br>
                      R S Y N C . O S U O S L . O R G<br>
                          Oregon State University<br>
                              Open Source Lab<br>
<br>
       Unauthorized use is prohibited - violators will be prosecuted<br>
---------------------------------------------------------------------------<br>
<br>
                For more information about the OSL visit:<br>
                    http://osuosl.org/services/hosting<br>
<br>
          This host is the home to the primary archives of several<br>
           projects.  We would prefer that only primary/secondary<br>
                    mirrors use this service.  Thanks!<br>
<br>
---------------------------------------------------------------------------<br>
</span>
<span class="prompt">~/$ </span>curl -O "ftp://ftp.slackware.com/{welcome.msg,debian-cd/ls-lR.gz}"<br>
<span class="stdout">

[1/2]: ftp://ftp.slackware.com/welcome.msg --> welcome.msg<br>
--_curl_--ftp://ftp.slackware.com/welcome.msg<br>
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current<br>
                                 Dload  Upload   Total   Spent    Left  Speed<br>
100   754  100   754    0     0    347      0  0:00:02  0:00:02 --:--:--   347<br>
<br>
[2/2]: ftp://ftp.slackware.com/debian-cd/ls-lR.gz --> ls-lR.gz<br>
--_curl_--ftp://ftp.slackware.com/debian-cd/ls-lR.gz<br>
100 15496  100 15496    0     0  12201      0  0:00:01  0:00:01 --:--:-- 28537<br>
</span>
<span class="prompt">~/$ </span>ls <span class="comment"># verify the files have been downloaded</span><br>
<span class="stdout">
ls-lR.gz	welcome.msg<br>
</span>
</div>

## Connect with your username and password
<div class="terminal">
<span class="prompt">~/$ </span>curl ftp://username:password@ftp.slackware.com/<br>
<span class="stdout">
curl: (67) Access denied: 530<br>
</span>
<span class="prompt">~/$ </span>curl -u "username:password" ftp://ftp.slackware.com/<br>
<span class="stdout">
curl: (67) Access denied: 530<br>
</span>
<span class="prompt">~/$ </span>curl -u "anonymous:password" ftp://ftp.slackware.com/<br>
<span class="stdout">
lrwxrwxrwx    1 0        0              17 Jun 15  2015 debian -> pub/debian/debian<br>
lrwxrwxrwx    1 0        0              18 Jun 15  2015 debian-cd -> pub/debian-cdimage<br>
lrwxrwxrwx    1 0        0              18 Jun 15  2015 debian-cdimage -> pub/debian-cdimage<br>
drwxr-xr-x    2 0        0              56 May 12  2016 lost+found<br>
drwxr-xr-x    4 0        0            4096 Jun 30 16:58 pub<br>
-rw-r--r--    1 0        0             754 May 13  2015 welcome.msg<br>
</span>
</div>


## Uploading a file to your FTP server
<div class="terminal">
<span class="prompt">~/$ </span>curl -T welcome.msg -u "username:password" ftp://ftp.example.com/<br>
<span class="stdout">
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current<br>
                                 Dload  Upload   Total   Spent    Left  Speed<br>
100   754    0     0  100   754      0    194  0:00:03  0:00:03 --:--:--   194<br>
</span>
</div>

## Delete files on an FTP server
<div class="terminal">
    <span class="prompt">~/$ </span>curl -u "username:password" --quote "DELE welcome.msg" ftp://ftpperso.free.fr<br>
    <span class="stdout">
    </span>
</div>

<div class="related">
    <div class="title">
        Related pages<br>
        <img src="https://mickael.kerjean.me/assets/img/arrow_bottom.png"/>
    </div>
    <div class="related_content">
        <a href="{% post_url 2020-08-04-ftp-testing-tool %}"><h3 class="no-anchor">FTP Testing Tool</h3></a><a href="{% post_url 2019-11-26-ftp-web-client %}"><h3 class="no-anchor">FTP Web Client</h3></a><a href="{% post_url 2020-07-06-ftp-from-the-command-line %}"><h3 class="no-anchor">FTP CLI</h3></a><a href="{% post_url 2021-08-07-ftp-with-telnet %}"><h3 class="no-anchor">FTP with telnet</h3></a>
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
