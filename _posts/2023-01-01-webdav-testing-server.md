---
title: A zero config WebDAV server
description: A simple Webdav server
layout: post
tags: webdav
language: en
---

In this post, we will spinup a simple zero config webdav server which is [open source](https://github.com/svtslv/webdav-cli) and available from npm. This webdav server is a middleground between full fledge servers like [nginx]({% post_url 2021-12-09-nginx-webdav %}) and [apache]({% post_url 2022-03-04-apache-webdav %}) and our 20 lines of code [webdav testing server]({% post_url 2022-05-04-webdav-testing-server %}) which we already covered in previous articles.

<div class="terminal">
<span class="prompt">~/$ </span>npm install --global webdav-cli<br>
<span class="stdout">
/home/mickael/.nvm/versions/node/v14.0.0/bin/webdav-cli -> /home/mickael/.nvm/versions/node/v14.0.0/lib/node_modules/webdav-cli/dist/webdav-cli.cli.js<br/>
+ webdav-cli@2.0.0<br/>
added 15 packages from 14 contributors in 7.648s<br/>
</span>
</div>
<div class="terminal">
<span class="prompt">~/$ </span>npx webdav-cli<br>
<span class="stdout"><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_&nbsp;&nbsp;&nbsp;_&nbsp;<br/>
&nbsp;__&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;__&nbsp;&nbsp;&nbsp;___&nbsp;&nbsp;|&nbsp;|__&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;__|&nbsp;|&nbsp;&nbsp;&nbsp;__&nbsp;_&nbsp;&nbsp;__&nbsp;&nbsp;&nbsp;__&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;___&nbsp;&nbsp;|&nbsp;|&nbsp;(_)<br/>
&nbsp;\&nbsp;\&nbsp;/\&nbsp;/&nbsp;/&nbsp;&nbsp;/&nbsp;_&nbsp;\&nbsp;|&nbsp;'_&nbsp;\&nbsp;&nbsp;&nbsp;/&nbsp;_`&nbsp;|&nbsp;&nbsp;/&nbsp;_`&nbsp;|&nbsp;\&nbsp;\&nbsp;/&nbsp;/&nbsp;&nbsp;_____&nbsp;&nbsp;&nbsp;/&nbsp;__|&nbsp;|&nbsp;|&nbsp;|&nbsp;|<br/>
&nbsp;&nbsp;\&nbsp;V&nbsp;&nbsp;V&nbsp;/&nbsp;&nbsp;|&nbsp;&nbsp;__/&nbsp;|&nbsp;|_)&nbsp;|&nbsp;|&nbsp;(_|&nbsp;|&nbsp;|&nbsp;(_|&nbsp;|&nbsp;&nbsp;\&nbsp;V&nbsp;/&nbsp;&nbsp;|_____|&nbsp;|&nbsp;(__&nbsp;&nbsp;|&nbsp;|&nbsp;|&nbsp;|<br/>
&nbsp;&nbsp;&nbsp;\_/\_/&nbsp;&nbsp;&nbsp;&nbsp;\___|&nbsp;|_.__/&nbsp;&nbsp;&nbsp;\__,_|&nbsp;&nbsp;\__,_|&nbsp;&nbsp;&nbsp;\_/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\___|&nbsp;|_|&nbsp;|_|<br/>
<br/>
Homepage: https://github.com/svtslv/webdav-cli<br/>
<br/>
Server running at http://127.0.0.1:1900<br/>
[rights]: all<br/>
[digest]: false<br/>
username: domdhtgnqljs5snm<br/>
password: xq9u5r3ilgmai548<br/>
Hit CTRL-C to stop the server<br/>
Run with --help to print help</br>
</span>
</div>

By default, it will give you a username and password which you can use to connect and do whatever you want. Among the nice things are the quick configuration options which you can enable via the CLI:

<div class="terminal">
<span class="prompt">~/$ </span>npx webdav-cli --help<br>
<span class="stdout"><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_&nbsp;&nbsp;&nbsp;_&nbsp;<br/>
&nbsp;__&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;__&nbsp;&nbsp;&nbsp;___&nbsp;&nbsp;|&nbsp;|__&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;__|&nbsp;|&nbsp;&nbsp;&nbsp;__&nbsp;_&nbsp;&nbsp;__&nbsp;&nbsp;&nbsp;__&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;___&nbsp;&nbsp;|&nbsp;|&nbsp;(_)<br/>
&nbsp;\&nbsp;\&nbsp;/\&nbsp;/&nbsp;/&nbsp;&nbsp;/&nbsp;_&nbsp;\&nbsp;|&nbsp;'_&nbsp;\&nbsp;&nbsp;&nbsp;/&nbsp;_`&nbsp;|&nbsp;&nbsp;/&nbsp;_`&nbsp;|&nbsp;\&nbsp;\&nbsp;/&nbsp;/&nbsp;&nbsp;_____&nbsp;&nbsp;&nbsp;/&nbsp;__|&nbsp;|&nbsp;|&nbsp;|&nbsp;|<br/>
&nbsp;&nbsp;\&nbsp;V&nbsp;&nbsp;V&nbsp;/&nbsp;&nbsp;|&nbsp;&nbsp;__/&nbsp;|&nbsp;|_)&nbsp;|&nbsp;|&nbsp;(_|&nbsp;|&nbsp;|&nbsp;(_|&nbsp;|&nbsp;&nbsp;\&nbsp;V&nbsp;/&nbsp;&nbsp;|_____|&nbsp;|&nbsp;(__&nbsp;&nbsp;|&nbsp;|&nbsp;|&nbsp;|<br/>
&nbsp;&nbsp;&nbsp;\_/\_/&nbsp;&nbsp;&nbsp;&nbsp;\___|&nbsp;|_.__/&nbsp;&nbsp;&nbsp;\__,_|&nbsp;&nbsp;\__,_|&nbsp;&nbsp;&nbsp;\_/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\___|&nbsp;|_|&nbsp;|_|<br/>
<br/>
Homepage: https://github.com/svtslv/webdav-cli<br/>
<br/>
usage: webdav-cli [options]<br/>
<br/>
options:<br/>
&nbsp;&nbsp;--path&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Path&nbsp;to&nbsp;folder&nbsp;[process.cwd()]<br/>
&nbsp;&nbsp;--host&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Host&nbsp;to&nbsp;use&nbsp;[127.0.0.1]<br/>
&nbsp;&nbsp;--port&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Port&nbsp;to&nbsp;use&nbsp;[1900]<br/>
&nbsp;&nbsp;--digest&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enable&nbsp;digest&nbsp;authentication&nbsp;[basic]<br/>
&nbsp;&nbsp;--username&nbsp;&nbsp;&nbsp;Username&nbsp;for&nbsp;basic/digest&nbsp;authentication&nbsp;[random]<br/>
&nbsp;&nbsp;--password&nbsp;&nbsp;&nbsp;Password&nbsp;for&nbsp;basic/digest&nbsp;authentication&nbsp;[random]<br/>
&nbsp;&nbsp;--directory&nbsp;&nbsp;Show&nbsp;directory&nbsp;listings&nbsp;[false]<br/>
&nbsp;&nbsp;--autoIndex&nbsp;&nbsp;Display&nbsp;autoIndex&nbsp;[false]<br/>
&nbsp;&nbsp;--ssl&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enable&nbsp;https&nbsp;[false]<br/>
&nbsp;&nbsp;--sslKey&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Path&nbsp;to&nbsp;ssl&nbsp;key&nbsp;file&nbsp;[self-signed]<br/>
&nbsp;&nbsp;--sslCert&nbsp;&nbsp;&nbsp;&nbsp;Path&nbsp;to&nbsp;ssl&nbsp;cert&nbsp;file&nbsp;[self-signed]<br/>
&nbsp;&nbsp;--help&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Print&nbsp;this&nbsp;list&nbsp;and&nbsp;exit<br/>
&nbsp;&nbsp;--version&nbsp;&nbsp;&nbsp;&nbsp;Print&nbsp;the&nbsp;version&nbsp;and&nbsp;exit.<br/>
&nbsp;&nbsp;--rights&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Comma&nbsp;separated&nbsp;values&nbsp;without&nbsp;spaces&nbsp;[all]<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;'all',&nbsp;'canCreate',&nbsp;'canDelete',&nbsp;'canMove',&nbsp;'canRename',&nbsp;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;'canAppend',&nbsp;'canWrite',&nbsp;'canRead',&nbsp;'canSource',&nbsp;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;'canGetMimeType',&nbsp;'canGetSize',&nbsp;'canListLocks',&nbsp;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;'canSetLock',&nbsp;'canRemoveLock',&nbsp;'canGetAvailableLocks',&nbsp;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;'canGetLock',&nbsp;'canAddChild',&nbsp;'canRemoveChild',&nbsp;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;'canGetChildren',&nbsp;'canSetProperty',&nbsp;'canGetProperty',&nbsp;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;'canGetProperties',&nbsp;'canRemoveProperty',&nbsp;'canGetCreationDate',&nbsp;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;'canGetLastModifiedDate',&nbsp;'canGetWebName',&nbsp;'canGetType'<br/>
<br/>
env:<br/>
&nbsp;&nbsp;WEBDAV_CLI_PATH,&nbsp;WEBDAV_CLI_HOST,&nbsp;WEBDAV_CLI_PORT,<br/>
&nbsp;&nbsp;WEBDAV_CLI_USERNAME,&nbsp;WEBDAV_CLI_PASSWORD,&nbsp;WEBDAV_CLI_DIGEST,<br/>
&nbsp;&nbsp;WEBDAV_CLI_SSL,&nbsp;WEBDAV_CLI_SSL_KEY,&nbsp;WEBDAV_CLI_SSL_CERT,<br/>
&nbsp;&nbsp;WEBDAV_CLI_DIRECTORY,&nbsp;WEBDAV_CLI_AUTO_INDEX,&nbsp;WEBDAV_CLI_RIGHTS<br/>
&nbsp;&nbsp;WEBDAV_CLI_DISABLE_AUTHENTICATION<br/>
</span>
</div>

To get further, check out [their github repo](https://github.com/svtslv/webdav-cli)

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
