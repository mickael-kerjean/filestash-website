---
layout: documentation
title: Faq
order: 7
---

## Can I use the local filesystem?

Yes. The trick is to leverage the builtin SFTP server that comes with the SSH package. In other words, if you use SSH to connect to your machine, accessing the local filesystem can be done using SFTP where your username is your machine username and password is your password.

## Can I disable the admin console?

Yes but you'd need to do it at the reverse proxy level. All the urls from the admin console use the suffix `/admin`. If you're using nginx as a reverse proxy it will look like this:
```
server {
    ...
    location ~ ^/admin {
        allow 127.0.0.1;
        deny all;
    }
    ...
}
```

## I want to use S3. How do you create an AWS access Key ID and AWS Secret Access key?

We wrote a post about this, [check it out](({% post_url 2019-11-21-s3-browser %}))

## My server provider only support PHP based applications, is that ok?

No. Plus, if you run one of those archaic things, it's time for you to upgrade to an actual server.

## What happens to my credentials?

Credentials are stored in your browser via cookies that are protected by a few mechanisms:
- cookies are [http only](https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies){:rel="nofollow"}
- the data within your cookie is both encrypted and authenticated using state of the art cryptographic algorithms
- various mechanism leveraging HTTP headers (HSTS, CSP, SameSite Cookie, X-XSS-Protection, X-Frame-Options, X-Content-Type-Options and X-Requested-With) to protect against an attacker trying to trick your browser into doing something nefarious
- various other technics that are left to the reader to dig through the code

Nothing is kept server side unless you use the share feature. In this scenario, Filestash persist an encrypted version of your credentials.

## Why don't you support a proper installer on my Windows, OSX and all the Linux distribution like ubuntu, debian, centos, rhel, fedora, arch, ... ?

There's support for many linux distribution but those installers are only provided to my patreons and enterprise users. For everyone else, you can use docker to install Filestash or submit pull request if you're willing to support those as part of the open source offering.

## The code doesn't have tests ?!? Are you guys cowboys?

We do have an extensive suite of tests but those haven't been open source. We wrote on the why [here](https://github.com/mickael-kerjean/filestash/blob/master/CONTRIBUTING.md#tests){:rel="nofollow"}

## Why did filestash got developed?

Filestash [original author](https://mickael-kerjean.me) couldn't find an open source file sharing service he was happy with, something that:
1. Only focus on solving the problem "Managing your data in a cloud you control" and do it well
2. Doesn't try to own your data making it hard to move away
3. Doesn't reinvent the wheel but leverage the state of technology we've seen in the past 20 years (eg: FTP servers, Authentication via PAM, access levels of a linux server, ...)
4. Has a user interface that's not a second class citizen compared to Dropbox or Google Drive
5. Is submillisecond fast
6. Is open source
