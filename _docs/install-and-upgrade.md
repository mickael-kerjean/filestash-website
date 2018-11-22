---
layout: documentation
title: Install and upgrade
order: 2
---

{% include toc.md %}

## Requirement

To install Filestash, you either need:
1. A web server running Linux (preferred) with 2 tools: `docker` and `docker-compose`
2. A phone running Android with `Termux` installed either from the [Playstore](https://play.google.com/store/apps/details?id=com.termux) or [Fdroid](https://f-droid.org/packages/com.termux/)



## Installation on Linux

Using Docker and docker-compose:
```
mkdir filestash && cd filestash
curl -O https://downloads.filestash.app/latest/docker-compose.yml
docker-compose up -d
```

Official Docker images are made available on [DockerHub](https://hub.docker.com/r/machines/filestash/).

## Upgrade on Linux

Using Docker and docker-compose:
```
cd filestash
curl -O http://filestash.app/downloads/docker-compose.yml
docker-compose pull
docker-compose up -d
```

## Installation on Android

Installation on Android will be supported once we have a solution to [this opened issue](https://github.com/mickael-kerjean/filestash/issues/104)

## What now?

You now have the basic application running. You can customise a lot of stuff in Filestash so be sure to keep reading the next chapter about [configuration](/docs/configuration).
