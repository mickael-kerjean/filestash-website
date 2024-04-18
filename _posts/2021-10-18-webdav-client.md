---
title: WebDAV Client | An online WebDAV Client tool
description: A modern online WebDAV client to explore and browse your WebDAV server like Nginx, Apache, Nextcloud, Owncloud, Synology and more
layout: landing
permalink: /webdav-client.html
tags: webdav oem online-client tool
language: en
head:
  - <link rel="alternate" href="https://www.filestash.app/fr/client-webdav.html" hreflang="fr" />
  - <link rel="alternate" href="https://www.filestash.app/webdav-client.html" hreflang="en" />
---

<link rel="stylesheet" href="/css/landing-page.css">
<link rel="stylesheet" href="/css/landing-page-login.css">

<div id="splash" class="nopadding">
  <div class="row">
    <div class="col-sm-12">
      <div class="hgroup">
        <h1>Online <a href="https://en.wikipedia.org/wiki/WebDAV">WebDAV</a> Client</h1>
      </div>
      <form onsubmit='$("form input[type=\"submit\"]").attr("value", "LOADING...")' action="https://demo.filestash.app/login" method="GET">
        <input type="hidden" name="type" value="webdav" />
        <label>
          <span>Hostname:</span><input type="text" name="url" pattern="^http[s]?://.*$" title="full url of your webdav server. eg: https://webdav.filestash.app" placeholder="URL of your WebDAV server" required/>
        </label>
        <label>
          <span>Username:</span><input default="anonymous" type="text" name="username" placeholder="Username"/>
        </label>
        <label>
          <span>Password:</span><input type="password" name="password" placeholder="password"/>
        </label>
        <input type="submit" value="Connect" class="btn" />
      </form>
      <script>
        function clickPublicWebDAVHandler(e, data){
            e.preventDefault();
            for(var key in data){
                document.querySelector("form [name='"+key+"']").value = data[key]
            }
            document.querySelector("form input[type='submit']").click()
        }
        function clickOnWwwWebdavServerDotComHandler(e, data) {
            fetch(data.url).then((r) => clickPublicWebDAVHandler(e, { url: r.url }))
        }
      </script>

      <p class="example">
        Examples of <a href="{% post_url 2021-12-09-nginx-webdav %}">WebDAV server</a> for testing: <br>
        <a onclick="clickOnWwwWebdavServerDotComHandler(event, {url: 'https://www.webdavserver.com/'});" href="https://www.webdavserver.com/">www.webdavserver.com</a>
        <a onclick="clickPublicWebDAVHandler(event, {url: 'https://webdav.filestash.app'});" href="https://webdav.filestash.app/">webdav.filestash.app</a>
      </p>
    </div>
  </div>
  {% include share.html %}
  <div class="container">
    <div id="oem">
      <span>
          Want to run your own version of Filestash? Tailor every aspect via plugins or from the admin console, from integrating your FTP with your SSO provider or opting for full white labeling, we've got you covered. Filestash is the most adaptable file manager available.
      </span>
      <a href="/pricing/?origin=landing::webdav&modal=enterprise" class="btn">Chat with us</a>
    </div>
  </div>
</div>
<div class="waveshape"></div>

{% include social-proof.html %}
<div class="social-proof">
  <h3>We've worked with:</h3>
  <div class="flex">
    <a href="https://www.media.mit.edu/posts/file-sharing/"><img src="/img/companies/mit.png" /></a>
    <div><img src="/img/companies/dhl.png" /></div>
    <div><img src="/img/companies/bell.png" /></div>
    <div><img src="/img/companies/uci.png" style="height:85px" /></div>
    <div><img src="/img/companies/schneider-electric.png" /></div>
  </div>
</div>

<hr class="spacer"/><hr class="spacer"/>

<script type="application/ld+json">
{
  "@context": "http://schema.org",
  "@type": "SoftwareApplication",
  "name": "WebDAV Client",
  "applicationCategory": "WebApplication",
  "operatingSystem": "Any",
  "description": "Access and manage your WebDAV server directly from your browser with our online WebDAV client",
  "url": "https://www.filestash.app/webdav-client.html",
  "screenshot": [
    "https://www.filestash.app/img/screenshots/viewerpage.png",
    "https://www.filestash.app/img/screenshots/feature1.png"
  ],
  "featureList": [
    "file manager like operation to your webdav server",
    "Direct file upload and download",
    "Easy navigation and file management",
    "Application viewers and document editor for all your files",
    "Extensible via plugins"
  ],
  "offers": {
    "@type": "Offer",
    "priceCurrency": "USD",
    "price": "0.1"
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "5",
    "ratingCount": "9347"
  },
  "interactionStatistic": [
    {
      "@type": "InteractionCounter",
      "interactionType": "https://schema.org/LikeAction",
      "userInteractionCount": 9314,
      "description": "GitHub stars - https://github.com/mickael-kerjean/filestash"
    },
    {
      "@type": "InteractionCounter",
      "interactionType": "https://schema.org/LikeAction",
      "userInteractionCount": 31,
      "description": "source: https://alternativeto.net/software/nuage-app/"
    }
  ],
  "review": [
    {
      "@type": "Review",
      "reviewRating": {
        "@type": "Rating",
        "ratingValue": "5"
      },
      "author": {
        "@type": "Person",
        "name": "Chris Meng"
      }
    },
    {
      "@type": "Review",
      "reviewRating": {
        "@type": "Rating",
        "ratingValue": "5"
      },
      "author": {
        "@type": "Person",
        "name": "David Carrillo Jr"
      }
    }
  ]
}
</script>


<div id="features" style="padding-bottom:0">
  <div class="container large">
    <div class="row features main">

      <div class="feature">
        <img alt="screenshot of Filestash when uploading" loading="lazy" class="fancy pull-right hidden-xs" src="/img/screenshots/viewerpage.png" />
        <h2>Access your WebDAV server from your browser</h2>
        <p>
            Filestash is a web interface that connects your WebDAV server to your browser. It makes it easy to explore / edit / upload/ download / delete / rename anything on your server
        </p>
        <img alt="screenshot of Filestash when uploading" loading="lazy" class="fancy visible-xs" src="/img/screenshots/viewerpage.png" />
      </div>

      <div class="feature">
          <img loading="lazy" class="fancy pull-left hidden-xs" src="/img/posts/2021-10-18-webdav-client-0.jpg" />
          <h2>Works with your WebDAV server</h2>
          <p>
              Our online tool works great with any <a href="https://tools.ietf.org/html/draft-ietf-secsh-filexfer-13">WebDAV compliant server</a> like <a href="{% post_url 2022-03-04-apache-webdav %}">Apache</a>, <a href="{% post_url 2021-12-09-nginx-webdav %}">Nginx</a>, <a href="https://nextcloud.com/">Nextcloud</a>, <a href="https://owncloud.com/">Owncloud</a>, <a href="https://kb.synology.com/en-me/DSM/tutorial/How_to_access_files_on_Synology_NAS_with_WebDAV">Synology</a> and more
        </p>
        <img alt="illustration of the shared link screen" loading="lazy" class="fancy visible-xs" src="/img/posts/2021-10-18-webdav-client-0.jpg" />
      </div>

      <div class="feature">
        <img alt="screenshot of the text editor" loading="lazy" class="fancy pull-right hidden-xs" src="/img/posts/2019-08-20-ftp-web-client.html.1.png" />
        <h2>Document editor</h2>
        <p>
            Open up your files and easily edit them directly from your browser. It even works with word documents, spreadsheet and presentations
        </p>
        <img alt="screenshot of the text editor" loading="lazy" class="fancy visible-xs" src="/img/posts/2019-08-20-ftp-web-client.html.1.png" />
      </div>


      <div class="feature">
        <img alt="screenshot of the shared link" loading="lazy" class="fancy pull-left hidden-xs" src="/img/screenshots/feature_share_0000.png" />
        <h2>Mac, Windows, Linux, IOS and Android</h2>
        <p>
            Filestash is the missing WebDAV client that is available from your browser. No download required, our tool is portable and works on any platform
        </p>
        <img alt="screenshot of the shared link" loading="lazy" class="fancy visible-xs" src="/img/screenshots/feature_share_0000.png" />
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
          <img alt="agpl logo" loading="lazy" class="fancy pull-left hidden-xs" src="/img/posts/2019-08-20-ftp-web-client.html.2.png" />
          <h2>Open source and Free software</h2>
          <p>
              You don't have to trust us. The code of our software is available on <a href="https://github.com/mickael-kerjean/filestash">github</a> for everyone to download, audit, selfhost and contribute back
          </p>
          <img alt="agpl logo" loading="lazy" class="fancy visible-xs" src="/img/posts/2019-08-20-ftp-web-client.html.2.png" />
      </div>

      <div class="feature">
        <img alt="plugin" loading="lazy" class="fancy pull-right hidden-xs" src="/img/posts/2019-08-20-ftp-web-client.html.6.png" />
        <h2>Extensible and Configurable</h2>
        <p>
          Filestash can be configured to look and feel in many different ways, both with your own design and through configuration via the admin console. If you need to get further, you can extend the program by creating custom <a href="/docs/plugin/">plugins</a>
        </p>
        <img alt="plugin" loading="lazy" class="fancy visible-xs" src="/img/posts/2019-08-20-ftp-web-client.html.6.png" />
      </div>
    </div>
  </div>

  <div class="call-to-action">
    <h2>See our other tools:</h2>
    <a class="btn light" href="{% post_url 2022-01-15-webdav-test-tool %}">Webdav Test</a>
    <a class="btn light" href="{% post_url 2020-04-30-sftp-browser %}">SFTP Client</a>
    <a class="btn light" href="{% post_url 2019-11-26-ftp-web-client %}">FTP Client</a>
    <a class="btn light" href="{% post_url 2019-11-21-s3-browser %}">S3 Browser</a>
    <a class="btn light" href="{% post_url 2020-01-04-ldap-browser %}">LDAP Client</a>
  </div>
</div>
{% include filestash-demo-dependency.html %}
