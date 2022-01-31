---
title: The path forward now that Chrome has dropped FTP support
layout: post
description: Migrating away from the now deprecated Chrome integrated FTP client, a path forward using a web FTP client
language: en
permalink: /chrome-ftp.html
tags: ftp guide tool
head:
- <link rel="stylesheet" href="/css/form.css">
---

Up until the end of 2021, browsers were able to browse through FTP server and download files straight from it.

<img alt="ftp from chrome - old" src="/img/posts/2022-02-01-chrome-has-deprecated-ftp-in-their-browser.png" class="fancy" />

After the initial [deprecation annoucement](https://developers.google.com/web/updates/2019/12/chrome-80-deps-rems), the latest version of Chrome has [lost its FTP capability](https://chromestatus.com/feature/6246151319715840)

The good news is there's some much better [FTP client]({% post_url 2019-11-26-ftp-web-client %}) you can use from your browser like you did before:

<img alt="ftp from chrome - new" src="/img/screenshots/viewerpage.png" class="fancy" />

To get this to work, you can either:
1. visit our [FTP client online tool]({% post_url 2019-11-26-ftp-web-client %})
2. use this URL conversion tool to translate the old URL which had a `ftp://` onto a new format you can share with others:

<form class="tool">
    <label> FTP url:
        <input type="text" name="ftp-url" placeholder="Url of your FTP server as given to Chrome" />
    </label>
    <div style="text-align:center">
        <img src="https://mickael.kerjean.me/assets/img/arrow_bottom.png" style="background:var(--bg-color);border-radius:50%;padding:10px;width:20px;height:20px;" />
    </div>
    <label>
        <input type="text" name="ftp-url-new" readonly="true" placeholder="New URL you can share"/>
    </label>
</form>
<script>
 (function() {
     const $output = document.querySelector("input[name=\"ftp-url-new\"]");
     const $input = document.querySelector("input[name=\"ftp-url\"]");
     const inputChangeHandler = function() {
         let u = "";
         try {
             u = new URL($input.value);
         } catch (err) {
             return;
         }
         const filestashURL = new URL("https://demo.filestash.app/login?type=ftp");
         if (["ftp", "ftps:"].indexOf(u.protocol) === -1) $output.setAttribute("value", `'${u.protocol}' protocol is not supported`);
         if (!u.hostname) return;
         filestashURL.searchParams.set("hostname", u.hostname);

         if(u.username) filestashURL.searchParams.set("username", u.username);
         if(u.password) filestashURL.searchParams.set("password", u.password);
         if(u.port) filestashURL.searchParams.set("port", u.port);
         if(u.pathname && u.pathname !== "/") filestashURL.searchParams.set("next", `/files${u.pathname}`);
         $output.setAttribute(
             "value",
             "https://demo.filestash.app/login#" + decodeURIComponent(filestashURL.searchParams.toString()),
         );
     }
     $input.addEventListener("input", inputChangeHandler);
     $input.setAttribute("value", "ftp://ftp.gnu.org"); inputChangeHandler();     
 }())
</script>

On the plus side, you will now use FTPS if your server supports it and gain a lot of other functionalities which weren't offered by chrome before like upload, download multiple file at once (via zip), rename, search, shared links and many more.


<div class="related">
    <div class="title">
        Related Pages<br>
        <img src="https://mickael.kerjean.me/assets/img/arrow_bottom.png"/>
    </div>
    <div class="related_content">
        <a href="{% post_url 2019-11-26-ftp-web-client %}"><h3 class="no-anchor">FTP Client</h3></a><a href="{% post_url 2020-08-04-ftp-testing-tool %}"><h3 class="no-anchor">FTP Test Tool</h3></a><a href="{% post_url 2020-04-30-sftp-browser %}"><h3 class="no-anchor">SFTP Client</h3></a><a href="{% post_url 2019-11-21-s3-browser %}"><h3 class="no-anchor">S3 Browser</h3></a>
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
