---
title: WebDAV Test Tool
description: Test your FTP server with our online testing tool
layout: landing
permalink: /webdav-test.html
tags: webdav tool
language: en
---

<link rel="stylesheet" href="/css/landing-page.css">
<link rel="stylesheet" href="/css/landing-page-login.css">

<div id="splash" class="nopadding">
  <div class="row">
    <div class="col-sm-12">
      <div class="hgroup">
        <h1>WebDAV Test Tool</h1>
        <p class="container">
          Test your WebDAV server with this online testing tool <br>
          Enter your server IP or domain and our test tool will tell you everything it finds about your FTP server
        </p>
      </div>

      <form method="GET" style="padding:0;">
        <label style="margin-bottom:0;">
          <input type="text" style="width:100%;border:none;font-size:1.1rem;border-radius:5px;padding:20px 25px;" name="url" placeholder="url of your webdav server" required/>
        </label>
      </form>
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
      <strong>Protocol:</strong> <span id="protocol"></span><br>
      <strong>Latency:</strong> <span id="latency"></span><br>
      <strong>WebDAV Type:</strong> <span id="webdav-type"></span><br>
      <strong>Exposed Header:</strong> <span id="exposed-headers"></span><br>
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
        function webDAVTest(url) {
            var oReq = new XMLHttpRequest();
            oReq.onload = function(){
                var data = JSON.parse(this.responseText);
                if(data["isOnline"]){
                    let html = "<a target=\"_blank\" href=\"";
                    html += "http://demo.filestash.app/login";
                    html += "\">";
                    html += data["url"];
                    html += "</a>";
                    document.getElementById("hostname").innerHTML = html;
                } else {
                    document.getElementById("hostname").innerText = data["url"];
                }
                document.getElementById("latency").innerText = data["latency"];
                document.getElementById("is-online").innerText = data["isOnline"] ? "Yes" : "No";
                document.getElementById("protocol").innerText = data["protocol"];
                document.getElementById("webdav-type").innerText = data["dav"];

                document.getElementById("exposed-headers").innerText = ""
                Object.entries(data["headers"]).map(([key, value]) => {
                    document.getElementById("exposed-headers").innerHTML += `${key}: ${value} <br/>`;
                });

                console.log(data);
                document.getElementById("tester").classList.add("show");
                document.getElementById("loader").classList.remove("show");
                document.getElementById("loader").classList.add("hide");
            };
            oReq.onerror = function(){
                console.log("ERROR");
            };
            oReq.open("get", "https://pages.kerjean.me/projects/filestash/apps/test_webdav/?url="+url, true);
            oReq.send();
        }

        var match = location.search.match(/url=([^&]+)/);
        if(match){
            document.querySelector("form input[name='url']").value = decodeURIComponent(match[1]);
            webDAVTest(match[1]);
        } else {
            webDAVTest("https://webdav.filestash.app")
        }

    }());
  </script>

  <div class="call-to-action">
    <h2>Our online tools:</h2>
    <a class="btn light" href="{% post_url 2021-10-18-webdav-client %}">WebDAV Client</a>
    <a class="btn light" href="{% post_url 2020-08-31-sftp-online-test %}">SFTP Testing Tool</a>
    <a class="btn light" href="{% post_url 2020-08-04-ftp-testing-tool %}">FTP Testing Tool</a>
    <a class="btn light" href="{% post_url 2021-08-01-ldap-test-tool %}">LDAP Testing Tool</a>
    <a class="btn light" href="{% post_url 2019-11-21-s3-browser %}">S3 Browser</a>
  </div>
</div>
