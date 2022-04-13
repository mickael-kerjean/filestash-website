---
title: How to create a webdav server with Apache
layout: post
description: Step by step instructions to install and setup a webdav server using Apache and its related dav modules in less than 2 minutes
language: en
tags: webdav guide
---

Apache is one of the most popular software there is when it comes to create a web server. My favorite feature is its [dynamic module system](https://httpd.apache.org/modules/) which enables users to extend the base server functionality with extra features among which creating a WebDAV server.

In this guide, I will show you all the steps involved in creating a WebDAV server from scratch from:
1. [the installation of Apache itself](#install-apache)
2. [the required configuration](#configure-the-webdav-server)

# Install Apache

In Ubuntu 20-04:
<div class="terminal">
<span class="prompt">~/$ </span>apt -y update<br>
<span class="stdout">
Get:1 https://mirror.hetzner.com/ubuntu/packages focal InRelease [265 kB]<br/>
Get:2 https://mirror.hetzner.com/ubuntu/packages focal-updates InRelease [114 kB]<br/>
Get:3 https://mirror.hetzner.com/ubuntu/security focal-security InRelease [114 kB]<br/>
...<br/>
..<br/>
...<br/>
Reading state information... Done<br/>
</span>
<span class="prompt">~/$ </span>apt -y install apache2<br>
<span class="stdout">
Reading package lists... Done<br>
Building dependency tree<br>
Reading state information... Done<br>
...<br>
..<br>
...<br>
Created symlink /etc/systemd/system/multi-user.target.wants/apache2.service → /lib/systemd/system/apache2.service.<br/>
Created symlink /etc/systemd/system/multi-user.target.wants/apache-htcacheclean.service → /lib/systemd/system/apache-htcacheclean.service.<br/>
Processing triggers for ufw (0.36-6ubuntu1) ...<br/>
Processing triggers for systemd (245.4-4ubuntu3.15) ...<br/>
Processing triggers for man-db (2.9.1-1) ...<br/>
Processing triggers for libc-bin (2.31-0ubuntu9.2) ...<br/>
</span>
</div>

# Configure the WebDAV server


<div class="terminal">
<span class="prompt">~/$ </span>a2enmod dav<br>
<span class="stdout">
Enabling module dav.<br/>
To activate the new configuration, you need to run:<br/>
&nbsp;&nbsp;service apache2 restart<br/>
</span>
<span class="prompt">~/$ </span>a2enmod dav_fs<br>
<span class="stdout">
Considering dependency dav for dav_fs:<br/>
Module dav already enabled<br/>
Enabling module dav_fs.<br/>
To activate the new configuration, you need to run:<br/>
&nbsp;&nbsp;service apache2 restart<br/>
</span>
<span class="prompt">~/$ </span>mkdir -p /usr/local/apache/<br>
<span class="prompt">~/$ </span>chown -R www-data:www-data /usr/local/apache<br>
<span class="prompt">~/$ </span>chown -R www-data:www-data /var/www/<br>
<span class="prompt">~/$ </span>touch /usr/local/apache/user.password<br>
<span class="prompt">~/$ </span>cat > /etc/apache2/sites-available/webdav-site.conf <<EOF<br/>
DavLockDB /usr/local/apache/DavLock<br/>
ServerName localhost<br/>
Alias /webdav /var/www/<br/>
<Directory /var/www/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;DAV On<br/>
&nbsp;&nbsp;&nbsp;&nbsp;DirectoryIndex disabled<br/>
&nbsp;&nbsp;&nbsp;&nbsp;AuthType Basic<br/>
&nbsp;&nbsp;&nbsp;&nbsp;AuthName "Password Required"<br/>
&nbsp;&nbsp;&nbsp;&nbsp;AuthUserFile /usr/local/apache/users.password<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Require valid-user<br/>
</Directory><br/>
EOF<br/>
<span class="prompt">~/$ </span>ln -s /etc/apache2/sites-available/webdav-site.conf /etc/apache2/sites-enabled/webdav-site.conf<br>
<span class="prompt">~/$ </span>apachectl configtest && service apache2 restart<br>
<span class="stdout">
Syntax OK<br/>
</span>
</div>

Finally let's create some users:
<div class="terminal">
<span class="prompt">~/$ </span>htpasswd -c /usr/local/apache/users.password username<br>
<span class="stdout">
New password: <br>
Re-type new password: <br>
Adding password for user username<br>
</span>
</div>

To make sure everything is working out properly:
<div class="terminal">
<span class="prompt">~/$ </span>curl -X PROPFIND --user "username:password" --data "&lt;d:propfind xmlns:d='DAV:'&gt;&lt;d:prop&gt;&lt;d:displayname/&gt;&lt;d:resourcetype/&gt;&lt;d:getlastmodified/&gt;&lt;d:getcontentlength/&gt;&lt;/d:prop&gt;&lt;/d:propfind&gt;" -H "Depth: 1" http://127.0.0.1/webdav/<br>
<span class="stdout">
&lt;?xml version="1.0" encoding="utf-8"?&gt;<br/>
&lt;D:multistatus xmlns:D="DAV:" xmlns:ns0="DAV:"&gt;<br/>
&lt;D:response xmlns:lp1="DAV:" xmlns:lp2="http://apache.org/dav/props/" xmlns:g0="DAV:"&gt;<br/>
&lt;D:href&gt;/webdav/html/&lt;/D:href&gt;<br/>
&lt;D:propstat&gt;<br/>
&lt;D:prop&gt;<br/>
&lt;lp1:resourcetype&gt;&lt;D:collection/&gt;&lt;/lp1:resourcetype&gt;<br/>
&lt;lp1:getlastmodified&gt;Fri, 04 Mar 2022 07:10:02 GMT&lt;/lp1:getlastmodified&gt;<br/>
&lt;/D:prop&gt;<br/>
&lt;D:status&gt;HTTP/1.1 200 OK&lt;/D:status&gt;<br/>
&lt;/D:propstat&gt;<br/>
&lt;D:propstat&gt;<br/>
&lt;D:prop&gt;<br/>
&lt;g0:displayname/&gt;<br/>
&lt;g0:getcontentlength/&gt;<br/>
&lt;/D:prop&gt;<br/>
&lt;D:status&gt;HTTP/1.1 404 Not Found&lt;/D:status&gt;<br/>
&lt;/D:propstat&gt;<br/>
&lt;/D:response&gt;<br/>
&lt;D:response xmlns:lp1="DAV:" xmlns:lp2="http://apache.org/dav/props/" xmlns:g0="DAV:"&gt;<br/>
&lt;D:href&gt;/webdav/html/old.html&lt;/D:href&gt;<br/>
&lt;D:propstat&gt;<br/>
&lt;D:prop&gt;<br/>
&lt;lp1:resourcetype/&gt;<br/>
&lt;lp1:getlastmodified&gt;Fri, 04 Mar 2022 06:41:27 GMT&lt;/lp1:getlastmodified&gt;<br/>
&lt;lp1:getcontentlength&gt;10918&lt;/lp1:getcontentlength&gt;<br/>
&lt;/D:prop&gt;<br/>
&lt;D:status&gt;HTTP/1.1 200 OK&lt;/D:status&gt;<br/>
&lt;/D:propstat&gt;<br/>
&lt;D:propstat&gt;<br/>
&lt;D:prop&gt;<br/>
&lt;g0:displayname/&gt;<br/>
&lt;/D:prop&gt;<br/>
&lt;D:status&gt;HTTP/1.1 404 Not Found&lt;/D:status&gt;<br/>
&lt;/D:propstat&gt;<br/>
&lt;/D:response&gt;<br/>
&lt;/D:multistatus&gt;<br/>
</span>
</div>

If you're the kind of person who find xml sexy, you're good to go with curl, otherwise, check our online [webdav client]({% post_url 2021-10-18-webdav-client %}):

<a href="{% post_url 2021-10-18-webdav-client %}"><img class="fancy" src="https://www.filestash.app/img/screenshots/viewerpage.png" alt="screenshot of the Filestash webdav client" style="margin-top: -15px;" /></a>

*Pro tips*: 
1. don't forget to setup your ssl certificates if you were to use that server outside your local machine. To get this to work, refer to the [relevant apache documentation](http://www.apache.com/how-to-setup-an-ssl-certificate-on-apache/)
2. There's a lot more option available for auth, refer to the [apache documentation](https://httpd.apache.org/docs/current/howto/htaccess.html#auth)

<div class="related">
    <div class="title">
        Related Pages<br>
        <img src="https://mickael.kerjean.me/assets/img/arrow_bottom.png"/>
    </div>
    <div class="related_content">
        <a href="{% post_url 2021-10-18-webdav-client %}"><h3 class="no-anchor">Webdav Client</h3></a>        <a href="{% post_url 2021-12-09-nginx-webdav %}"><h3 class="no-anchor">Nginx WebDAV</h3></a><a href="{% post_url 2022-01-15-webdav-test-tool %}"><h3 class="no-anchor">Webdav Test Tool</h3></a><a href="{% post_url 2019-11-26-ftp-web-client %}"><h3 class="no-anchor">FTP Client</h3></a><a href="{% post_url 2020-04-30-sftp-browser %}"><h3 class="no-anchor">SFTP Client</h3></a>
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
