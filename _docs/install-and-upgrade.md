---
layout: documentation
title: Install and upgrade
order: 2
---

{% include toc.md %}

## Requirement

The official installation guide requires a Linux server with the following tools installed:
- [docker](https://docs.docker.com/install/)
- [docker-compose](https://docs.docker.com/compose/install/)
- curl (very likely already installed in your linux distribution)

## Installation
The installation can be done in 3 bash commands:
<div class="terminal">
<span class="prompt">~/$</span> mkdir filestash && cd filestash <br>
<span class="prompt">~/filestash$</span> curl -O https://downloads.filestash.app/latest/docker-compose.yml <br>
<span>
% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current<br>
                                 Dload  Upload   Total   Spent    Left  Speed<br>
100   322  100   322    0     0     98      0  0:00:03  0:00:03 --:--:--    98<br>
</span>
<span class="prompt">~/filestash$</span> docker-compose up -d <br>
<span>
Creating filestash_app ... <br>
Creating filestash_app ... done
</span>
</div>

*Note*: Official Docker images are made available on [DockerHub](https://hub.docker.com/r/machines/filestash/).

Once the installation has complete, open up a browser and navigate to: `http://your_ip:8334`, you will be greet with:

<img src="https://raw.githubusercontent.com/mickael-kerjean/filestash_images/master/screenshots/setup.png" alt="setup screenshot" height="320"/>

Follow the wizard and you should be up and running in less than a minute.

## Once you are up and running

1. For a production instance, it is advised to fill the `host` value under `configure->general` with your domain name.

2. You can enable the full text search via the admin console. This feature is disabled by default for 2 reasons:
    - a privacy concern as creating a searchable index will result in Filestash to crawl through your content and persist some data for the only purpose of answering search queries
    - associated cost when you use a vendor like S3 that charges both for the bandwith and API calls. In your settings you can change the reindex time to a higher value to minimise cost at the expense of having some stale data in your index.

## Upgrade

Upgrade is straightforward:

<div class="terminal">
<span class="prompt">~/filestash$</span> curl -O http://filestash.app/downloads/docker-compose.yml <br>
<span>
% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current<br>
                                 Dload  Upload   Total   Spent    Left  Speed<br>
100   322  100   322    0     0     98      0  0:00:03  0:00:03 --:--:--    98<br>
</span>
<span class="prompt">~/filestash$</span> docker-compose pull <br>
<span>
Pulling app (machines/filestash:latest)... <br>
latest: Pulling from machines/filestash <br>
Digest: sha256:4da068a5868d736f6382618e6f8baa6cf44c1cf0f94a3ded05aa25b00a41f425 <br>
Status: Image is up to date for machines/filestash:latest <br>
</span>
<span class="prompt">~/filestash$</span> docker-compose up -d <br>
<span>
Recreating filestash_app ... <br>
Recreating filestash_app ... done
</span>
</div>

## Alternative installation methods

*Warning*: to date, docker is the only officially supported installation method that's available free of charge. The reason is creating and maintaining hundreds of guides for every possible linux distribution isn't trivial with linux packaging alone beeing a massive rabbit hole that can only be illustrated by [this XKCD](https://xkcd.com/927/). If you need to have Filestash working in a production setting without docker, contact us and we'll make it work as part of a support contract

In the meantime, community supported guides are also available:
- SRugina: [ubuntu instructions + script](https://github.com/mickael-kerjean/filestash/pull/136)
- *add you own with a PR*

If you want to install Filestash on your own with a more custom build approach, the installation recipe reference is the [Dockerfile](https://github.com/mickael-kerjean/filestash/blob/master/docker/prod/Dockerfile). This recipe is just 1 example of a custom compilation that emphasis on speed, efficiency and features at the cost of installation size. You could shrink down the required space by more than 95% by:
1. removing everything that's under the "Dependencies" section:
   - which is about compiling a few low level C libraries (libvips and libraw) that is used by the image_light plugin to transcode image from various format and resize them for a better experience from a browser
   - if you do remove libvips and libraw, it is recommended to compile the alternate image_heavy plugin instead that trade transcoding speed and support for various less common graphic format for a more cross platform appraoch that don't assume anything is installed in your system and a much smaller footprint when it comes to install size

2. removing everything that's under the "External dependencies" section, with more notably:
   - texlive and emacs: used by the org-mode client to perform the export to several format. If you don't plan on using org-mode, this alone will save a massive amount of space
   - poppler-utils: used as part of the full text search indexation logic for text extraction of PDF documents

## Optional: Using a reverse proxy

Using a reverse proxy isn't mandatory but is quite usefull when you have multiple things installed on your server and can't dedicate the port 80 and 443 to 1 application.

A sample configuration for nginx:
```
# change the env variable to what you want to use
export FILESTASH_DOMAIN=demo.filestash.app

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
    location / {
        proxy_set_header     Host \$host:\$server_port;
        proxy_set_header     X-Real-IP \$remote_addr;
        proxy_set_header     X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header     X-Forwarded-Proto \$scheme;
        proxy_pass           http://127.0.0.1:8334;
        proxy_read_timeout   86400;
        client_max_body_size 50G;
    }
}
EOF
cat /tmp/filestash.conf
ln -s /etc/nginx/sites-available/filestash.conf /etc/nginx/sites-enabled/filestash.conf
nginx -t && service nginx restart
```

*Note*: Resist the temptation of using gzip and other caching mechanism at the reverse proxy level. All those technics are already implemented within the filestash server to both minimise resource consumptions on the server and to perform as fast as possible for the client whilst handling all the cache invalidation logic.