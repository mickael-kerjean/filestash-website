---
layout: documentation
title: Faq
order: 7
---

## My server provider only support PHP based applications, is that ok?

No. Plus, if you run one of those archaic things, it's time for you to upgrade to an actual server.

## What happens to my credentials?

Credentials are stored in your browser via cookies that are protected by 2 mechanisms:
- cookies are [http only](https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies)
- the data within your cookie is both encrypted and authenticated using state of the art cryptographic algorithms

Unless you use the share feature for which Filestash is forced to persist an encrypted version of your credentials, nothing is kept server side.

## Why don't you support a proper installer on my Windows, OSX and all the Linux distribution like ubuntu, debian, centos, rhel, fedora, arch, ... ?

There's support for many linux distribution but those installers are only provided to my patreons and enterprise users. For everyone else, you can use docker to install Filestash or submit pull request if you're willing to support those as part of the open source offering.

## I can't see much tests in the repo, are you guys cowboys?

We do have an extensive suite of tests but we don't publish them under an open source license.

## Why did filestash got developed?

Filestash [original author](https://mickael-kerjean.me) couldn't find an open source file sharing service he was happy with, something that:
1. Only focus on solving the problem "Managing your data in a cloud you control" and do it well
2. Doesn't try to own your data making it hard to move away
3. Doesn't reinvent the wheel but leverage the state of technology we've seen in the past 20 years (eg: FTP servers, Authentication via PAM, access levels of a linux server, ...)
4. Has a user interface that's not a second class citizen compared to Dropbox or Google Drive
5. Is submillisecond fast and open source
