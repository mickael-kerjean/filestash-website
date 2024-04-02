---
title: What is FTP? The Essential Guide
description: File Transfer Protocol (FTP) refers to a xxxx that organisations use to manage files remotely
layout: landing
language: en
permalink: /what-is-ftp.html
tags: ftp
---

<link rel="stylesheet" href="/css/landing-page.css">
<link rel="stylesheet" href="/css/landing-page-login.css">
<link rel="stylesheet" href="/css/guide.css">

<div id="splash" class="nopadding">
  <div class="row">
    <div class="col-sm-12">
      <div class="hgroup">
        <h1>What is FTP?</h1>
        <p class="container" id="defining-ftp">
            <img src="/img/posts/2021-07-27-getting-started-with-a-ftp-server_0.png" alt="what is FTP" class="hidden-sm hidden-xs" />
            File Transfer Protocol (<a href="https://www.w3.org/Protocols/rfc959/">FTP</a>) is <strong>THE</strong> most battle-tested protocol for managing files over a network. Simply put, FTP is used for downloading and uploading files, managing folders, and executing all the file management operations you might want to do but across a network.
        </p>
      </div>
    </div>
  </div>
</div>
<div class="waveshape" style="background-image:url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNDQwIiBoZWlnaHQ9IjIyMCIgdmlld0JveD0iMCAwIDE0NDAgMjIwIj4KPHBhdGggc3R5bGU9ImZpbGw6I2YyZjNmNTtzdHJva2U6IzM3NTE2MDtzdHJva2Utd2lkdGg6MnB4IiBkPSJtIDE0NDAsMCAxLDg1IEMgMTI4Mi4xNzE1LDg1IDY3MCwxMzMgNDkwLDEzMyA0NTUsMTMzIDE0LDE0IDAsMTQgViAwIiAvPgo8L3N2Zz4=)"></div>

<div id="toc">
    <h2>Table of contents</h2>
    <ol>
        <li><a href="#defining-ftp">Defining FTP</a></li>
        <li><a href="#ftp-fundamentals">FTP Fundamentals</a></li>
        <li><a href="#the-use-case-of-ftp">The use cases of FTP</a></li>
        <li><a href="#how-to-access-your-ftp-server">How to access your FTP server</a></li>
        <li><a href="#the-different-type-of-ftp-clients">The different type of clients</a></li>
        <li><a href="#how-ftp-works">How FTP works</a></li>
        <li><a href="#ftp-faqs">FAQs</a></li>
        <li><a href="#technical-resources">Technical Resources</a></li>
    </ol>
</div>


<div class="container" id="main">

<h2 id="ftp-fundamentals">FTP Fundamentals</h2>

<p>
    FTP is built on the client-server model architecture. To use it you need 2 main components:
</p>

<ul>
    <li>a <a href="#ftp-servers">FTP server</a>: that is the software program that runs on the server from which you will be manipulating files</li>
    <li>a <a href="#the-different-type-of-ftp-client">FTP client</a>: that is the software you run to access the files on that server. It would typically looks like this:<br>
    <img class="fancy" alt="side by side screenshot of 2 FTP clients" src="/img/posts/2024-03-05-what-is-ftp-0.webp" /></li>
</ul>

<h2 id="the-use-case-of-ftp">FTP Use cases</h2>

<p>
    <strong>Website administrator:</strong> The most common use case for FTP is to manage a site made with something like <a href="https://wordpress.org/">wordpress</a>, <a href="https://www.joomla.org/">joomla</a>, <a href="https://www.drupal.org/">Drupal</a>, ... Using FTP, administrators can upload new files and content to their servers, update web pages and scripts, manage media files, <a href="{% post_url 2019-12-06-ovh-ftp %}">back up</a> their website data, ...
</p>

<p>
    <strong>Software distribution:</strong> Historically most softwares in the linux world were publish through mirrors on FTP servers. For example: <a href="https://ftp.debian.org/">ftp.debian.org</a>, <a href="http://ftp.gnu.org/">ftp.gnu.org</a>, ftp.slackware.com.
</p>

<p>
    <strong>Network Storage:</strong> Many enterprises do use FTP to provide network storage solutions and be able to share data both internally and externally. There is literally <a href="https://www.shodan.io/search?query=ftp">millions</a> of those on the internet.
</p>

<h2 id="the-different-type-of-ftp-clients">The different type of FTP clients</h2>

<p>
    Assuming you have an FTP server somewhere you know either its IP address or have a domain name, you can access such server through a tool called an FTP client. Depending on what you are trying to do, you will find different types of clients:
</p>

<ul>
    <li>command-line based client: <a href="{% post_url 2020-07-06-ftp-from-the-command-line %}">ftp</a> or <a href="https://lftp.yar.ru/">lftp</a></li>
    <li>desktop client: <a href="https://filezilla-project.org/">Filezilla</a>, <a href="https://cyberduck.io/">Cyberduck</a></li>
    <li>web client: <a href="{% post_url 2019-11-26-ftp-web-client %}">Filestash</a>, <a href="https://www.monstaftp.com/">MonstaFTP</a></li>
</ul>

<img alt="screenshot of Filestash when uploading" class="fancy" src="/img/screenshots/feature1.png" />

<p>
    The role of those clients is to talk to your server using the FTP protocol and perform the action you want to do on that server. For example, if you are hosting WordPress and want to change your theme, you will be able to use that client to update some data on your server.
</p>

<h2 id="how-to-access-your-ftp-server">How to access your FTP server?</h2>

<p>
    For the sake of this guide, we will be connecting to the gnu ftp server available from: <a href="https://ftp.gnu.org/">ftp://ftp.gnu.org</a>. To make things really simple we will be connecting to it via a <a href="{% post_url 2019-11-26-ftp-web-client %}">web client</a>:<br><br>

    <script>
    function loadFTP(e) {
        e.preventDefault();
        e.target.parentElement.innerHTML="<iframe title='FTP client example' src='https://demo.filestash.app/login?type=ftp&hostname=ftp.gnu.org&next=/files/gnu/bash/'></iframe>"
    }
    </script>
    <a href="https://demo.filestash.app/login?type=ftp&hostname=ftp.gnu.org&next=/files/gnu/bash/" id="photo-player" onclick="loadFTP(event);">
        <img alt="screenshot of the content in ftp://ftp.gnu.org" src="/img/posts/2024-03-05-what-is-ftp-1.webp" />
    </a>
    <style>
        #photo-player { display: block; }
        #photo-player img, #photo-player iframe {
            width: 100%;
            height: 100%;
            border: 9px solid #0000001a;
            border-radius: 5px;
            box-shadow: rgba(158, 163, 172, 0.3) 3px 3px 20px;
            box-sizing: border-box;
            min-height: 500px;
        }
    </style>
</p>
<!-- TODO: load as iframe? -->

<h2 id="how-ftp-works">How FTP works?</h2>

<p>
FTP is a standard that has evolved over time to take advantage of technological advances we’ve had over the last 50 years. In its currently used format, the protocol is an entirely TCP based service without any UDP components. What makes FTP different is how it uses 2 connections, a first one for the control exchange which runs typically on port 21 and another one for data exchange which is typically using port 20 and random port > 1024.
</p>
<p>
The model of FTP as described in RFC959:

<pre>
<code>
                                            -------------
                                            |/---------\|
                                            ||   User  ||    --------
                                            ||Interface|<--->| User |
                                            |\----^----/|    --------
                  ----------                |     |     |
                  |/------\|  FTP Commands  |/----V----\|
                  ||Server|<---------------->|   User  ||
                  ||  PI  ||   FTP Replies  ||    PI   ||
                  |\--^---/|                |\----^----/|
                  |   |    |                |     |     |
      --------    |/--V---\|      Data      |/----V----\|    --------
      | File |<--->|Server|<---------------->|  User   |<--->| File |
      |System|    || DTP  ||   Connection   ||   DTP   ||    |System|
      --------    |\------/|                |\---------/|    --------
                  ----------                -------------

                  Server-FTP                   USER-FTP

legend:
- PI: "protocol interpreter"
- DTP: "data transfer process"
</code>
</pre>
</p>

<p>
    If you want to know all the intricacies of FTP, its mode and commands, a good starting point is <a href="https://datatracker.ietf.org/doc/html/rfc959">RFC959</a>. If you feel like a historian, you might want to read the very first <a href="https://tools.ietf.org/html/rfc114">RFC114</a> and if that's still not enough you want to dig through <a href="https://tools.ietf.org/html/rfc697">RFC 697</a>, <a href="https://tools.ietf.org/html/rfc765">RFC 765</a>, <a href="https://tools.ietf.org/html/rfc1579">RFC 1579</a>, <a href="https://tools.ietf.org/html/rfc1635">RFC 1635</a>, <a href="https://tools.ietf.org/html/rfc1639">RFC 1639</a>, <a href="https://tools.ietf.org/html/rfc1738">RFC 1738</a>, <a href="https://tools.ietf.org/html/rfc2228">RFC 2228</a>, <a href="https://tools.ietf.org/html/rfc2389">RFC 2389</a>, <a href="https://tools.ietf.org/html/rfc2428">RFC 2428</a>, <a href="https://tools.ietf.org/html/rfc2577">RFC 2577</a>, <a href="https://tools.ietf.org/html/rfc2640">RFC 2640</a>, <a href="https://tools.ietf.org/html/rfc3659">RFC 3659</a>, <a href="https://tools.ietf.org/html/rfc5797">RFC 5797</a>, <a href="https://tools.ietf.org/html/rfc7151">RFC 7151</a>.
</p>

<h2 id="ftp-faqs"> FTP FAQs</h2>

<p>
    <strong>What FTP stands for?</strong><br>"File Transfer Protocol".
</p>

<p>
    <strong>Is FTP secure?</strong><br>FTP is as secure as HTTP. In practice most people referring to FTP would have their server setup to accept FTPS connections and <a href="{% post_url 2023-11-23-debunking-the-security-of-ftp %}">FTPS is as secure as HTTPS</a>.
</p>

<p>
    <strong>Who invented FTP?</strong><br>FTP was invented by Abhay Bhushan while he was a student at MIT. Fun fact, he also work on the early version of emails.
</p>

<p>
    <strong>When was FTP invented?</strong><br>The original spec of FTP was published the 16 April 1971.
</p>

<p>
    <strong id="ftp-servers">What are the 3 most common FTP servers?</strong><br> According to <a href="https://shodan.io">shodan</a>, the most popular FTP server is <a href="https://www.pureftpd.org/project/pure-ftpd/">PureFTPd</a> with 26% market share, followed by <a href="https://bftpd.sourceforge.net/">Bftpd</a> and Microsoft FTPD.
</p>

<p>
    <strong>Is SFTP the same as FTPS?</strong><br>No! FTPS and SFTP both enable secure file exchange over a network but the way they work under the hood are completely different in the same way apples and oranges taste vastly different despite both being fruits.
</p>

<p>
    <strong>What is anonymous FTP?</strong><br>The anonymous user is a special account enabled on certain FTP servers, allowing individuals to browse and download resources without the capability to modify the server's content.
</p>

<p>
    <strong>FTP has the reputation to be tricky to deploy, why is that?</strong><br>Contrary to some other file transfer protocols (like SFTP or WebDAV), FTP can't work using a single port but need a range of opened port, making the configuration of firewalls potentially challenging depending on your environment.
</p>


<h2 id="technical-resources">Technical Resources</h2>

<div id="resources">
    <a href="{% post_url 2019-11-26-ftp-web-client %}">
        <h3>FTP Client</h3>
        An online web client for FTP you can use from your browser
        <i>Use the FTP Client</i>
    </a>
    <a href="{% post_url 2020-08-04-ftp-testing-tool %}">
        <h3>FTP Test tool</h3>
        A Test tool to see all the information your FTP server is exposing
        <i>Explore the tool</i>
    </a>
    <a href="{% post_url 2022-07-12-ftp-server-linux %}">
        <h3>Setup a FTP server</h3>
        Deploy proftpd, the most popular FTP server
        <i>Deploy proftpd</i>
    </a>
    <a href="{% post_url 2020-07-06-ftp-from-the-command-line %}">
        <h3>FTP from the CLI</h3>
        Master the FTP client from your command line using the ftp command
        <i>Explore the FTP CLI</i>
    </a>
    <a href="{% post_url 2020-09-29-doing-ftp-with-curl %}">
        <h3>FTP via curl</h3>
        curl can be used as a FTP client, learn how to use it from your terminal.
        <i>Explore FTP via curl</i>
    </a>
    <a href="{% post_url 2021-12-14-python-ftplib %}">
        <h3>The simplest FTP server</h3>
        Python has this great library you can use to create a FTP server as a one liner using pyftplib.
        <i>Deploy pyftplib</i>
    </a>
</div>

<style>
#resources {
    display:flex;
    flex-wrap: wrap;
}
#resources a{
    display: block;
    width: 300px;
    background: var(--bg-color);
    margin: 0px 15px 15px 0;
    padding: 20px 20px 10px 20px;
    color: inherit;
    text-decoration: none;
}
#resources a h3 {
    font-size: 1.1rem;
    margin: 0 0 10px 0;
    color: inherit;
}
#resources a i:before {
    content: "> ";
}
#resources a i {
    display: block;
    display: block;
    margin-top: 20px;
    font-style: normal;
    color: #2b679b;
}
</style>
</div>


<div id="features">
    <div class="call-to-action">
        <h2>Online Tools:</h2>
        <a class="btn light" href="{% post_url 2021-10-18-webdav-client %}">WebDAV Client</a>
        <a class="btn light" href="{% post_url 2019-11-21-s3-browser %}">S3 Browser</a>
        <a class="btn light" href="{% post_url 2019-11-26-ftp-web-client %}">FTP Client</a>
        <a class="btn light" href="{% post_url 2020-04-30-sftp-browser %}">SFTP Client</a>
    </div>
</div>
