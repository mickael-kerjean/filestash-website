---
layout: documentation
title: Install and upgrade
order: 2
language: en
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

The official docker images are available on [docker hub](https://hub.docker.com/r/machines/filestash/).

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

## Setup

You can pick and choose which storages you want your users to access:

<figure>
    <img class="fancy" src="/img/screenshots/doc_install_setup00.png" alt="storage backend screenshot" />
    <figcaption>Example with only FTP & S3 enabled, appearing as "A FTP" and "AWS S3"</figcaption>
</figure>

Behind the scenes, "storage plugins" power each storage option in Filestash, providing a unified web interface that encapsulates the main functionalities of Filezilla, Cloudberry, WinSCP, and Cyberduck. This setup alone meets a wide range of needs but we can unlock some more powerful capabilities via "authentication middleware":

<img class="fancy" src="/img/screenshots/doc_install_setup03.png" alt="auth middleware screenshot using passthrough to be used as an FTP client" loading="lazy" />

By enabling an "Authentication middleware" plugin like the passthrough option shown above, you spare users from knowing and entering the technical details of your storage like hostname, port, access_keys, ... etc... These parameters will then be used to connect to your storage which in this case would show:

<figure>
    <img class="fancy" src="/img/screenshots/doc_install_setup02.png" alt="resulting frontend as an FTP client" loading="lazy" />
    <figcaption>Authenticating as "anonymous" to ftp.gnu.org</figcaption>
</figure>

Another very common pattern is to use a plugin like the `htpasswd` to create a facade for your storage:

<img class="fancy" src="/img/screenshots/doc_install_setup04.png" alt="auth middleware to be used as a S3 browser" loading="lazy" />

This setup grants "rick" complete access to all S3 buckets, whereas "jerry" is restricted to the "earth" bucket only. These mappings can make use of the [Go templating language](https://pkg.go.dev/text/template), enriched to enable the use of environment variables and additional functions like ".contains", which are very handy for setting up role-based access.


## Plugins

So far, we've touched on storage plugins and authentication middleware, which are 2 of the 3 pillars of a solid bespoke solution:

<figure>
    <svg class="fancy" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="541px" height="251px" viewBox="-0.5 -0.5 541 251" content="&lt;mxfile host=&quot;app.diagrams.net&quot; modified=&quot;2023-10-26T10:41:44.689Z&quot; agent=&quot;Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36&quot; etag=&quot;eEwr9J-BfdjW0COSig_D&quot; version=&quot;22.0.8&quot; type=&quot;device&quot;&gt;&lt;diagram name=&quot;Page-1&quot; id=&quot;c8K3z8Ol-qs7Zjn3edB4&quot;&gt;5Zldc6IwFIZ/jZfrQACVS9bS6qwtHeLW2b3ZQYmQaSRuDKvtr99E4mfotLutllKd0fASonne4zlnpGF1Z6srFs3Taxoj0gBGvGpYFw0AHNASr1J4KATTtNuFkjAcK20nQPyIlGgoNccxWhxM5JQSjueH4oRmGZrwAy1ijC4Pp00pOfzUeZQgTYCTiOjqCMc8LdSOY+z0HsJJuvlk01BnZtFmshIWaRTT5Z5k+Q2ryyjlxWi26iIi4W24FNddPnF2+8UYyvhLLohHUwrb+a/ZHR3l3/owcru/v4BilT8RydWG4TAIvSu/IVdrEbHy1zETo0SOoB/e+aHaDn/YMBI7m8vhJB+Lt6/LFHME59FEaksRFkJL+YyII1MuR/MsRvFgvBWiyX3CpBrknOAMKT2O2H0glsFcBo/RNJxDEaxVOVNtAjGOVk/SMbfMRbAiOkOcPYgp6oKOcknF6fZ4uTPd3Jie7hnuKi1ScZZsV95ZIQbKjX9wxtKcuewPfDj0YE/I3SD0NR9YQVbhe8aGlDL8SDMebQSJD4vA9whOMqFxOn8btK1DtCbQ0Tr2OdHaGtonQzqm+ZggTyYSGXyYiRyDqcSzoLn89s9hfgN+pn0Um6YOEJTwa5+Kn6Px874Pe/7NsN/1hv3g5lMlDuA4FcscrY8V3pYJmkcI3zvA26UBHoT9nyq+axjHNqhaHHc+VhzbbsXStGlqACGnTDa8wLgleYKzxet6iPKWYYoJ6VJC2XpFa+rIp9RFt7GnFw+hLzij92jvTGv9eBtX2kfNR6skqlslrjgnc0WvnpfD29f5UGnirk68rNsDJwOu10NYL+KmWTXkegGFVp2AO1UDrtfKZrNZJ+Ju1Yi7GnFPdhqfp7IC67BhLC2tbeeMpXVj9p4n1ziOCVqKTX0iZ2zzJc6cs+kBeivaG956EI6C8KJGaQq0j8iXpCm35CdxsjQF9G4TwqBOxI+z0HsXBqC3m/UqxVbVGnygd5uh74k3I7gZ/KgReS2vl5DvnJV83dtOx65YdrH0FicMBq+8FVQp5Lb7PPKyvyH/A7k43N1+XZ/bu4lt+X8B&lt;/diagram&gt;&lt;/mxfile&gt;" style="padding:15px 10px; width: 100%; min-height: 350px; box-sizing: border-box;"><defs/><g><path d="M 20 160 L 150 160 L 170 180 L 170 250 L 40 250 L 20 230 L 20 160 Z" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><path d="M 20 160 L 150 160 L 170 180 L 40 180 Z" fill-opacity="0.05" fill="#000000" stroke="none" pointer-events="all"/><path d="M 20 160 L 40 180 L 40 250 L 20 230 Z" fill-opacity="0.1" fill="#000000" stroke="none" pointer-events="all"/><path d="M 40 250 L 40 180 L 20 160 M 40 180 L 170 180" fill="none" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 128px; height: 1px; padding-top: 215px; margin-left: 41px;"><div data-drawio-colors="color: rgb(0, 0, 0); " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">STORAGE <br />SERVER</div></div></div></foreignObject><text x="105" y="219" fill="rgb(0, 0, 0)" font-family="Helvetica" font-size="12px" text-anchor="middle">STORAGE...</text></switch></g><rect x="0" y="0" width="540" height="90" rx="13.5" ry="13.5" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe flex-start; justify-content: unsafe center; width: 538px; height: 1px; padding-top: 7px; margin-left: 1px;"><div data-drawio-colors="color: rgb(0, 0, 0); " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">FILESTASH CORE</div></div></div></foreignObject><text x="270" y="19" fill="rgb(0, 0, 0)" font-family="Helvetica" font-size="12px" text-anchor="middle">FILESTASH CORE</text></switch></g><path d="M 55 125 L 69 115 L 69 122 L 111 122 L 111 115 L 125 125 L 111 135 L 111 128 L 69 128 L 69 135 Z" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" transform="rotate(90,90,125)" pointer-events="all"/><path d="M 195 160 L 325 160 L 345 180 L 345 250 L 215 250 L 195 230 L 195 160 Z" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><path d="M 195 160 L 325 160 L 345 180 L 215 180 Z" fill-opacity="0.05" fill="#000000" stroke="none" pointer-events="all"/><path d="M 195 160 L 215 180 L 215 250 L 195 230 Z" fill-opacity="0.1" fill="#000000" stroke="none" pointer-events="all"/><path d="M 215 250 L 215 180 L 195 160 M 215 180 L 345 180" fill="none" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 128px; height: 1px; padding-top: 215px; margin-left: 216px;"><div data-drawio-colors="color: rgb(0, 0, 0); " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">AUTHENTICATION<br />SERVER</div></div></div></foreignObject><text x="280" y="219" fill="rgb(0, 0, 0)" font-family="Helvetica" font-size="12px" text-anchor="middle">AUTHENTICATION...</text></switch></g><path d="M 227.5 125 L 241.5 115 L 241.5 122 L 283.5 122 L 283.5 115 L 297.5 125 L 283.5 135 L 283.5 128 L 241.5 128 L 241.5 135 Z" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" transform="rotate(90,262.5,125)" pointer-events="all"/><path d="M 365 160 L 495 160 L 515 180 L 515 250 L 385 250 L 365 230 L 365 160 Z" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><path d="M 365 160 L 495 160 L 515 180 L 385 180 Z" fill-opacity="0.05" fill="#000000" stroke="none" pointer-events="all"/><path d="M 365 160 L 385 180 L 385 250 L 365 230 Z" fill-opacity="0.1" fill="#000000" stroke="none" pointer-events="all"/><path d="M 385 250 L 385 180 L 365 160 M 385 180 L 515 180" fill="none" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 128px; height: 1px; padding-top: 215px; margin-left: 386px;"><div data-drawio-colors="color: rgb(0, 0, 0); " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(0, 0, 0); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">AUTHORIZATION</div></div></div></foreignObject><text x="450" y="219" fill="rgb(0, 0, 0)" font-family="Helvetica" font-size="12px" text-anchor="middle">AUTHORIZATION</text></switch></g><path d="M 405 125 L 419 115 L 419 122 L 461 122 L 461 115 L 475 125 L 461 135 L 461 128 L 419 128 L 419 135 Z" fill="rgb(255, 255, 255)" stroke="rgb(0, 0, 0)" stroke-miterlimit="10" transform="rotate(90,440,125)" pointer-events="all"/><rect x="10" y="40" width="160" height="50" rx="7.5" ry="7.5" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe flex-start; justify-content: unsafe center; width: 158px; height: 1px; padding-top: 47px; margin-left: 11px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">Storage Plugins</div></div></div></foreignObject><text x="90" y="59" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">Storage Plugins</text></switch></g><rect x="10" y="70" width="40" height="20" rx="3" ry="3" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 38px; height: 1px; padding-top: 80px; margin-left: 11px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">FTP</div></div></div></foreignObject><text x="30" y="84" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">FTP</text></switch></g><rect x="50" y="70" width="40" height="20" rx="3" ry="3" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 38px; height: 1px; padding-top: 80px; margin-left: 51px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">SFTP</div></div></div></foreignObject><text x="70" y="84" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">SFTP</text></switch></g><rect x="90" y="70" width="40" height="20" rx="3" ry="3" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 38px; height: 1px; padding-top: 80px; margin-left: 91px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">S3</div></div></div></foreignObject><text x="110" y="84" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">S3</text></switch></g><rect x="130" y="70" width="40" height="20" rx="3" ry="3" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 38px; height: 1px; padding-top: 80px; margin-left: 131px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">...</div></div></div></foreignObject><text x="150" y="84" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">...</text></switch></g><rect x="175" y="40" width="175" height="50" rx="7.5" ry="7.5" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe flex-start; justify-content: unsafe center; width: 173px; height: 1px; padding-top: 47px; margin-left: 176px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">Auth Plugins</div></div></div></foreignObject><text x="263" y="59" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">Auth Plugins</text></switch></g><rect x="355" y="40" width="170" height="50" rx="7.5" ry="7.5" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe flex-start; justify-content: unsafe center; width: 168px; height: 1px; padding-top: 47px; margin-left: 356px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">Middleware Plugins</div></div></div></foreignObject><text x="440" y="59" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">Middleware Plugins</text></switch></g><rect x="215" y="70" width="95" height="20" rx="3" ry="3" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 93px; height: 1px; padding-top: 80px; margin-left: 216px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">HTPASSWORD</div></div></div></foreignObject><text x="263" y="84" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">HTPASSWORD</text></switch></g><rect x="175" y="70" width="40" height="20" rx="3" ry="3" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 38px; height: 1px; padding-top: 80px; margin-left: 176px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">SSO</div></div></div></foreignObject><text x="195" y="84" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">SSO</text></switch></g><rect x="310" y="70" width="40" height="20" rx="3" ry="3" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 38px; height: 1px; padding-top: 80px; margin-left: 311px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">...</div></div></div></foreignObject><text x="330" y="84" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">...</text></switch></g><rect x="355" y="70" width="80" height="20" rx="3" ry="3" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 78px; height: 1px; padding-top: 80px; margin-left: 356px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">READ ONLY</div></div></div></foreignObject><text x="395" y="84" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">READ ONLY</text></switch></g><rect x="485" y="70" width="40" height="20" rx="3" ry="3" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 38px; height: 1px; padding-top: 80px; margin-left: 486px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">...</div></div></div></foreignObject><text x="505" y="84" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">...</text></switch></g><rect x="435" y="70" width="50" height="20" rx="3" ry="3" fill="#f5f5f5" stroke="#666666" pointer-events="all"/><g transform="translate(-0.5 -0.5)"><switch><foreignObject pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility" style="overflow: visible; text-align: left;"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe center; width: 48px; height: 1px; padding-top: 80px; margin-left: 436px;"><div data-drawio-colors="color: #333333; " style="box-sizing: border-box; font-size: 0px; text-align: center;"><div style="display: inline-block; font-size: 12px; font-family: Helvetica; color: rgb(51, 51, 51); line-height: 1.2; pointer-events: all; white-space: normal; overflow-wrap: normal;">ROLE</div></div></div></foreignObject><text x="460" y="84" fill="#333333" font-family="Helvetica" font-size="12px" text-anchor="middle">ROLE</text></switch></g></g><switch><g requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"/><a transform="translate(0,-5)" xlink:href="https://www.drawio.com/doc/faq/svg-export-text-problems" target="_blank"><text text-anchor="middle" font-size="10px" x="50%" y="100%">Text is not SVG - cannot display</text></a></switch></svg>
    <figcaption>Storage plugins implements the <a href="https://github.com/mickael-kerjean/filestash/blob/master/server/common/types.go#L11-L21">IBackend interface</a>, Auth middleware implements the <a href="https://github.com/mickael-kerjean/filestash/blob/master/server/common/types.go#L23C6-L27">IAuthentication interface</a> and you can get fine grained authorisation with the <a href="https://github.com/mickael-kerjean/filestash/blob/master/server/common/types.go#L29-L37">IAuthorization interface</a></figcaption>
</figure>

Yet, we're just beginning to tap into the potential of plugins. At its heart, Filestash is a file management engine, and plugins are the tools that empower you to customize its many facets.

For example, plugins offer the flexibility to modify the [default file viewer](https://github.com/mickael-kerjean/filestash/blob/master/server/common/plugin.go#L164-L171) for a custom look or even build one from the ground up—as we did with our [OnlyOffice integration to support office documents](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_editor_onlyoffice). You can also alter where Filestash's configuration is pulled from and saved. While the filesystem is the default method, plugins enable configuration via [S3 or directly through environment variables](https://github.com/mickael-kerjean/filestash/blob/master/server/common/config_state.go#L3-L14). Searching capabilities go beyond the default recursive search plugin; they can be enhanced with more sophisticated FTS engines, like [our SQLite implementation](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_search_sqlitefts), integrated with your existing Elasticsearch or Solr cluster or be disabled altogether. Additionally, if the thought of a buffer overflow makes you sweat, you can switch the default thumbnail generators written in C for [another implementation made entirely in Go](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_image_golang).

You can see all the plugins installed in your build on the `/about` page of your Filestash instance:

<img class="fancy" src="/img/screenshots/doc_install_setup01.png" alt="about page screenshot" loading="lazy" />

To truly grasp the breadth of options available through plugins, delving into the source code is the way to go. A good starting point for this exploration is [this](https://github.com/mickael-kerjean/filestash/blob/master/server/common/plugin.go#L164-L171) and [this](https://github.com/mickael-kerjean/filestash/blob/master/server/common/types.go).

<div class="banner" style="text-align:justify">
    Need a hand with your setup? <br>
    We offer professional services, including a variety of ready-made plugins, and can develop custom plugins tailored to your needs. Don't hesitate to <a href="/pricing/?modal=installer_selfhosted">get in touch</a>, and we'll assist you every step of the way.
</div>

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

## Alternative installation methods

*Warning*: Docker remains the only officially supported free installation method. The vast landscape of Linux distributions presents a complex challenge, particularly when it comes to packaging—aptly depicted by this [classic XKCD comic](https://xkcd.com/927/){:rel="nofollow"}. Should you require a production-ready Filestash installation outside of Docker, please contact us. We'll ensure a seamless setup as part of a support contract.

For other installation methods, you can refer to guides provided by our community:

- SRugina: [ubuntu instructions + script](https://github.com/mickael-kerjean/filestash/pull/136)
- sehnryr: [Installing Filestash on Debian 10 (Buster)](https://sehnryr.medium.com/installing-filestash-on-debian-10-buster-8b6d33c8daed)
- *add your own with a PR*

If you want to build and install Filestash by yourself, the reference is the [Dockerfile](https://github.com/mickael-kerjean/filestash/blob/master/docker/prod/Dockerfile){:rel="nofollow"}.




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
