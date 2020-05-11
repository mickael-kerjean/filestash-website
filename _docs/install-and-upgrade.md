---
layout: documentation
title: Install and upgrade
order: 2
---

{% include toc.md %}
<div style="
background: var(--emphasis-primary);
color: var(--dark);
padding: 5px 10px;
border-radius: 3px;
border: 2px solid var(--primary);
text-decoration: none;
margin-bottom: 15px;
margin-top: -5px;">
    <style>.banner{display:none!important;}</style>
    Do you prefer video tutorial more than reading documentation? Vote <a rel="nofollow" href="https://github.com/mickael-kerjean/filestash/issues/215">here</a> and we will create one if we ever reach 100 votes
</div>

## Requirement

The official installation guide requires a Linux server with the following tools installed:
- [docker](https://docs.docker.com/install/){:rel="nofollow"}
- [docker-compose](https://docs.docker.com/compose/install/){:rel="nofollow"}
- curl (very likely already installed in your linux distribution)

Hardware requirement is minimal: 64MB of RAM and 1 core will give you plenty of comfort. If you're expecting heavier load, we have some numbers [here](/2019/05/06/benchmark/)

## Installation
The installation can be done in 3 bash commands:
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

*Note*: Official Docker images are made available on [DockerHub](https://hub.docker.com/r/machines/filestash/).

*Note*: The Docker Compose command above will run Filestash as well as OnlyOffice Document Server. Please check the requirements here: https://hub.docker.com/r/onlyoffice/documentserver#recommended-system-requirements

=======
Once the installation has complete, open up a browser and navigate to: `http://your_ip:8334`, you will be greet with the setup screen:

<img src="https://raw.githubusercontent.com/mickael-kerjean/filestash_images/master/screenshots/setup.png" alt="setup screenshot" height="320px"/>
Enter the admin password you want to use to protect the admin console that's available under `/admin`.

Last step is to let Filestash configure itself depending on what you are trying to achieve:
<img src="https://raw.githubusercontent.com/mickael-kerjean/filestash_images/master/screenshots/setup_stage2.png" alt="stage 2 of the setup- screenshot" height="320px"/>

At this stage, selecting `Yes` will expose your instance to the internet from one of our subdomain (eg https://user-foo.filestash.app) without requiring any further setup from your end (see [here](/2019/05/01/performance/) if you worry about the automatic configuration).

**How does it work?** Filestash establish a bidirectional tunnel from your instance to one of our public server. Incoming requests through our domain will first hit our server to then be directed within the tunnel.

**Why should I care?** The motivation behind this feature is security since we discovered (big thank you to the people would have opt in the telemetry) many instances weren't being secured properly: lack of SSL certificates, missconfiguration of reverse proxy, ...

<img height="320px" src="https://img.memecdn.com/poodle-vulnerability_o_4000087.webp" alt="poodle ssl vulnerability"/>

**Pro and Cons:** This approach isn't perfect, it adds on latency and won't give control of the proxy server. However, it has benefits such as:
- it is secure by default
- you aren't require to be an admin of anything to make it work
- if a security vulnerability comes up, we will be able to block potential exploit

**Your domain name**: If you have the tunnel enable, a filestash sub domain will be automatically assigned to your instance (eg: user-foo.filestash.app). We can change this domain to whatever you want (eg: stallman.filestash.app) but considering the extra cost associated with that feature (our server aren't free) we will only do it for the people supporting the project.

## Once you are up and running

1. For a production instance, it is advised to fill the `host` value under `configure->general` with your domain name.

2. You can enable the full text search via the admin console. This feature is disabled by default for 2 reasons:
    - associated cost when you use a vendor like [S3]({% post_url 2019-11-21-s3-browser %}) that charges both for the bandwith and API calls. In your settings you can change the reindex time to a higher value to minimise cost at the expense of having some stale data in your index.
    - a privacy concern as creating a searchable index will result in your instance crawling through your content and persist some data locally for the purpose of answering those search queries

## Upgrade

Upgrade is straightforward:

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

*Warning*: to date, docker is the only officially supported installation method that's available free of charge. The reason is creating and maintaining hundreds of guides for every possible linux distribution isn't trivial with linux packaging alone beeing a massive rabbit hole that can only be illustrated by [this XKCD](https://xkcd.com/927/){:rel="nofollow"}. If you need to have Filestash working in a production setting without docker, contact us and we'll make it work as part of a support contract

In the meantime, community supported guides are also available:
- SRugina: [ubuntu instructions + script](https://github.com/mickael-kerjean/filestash/pull/136)
- *add your own with a PR*

If you want to install Filestash on your own with a more custom build approach, the reference is the [Dockerfile](https://github.com/mickael-kerjean/filestash/blob/master/docker/Dockerfile){:rel="nofollow"}. This recipe is just 1 example of a custom compilation that emphasis on speed, efficiency and features at the cost of installation size. You could shrink down the required space by 90% by disabling features such as image transcoding (getting rid of libvips and libraw), org-mode export (getting rid of emacs and our latex distribution) and other tools (such as pdftotext, ...)

Docker Compose will run Filestash as well as the OnlyOffice integration. Since the OnlyOffice Image needs at least 4GB RAM (as per https://hub.docker.com/r/onlyoffice/documentserver#recommended-system-requirements), you may want to run Filestash without Docker Compose. The easiest way to run Filestash without Docker Compose is to use the following steps:
<div class="terminal">
<span class="prompt">~/$ </span>mkdir -p /srv/filestash/config<br>
<span class="prompt">~/$ </span>touch /srv/filestash/config/config.json<br>
<span class="prompt">~/$ </span>chmod 0777 /srv/filestash/config/config.json<br>
<span class="prompt">~/$ </span>docker run -d -p 8443:8443 -v /srv/filestash/config/config.json:/app/data/state/config/config.json -e APPLICATION_URL=example.com machines/filestash
</div>

## Optional: Using a reverse proxy

Using a reverse proxy isn't mandatory but is quite usefull when you have multiple things installed on your server and can't dedicate the port 80 and 443 to 1 application.

A sample configuration for nginx:
```
# change the env variable to what you want to use
export FILESTASH_DOMAIN=demo.filestash.app
openssl dhparam -out /etc/letsencrypt/live/$FILESTASH_DOMAIN/dh2048.pem -outform PEM -2 2048

cat > /etc/nginx/sites-available/filestash.conf <<EOF
server {
    listen         80;
    server_name    $FILESTASH_DOMAIN;
    return         301 https://\$server_name\$request_uri;
}
server {
    listen 443 ssl;
    server_name $FILESTASH_DOMAIN;
    expires \$expires;

    ssl on;
    ssl_certificate /etc/letsencrypt/live/$FILESTASH_DOMAIN/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/$FILESTASH_DOMAIN/privkey.pem;
    ssl_dhparam /etc/letsencrypt/live/$FILESTASH_DOMAIN/dh2048.pem;
    ssl_protocols TLSv1.1 TLSv1.2;
    ssl_ciphers 'ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA:ECDHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES256-SHA:ECDHE-ECDSA-DES-CBC3-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:DES-CBC3-SHA:!DSS';
    ssl_ecdh_curve secp384r1;

    location / {
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";

        proxy_set_header     Host \$host:\$server_port;
        proxy_set_header     X-Real-IP \$remote_addr;
        proxy_set_header     X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header     X-Forwarded-Proto \$scheme;
        proxy_set_header     Origin '';

        add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;

        proxy_pass           http://127.0.0.1:8334;
        proxy_read_timeout   86400;
    }
}
EOF

ln -s /etc/nginx/sites-available/filestash.conf /etc/nginx/sites-enabled/filestash.conf
nginx -t && service nginx restart
```

**Note**: Resist the temptation of using gzip and other caching mechanism at the reverse proxy level, you would waste valuable CPU cycles adding latency and increasing the bandwith usage, creating issues with cache invalidation. Filestash is already doing its best at compile time optimising at a level no reverse proxy could ever do with a few lines of configuration and no deep knowledge of the underlying service.
