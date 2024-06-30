---
title: Le client SFTP en ligne
description: Le client SFTP en ligne qui vous permet de transférer et de gérer tous vos fichiers sur vos serveurs SFTP directement depuis votre navigateur.
layout: landing
permalink: /fr/client-sftp-en-ligne.html
tags: sftp oem online-client
language: fr
head:
  - <link rel="alternate" href="https://www.filestash.app/sftp-browser.html" hreflang="en" />
  - <link rel="alternate" href="https://www.filestash.app/fr/client-sftp-en-ligne.html" hreflang="fr" />
---

<link rel="stylesheet" href="/css/landing-page.css">
<link rel="stylesheet" href="/css/landing-page-login.css">

<div id="splash" class="nopadding">
  <div class="row">
    <div class="col-sm-12">
      <div class="hgroup">
        <h1>Le client <a href="https://en.wikipedia.org/wiki/SSH_File_Transfer_Protocol">SFTP</a> en ligne</h1>
      </div>
      <form onsubmit='$("form input[type=\"submit\"]").attr("value", "LOADING...")' action="https://demo.filestash.app/login" method="GET">
        <input type="hidden" name="type" value="sftp" />
        <label>
          <span>Nom d'hôte:</span><input type="text" name="hostname" placeholder="IP address of your server" required/>
        </label>
        <label>
          <span>Nom utilisateur:</span><input default="anonymous" type="text" name="username" placeholder="Username"/>
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
        <a href="{% post_url 2020-07-01-sftp-example %}">Examples</a> de serveurs SFTP de tests pour essayer le service: <br>
        <a onclick="clickPublicSFTPHandler(event, {hostname: 'test.rebex.net', username: 'demo', password: 'password', port: 22});" href="https://test.rebex.net/">test.rebex.net</a>
        <a onclick="clickPublicSFTPHandler(event, {hostname: 'demo.wftpserver.com', username: 'demo', password: 'demo', port: 2222});" href="http://demo.wftpserver.com/">demo.wftpserver.com</a>
      </p>
    </div>
  </div>
  {% include share.html %}
  <div class="container">
    <div id="oem">
      <span>
        Vous voulez une solution clé en main autour du SFTP ? De l'intégration SSO au white label pour vos clients, en passant par le support et le déploiement d'entreprise, nous pouvons vous aider
      </span>
      <a href="/pricing/?modal=enterprise" class="btn">Contactez nous</a>
    </div>
  </div>
</div>
<div class="waveshape"></div>

{% include social-proof.html %}
<div class="social-proof">
  <h3>Ils utilisent Filestash</h3>
  <div class="flex">
    <div><img src="/img/companies/schneider-electric.png" /></div>
    <a href="https://www.media.mit.edu/posts/file-sharing/"><img src="/img/companies/mit.png" /></a>
    <a href="/img/companies/insa-toulouse-proof.png"><img src="/img/companies/insa-toulouse.png" /></a>
    <div><img src="/img/companies/dhl.png" /></div>
    <div><img src="/img/companies/bell.png" /></div>
  </div>
  <div class="flex">
    <a href="/img/companies/university_clermont-proof.png"><img src="/img/companies/university_clermont.png" /></a>
    <a href="/img/companies/university_strasbourg-proof.png"><img src="/img/companies/university_strasbourg.png" /></a>
    <div><img src="/img/companies/shell.png" /></div>
  </div>
</div>

<div class="technical-resources container">
    <a href="https://aws.amazon.com/blogs/storage/how-regeneron-built-a-secure-and-scalable-file-transfer-service-using-aws-transfer-family/">
        <h3>Du SFTP avec Filestash chez un mastodon du pharmaceutique</h3>
        Un example de project d'implémentation avec des examples d'architecture scalable haute disponibilité dans une F500 de la pharma se basant sur SFTP avec AWS Transfer Family et Filestash.
        <i>Lire l'article sur le blog d'AWS</i>
    </a>
</div>

<hr class="spacer"/>

<script type="application/ld+json">
{
  "@context": "http://schema.org",
  "@type": "SoftwareApplication",
  "name": "SFTP Client",
  "applicationCategory": "WebApplication",
  "operatingSystem": "Any",
  "description": "Le client SFTP en ligne qui vous permet de transférer et de gérer tous vos fichiers sur vos serveurs SFTP directement depuis votre navigateur.",
  "url": "https://www.filestash.app/fr/client-sftp-en-ligne.html",
  "screenshot": [
    "https://www.filestash.app/img/screenshots/viewerpage.png",
    "https://www.filestash.app/img/screenshots/feature1.png"
  ],
  "featureList": [
    "Un gestionnaire de fichiers comme si vous étiez en local",
    "Téléchargement et envoi de vos fichiers sur votre serveur SFTP",
    "Navigation et gestion faciles de votre serveur",
    "Visualisation et édition de vos documents directement sur votre serveur SFTP",
    "Extensible via des plugins"
  ],
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "5",
    "ratingCount": "33"
  },
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
        <img alt="screenshot of Filestash when uploading" loading="lazy" class="fancy pull-left hidden-xs" src="/img/screenshots/feature1.png" style="margin-top: -30px;" />
        <h2>Explorez vos fichiers via SSH</h2>
        <p>
          Notre <strong>client SFTP</strong> vous permet de copier ou télécharger vos fichiers et/ou dossiers en utilisant le protocole SFTP (SSH File Transfer Protocol)
        </p>
        <img alt="screenshot of Filestash when uploading" loading="lazy" class="fancy visible-xs" src="/img/screenshots/feature1.png" />
      </div>

      <div class="feature">
        <img alt="screenshot of Filestash when uploading" loading="lazy" class="fancy pull-right hidden-xs" src="/img/screenshots/viewerpage.png" />
        <h2>Accéder à vos fichiers depuis votre navigateur</h2>
        <p>
            Notre logiciel SFTP en ligne permet l'accès à votre serveur SFTP directement depuis votre navigateur. Il rend facile l'exploration, la modification, le chargement, le téléchargement, l'effacement ou le renommage de tout ce qui se trouve sur votre serveur
        </p>
        <img alt="screenshot of Filestash when uploading" loading="lazy" class="fancy visible-xs" src="/img/screenshots/viewerpage.png" />
      </div>

      <div class="feature">
          <img loading="lazy" class="fancy pull-left hidden-xs" src="https://miro.medium.com/max/580/1*DHe24MbDHtbkOeIJzxrfdA.png" />
          <h2>Compatible avec tous les serveurs SFTP</h2>
          <p>
              Notre logiciel fonctionne parfaitement avec tous les serveurs SFTP qui implémente le <a href="https://tools.ietf.org/html/draft-ietf-secsh-filexfer-13">protocole SFTP</a> comme <a href="https://www.openssh.com/">Openssh</a>, <a href="http://proftpd.org/">ProFTPD</a> et
même vos buckets Amazon S3 via <a href="https://console.aws.amazon.com/transfer/home">AWS Transfer Family</a>
        </p>
        <img alt="illustration of the shared link screen" loading="lazy" class="fancy visible-xs" src="/img/posts/2019-11-26-s3.png" />
      </div>

      <div class="feature">
        <img alt="screenshot of the text editor" loading="lazy" class="fancy pull-right hidden-xs" src="/img/posts/2019-08-20-ftp-web-client.html.1.png" />
        <h2>Édition de document</h2>
        <p>
           Les documents sur votre serveur peuvent être modifié directement depuis votre navigateur, que ce soit des documents word, excel ou autres fichiers texte. Plus besoin de télécharger un document sur votre ordinateur pour l'éditer et le recharger
        </p>
        <img alt="screenshot of the text editor" loading="lazy" class="fancy visible-xs" src="/img/posts/2019-08-20-ftp-web-client.html.1.png" />
      </div>

      <div class="feature">
        <img alt="screenshot of the shared link" loading="lazy" class="fancy pull-left hidden-xs" src="/img/screenshots/feature_share_0000.png" />
        <h2>Facilite la collaboration</h2>
        <p>
           Comme avec Dropbox, vous pouvez créer des liens de partage en tout sécurité sans jamais partager vos informations de connection
        </p>
        <img alt="screenshot of the shared link" loading="lazy" class="fancy visible-xs" src="/img/screenshots/feature_share_0000.png" />
      </div>

      <div class="feature">
          <img alt="open as network drive from finder on MacOS" loading="lazy" class="fancy pull-right hidden-xs" src="/img/posts/2019-08-20-ftp-web-client.html.3.png" />
          <h2>Intégration avec votre gestionnaire de fichiersIntegration avec votre gestionnaire de fichier</h2>
          <p>
              Les liens de partages peuvent être monté dans votre gestionnaire de fichiers et appaissent comme un disque réseau classique
          </p>
          <img alt="open as network drive from finder on MacOS" loading="lazy" class="fancy visible-xs" src="/img/posts/2019-08-20-ftp-web-client.html.3.png" />
      </div>


      <div class="feature">
          <img alt="agpl logo" loading="lazy" class="fancy pull-left hidden-xs" src="/img/posts/2019-08-20-ftp-web-client.html.2.png" />
          <h2>Logiciel libre et open source</h2>
          <p>
             Notre code source n'est pas secret, il est sur <a href="https://github.com/mickael-kerjean/filestash">github</a> et vous pouvez le télécharger, l'auditer, le modifier, le charger sur votre serveur et contribuer à notre projet
          </p>
          <img alt="agpl logo" loading="lazy" class="fancy visible-xs" src="/img/posts/2019-08-20-ftp-web-client.html.2.png" />
      </div>

      <div class="feature">
        <img alt="plugin" loading="lazy" class="fancy pull-right hidden-xs" src="/img/posts/2019-08-20-ftp-web-client.html.6.png" />
        <h2>Extensible et Configurable</h2>
        <p>
          Filestash peut être customisé à volonté à la fois directement sur la console administrateur ou en créant des plugins qui modifie le programme en profondeur
        </p>
        <img alt="plugin" loading="lazy" class="fancy visible-xs" src="/img/posts/2019-08-20-ftp-web-client.html.6.png" />
      </div>
    </div>
  </div>

  <br><br><br><br><br>

  <div class="call-to-action">
    <h2>Nos autres outils en ligne:</h2>
    <a class="btn light" href="{% post_url 2019-11-26-ftp-web-client-fr %}">FTP</a>
    <a class="btn light" href="{% post_url 2019-11-26-ftp-web-client-fr %}">FTPS</a>
    <a class="btn light" href="{% post_url 2021-10-18-webdav-client-fr %}">WebDAV</a>
    <a class="btn light" href="{% post_url 2020-08-31-sftp-online-test %}">SFTP Test</a>
    <a class="btn light" href="{% post_url 2019-11-21-s3-browser-fr %}">S3</a>
    <a class="btn light" href="{% post_url 2020-01-04-ldap-browser %}">LDAP</a>
  </div>
</div>
{% include filestash-demo-dependency.html %}
