---
layout: documentation
title: Getting started
order: 1
language: en
permalink: /docs/
head:
  - <link rel="alternate" href="https://www.filestash.app/docs/" hreflang="en" />
  - <link rel="alternate" href="https://www.filestash.app/fr/docs/" hreflang="fr" />
---

To use Filestash, you can either:
1. Launch it from the cloud using our [cloud service](/redirect.html?origin=doc::cloud&url=https://buy.stripe.com/4gwcOa0Q6bhs6be8wz) or through the [AWS Marketplace](/install-cloud.html).
2. Self-host on your own server - [see the documentation](/docs/install-and-upgrade/?release=agpl) for the detailed instructions
3. Play with the [demo server](https://demo.filestash.app):
<iframe style="width: 100%;height: 500px;border: 9px solid #0000001a;border-radius: 5px;box-sizing:border-box;" id="appframe" frameborder="0" src="https://demo.filestash.app/login" allow="fullscreen;speaker"></iframe>

<div class="related">
    <div class="title">
        Online Clients <br>
        <img src="https://mickael.kerjean.me/assets/img/arrow_bottom.png">
    </div>
    <div class="related_content">
        <a href="{% post_url 2019-11-26-ftp-web-client %}"><h3 class="no-anchor">FTP Client</h3></a><a href="{% post_url 2020-04-30-sftp-browser %}"><h3 class="no-anchor">SFTP Client</h3></a><a href="{% post_url 2019-11-21-s3-browser %}"><h3 class="no-anchor">S3 Browser</h3></a><a href="{% post_url 2021-10-18-webdav-client %}"><h3 class="no-anchor">WebDAV Client</h3></a><a href="{% post_url 2020-01-04-ldap-browser %}"><h3 class="no-anchor">LDAP Browser</h3></a>
    </div>
</div>

<style>
.related{ text-align:center;}
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
    box-sizing: border-box;
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
