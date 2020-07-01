---
title: A web client to do file transfer over SSH
description: A web interface to access your SFTP server from your browser
layout: landing
permalink: /ssh-file-transfer.html
language: en
redirect_from:
  - /online-sftp-browser.html
---

<link rel="stylesheet" href="/css/landing-page.css">
<link rel="stylesheet" href="/css/landing-page-login.css">

<div id="splash" class="nopadding">
  <div class="row">
    <div class="col-sm-12">
      <div class="hgroup">
        <h1>SSH File transfer made easy with our <a href="https://en.wikipedia.org/wiki/SSH_File_Transfer_Protocol">SFTP</a> Browser</h1>
      </div>
      <form onsubmit='$("form input[type=\"submit\"]").attr("value", "LOADING...")' action="https://demo.filestash.app/login" method="GET">
        <input type="hidden" name="type" value="sftp" />
        <label>
          <span>Hostname:</span><input type="text" name="hostname" placeholder="IP address of your server" required/>
        </label>
        <label>
          <span>Username:</span><input default="anonymous" type="text" name="username" placeholder="Username"/>
        </label>
        <label>
          <span>Password:</span><input type="password" name="password" placeholder="password"/>
        </label>
        <label>
          <span>Port:</span><input type="text" name="port" placeholder="Default: 22"/>
        </label>
        <input type="submit" value="Connect" />
      </form>
      <script>
        function clickPublicSFTPHandler(e, data){
            e.preventDefault();
            for(var key in data){
                document.querySelector("form [name='"+key+"']").value = data[key]
            }
            document.querySelector("form input[type='submit']").click()
        }
      </script>

      <p class="example">
        Examples of free online SFTP server for testing: <br>
        <a onclick="clickPublicSFTPHandler(event, {hostname: 'test.rebex.net', username: 'demo', password: 'password', port: 22});" href="https://test.rebex.net/">test.rebex.net</a>
        <a onclick="clickPublicSFTPHandler(event, {hostname: 'demo.wftpserver.com', username: 'demo-user', password: 'demo-user', port: 2222});" href="http://demo.wftpserver.com/">demo.wftpserver.com</a>
      </p>
    </div>
  </div>
  {% include share.html %}
</div>
<div class="waveshape"></div>

<div id="features" style="padding-bottom:0">
  <div class="container large">
    <div class="row features main">

      <div class="feature">
        <img alt="screenshot of Filestash when uploading" class="lazy fancy pull-right hidden-xs" data-src="/img/screenshots/feature1.png" style="margin-top: -30px;" />
        <h2>Transfer files over SSH</h2>
        <p>
          Our web client makes it easy to copy files and folders both from local to remote and from remote to local. Under the hood it uses the SSH File Transfer Protocol also known as SFTP
        </p>
        <img alt="screenshot of Filestash when uploading" class="lazy fancy visible-xs" data-src="/img/screenshots/feature1.png" />
      </div>

      <div class="feature">
        <img alt="screenshot of Filestash when uploading" class="lazy fancy pull-left hidden-xs" data-src="/img/screenshots/viewerpage.png" />
        <h2>Access your sftp from your browser</h2>
        <p>
            Filestash is a <strong>web interface</strong> to access your SFTP server from your browser. It makes it easy to explore / edit / upload/ download / delete / rename anything on your server
        </p>
        <img alt="screenshot of Filestash when uploading" class="lazy fancy visible-xs" data-src="/img/screenshots/viewerpage.png" />
      </div>

      <div class="feature">
          <img class="lazy fancy pull-right hidden-xs" data-src="https://miro.medium.com/max/580/1*DHe24MbDHtbkOeIJzxrfdA.png" />
          <h2>Works with all the popular free SFTP servers</h2>
          <p>
              Our online tool works great with any <a href="https://tools.ietf.org/html/draft-ietf-secsh-filexfer-13">SFTP compliant server</a> like
              <a href="https://www.openssh.com/">Openssh</a>, <a href="http://proftpd.org/">ProFTPD</a> and even your Amazon S3 buckets with <a href="https://console.aws.amazon.com/transfer/home">AWS SFTP</a>
        </p>
        <img alt="illustration of the shared link screen" class="lazy fancy visible-xs" data-src="/img/posts/2019-11-26-s3.png" />
      </div>

      <div class="feature">
        <img alt="screenshot of the text editor" class="lazy fancy pull-left hidden-xs" data-src="/img/posts/2019-08-20-ftp-web-client.html.1.png" />
        <h2>Document editor</h2>
        <p>
            Open up your files and easily edit them directly from your browser. It even works with word documents, spreadsheet and presentations
        </p>
        <img alt="screenshot of the text editor" class="lazy fancy visible-xs" data-src="/img/posts/2019-08-20-ftp-web-client.html.1.png" />
      </div>

      <div class="feature">
        <img class="lazy fancy pull-right hidden-xs" data-src="/img/screenshots/feature_share_0000.png" />
        <h2>Collaborate easily</h2>
        <p>
            Create shared links without sharing any credentials to anyone. Protect those links with a password, make it available to a specific email adress or a domain, there's many options available.
        </p>
        <img class="lazy fancy visible-xs" data-src="/img/screenshots/feature_share_0000.png" />
      </div>

      <div class="feature">
          <img class="lazy fancy pull-left hidden-xs" data-src="/img/posts/2019-08-20-ftp-web-client.html.3.png" />
          <h2>File manager integration</h2>
          <p>
              Shared links can be mounted in your file manager and be used like any other network drive
          </p>
          <img class="lazy fancy visible-xs" data-src="/img/posts/2019-08-20-ftp-web-client.html.3.png" />
      </div>


      <div class="feature">
          <img alt="agpl logo" class="lazy fancy pull-right hidden-xs" data-src="/img/posts/2019-08-20-ftp-web-client.html.2.png" />
          <h2>Open source and Free software</h2>
          <p>
              You don't have to trust us. The code of our software is available on <a href="https://github.com/mickael-kerjean/filestash">github</a> for everyone to download, audit, selfhost and contribute back
          </p>
          <img alt="agpl logo" class="lazy fancy visible-xs" data-src="/img/posts/2019-08-20-ftp-web-client.html.2.png" />
      </div>

      <div class="feature">
        <img class="lazy fancy pull-left hidden-xs" data-src="/img/posts/2019-08-20-ftp-web-client.html.6.png" />
        <h2>Extensible and Configurable</h2>
        <p>
          Filestash can be customised quite simply. Also, many features can be enable/disable from the admin console. If that's not enough, you can extend the program by creating your own <a href="/docs/plugin/">plugins</a>
        </p>
        <img class="lazy fancy visible-xs" data-src="/img/posts/2019-08-20-ftp-web-client.html.6.png" />
      </div>

    </div>

    <br><br><br><br>
  </div>

  <div class="call-to-action">
    <h2>See our other web client:</h2>
    <a class="btn" href="{% post_url 2019-11-26-ftp-web-client %}">FTP</a>
    <a class="btn" href="{% post_url 2019-11-26-ftp-web-client %}">FTPS</a>
    <a class="btn" href="{% post_url 2019-11-21-s3-browser %}">S3</a>
    <a class="btn" href="{% post_url 2020-01-04-ldap-browser %}">LDAP</a>
    <a class="btn" href="https://demo.filestash.app/login">Webdav</a>
    <a class="btn" href="https://demo.filestash.app/login">GIT</a>
  </div>


</div>

{% include support.html %}
