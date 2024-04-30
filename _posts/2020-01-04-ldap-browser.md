---
title: Online LDAP browser tool to manage and explore your LDAP server
description: A web-based tool to browse and manage your LDAP without beeing a LDIF wizard
layout: landing
tags: online-client tool oem
permalink: /ldap-browser.html
language: en
---

<link rel="stylesheet" href="/css/landing-page.css">
<link rel="stylesheet" href="/css/landing-page-login.css">

<div id="splash" class="nopadding">
  <div class="row">
    <div class="col-sm-12">
      <div class="hgroup">
        <h1>Try our <a rel="nofollow noreferrer noopener" href="https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol">LDAP</a> Browser tool:</h1>
      </div>
      <form onsubmit='$("form input[type=\"submit\"]").attr("value", "LOADING...")' action="https://demo.filestash.app/login" method="GET">
        <input type="hidden" name="type" value="ldap" />
        <label>
          <span>Hostname:</span><input type="text" name="hostname" placeholder="ldap://ldap.example.com" required/>
        </label>
        <label>
          <span>Bind DN:</span><input default="anonymous" type="text" name="bind_dn" placeholder="cn=admin,dc=example,dc=com" />
        </label>
        <label>
          <span>Bind DN password:</span><input type="password" name="bind_password" placeholder="*******" />
        </label>
        <label>
          <span>Base DN:</span><input type="text" name="base_dn" placeholder="dc=example,dc=com" />
        </label>
        <input type="submit" value="Connect" class="btn" />
      </form>

      <script>
        function clickPublicLDAPHandler(e, data){
            e.preventDefault();
            for(var key in data){
                document.querySelector("form [name='"+key+"']").value = data[key]
            }
            document.querySelector("form input[type='submit']").click()
        }
      </script>
      <p class="example">
        LDAP examples you can use:<br>
        <a rel="nofollow noopener" onclick="clickPublicLDAPHandler(event, {hostname: 'ldap://ipa.demo1.freeipa.org', bind_dn: 'uid=admin,cn=users,cn=accounts,dc=demo1,dc=freeipa,dc=org', bind_password:'Secret123', base_dn: 'cn=accounts,dc=demo1,dc=freeipa,dc=org'});" href="ldap://ipa.demo1.freeipa.org">ldap://ipa.demo1.freeipa.org</a>
        <a rel="nofollow noopener" onclick="clickPublicLDAPHandler(event, {hostname: 'ldap://ldap.forumsys.com', bind_dn: 'cn=read-only-admin,dc=example,dc=com', bind_password: 'password', base_dn: 'dc=example,dc=com'});" href="ldap://ldap.forumsys.com/">ldap://ldap.forumsys.com</a>
      </p>
    </div>
  </div>
  {% include share.html %}
</div>
<div class="waveshape"></div>

<div id="features" style="padding-bottom:0;">
  <div class="container large">
    <div class="row features main">

      <div class="feature">
        <img alt="screenshot of Filestash" loading="lazy" class="fancy pull-left hidden-xs" src="/img/screenshots/2020-01-04-ldap-browser/filespage.png" style="margin-top: -30px;" />
        <h2>A online tool to browse and manage your LDAP server</h2>
        <p>
          Filestash is web-based online tool to be use as a GUI to explore your LDAP server. The interface makes it easy to view / edit / add and remove entries from your server without being an LDIF wizard
        </p>
        <img alt="screenshot of Filestash" loading="lazy" class="fancy visible-xs" src="/img/screenshots/2020-01-04-ldap-browser/filespage.png" />
      </div>

      <div class="feature">
        <img alt="object class editor" loading="lazy" class="fancy pull-right hidden-xs" src="/img/screenshots/2020-01-04-ldap-browser/viewerpage.png" />
        <h2>LDAP Viewer and Editor</h2>
        <p>
          Our integrated viewer makes it easy to view and edit an object from your directory without being a wizard at creating LDIF files.
        </p>
        <img alt="object class editor" loading="lazy" class="fancy visible-xs" src="/img/screenshots/2020-01-04-ldap-browser/viewerpage.png" />
      </div>

      <div class="feature">
        <img alt="schema illustration" loading="lazy" class="fancy pull-left hidden-xs" src="/img/screenshots/2020-01-04-ldap-browser/schema.png" />
        <h2>Understand your LDAP schema</h2>
        <p>
          Filestash has a range of builtin of LDAP schema and it understand most commons structural object classes
        </p>
        <img alt="schema illustration" loading="lazy" class="fancy visible-xs" src="/img/screenshots/2020-01-04-ldap-browser/schema.png" />
      </div>


      <div class="feature">
        <img alt="illustration of the shared link screen" loading="lazy" class="fancy pull-right hidden-xs" src="/img/screenshots/feature_share_0000.png" />
        <h2>Shared links and full text search</h2>
        <p>
          Filestash adds a few features from your LDAP server such as full text search to quickly find something or someone and shared link to collaborate accross your organisation without frightening people who aren't used to LDIF
        </p>
        <img alt="illustration of the shared link screen" loading="lazy" class="fancy visible-xs" src="/img/screenshots/feature_share_0000.png" />
      </div>

      <div class="feature">
        <img alt="logo of the 3 main operating system" loading="lazy" class="fancy pull-left hidden-xs" src="/img/posts/2019-08-20-ftp-web-client.html.4.png" />
        <h2>Linux, Windows and Mac OSX</h2>
        <p>
          Our LDAP browser tool is to be used from your browser giving you the ultimate portability accross all platforms: Windows, Mac OSX, Linux and even Android and IOS, no download required!
        </p>
        <img alt="logo of the 3 main operating system" loading="lazy" class="fancy pull-left visible-xs" src="/img/posts/2019-08-20-ftp-web-client.html.4.png" />
      </div>

      <div class="feature">
        <img alt="agpl logo" loading="lazy" class="fancy pull-right hidden-xs" src="/img/posts/2019-08-20-ftp-web-client.html.2.png" />
        <h2>Open source & free software</h2>
        <p>
          Our tool is both open source and <a href="https://www.gnu.org/philosophy/free-sw.en.html">free software</a>. The code is available from <a rel="nofollow" href="https://github.com/mickael-kerjean/filestash">github</a> for everyone to use, audit and selfhost their own
        </p>
        <img alt="agpl logo" loading="lazy" class="fancy visible-xs" src="/img/posts/2019-08-20-ftp-web-client.html.2.png" />
      </div>

       <div class="feature">
        <img alt="ldap illustration" loading="lazy" class="fancy pull-left hidden-xs" src="/img/screenshots/2020-01-04-ldap-browser/ldap.jpeg" />
        <h2>LDAP Compliant servers</h2>
        <p>
          Filestash works great as an user interface for <a rel="nofollow noopener" href="https://www.openldap.org/">openldap</a>, <a href="https://directory.fedoraproject.org/">389ds</a>, <a href="https://en.wikipedia.org/wiki/Active_Directory">active directory</a> and any other <a rel="nofollow noopener" href="https://tools.ietf.org/html/rfc4511">LDAP compliant server</a>
        </p>
        <img alt="ldap illustration" loading="lazy" class="fancy visible-xs" src="/img/screenshots/2020-01-04-ldap-browser/ldap.jpeg" />
      </div>

      <div class="feature">
        <img alt="plugin illustration" loading="lazy" class="fancy pull-right hidden-xs" src="/img/posts/2019-08-20-ftp-web-client.html.6.png" />
        <h2>Extensible </h2>
        <p>
          Extend the base program to customise it to your exact need by creating some <a href="/docs/plugin/">plugins</a>. Actually, the LDAP functionality itself was implemented as a plugin, how cool is that?
        </p>
        <img alt="plugin illustration" loading="lazy" class="fancy visible-xs" src="/img/posts/2019-08-20-ftp-web-client.html.6.png" />
      </div>

    </div>
  </div>

  <div class="call-to-action">
    <h2>Some other online tools:</h2>
    <a class="btn light" href="{% post_url 2021-08-01-ldap-test-tool %}">LDAP Test</a>
    <a class="btn light" href="{% post_url 2019-11-26-ftp-web-client %}">FTP</a>
    <a class="btn light" href="{% post_url 2019-11-21-s3-browser %}">S3</a>
    <a class="btn light" href="{% post_url 2020-04-30-sftp-browser %}">SFTP</a>
    <a class="btn light" href="{% post_url 2021-10-18-webdav-client %}">WebDAV</a>
    <a class="btn light" href="{% post_url 2024-05-01-smb-web-client %}">SMB</a>
  </div>

</div>
{% include filestash-demo-dependency.html %}
