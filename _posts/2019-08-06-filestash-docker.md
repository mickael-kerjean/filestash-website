---
layout: post
title: Install Filestash using Docker
description: Install Filestash using Docker - Knowledge base
---

Filestash can easily be installed using Docker, the official image beeing available from [the hub](https://hub.docker.com/r/machines/filestash/tags). If you want to know the Nitty-gritty of how to install and maintain Filestash with docker, the [documentation](https://www.filestash.app/docs/install-and-upgrade/) is where you want to go.

The docker image is kept maintained as part of our build for every commit once the project is build and successfully tested against our testing suite:

![screenshot CI](/img/posts/2019-08-06-filestash-docker.md.1.png)

. Also, at this stage of the project, we haven't open source installers for every possible Linux platform: debian, centos, rhel, arch, ubuntu, fedora, ... Don't worry though, there's [options](https://www.filestash.app/docs/install-and-upgrade/#alternative-installation-methods) to get it to work
