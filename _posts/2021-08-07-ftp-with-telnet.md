---
title: A simple guide to FTP with telnet
description: Using telnet to login and perform FTP commands
layout: post
language: en
tags: ftp guide
---

Telnet is one of those solid tools that don’t change every day. In fact, telnet predates FTP by 2 years as it was released only [2 months after Neil Amstrong walked on the moon](https://datatracker.ietf.org/doc/html/rfc15).

To work with FTP from telnet, we will need to open 2 telnet connections across 2 terminals, a first one we will call the control channel where we will send FTP commands and another one we will refer to as the data channel. That’s one of the things CLI tools like [ftp]({% post_url 2020-07-06-ftp-from-the-command-line %}) or [curl]({% post_url 2020-09-29-doing-ftp-with-curl %}) abstract away from us but using telnet we are much closer to the protocol itself.

## Establish the control channel

Our goal here is to establish the control channel and login as an anonymous user onto a server using telnet. Spun up a terminal and type those commands:

<div class="terminal">
<span class="prompt">~/$ </span>telnet ftp.vim.org 21<br>
<span class="stdout">
Trying 145.220.21.40...<br/>
Connected to ftp.nluug.nl.<br/>
Escape character is '^]'.<br/>
220-Welcome to the FTP archive of<br/>
220-The Netherlands Unix Users Group (NLUUG).<br/>
220-<br/>
220-This server is located in The Netherlands, Europe.<br/>
220-If you are abroad, please find an ftp site near you.<br/>
220-Most information on this site is mirrored.<br/>
220-<br/>
220-Information about your login and any transfers you do are logged.<br/>
220-If you don't like this, disconnect now.<br/>
220-<br/>
220-For statistics, see http://ftp.nluug.nl/.statistics/<br/>
220-Problems?  Mail ftp-admin @ nluug.nl<br/>
220-<br/>
220-You may login as "ftp" or "anonymous".<br/>
220-<br/>
220<br/>
</span>
<span class="prompt"></span>USER anonymous<br>
<span class="stdout">
331 Please specify the password.
</span><br/>
<span class="prompt"></span>PASS anonymous<br>
<span class="stdout">
230 Login successful.
</span>
</div>

## Send commands through the control channel

There's a bunch of FTP commands we can use from the control channel, eg:

<div class="terminal">
<span class="prompt"></span>HELP<br>
<span class="stdout">
214-The following commands are recognized.<br/>
 ABOR ACCT ALLO APPE CDUP CWD  DELE EPRT EPSV FEAT HELP LIST MDTM MKD<br/>
 MODE NLST NOOP OPTS PASS PASV PORT PWD  QUIT REIN REST RETR RMD  RNFR<br/>
 RNTO SITE SIZE SMNT STAT STOR STOU STRU SYST TYPE USER XCUP XCWD XMKD<br/>
 XPWD XRMD<br/>
214 Help OK.<br/>
</span>
<span class="prompt"></span>SYST<br>
<span class="stdout">
215 UNIX Type: L8<br/>
RETR welcome.msg<br/>
425 Use PORT or PASV first.<br/>
</span>
</div>

The FTP command to list files under a directory are LIST and NLST. If you try to use those right now you will get something like this:
<div class="terminal">
<span class="prompt"></span>LIST /<br>
<span class="stdout">
425 Use PORT or PASV first.<br/>
</span>
<span class="prompt"></span>NLST /<br>
<span class="stdout">
425 Use PORT or PASV first.<br/>
</span>
</div>
Indeed those commands give back answer over a data channel and we don't have such thing yet.

## Establish a data channel

We can establish a data channel from our previously established control channel:
<div class="terminal">
<span class="prompt"></span>PASV /<br>
<span class="stdout">
227 Entering Passive Mode (145,220,21,40,242,69).<br/>
</span>
</div>

That means we can now establish another telnet session over `(145,220,21,40,242,69)`. This can be interpreted in 2 groups of numbers:
- the first four is the IP address the server is expecting to establish the data channel
- the last two are for the port number. The first number of that group is the upper 8 bit of that port and the second number is the lower 4 bits, in our case `242*256 + 69 = 62021`

To find the correct telnet command to use to establish a data channel, you can either do the calculation on your own or copy and paste what you're getting onto this calculator:

<form onsubmit="onFormSubmit()" class="calculator">
    <label>
        Result of the PASV command:
        <input type="text" placeholder="eg: 227 Entering Passive Mode (145,220,21,40,242,69)." value="227 Entering Passive Mode (145,220,21,40,242,69)." change="onInputChange" />
    </label>

    <div style="margin:20px 0 20px 0;text-align:center;">
        <i class="arrow down"></i> <br/>
        <i style="position:relative;top:-20px;" class="arrow down"></i> <br/>
    </div>

    <label>
        Telnet command to establish the data channel:
        <input type="text" value="loading ..." name="output" />
    </label>
</form>
<script>
document.querySelector("form.calculator input").addEventListener("input", function(e){
    displayTelnetCommand(e.target.value);
});
function displayTelnetCommand(text) {
    let match = /\((\d+,\d+,\d+,\d+,\d+,\d+)\)/.exec(text);
    const $result = document.querySelector("form.calculator input[name='output']");
    if(!match) {
        $result.value = "Invalid PASV command";
        return;
    }
    const tmp = match[1].split(",").map((r) => parseInt(r.trim()));
    const ip = tmp.slice(0,4).join(".");
    const port = tmp[4] * 256 + tmp[5]
    $result.value = "telnet " + ip + " " + port;
}
displayTelnetCommand(document.querySelector("form.calculator input").value)
</script>
<style>
form.calculator {
    background: var(--dark);
    padding: 25px;
    border-radius: 5px;
    color: var(--bg-color);
    box-shadow: 0px 0px 50px rgb(0 0 0 / 50%);
    margin-bottom: 20px;
}
form.calculator input {
    width: 100%;
    box-sizing: border-box;
    background: white;
    border: 1px solid rgba(0,0,0,0.15);
    border-radius: 2px;
    padding: 7px 10px;
    margin-top: 8px;
    text-align: center;
    color: var(--secondary);
    font-size: 1.1rem;
}
.arrow {
  border: solid var(--color);
  border-width: 0 7px 7px 0;
  display: inline-block;
  padding: 15px;
  transform: rotate(45deg);
  -webkit-transform: rotate(45deg);
}

</style>

Once you got your command, keep your control channel open and spun up another terminal and type the generated command:
<div class="terminal">
<span class="prompt">~/$ </span>telnet 145.220.21.40 62021/<br>
<span class="stdout">
Trying 145.220.21.40...<br/>
Connected to 145.220.21.40.<br/>
Escape character is '^]'.<br/>
</span>
</div>


## Listing files under a directory

After establishing the data channel, you should be able to execute the following from the control channel:
<div class="terminal">
<span class="prompt"></span>LIST /<br>
</div>
The data channel should then returns something like this:
<div class="terminal">
<span class="stdout">
~ # telnet 145.220.21.40 62021<br/>
Trying 145.220.21.40...<br/>
Connected to 145.220.21.40.<br/>
Escape character is '^]'.<br/>
lrwxrwxrwx    1 0        0               1 Nov 13  2012 ftp -> .<br/>
lrwxrwxrwx    1 0        0               3 Nov 13  2012 mirror -> pub<br/>
drwxr-xr-x   23 0        0            4096 Dec 14  2018 pub<br/>
drwxr-sr-x   89 0        450          4096 Jul 29 23:24 site<br/>
drwxr-xr-x    9 0        0            4096 Jan 23  2014 vol<br/>
Connection closed by foreign host.<br/>
</span>
</div>

As you see, the data channel closed itself after being used. Using FTP you need to recreate the data channel whenever you need to use it by sending `PASV` to the control channel

## Download a file store on the FTP server

In the server we're working from, we will download the file stored under `/pub/README.nluug`. To do this, you need first need to change the working directory to "pub" like this:
<div class="terminal">
<span class="prompt"></span>CWD pub /<br>
<span class="stdout">
250 Directory successfully changed.
</span>
</div>

To retrieve the file named `README.nluug`, we first need to open a data channel via `PASV` as we did before, then type under the control channel:
<div class="terminal">
<span class="prompt"></span>RETR README.nluug<br/>
<span class="stdout">
150 Opening BINARY mode data connection for README.nluug (932 bytes).<br/>
226 Transfer complete.<br/>
</span>
</div>

Example of what we observed from the data channel:
<div class="terminal">
<span class="prompt">~/$ </span>telnet 145.220.21.40 60993<br/>
<span class="stdout">
The data channel should fill itself like this:<br/>
~/Documents/projects/filestash-website # telnet 145.220.21.40 60993<br/>
Trying 145.220.21.40...<br/>
Connected to 145.220.21.40.<br/>
Escape character is '^]'.<br/>
========================================================<br/>
<br/>
This machine is a mirror of many packages on the internet. It is managed<br/>
by the NLUUG (http://www.nluug.nl/).<br/>
<br/>
The license terms differ per package. Please see the information within<br/>
each package. NLUUG accepts no liability for the download and/or use<br/>
of the software contained in this archive.<br/>
<br/>
This server connects to the internet via a sponsored SURFnet link.<br/>
It supports IPv4 and IPv6 connections and allows downloads via ftp,<br/>
http and rsync.<br/>
<br/>
For questions and/or comments, contact ftp-admin@nluug.nl<br/>
<br/>
-=-=-=-=- NLUUG - Open Systems. Open Standards. -=-=-=-=-<br/>
<br/>
Support the NLUUG, Become a member and get discounts on <br/>
conferences and more, see http://www.nluug.nl/<br/>
<br/>
================================================================<br/>
Want to know where to find what data?  See the file<br/>
WhereToFindWhat.txt<br/>
================================================================<br/>
<br/>
Connection closed by foreign host.<br/>
</span>
</div>



<div class="related">
    <div class="title">
        Related pages<br>
        <img src="https://mickael.kerjean.me/assets/img/arrow_bottom.png"/>
    </div>
    <div class="related_content">
        <a href="{% post_url 2020-08-04-ftp-testing-tool %}"><h3 class="no-anchor">FTP Testing Tool</h3></a><a href="{% post_url 2019-11-26-ftp-web-client %}"><h3 class="no-anchor">FTP Web Client</h3></a><a href="{% post_url 2020-07-06-ftp-from-the-command-line %}"><h3 class="no-anchor">FTP CLI</h3></a><a href="{% post_url 2020-09-29-doing-ftp-with-curl %}"><h3 class="no-anchor">FTP with curl</h3></a>
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

