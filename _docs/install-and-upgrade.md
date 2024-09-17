---
layout: documentation
title: Install and upgrade
order: 2
language: en
redirect_from:
  - /docs/configuration/
---

{% include toc.md %}

## Requirements

All you need is a Linux server with these tools installed:
- [docker](https://docs.docker.com/install/){:rel="nofollow"}
- [docker-compose](https://docs.docker.com/compose/install/){:rel="nofollow"}
- curl

<div class="terminal">
<span class="prompt">~/$ </span>docker -v<br>
<span class="stdout">
Docker version 19.03.8, build afacb8b7f0<br>
</span>
<span class="prompt">~/$ </span>docker-compose -v<br>
<span class="stdout">
docker-compose version 1.24.0, build 0aa59064<br>
</span>
<span class="prompt">~/$ </span>curl --version<br>
<span class="stdout">
curl 7.70.0 (x86_64-pc-linux-gnu) ...<br>
Release-Date: 2020-04-29<br>
Protocols: ...<br>
Features: ...<br>
</span>
</div>

Hardware requirement is minimal: 128MB of RAM and 1 core will suffice, provided you’re not doing intensive video transcoding and/or serving thousands of users simultaneously.

## Installation

The official Docker image is available on [Docker Hub](https://hub.docker.com/r/machines/filestash/)
<div class="terminal">
<span class="prompt">~/$ </span>mkdir filestash && cd filestash<br>
<span class="prompt">~/filestash$ </span>curl -O https://downloads.filestash.app/latest/docker-compose.yml<br>
<span class="stdout">
% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current<br>
                                 Dload  Upload   Total   Spent    Left  Speed<br>
100   322  100   322    0     0     98      0  0:00:03  0:00:03 --:--:--    98<br>
</span>
<span class="prompt">~/filestash$ </span>docker-compose up -d<br>
<span class="stdout">
Creating filestash_app ... <br>
Creating filestash_app ... done
</span>
</div>

After installation, navigate to `http://your_domain:8334` to configure your admin password:

<img class="fancy" src="https://raw.githubusercontent.com/mickael-kerjean/filestash_images/master/screenshots/setup_password.png" alt="setup screenshot" style="320px;width: 100%;object-fit: cover;"/>

## Configuration

For a basic setup, just pick the storage backends you need, and you’re good to go:

<figure>
    <img class="fancy" src="/img/screenshots/doc_install_setup00.png" alt="storage backend screenshot" />
    <figcaption>Example with only FTP & S3 enabled, appearing as "A FTP" and "AWS S3"</figcaption>
</figure>

This is the setup we use for the publicly available <a href="https://demo.filestash.app/login">demo</a>. If that's all you need, you can jump straight to <a href="#going-to-prod">going to prod<a>.

### Passthrough Pattern

Now that we’ve covered the basics, let’s dive into the cooler stuff, connecting your storage to different authentication and authorization sources. There are plenty of valid strategies for this, but we’ll start with the simplest one, the passthrough middleware:

<img class="fancy" src="/img/screenshots/doc_install_setup03.png" alt="auth middleware screenshot using passthrough to be used as an FTP client" loading="lazy" />

If you go with the same exact configuration in the screenshot above, users will see a much simpler login screen like this:

<figure>
    <img class="fancy" src="/img/screenshots/doc_install_setup02.png" alt="resulting frontend as an FTP client" loading="lazy" />
    <figcaption>Authenticating as "anonymous" to ftp.gnu.org</figcaption>
</figure>

At this point, the user experience is already much better than having them type in the correct "hostname" and "port" like before. The connection is established using a mix of static values, such as the hardcoded "ftp.gnu.org" hostname from the admin configuration, and dynamic variables, which in this case are the username and password entered by the user. Another common strategy is to create automatic login links. To do this, simply change the strategy in the configuration to "direct" and set everything up statically or through URL variables. This approach is especially useful if you want to generate QR codes or deep URLs, in which case security can be preserved through URL signatures.

### Facade Pattern

Another very different pattern is to create a "facade" for your storage using methods like "htpasswd", "OIDC", "SAML", or "LDAP". In practice, it looks like this:

<img class="fancy" src="/img/screenshots/doc_install_setup04.png" alt="auth middleware to be used as a S3 browser" loading="lazy" />

In the setup above, only two users with their own username and password are allowed access, and the path variable is dynamically generated based on who has successfully authenticated. The user “rick” has full access to all S3 buckets, while the user “jerry” is restricted to the “earth” bucket only.

Under the hood, these mappings are done using the Go templating language, along with a few custom functions to enable more advanced use cases. For example, you can dynamically generate chroot paths based on AD groups by building queries like this: &#123;&#123; if contains .memberOf "ADMIN"}}/&#123;&#123; else }}/&#123;&#123; .department }}/&#123;&#123; endif }}.

## Plugins

So far, we've only touched on storage plugins and authentication middleware, which are 2 of the 3 pillars of a solid bespoke solution:

<figure>
    <svg class="fancy" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="541px" height="251px" viewBox="-0.5 -0.5 541 251" content="&lt;mxfile host=&quot;app.diagrams.net&quot; modified=&quot;2023-10-26T10:41:44.689Z&quot; agent=&quot;Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36&quot; etag=&quot;eEwr9J-BfdjW0COSig_D&quot; version=&quot;22.0.8&quot; type=&quot;device&quot;&gt;&lt;diagram name=&quot;Page-1&quot; id=&quot;c8K3z8Ol-qs7Zjn3edB4&quot;&gt;5Zldc6IwFIZ/jZfrQACVS9bS6qwtHeLW2b3ZQYmQaSRuDKvtr99E4mfotLutllKd0fASonne4zlnpGF1Z6srFs3Taxoj0gBGvGpYFw0AHNASr1J4KATTtNuFkjAcK20nQPyIlGgoNccxWhxM5JQSjueH4oRmGZrwAy1ijC4Pp00pOfzUeZQgTYCTiOjqCMc8LdSOY+z0HsJJuvlk01BnZtFmshIWaRTT5Z5k+Q2ryyjlxWi26iIi4W24FNddPnF2+8UYyvhLLohHUwrb+a/ZHR3l3/owcru/v4BilT8RydWG4TAIvSu/IVdrEbHy1zETo0SOoB/e+aHaDn/YMBI7m8vhJB+Lt6/LFHME59FEaksRFkJL+YyII1MuR/MsRvFgvBWiyX3CpBrknOAMKT2O2H0glsFcBo/RNJxDEaxVOVNtAjGOVk/SMbfMRbAiOkOcPYgp6oKOcknF6fZ4uTPd3Jie7hnuKi1ScZZsV95ZIQbKjX9wxtKcuewPfDj0YE/I3SD0NR9YQVbhe8aGlDL8SDMebQSJD4vA9whOMqFxOn8btK1DtCbQ0Tr2OdHaGtonQzqm+ZggTyYSGXyYiRyDqcSzoLn89s9hfgN+pn0Um6YOEJTwa5+Kn6Px874Pe/7NsN/1hv3g5lMlDuA4FcscrY8V3pYJmkcI3zvA26UBHoT9nyq+axjHNqhaHHc+VhzbbsXStGlqACGnTDa8wLgleYKzxet6iPKWYYoJ6VJC2XpFa+rIp9RFt7GnFw+hLzij92jvTGv9eBtX2kfNR6skqlslrjgnc0WvnpfD29f5UGnirk68rNsDJwOu10NYL+KmWTXkegGFVp2AO1UDrtfKZrNZJ+Ju1Yi7GnFPdhqfp7IC67BhLC2tbeeMpXVj9p4n1ziOCVqKTX0iZ2zzJc6cs+kBeivaG956EI6C8KJGaQq0j8iXpCm35CdxsjQF9G4TwqBOxI+z0HsXBqC3m/UqxVbVGnygd5uh74k3I7gZ/KgReS2vl5DvnJV83dtOx65YdrH0FicMBq+8FVQp5Lb7PPKyvyH/A7k43N1+XZ/bu4lt+X8B&lt;/diagram&gt;&lt;/mxfile&gt;" style="padding:15px 10px; width: 100%; min-height: 350px; box-sizing: border-box;"><defs/><g><path d="M 20 160 L 150 160 L 170 180 L 170 250 L 40 250 L 20 230 L 20 160 Z" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><path d="M 20 160 L 150 160 L 170 180 L 40 180 Z" fill-opacity="0.05" fill="#000000" stroke="none" pointer-events="all"/><path d="M 20 160 L 40 180 L 40 250 L 20 230 Z" fill-opacity="0.1" fill="#000000" stroke="none" pointer-events="all"/><path d="M 40 250 L 40 180 L 20 160 M 40 180 L 170 180" fill="none" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 128px; height: 1px; padding-top: 215px; margin-left: 41px;"><div data-drawio-colors="color: rgb(0, 0, 0); " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">STORAGE <br />SERVER</div></div></div></foreignObject><text x="105" y="219" fill="rgb(0, 0, 0)" font-family="Helvetica" font-size="12px" text-anchor="middle">STORAGE...</text></switch></g><rect x="0" y="0" width="540" height="90" rx="13.5" ry="13.5" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe flex-start; justify-content: unsafe center; width: 538px; height: 1px; padding-top: 7px; margin-left: 1px;"><div data-drawio-colors="color: rgb(0, 0, 0); " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">FILESTASH CORE</div></div></div></foreignObject><text x="270" y="19" fill="rgb(0, 0, 0)" font-family="Helvetica" font-size="12px" text-anchor="middle">FILESTASH CORE</text></switch></g><path d="M 55 125 L 69 115 L 69 122 L 111 122 L 111 115 L 125 125 L 111 135 L 111 128 L 69 128 L 69 135 Z" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" transform="rotate(90,90,125)" pointer-events="all"/><path d="M 195 160 L 325 160 L 345 180 L 345 250 L 215 250 L 195 230 L 195 160 Z" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><path d="M 195 160 L 325 160 L 345 180 L 215 180 Z" fill-opacity="0.05" fill="#000000" stroke="none" pointer-events="all"/><path d="M 195 160 L 215 180 L 215 250 L 195 230 Z" fill-opacity="0.1" fill="#000000" stroke="none" pointer-events="all"/><path d="M 215 250 L 215 180 L 195 160 M 215 180 L 345 180" fill="none" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 128px; height: 1px; padding-top: 215px; margin-left: 216px;"><div data-drawio-colors="color: rgb(0, 0, 0); " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">AUTHENTICATION<br />SERVER</div></div></div></foreignObject><text x="280" y="219" fill="rgb(0, 0, 0)" font-family="Helvetica" font-size="12px" text-anchor="middle">AUTHENTICATION...</text></switch></g><path d="M 227.5 125 L 241.5 115 L 241.5 122 L 283.5 122 L 283.5 115 L 297.5 125 L 283.5 135 L 283.5 128 L 241.5 128 L 241.5 135 Z" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" transform="rotate(90,262.5,125)" pointer-events="all"/><path d="M 365 160 L 495 160 L 515 180 L 515 250 L 385 250 L 365 230 L 365 160 Z" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><path d="M 365 160 L 495 160 L 515 180 L 385 180 Z" fill-opacity="0.05" fill="#000000" stroke="none" pointer-events="all"/><path d="M 365 160 L 385 180 L 385 250 L 365 230 Z" fill-opacity="0.1" fill="#000000" stroke="none" pointer-events="all"/><path d="M 385 250 L 385 180 L 365 160 M 385 180 L 515 180" fill="none" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 128px; height: 1px; padding-top: 215px; margin-left: 386px;"><div data-drawio-colors="color: rgb(0, 0, 0); " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">AUTHORIZATION</div></div></div></foreignObject><text x="450" y="219" fill="rgb(0, 0, 0)" font-family="Helvetica" font-size="12px" text-anchor="middle">AUTHORIZATION</text></switch></g><path d="M 405 125 L 419 115 L 419 122 L 461 122 L 461 115 L 475 125 L 461 135 L 461 128 L 419 128 L 419 135 Z" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" transform="rotate(90,440,125)" pointer-events="all"/><rect x="10" y="40" width="160" height="50" rx="7.5" ry="7.5" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe flex-start; justify-content: unsafe center; width: 158px; height: 1px; padding-top: 47px; margin-left: 11px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">Storage Plugins</div></div></div></foreignObject><text x="90" y="59" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">Storage Plugins</text></switch></g><rect x="10" y="70" width="40" height="20" rx="3" ry="3" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 38px; height: 1px; padding-top: 80px; margin-left: 11px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">FTP</div></div></div></foreignObject><text x="30" y="84" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">FTP</text></switch></g><rect x="50" y="70" width="40" height="20" rx="3" ry="3" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 38px; height: 1px; padding-top: 80px; margin-left: 51px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">SFTP</div></div></div></foreignObject><text x="70" y="84" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">SFTP</text></switch></g><rect x="90" y="70" width="40" height="20" rx="3" ry="3" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 38px; height: 1px; padding-top: 80px; margin-left: 91px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">S3</div></div></div></foreignObject><text x="110" y="84" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">S3</text></switch></g><rect x="130" y="70" width="40" height="20" rx="3" ry="3" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 38px; height: 1px; padding-top: 80px; margin-left: 131px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">...</div></div></div></foreignObject><text x="150" y="84" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">...</text></switch></g><rect x="175" y="40" width="175" height="50" rx="7.5" ry="7.5" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe flex-start; justify-content: unsafe center; width: 173px; height: 1px; padding-top: 47px; margin-left: 176px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">Auth Plugins</div></div></div></foreignObject><text x="263" y="59" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">Auth Plugins</text></switch></g><rect x="355" y="40" width="170" height="50" rx="7.5" ry="7.5" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe flex-start; justify-content: unsafe center; width: 168px; height: 1px; padding-top: 47px; margin-left: 356px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">Middleware Plugins</div></div></div></foreignObject><text x="440" y="59" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">Middleware Plugins</text></switch></g><rect x="215" y="70" width="95" height="20" rx="3" ry="3" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 93px; height: 1px; padding-top: 80px; margin-left: 216px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">HTPASSWORD</div></div></div></foreignObject><text x="263" y="84" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">HTPASSWORD</text></switch></g><rect x="175" y="70" width="40" height="20" rx="3" ry="3" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 38px; height: 1px; padding-top: 80px; margin-left: 176px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">SSO</div></div></div></foreignObject><text x="195" y="84" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">SSO</text></switch></g><rect x="310" y="70" width="40" height="20" rx="3" ry="3" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 38px; height: 1px; padding-top: 80px; margin-left: 311px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">...</div></div></div></foreignObject><text x="330" y="84" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">...</text></switch></g><rect x="355" y="70" width="80" height="20" rx="3" ry="3" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 78px; height: 1px; padding-top: 80px; margin-left: 356px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">READ ONLY</div></div></div></foreignObject><text x="395" y="84" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">READ ONLY</text></switch></g><rect x="485" y="70" width="40" height="20" rx="3" ry="3" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 38px; height: 1px; padding-top: 80px; margin-left: 486px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">...</div></div></div></foreignObject><text x="505" y="84" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">...</text></switch></g><rect x="435" y="70" width="50" height="20" rx="3" ry="3" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 48px; height: 1px; padding-top: 80px; margin-left: 436px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">ROLE</div></div></div></foreignObject><text x="460" y="84" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">ROLE</text></switch></g></g><switch><g requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"/><a transform="translate(0,-5)" xlink:href="https://www.drawio.com/doc/faq/svg-export-text-problems" target="_blank"><text text-anchor="middle" font-size="10px" x="50%" y="100%">Text is not SVG - cannot display</text></a></switch></svg>
    <figcaption>Storage plugins implements the <a href="https://github.com/mickael-kerjean/filestash/blob/master/server/common/types.go#L11-L21">IBackend interface</a>, Auth middleware implements the <a href="https://github.com/mickael-kerjean/filestash/blob/master/server/common/types.go#L23C6-L27">IAuthentication interface</a> and you can get fine grained authorisation with the <a href="https://github.com/mickael-kerjean/filestash/blob/master/server/common/types.go#L29-L37">IAuthorization interface</a></figcaption>
</figure>

Yet, we’re only beginning to tap into the potential of plugins. Filestash is more than just a ready-to-use tool; it's built as a framework for developing file management applications. Once you take a closer look, you’ll find a core engine surrounded by [plugins](https://github.com/mickael-kerjean/filestash/blob/master/server/plugin/index.go) that define almost every aspect of the file manager.

To cite a few examples of what plugins can do, you can layer a complete authorisation framework, override frontend code to change the default set of icons, disable viewers, add buttons specific to your use case, or even build entire file viewer applications like our [OnlyOffice integration](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_editor_onlyoffice) which supports office documents, change how [configuration is being stored](https://github.com/mickael-kerjean/filestash/blob/master/server/common/config_state.go#L3-L14) and saved to something like S3 or via environment variables, disable search or go the full text search path with either the [sqlite plugin](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_search_sqlitefts) or integrate with your existing Elasticsearch or Solr cluster. We've gone so far that if the thought of a buffer overflow makes you sweat, you can switch the default thumbnail generators written in C for [another implementation made entirely in Go](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_image_golang) or disable it altogether.

You can see all the plugins installed in your build on the `/about` page of your Filestash instance:

<img class="fancy" src="/img/screenshots/doc_install_setup01.png" alt="about page screenshot" loading="lazy" />

The plugin based architecture runs deep in the software and allows for the kind of customisation that would be impossible with any other solution. If you have very specific needs, there's good chance custom plugin can work for you and we can assist you <a href="/pricing/?origin=local&modal=enterprise">every step of the way in your project</a>

If you’re eager to explore the power of plugins, delving into the source code is your best bet. A good starting point for this exploration is [this](https://github.com/mickael-kerjean/filestash/blob/master/server/common/plugin.go#L164-L171) and [this](https://github.com/mickael-kerjean/filestash/blob/master/server/common/types.go).

## Going to Prod

### SSL & Load Balancer

Most enterprises will want to bring their own SSL certificates and use an ELB (Elastic Load Balancer) to proxy requests to the service, ensuring high availability. The base image plays well with this kind of setup but if you live in a simpler world, you have a couple options:

1. setup a reverse proxy sitting as a middleman and handling the SSL termination there. In practice it means you will be using something like [certbot](https://letsencrypt.org/getting-started/) to generate SSL certificate and have something like [nginx](https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/) sitting as a middle man configured with proxy_pass to "http://ip_of_the_service:8334" and ssl certificate installed [like this](https://nginx.org/en/docs/http/configuring_https_servers.html).

2. use another plugin that make Filestash speaks HTTPS natively without reverse proxy. There's 2 variations of such plugins, one that does SSL through letsencrypt and another where you need to insert your certificate in a particular location.

### Advanced Setup

Filestash is deployed in many sensitive environments with very stringent needs. If this sounds like what you are doing, you might want to read:

1. our [hardening guide](/redirect.html?origin=doc::install&url=https://downloads.filestash.app/upload/hardening-guide.pdf)

2. some examples of architecture diagram that was made for a deployment in large pharma with requirements for high availability and scalability. You can read about that in [this post from the AWS Blog](https://aws.amazon.com/blogs/storage/how-regeneron-built-a-secure-and-scalable-file-transfer-service-using-aws-transfer-family/):

<figure>
    <img src="/img/illustration/architecture-diagram.png">
    <figcaption style="text-align:left;">
        Credit: aws.amazon.com/blogs/ <br>
        Source: <a href="https://aws.amazon.com/blogs/storage/how-regeneron-built-a-secure-and-scalable-file-transfer-service-using-aws-transfer-family/">How Regeneron built a secure and scalable file transfer service using AWS Transfer Family</a></figcaption>
</figure>

## Upgrade

To update Filestash:

<div class="terminal">
<span class="prompt">~/filestash$ </span>curl -O https://downloads.filestash.app/latest/docker-compose.yml<br>
<span class="stdout">
% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current<br>
                                 Dload  Upload   Total   Spent    Left  Speed<br>
100   322  100   322    0     0     98      0  0:00:03  0:00:03 --:--:--    98<br>
</span>
<span class="prompt">~/filestash$ </span>docker-compose pull<br>
<span class="stdout">
Pulling app (machines/filestash:latest)... <br>
latest: Pulling from machines/filestash <br>
Digest: sha256:4da068a5868d736f6382618e6f8baa6cf44c1cf0f94a3ded05aa25b00a41f425 <br>
Status: Image is up to date for machines/filestash:latest <br>
</span>
<span class="prompt">~/filestash$ </span>docker-compose up -d<br>
<span class="stdout">
Recreating filestash_app ... <br>
Recreating filestash_app ... done
</span>
</div>

<style>
figure { margin: 0; }
figure figcaption {
    padding: 0 10px;
    text-align: center;
    font-size: 0.95rem;
    font-style: italic;
    opacity: 0.9;
}
</style>
