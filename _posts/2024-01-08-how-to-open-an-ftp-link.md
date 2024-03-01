---
title: How to open a FTP link?
description: An online tool to open urls with ftp://
layout: post
language: en
tags: ftp
head:
- <link rel="stylesheet" href="/css/form.css">
---

[Chrome](https://developer.chrome.com/blog/chrome-80-deps-rems/) and more recently [Firefox](https://blog.mozilla.org/security/2021/07/20/stopping-ftp-support-in-firefox-90/) have both dropped support for user to connect to FTP servers like this:

<img alt="ftp from chrome - old" src="/img/posts/2022-02-01-chrome-has-deprecated-ftp-in-their-browser.png" class="fancy" />

So we made this tool so you can keep sharing ftp links with everyone:

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

and brings you and your users to a much nicer [FTP client]({% post_url 2019-11-26-ftp-web-client %}) that look like this:

<iframe style="width: 100%;height: 500px;border: 9px solid #0000001a;border-radius: 5px;box-sizing:border-box;" id="appframe" frameborder="0" src="https://demo.filestash.app/login?type=webdav&url=https://webdav.filestash.app/" allow="fullscreen;speaker"></iframe>
