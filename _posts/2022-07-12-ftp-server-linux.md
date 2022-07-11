---
title: Setup a FTP server on ubuntu under 1 minute
description: Instructions to create a FTP server on any linux server
layout: post
tags: ftp guide
language: en
---

Want to create a FTP server on your raspberry pi or really any other linux server? Head to your terminal and type:

<div class="terminal">
<span class="prompt">~/$ </span>sudo apt-get install -y proftpd<br>
<span class="stdout">
Reading package lists... Done<br/>
Building dependency tree... Done<br/>
Reading state information... Done<br/>
...<br/>
</span>
</div>

You're done. Don't believe me, head to your terminal:
<div class="terminal">
<span class="prompt">~/$ </span>ftp 127.0.0.1<br>
<span class="stdout">
Connected to 127.0.0.1.<br/>
220 ProFTPD Server (Debian) [::ffff:127.0.0.1]<br/>
</span>
<span class="prompt">Name (127.0.0.1:mickael): </span><br/>
<span class="stdout">
331 Password required for mickael<br/>
</span>
<span class="prompt">Password: </span><br/>
<span class="stdout">
230 User mickael logged in<br/>
Remote system type is UNIX.<br/>
Using binary mode to transfer files.<br/>
</span>
<span class="prompt">ftp> </span>ls<br/>
<span class="stdout">
200 PORT command successful<br/>
150 Opening ASCII mode data connection for file list<br/>
drwxr-xr-x   2 mickael  mickael      4096 Jul  3 02:56 Desktop<br/>
drwxr-xr-x   7 mickael  mickael      4096 Aug  4 13:22 Documents<br/>
drwxr-xr-x  13 mickael  mickael     12288 Aug  6 15:20 Downloads<br/>
226 Transfer complete<br/>
</span>
<span class="prompt">ftp> </span>quit<br/>
<span class="stdout">
221 Goodbye.<br/>
</span>
</div>


## Optional step: enable FTPS for better security

If you're gonna expose the server over the internet, you should definitly enabled FTPS. To do this:

<div class="terminal">
<span class="prompt">~/$ </span>sudo openssl req -x509 -newkey rsa:2048 -keyout /etc/ssl/private/proftpd.key -out /etc/ssl/certs/proftpd.crt -nodes -days 365<br/>
<span class="stdout">
Generating a RSA private key<br/>
................+++++<br/>
......................................+++++<br/>
writing new private key to '/etc/ssl/private/proftpd.key'<br/>
-----<br/>
You are about to be asked to enter information that will be incorporated<br/>
into your certificate request.<br/>
What you are about to enter is what is called a Distinguished Name or a DN.<br/>
There are quite a few fields but you can leave some blank<br/>
For some fields there will be a default value,<br/>
If you enter '.', the field will be left blank.<br/>
-----<br/>
Country Name (2 letter code) [AU]:<br/>
State or Province Name (full name) [Some-State]:<br/>
Locality Name (eg, city) []:<br/>
Organization Name (eg, company) [Internet Widgits Pty Ltd]:<br/>
Organizational Unit Name (eg, section) []:<br/>
Common Name (e.g. server FQDN or YOUR name) []:<br/>
Email Address []:<br/>
</span>

<span class="prompt">~/$ </span>sudo sed -i 's|#Include /etc/proftpd/tls.conf|Include /etc/proftpd/tls.conf|g' /etc/proftpd/proftpd.conf<br/>
<span class="prompt">~/$ </span>cat > /etc/proftpd/tls.conf <<EOF<br/>
&lt;IfModule mod_tls.c&gt;<br/>

&nbsp;&nbsp;TLSEngine                  on<br/>
&nbsp;&nbsp;TLSLog                     /var/log/proftpd/tls.log<br/>
&nbsp;&nbsp;TLSRSACertificateKeyFile   /etc/ssl/private/proftpd.key<br/>
&nbsp;&nbsp;TLSRSACertificateFile      /etc/ssl/certs/proftpd.crt<br/>
&nbsp;&nbsp;TLSVerifyClient            off<br/>
&nbsp;&nbsp;TLSRenegotiate none<br/>
&nbsp;&nbsp;TLSOptions NoSessionReuseRequired<br/>
&lt;/IfModule&gt;<br/>
EOF<br/>

<span class="prompt">~/$ </span>sudo systemctl restart proftpd<br/>
</div>

proftpd is highly configurable, check their [doc](http://proftpd.org/docs/modules/index.html) if you want to go further.

<div class="related">
    <div class="title">
        Related Pages<br>
        <img src="https://mickael.kerjean.me/assets/img/arrow_bottom.png"/>
    </div>
    <div class="related_content">
        <a href="{% post_url 2019-11-26-ftp-web-client %}"><h3 class="no-anchor">FTP Client</h3></a>
        <a href="{% post_url 2021-08-07-ftp-with-telnet %}"><h3 class="no-anchor">FTP with telnet</h3></a><a href="{% post_url 2020-09-29-doing-ftp-with-curl %}"><h3 class="no-anchor">FTP with curl</h3></a><a href="{% post_url 2020-07-06-ftp-from-the-command-line %}"><h3 class="no-anchor">FTP from CLI</h3></a><a href="{% post_url 2020-08-04-ftp-testing-tool %}"><h3 class="no-anchor">FTP Test tool</h3></a>
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
