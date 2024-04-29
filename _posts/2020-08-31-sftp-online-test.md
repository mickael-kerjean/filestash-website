---
title: Online SFTP testing Tool
description: A online tool to test your SFTP server, from latency to host keys and other server information you are exposing with your SFTP server
layout: landing
permalink: /sftp-test.html
tags: sftp tool
language: en
---

<link rel="stylesheet" href="/css/landing-page.css">
<link rel="stylesheet" href="/css/landing-page-login.css">

<div id="splash" class="nopadding">
  <div class="row">
    <div class="col-sm-12">
      <div class="hgroup">
        <h1>SFTP Testing Tool</h1>
        <h2 style="display: block;font-size: 1.3rem;height: inherit;margin-bottom: 1.5rem;">
            Test your SFTP connection and SSH server online
        </h2>
        <p class="container">
          How it works? Enter your server IP or domain and our test tool will tell you what we can find about your server
        </p>
      </div>

      <form method="GET" style="padding:0;">
        <label style="margin-bottom:0;">
          <input type="text" style="width:100%;border:none;font-size:1.1rem;border-radius:5px;padding:20px 25px;" name="domain" placeholder="Hostname or IP address" required/>
        </label>
      </form>

      <script>
        function clickPublicSFTPHandler(e){
            e.preventDefault();
            document.querySelector("form input[name='domain']").value = e.target.text.replace(/^sftp:\/\//, "");
            document.querySelector("#splash form").submit();
        }
      </script>
      <p class="example center">
        See how your server stack up against those sftp test servers: <br>
        <a rel="nofollow noopener" onclick="clickPublicSFTPHandler(event);" href="sftp://athena.dialup.mit.edu">sftp://athena.dialup.mit.edu</a> <a rel="nofollow noopener" onclick="clickPublicSFTPHandler(event);" href="sftp://gs600-bastion1.gsfc.nasa.gov">sftp://gs600-bastion1.gsfc.nasa.gov</a> <a rel="nofollow noopener" onclick="clickPublicSFTPHandler(event);" href="sftp://rick.kerjean.me">sftp://rick.kerjean.me</a>
        <br>
      </p>
    </div>
  </div>
  {% include share.html %}
</div>
<div class="waveshape"></div>

<div id="features" style="padding-bottom:0;">
  <div class="container">
    <div class="center" id="loader" class="show" style="margin-bottom:200px;text-align:center;">
      <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
           width="50px" height="50px" viewBox="0 0 24 24" style="enable-background:new 0 0 50 50;" xml:space="preserve">
        <rect x="0" y="0" width="4" height="7" fill="#333">
          <animateTransform  attributeType="xml"
                             attributeName="transform" type="scale"
                             values="1,1; 1,3; 1,1"
                             begin="0s" dur="0.6s" repeatCount="indefinite" />
        </rect>

        <rect x="10" y="0" width="4" height="7" fill="#333">
          <animateTransform  attributeType="xml"
                             attributeName="transform" type="scale"
                             values="1,1; 1,3; 1,1"
                             begin="0.2s" dur="0.6s" repeatCount="indefinite" />
        </rect>
        <rect x="20" y="0" width="4" height="7" fill="#333">
          <animateTransform  attributeType="xml"
                             attributeName="transform" type="scale"
                             values="1,1; 1,3; 1,1"
                             begin="0.4s" dur="0.6s" repeatCount="indefinite" />
        </rect>
      </svg>
      <style>
        svg path, svg rect {
            fill: #9AD1ED;
        }
      </style>
    </div>


    <div id="tester" class="hide" style="background: white;padding:25px;margin: -150px 0 200px 0;box-shadow: 0px 1px 2px rgba(0,0,0,0.1);">
      <h2 id="hostname"></h2>
      <strong>Online:</strong> <span id="is-online"></span><br>
      <strong>Latency:</strong> <span id="latency"></span><br>
      <strong>Host Key:</strong> <span id="fingerprint"></span><br/>
      <strong>Server info:</strong> <pre id="server_info" style="margin:0;"></pre>
      <style>
        #tester h2{ margin-top:0;margin-bottom:20px;text-align:left; }
        #tester strong{
            min-width: 160px;
            display: inline-block;
        }
      </style>
    </div>
  </div>

  <script>
    (function() {
        function sftpTest(domain) {
            var oReq = new XMLHttpRequest();
            oReq.onload = function(){
                var data = JSON.parse(this.responseText);

                const $server_info = document.getElementById("server_info");

                document.getElementById("latency").innerText = data["latency"];
                document.getElementById("is-online").innerText = data["isOnline"] ? "Yes" : "No";
                if (data["server_info"]) $server_info.innerText = data["server_info"];
                else $server_info.classList.add("hidden");
                document.getElementById("fingerprint").innerText = data["fingerprint"] || "";

                if(data["isOnline"]){
                    let $a = document.createElement("a");
                    $a.setAttribute("target", "_blank");
                    $a.setAttribute("href", "http://www.filestash.app{% post_url 2020-04-30-sftp-browser %}");
                    $a.innerText = data["hostname"];
                    document.getElementById("hostname").innerHTML = $a.outerHTML;
                } else {
                    document.getElementById("hostname").innerText = data["hostname"];
                }

                document.getElementById("tester").classList.add("show");
                document.getElementById("loader").classList.remove("show");
                document.getElementById("loader").classList.add("hide");
            };
            oReq.onerror = function(){
                console.log("ERROR");
            };
            oReq.open("get", "https://pages.kerjean.me/projects/filestash/apps/sftp_test/?domain="+domain, true);
            oReq.send();
        }

        var match = location.search.match(/domain=([^&]+)/);
        if(match){
            document.querySelector("form input[name='domain']").value = match[1];
            sftpTest(match[1]);
        } else {
            sftpTest("itcsubmit.wustl.edu")
        }

    }());
  </script>

  <div class="call-to-action">
    <h2>Our online tools:</h2>
    <a class="btn light" href="{% post_url 2020-04-30-sftp-browser %}">SFTP Browser</a>
    <a class="btn light" href="{% post_url 2020-08-04-ftp-testing-tool %}">FTP Testing Tool</a>
    <a class="btn light" href="{% post_url 2019-11-26-ftp-web-client %}">Online FTP Client</a>
    <a class="btn light" href="{% post_url 2019-11-21-s3-browser %}">S3 Explorer</a>
    <a class="btn light" href="{% post_url 2021-10-18-webdav-client %}">WebDAV Client</a>
    <a class="btn light" href="{% post_url 2020-01-04-ldap-browser %}">LDAP Browser</a>
  </div>
</div>
