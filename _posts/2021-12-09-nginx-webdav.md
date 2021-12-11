---
title: How to create a webdav server with Nginx
layout: post
description: Step by step instructions to get your nginx powered webdav server ready in less than 2 minutes
language: en
tags: webdav guide
---

In this tutorial, I will guide you though the step by step instructions to get a webdav server ready in less than 2 minutes. It is structured around 2 parts:
1. [installing the necessary packages](#install-nginx)
2. [configuring the webdav server](#configure-the-webdav-server)

## Install nginx

In Ubuntu 20-04:
<div class="terminal">
<span class="prompt">~/$ </span>sudo apt -y update<br>
<span class="stdout">
Get:1 https://mirror.hetzner.com/ubuntu/packages focal InRelease [265 kB]<br/>
Get:2 https://mirror.hetzner.com/ubuntu/packages focal-updates InRelease [114 kB]<br/>
Get:3 https://mirror.hetzner.com/ubuntu/security focal-security InRelease [114 kB]<br/>
...<br/>
..<br/>
...<br/>
Reading state information... Done<br/>
</span>
<span class="prompt">~/$ </span>sudo apt -y install nginx nginx-extras libnginx-mod-http-dav-ext libnginx-mod-http-auth-pam<br>
<span class="stdout">
Reading package lists... Done<br/>
Building dependency tree<br/>
...<br/>
..<br/>
...<br/>
Setting up libnginx-mod-http-image-filter (1.18.0-0ubuntu1.2) ...<br/>
Setting up nginx-core (1.18.0-0ubuntu1.2) ...<br/>
Setting up nginx (1.18.0-0ubuntu1.2) ...<br/>
Processing triggers for ufw (0.36-6ubuntu1) ...<br/>
Processing triggers for systemd (245.4-4ubuntu3.13) ...<br/>
Processing triggers for man-db (2.9.1-1) ...<br/>
Processing triggers for libc-bin (2.31-0ubuntu9.2) ...<br/>
</span>
</div>

To make sure everything ran well, let's make sure nginx is being loaded with the 2 additional modules it needs to run the webdav server: [http_dav_module](http://nginx.org/en/docs/http/ngx_http_dav_module.html) and [http-dav-ext](https://github.com/arut/nginx-dav-ext-module):
<div class="terminal">
<span class="prompt">~/$ </span>if nginx -V 2>&1 | grep -qE "http_dav_module|http-dav-ext"; then echo "good to go :)"; else echo "missing dav module :("; fi<br>
<span class="stdout">
good to go :)<br/>
</span>
</div>

## Configure the webdav server

<div class="terminal">
<span class="prompt">~/$ </span>chown -R www-data:www-data /var/www/html/<br>
<span class="prompt">~/$ </span>cat > /etc/nginx/sites-available/default << EOF<br/>
server {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;listen 80 default_server;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;listen [::]:80 default_server;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;root /var/www/html/;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;index index.html index.htm index.nginx-debian.html;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;server_name _;<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;location / {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dav_methods PUT DELETE MKCOL COPY MOVE;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dav_ext_methods PROPFIND OPTIONS;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dav_access user:rw  group:rw all:rw;<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;client_max_body_size    0;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;create_full_put_path  on;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;client_body_temp_path /tmp/;<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;auth_pam "Restricted";<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;auth_pam_service_name "common-auth";<br/>
&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
}<br/>
EOF<br/>
<span class="stdout"></span>
</div>

If you want to allow anonymous user, you can remove the 2 nginx directives that starts with `auth_pam` and won't have to run this command:
<div class="terminal">
<span class="prompt">~/$ </span>sudo usermod -aG shadow www-data<br/>
</div>

Finally, reload nginx:
<div class="terminal">
<span class="prompt">~/$ </span>sudo nginx -t && sudo nginx -s reload<br/>
</div>

To make sure everything is running fine, you can quickly test your newly created webdav server:
<div class="terminal">
<span class="prompt">~/$ </span>DOMAIN=example.com<br/>
<span class="prompt">~/$ </span>curl -I http://$DOMAIN/index.nginx-debian.html<br/>
<span class="stdout">
HTTP/1.1 401 Unauthorized<br/>
Server: nginx/1.18.0 (Ubuntu)<br/>
Date: Thu, 09 Dec 2021 04:41:01 GMT<br/>
Content-Type: text/html<br/>
Content-Length: 188<br/>
Connection: keep-alive<br/>
WWW-Authenticate: Basic realm="Restricted"<br/>
<br/>
</span>
<span class="prompt">~/$ </span>curl -I --user username:password http://$DOMAIN/index.nginx-debian.html<br/>
<span class="stdout">
HTTP/1.1 200 OK<br/>
Server: nginx/1.18.0 (Ubuntu)<br/>
Date: Thu, 09 Dec 2021 04:41:58 GMT<br/>
Content-Type: text/html<br/>
Content-Length: 612<br/>
Last-Modified: Thu, 09 Dec 2021 03:35:44 GMT<br/>
Connection: keep-alive<br/>
ETag: "61b17990-264"<br/>
Accept-Ranges: bytes<br/>
<br/>
</span>
</div>

For a nicer webdav client than curl, check our online [webdav client]({% post_url 2021-10-18-webdav-client %}):

<img class="fancy" src="https://www.filestash.app/img/screenshots/viewerpage.png" alt="screenshot of the Filestash webdav client" style="margin-top: -15px;" />

*Pro tips*:
1. If the server doesn't have a user already defined, see the [user management linux cheat sheet](https://www.guru99.com/linux-commands-cheat-sheet.html#4)
2. Before using this webdav server for anything serious, it is strongly advised to create an SSL certificate. The nginx blog has a great article about [that exact topic](https://www.nginx.com/blog/using-free-ssltls-certificates-from-lets-encrypt-with-nginx/).
3. To make the server readonly, you will need to remove the nginx config line which contains `dav_methods PUT DELETE MKCOL COPY MOVE;`. For more information about what you can do by removing some of the supported methods in webdav, refer [rfc4918](https://datatracker.ietf.org/doc/html/rfc4918).
4. if you want to chroot your user onto their home folder, you will need to replace the location block with something like this:
```
location ~ ^/(.*)$ {
  alias /home/$remote_user/$1;
  ...
}
```

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
