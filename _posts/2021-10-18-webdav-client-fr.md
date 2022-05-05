---
title: Un client WebDAV en ligne
description: Un client WebDAV en ligne pour explorer et manager votre serveur WebDAV comme Nginx, Apache, Nextcloud, Owncloud, Synology et plus
layout: landing
permalink: /fr/client-webdav.html
tags: webdav online-client tool
language: fr
head:
  - <link rel="alternate" href="https://www.filestash.app/webdav-client.html" hreflang="en" />
---

<link rel="stylesheet" href="/css/landing-page.css">
<link rel="stylesheet" href="/css/landing-page-login.css">

<div id="splash" class="nopadding">
  <div class="row">
    <div class="col-sm-12">
      <div class="hgroup">
        <h1>Le client <a href="https://en.wikipedia.org/wiki/WebDAV">WebDAV</a> en ligne</h1>
      </div>
      <form onsubmit='$("form input[type=\"submit\"]").attr("value", "LOADING...")' action="https://demo.filestash.app/login" method="GET">
        <input type="hidden" name="type" value="webdav" />
        <label>
          <span>Addresse:</span><input type="text" name="url" pattern="^http[s]?://.*$" title="full url of your webdav server. eg: https://webdav.filestash.app" placeholder="Addresse de votre serveur WebDAV" required/>
        </label>
        <label>
          <span>Nom utilisateur:</span><input default="anonymous" type="text" name="username" placeholder="Username"/>
        </label>
        <label>
          <span>Mot de passe:</span><input type="password" name="password" placeholder="password"/>
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
        Examples de serveurs pour tester WebDAV:<br>
        <a onclick="clickOnWwwWebdavServerDotComHandler(event, {url: 'https://www.webdavserver.com/'});" href="https://www.webdavserver.com/">www.webdavserver.com</a>
        <a onclick="clickPublicWebDAVHandler(event, {url: 'https://webdav.filestash.app'});" href="https://webdav.filestash.app/">webdav.filestash.app</a>
      </p>
    </div>
  </div>
  {% include share.html %}
  <div class="container">
    <div id="oem">
      <span>
          Notre logiciel peut être utilisé en marque blanche, il s'intègre dans votre entreprise avec vos couleurs, logos, SSO. Nous nous mettons en quatre pour répondre à vos besoins même les plus custom.
      </span>
      <a href="/pricing/?modal=enterprise" class="btn">Contactez nous</a>
    </div>
  </div>
</div>
<div class="waveshape"></div>

<div id="features" style="padding-bottom:0">
  <div class="container large">
    <div class="row features main">

      <div class="feature">
        <img alt="screenshot of Filestash when uploading" loading="lazy" class="fancy pull-right hidden-xs" src="/img/screenshots/viewerpage.png" />
        <h2>Accédez à votre serveur WebDAV depuis votre navigateur</h2>
        <p>
            Filestash est une interface Web qui se connecte sur votre serveur WebDAV et facilite l'exploration / la modification / le téléchargement / le téléchargement / la suppression / le renommage de tout ce qui se trouve sur votre serveur
        </p>
        <img alt="screenshot of Filestash when uploading" loading="lazy" class="fancy visible-xs" src="/img/screenshots/viewerpage.png" />
      </div>

      <div class="feature">
          <img loading="lazy" class="fancy pull-left hidden-xs" src="/img/posts/2021-10-18-webdav-client-0.jpg" />
          <h2>Fonctionne avec tous les serveurs WebDAV</h2>
          <p>
              Notre outil en ligne fonctionne parfaitement avec n'importe quel serveur compatible WebDAV comme Apache, Nginx, Nextcloud, Owncloud, Synology et plus encore.
        </p>
        <img alt="illustration of the shared link screen" loading="lazy" class="fancy visible-xs" src="/img/posts/2021-10-18-webdav-client-0.jpg" />
      </div>

      <div class="feature">
        <img alt="screenshot of the text editor" loading="lazy" class="fancy pull-right hidden-xs" src="/img/posts/2019-08-20-ftp-web-client.html.1.png" />
        <h2>Éditeur de documents</h2>
        <p>
            Ouvrez vos fichiers et modifiez-les facilement directement depuis votre navigateur. Cela fonctionne avec tous les fichiers courant que ce soit word, des feuilles de calcul ou vos présentations
        </p>
        <img alt="screenshot of the text editor" loading="lazy" class="fancy visible-xs" src="/img/posts/2019-08-20-ftp-web-client.html.1.png" />
      </div>


      <div class="feature">
        <img alt="screenshot of the shared link" loading="lazy" class="fancy pull-left hidden-xs" src="/img/screenshots/feature_share_0000.png" />
        <h2>Mac, Windows, Linux, IOS et Android</h2>
        <p>
            Aucun téléchargement requis, notre outil est portable et fonctionne sur n'importe quelle plate-forme à partir du moment ou vous avez un navigateur d'installé
        </p>
        <img alt="screenshot of the shared link" loading="lazy" class="fancy visible-xs" src="/img/screenshots/feature_share_0000.png" />
      </div>


      <div class="feature">
        <img alt="screenshot of the shared link" loading="lazy" class="fancy pull-right hidden-xs" src="/img/screenshots/feature_share_0000.png" />
        <h2>Collaborez facilement</h2>
        <p>
            Créez des liens partagés sans partager d'informations d'identification avec qui que ce soit. Protégez ces liens avec un mot de passe, rendez-le accessible à une adresse e-mail ou à un domaine spécifique, de nombreuses options sont disponibles.
        </p>
        <img alt="screenshot of the shared link" loading="lazy" class="fancy visible-xs" src="/img/screenshots/feature_share_0000.png" />
      </div>

      <div class="feature">
          <img alt="agpl logo" loading="lazy" class="fancy pull-left hidden-xs" src="/img/posts/2019-08-20-ftp-web-client.html.2.png" />
          <h2>Logiciels open source</h2>
          <p>
              Vous n'avez pas à nous faire confiance. Le code de notre logiciel est disponible sur <a href="https://github.com/mickael-kerjean/filestash">github</a> pour que chacun puisse le télécharger, l'auditer, l'auto-héberger et contribuer en retour
          </p>
          <img alt="agpl logo" loading="lazy" class="fancy visible-xs" src="/img/posts/2019-08-20-ftp-web-client.html.2.png" />
      </div>

      <div class="feature">
        <img alt="plugin" loading="lazy" class="fancy pull-right hidden-xs" src="/img/posts/2019-08-20-ftp-web-client.html.6.png" />
        <h2>Extensible et configurable</h2>
        <p>
            Filestash peut être personnalisé soit en activant les fonctionnalités à partir de la console d'administration ou via des plugins qui peuvent étendre le programme pour le modifier en profondeur
        </p>
        <img alt="plugin" loading="lazy" class="fancy visible-xs" src="/img/posts/2019-08-20-ftp-web-client.html.6.png" />
      </div>
    </div>
  </div>

  <div class="call-to-action">
    <h2>Nous avons d'autres clients en ligne:</h2>
    <a class="btn light" href="{% post_url 2020-04-30-sftp-browser-fr %}">Client SFTP</a>
    <a class="btn light" href="{% post_url 2019-11-26-ftp-web-client-fr %}">Client FTP</a>
    <a class="btn light" href="{% post_url 2019-11-21-s3-browser %}">Client S3</a>
    <a class="btn light" href="{% post_url 2020-01-04-ldap-browser %}">Client LDAP</a>
  </div>
</div>
