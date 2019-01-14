---
layout: documentation
title: Install and upgrade
order: 2
---

{% include toc.md %}

## Requirement

To install Filestash, you need a Linux server with the following tools installed:
- [docker](https://docs.docker.com/install/)
- [docker-compose](https://docs.docker.com/compose/install/)
- curl (preinstalled in your linux distribution 9 times out of 10)

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
