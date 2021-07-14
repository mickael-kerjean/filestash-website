---
title: SFTP Browser | An online SFTP client tool
description: An online web client to browse and manage the content on your SFTP server like if was a modern file sharing service
layout: landing
permalink: /sftp-browser.html
tags: sftp oem online-client tool
language: en
redirect_from:
  - /online-sftp-browser.html
  - /ssh-file-transfer.html
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
        <input type="submit" value="Connect" class="btn" />
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
        <a href="{% post_url 2020-07-01-sftp-example %}">Examples</a> of free <a href="{% post_url 2020-07-01-sftp-example %}">online SFTP server</a> for testing: <br>
        <a onclick="clickPublicSFTPHandler(event, {hostname: 'test.rebex.net', username: 'demo', password: 'password', port: 22});" href="https://test.rebex.net/">test.rebex.net</a>
        <a onclick="clickPublicSFTPHandler(event, {hostname: 'demo.wftpserver.com', username: 'demo-user', password: 'demo-user', port: 2222});" href="http://demo.wftpserver.com/">demo.wftpserver.com</a>
      </p>
    </div>
  </div>
  {% include share.html %}
  <div class="container">
    <div id="oem">
      <span>
        We can make Filestash to work with your backend, your processes, your users and your brand
      </span>
      <a href="/pricing/?modal=enterprise" class="btn">Chat with us</a>
    </div>
  </div>
</div>
<div class="waveshape"></div>

<div id="features" style="padding-bottom:0">
  <div class="container large">
    <div class="row features main">

      <div class="feature">
        <img alt="screenshot of Filestash when uploading" loading="lazy" class="fancy pull-right hidden-xs" src="/img/screenshots/feature1.png" style="margin-top: -30px;" />
        <h2>SSH File Browser and Explorer</h2>
        <p>
          Our <strong>web SFTP</strong> client makes it easy to copy files and folders both from local to remote and from remote to local. Under the hood it uses the <strong>SSH File Transfer Protocol</strong> also known as SFTP
        </p>
        <img alt="screenshot of Filestash when uploading" loading="lazy" class="fancy visible-xs" src="/img/screenshots/feature1.png" />
      </div>

      <div class="feature">
        <img alt="screenshot of Filestash when uploading" loading="lazy" class="fancy pull-left hidden-xs" src="/img/screenshots/viewerpage.png" />
        <h2>Access your sftp from your browser</h2>
        <p>
            Filestash is a <strong>web interface</strong> to access your SFTP server from your browser. It makes it easy to explore / edit / upload/ download / delete / rename anything on your server
        </p>
        <img alt="screenshot of Filestash when uploading" loading="lazy" class="fancy visible-xs" src="/img/screenshots/viewerpage.png" />
      </div>

      <div class="feature">
          <img loading="lazy" class="fancy pull-right hidden-xs" src="https://miro.medium.com/max/580/1*DHe24MbDHtbkOeIJzxrfdA.png" />
          <h2>Works with all the popular free SFTP servers</h2>
          <p>
              Our online tool works great with any <a href="https://tools.ietf.org/html/draft-ietf-secsh-filexfer-13">SFTP compliant server</a> like
              <a href="https://www.openssh.com/">Openssh</a>, <a href="http://proftpd.org/">ProFTPD</a> and even your Amazon S3 buckets with <a href="https://console.aws.amazon.com/transfer/home">AWS SFTP</a>
        </p>
        <img alt="illustration of the shared link screen" loading="lazy" class="fancy visible-xs" src="/img/posts/2019-11-26-s3.png" />
      </div>

      <div class="feature">
        <img alt="screenshot of the text editor" loading="lazy" class="fancy pull-left hidden-xs" src="/img/posts/2019-08-20-ftp-web-client.html.1.png" />
        <h2>Document editor</h2>
        <p>
            Open up your files and easily edit them directly from your browser. It even works with word documents, spreadsheet and presentations
        </p>
        <img alt="screenshot of the text editor" loading="lazy" class="fancy visible-xs" src="/img/posts/2019-08-20-ftp-web-client.html.1.png" />
      </div>

      <div class="feature">
        <img alt="screenshot of the shared link" loading="lazy" class="fancy pull-right hidden-xs" src="/img/screenshots/feature_share_0000.png" />
        <h2>Collaborate easily</h2>
        <p>
            Create shared links without sharing any credentials to anyone. Protect those links with a password, make it available to a specific email adress or a domain, there's many options available.
        </p>
        <img alt="screenshot of the shared link" loading="lazy" class="fancy visible-xs" src="/img/screenshots/feature_share_0000.png" />
      </div>

      <div class="feature">
          <img alt="open as network drive from finder on MacOS" loading="lazy" class="fancy pull-left hidden-xs" src="/img/posts/2019-08-20-ftp-web-client.html.3.png" />
          <h2>File manager integration</h2>
          <p>
              Shared links can be mounted in your file manager and be used like any other network drive
          </p>
          <img alt="open as network drive from finder on MacOS" loading="lazy" class="fancy visible-xs" src="/img/posts/2019-08-20-ftp-web-client.html.3.png" />
      </div>


      <div class="feature">
          <img alt="agpl logo" loading="lazy" class="fancy pull-right hidden-xs" src="/img/posts/2019-08-20-ftp-web-client.html.2.png" />
          <h2>Open source and Free software</h2>
          <p>
              You don't have to trust us. The code of our software is available on <a href="https://github.com/mickael-kerjean/filestash">github</a> for everyone to download, audit, selfhost and contribute back
          </p>
          <img alt="agpl logo" loading="lazy" class="fancy visible-xs" src="/img/posts/2019-08-20-ftp-web-client.html.2.png" />
      </div>

      <div class="feature">
        <img alt="plugin" loading="lazy" class="fancy pull-left hidden-xs" src="/img/posts/2019-08-20-ftp-web-client.html.6.png" />
        <h2>Extensible and Configurable</h2>
        <p>
          Filestash can be customised quite simply. Also, many features can be enable/disable from the admin console. If that's not enough, you can extend the program by creating your own <a href="/docs/plugin/">plugins</a>
        </p>
        <img alt="plugin" loading="lazy" class="fancy visible-xs" src="/img/posts/2019-08-20-ftp-web-client.html.6.png" />
      </div>
    </div>
  </div>

  <div class="container" id="faq">
      <h2 style="margin-top:0;">Frequently Asked Questions</h2>
      <h3>What is SFTP?</h3>
      <p>
          SFTP stands for <strong>SSH File Transfer Protocol</strong>. It is a protocol for securely transfer file over a network between a client that can use that protocol and a server that implements the protocol.
      </p>

      <h3>How SFTP works?</h3>
      <p>
          The particularity of SFTP compared to <a href="{% post_url 2019-11-26-ftp-web-client %}">FTP and FTPS</a> is how it uses SSH as a transport mechanism to securely transfer files.
      </p>

      <h3>How to use SFTP?</h3>
      <p>
          To use SFTP, you need both a server which implement the SFTP protocol like <a href="https://www.openssh.com/">openssh</a> and a client to communicate with that server.
      </p>

      <h3>How to transfer file using SFTP?</h3>
      <p>
          To transfer files using SFTP, you need to connect to a server that can speak SFTP by using an SFTP Client (eg: Filezilla FTP, WinSCP, Filestash, Cyberduck, ...). Typically you would drag and drop files on your SFTP client to the desired location.
      </p>

      <h3>How to access an SFTP server from a browser?</h3>
      <p>
        You can use an SFTP web client like Filestash which comes with a web interface to access and transfer your files.
      </p>

      <h3>Which port does SFTP uses?</h3>
      <p>
          The SFTP protocol typically uses port 22.
      </p>

      <h3>What's the difference between SSH and SFTP?</h3>
      <p>
          SSH is to SFTP what a cinder block is to a house. SFTP leverages the SSH protocol as a transport mechanism to securely transfer your files over a network.
      </p>

      <h3>What's the difference between FTP and SFTP?</h3>
      <p>
          Both FTP and SFTP share the same use case to transfer file over a network. What stands them apart is the nitty gritty details in the protocol. The biggest difference is SFTP leverages SSH for encryption whereas FTPS use SSL and bare FTP has no encryption at all.
      </p>

      <h3>Can you use curl to access an SFTP server?</h3>
      <p>
          Yes. It works like this: `curl -k "sftp://test.rebex.net/readme.txt" --user "demo:password"`
      </p>

      <h3>Is there free SFTP server?</h3>
      <p>
          OpenSSH is the most popular SFTP implementation but some other exists like proFTPd. Also you can find a few unix shell that provide SFTP access like https://sdf.org/
      </p>


      <script type="application/ld+json">
       {

           "@context": "https://schema.org",
           "@type": "FAQPage",
           "mainEntity": [
               {
                   "@type": "Question",
                   "name": "What is SFTP?",
                   "acceptedAnswer": {
                       "@type": "Answer",
                       "text": "SFTP stands for SSH File Transfer Protocol. It is a protocol for securely transfer file over a network between a client that can use that protocol and a server that implements the protocol."
                   }
               },
               {
                   "@type": "Question",
                   "name": "How SFTP works?",
                   "acceptedAnswer": {
                       "@type": "Answer",
                       "text": "The particularity of SFTP compared to FTP and FTPS is how it uses SSH as a transport mechanism to securely transfer files."
                   }
               },
               {
                   "@type": "Question",
                   "name": "How to use SFTP?",
                   "acceptedAnswer": {
                       "@type": "Answer",
                       "text": "To use SFTP, you need both a server which implement the SFTP protocol like openssh and a client to communicate with that server."
                   }
               },
               {
                   "@type": "Question",
                   "name": "How to transfer file using SFTP?",
                   "acceptedAnswer": {
                       "@type": "Answer",
                       "text": "To transfer files using SFTP, you need to connect to a server that can speak SFTP by using an SFTP Client (eg: Filezilla FTP, WinSCP, Filestash, Cyberduck, ...). Typically you would drag and drop files on your SFTP client to the desired location."
                   }
               },
               {
                   "@type": "Question",
                   "name": "How to access an SFTP server from a browser?",
                   "acceptedAnswer": {
                       "@type": "Answer",
                       "text": "Filestash has a web interface that make it easy to access and transfer your files."
                   }
               },
               {
                   "@type": "Question",
                   "name": "Which port does SFTP uses?",
                   "acceptedAnswer": {
                       "@type": "Answer",
                       "text": "The SFTP protocol typically uses port 22."
                   }
               },
               {
                   "@type": "Question",
                   "name": "What's the difference between SSH and SFTP?",
                   "acceptedAnswer": {
                       "@type": "Answer",
                       "text": "SSH is to SFTP what a cinder block is to a house. SFTP leverages the SSH protocol as a transport mechanism to securely transfer your files over a network."
                   }
               },
               {
                   "@type": "Question",
                   "name": "What's the difference between FTP and SFTP?",
                   "acceptedAnswer": {
                       "@type": "Answer",
                       "text": "Both FTP and SFTP share the same use case to transfer file over a network. What stands them apart is the nitty gritty details in the protocol. The biggest difference is SFTP leverages SSH for encryption whereas FTPS use SSL and bare FTP has no encryption at all."
                   }
               },
               {
                   "@type": "Question",
                   "name": "Can you use curl to access an SFTP server?",
                   "acceptedAnswer": {
                       "@type": "Answer",
                       "text": "Yes. It works like this: `curl -k \"sftp://test.rebex.net/readme.txt\" --user \"demo:password\"`"
                   }
               },
               {
                   "@type": "Question",
                   "name": "Is there free SFTP server?",
                   "acceptedAnswer": {
                       "@type": "Answer",
                       "text": "OpenSSH is the most popular SFTP implementation but some other exists like proFTPd. Also you can find a few unix shell that provide SFTP access like https://sdf.org/"
                   }
               }
           ]
       }
      </script>
  </div>
  <br><br><br><br><br>

  <div class="call-to-action">
    <h2>See our other web client:</h2>
    <a class="btn light" href="{% post_url 2019-11-26-ftp-web-client %}">FTP</a>
    <a class="btn light" href="{% post_url 2019-11-26-ftp-web-client %}">FTPS</a>
    <a class="btn light" href="{% post_url 2019-11-21-s3-browser %}">S3</a>
    <a class="btn light" href="{% post_url 2020-01-04-ldap-browser %}">LDAP</a>
    <a class="btn light" href="https://demo.filestash.app/login">Webdav</a>
    <a class="btn light" href="https://demo.filestash.app/login">GIT</a>
  </div>
</div>

