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

Community supported guides are also available:
- SRugina: [ubuntu instructions + script](https://github.com/mickael-kerjean/filestash/pull/136)

## Installation
The installation can be done in 3 bash commands:
<div class="terminal">
<span class="prompt">/tmp$</span> mkdir filestash && cd filestash <br>
<span class="prompt">/tmp/filestash$</span> curl -O https://downloads.filestash.app/latest/docker-compose.yml <br>
<span>
% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current<br>
                                 Dload  Upload   Total   Spent    Left  Speed<br>
100   322  100   322    0     0     98      0  0:00:03  0:00:03 --:--:--    98<br>
</span>
<span class="prompt">/app/filestash$</span> docker-compose up -d <br>
<span>
Creating filestash_app ... <br>
Creating filestash_app ... done
</span>
</div>

*Note*: Official Docker images are made available on [DockerHub](https://hub.docker.com/r/machines/filestash/).

Once the installation has complete, open up a browser and navigate to: `http://your_ip:8334`, you will be greet with:

<img src="https://raw.githubusercontent.com/mickael-kerjean/filestash_images/master/screenshots/setup.png" alt="setup screenshot" height="320"/>

Follow the wizard and you should be up and running in less than a minute

## Using a reverse proxy

Using a reverse proxy isn't mandatory but is quite usefull when you have multiple things installed on your server and can't dedicate the port 80 and 443 to 1 application. Using nginx, the configuration looks like:
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

*Note*: Resist the temptation of using gzip and other caching mechanism at the reverse proxy level. All those technics are implemented extremely efficiently by the filestash server to minimise resource consumptions whilst being as fast as possible for the browser to load.

## Upgrade

<div class="terminal">
<span class="prompt">/tmp/filestash$</span> curl -O http://filestash.app/downloads/docker-compose.yml <br>
<span>
% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current<br>
                                 Dload  Upload   Total   Spent    Left  Speed<br>
100   322  100   322    0     0     98      0  0:00:03  0:00:03 --:--:--    98<br>
</span>
<span class="prompt">/app/filestash$</span> docker-compose pull <br>
<span>
Pulling app (machines/filestash:latest)... <br>
latest: Pulling from machines/filestash <br>
Digest: sha256:4da068a5868d736f6382618e6f8baa6cf44c1cf0f94a3ded05aa25b00a41f425 <br>
Status: Image is up to date for machines/filestash:latest <br>
</span>
<span class="prompt">/app/filestash$</span> docker-compose up -d <br>
<span>
Recreating filestash_app ... <br>
Recreating filestash_app ... done
</span>
</div>
