---
layout: documentation
title: Faq
order: 7
---

## My server provider only support PHP based applications, is that ok?

No. Plus, if you run one of those archaic things, it's time for you to upgrade to an actual server.

## What happens to my credentials?

Credentials are stored client's side using a http only cookie that's encrypted and authenticated. Unless you use the share feature for which Filestash is forced to store an encrypted version of your credentials, nothing is kept server side.

## Why don't you support ubuntu, debian, centos, rhel, fedora, arch, ... ?

There's support for many linux distribution but those installers are only provided to my patreons and enterprise users. For everyone else, you can use docker to install Filestash or submit pull request if you're willing to support those.

## Why did filestash got developed?

Filestash [original author](https://mickael-kerjean.me) couldn't find an open source file sharing service he was happy with, something that:
1. Only focus on solving the problem "Managing your data in a cloud you control" and do it well
2. Doesn't try to own your data but let you sit on the shoulders of giant (eg: many FTP and SFTP servers that have been battles tested for decades, PAM for authentication, the access right of a linux server)
3. has a user interface that doesn't feel like a second class citizen compared to Dropbox or Google Drive
4. is fast and not bloated whilst being open source
