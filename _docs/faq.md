---
layout: documentation
title: Faq
order: 7
language: en
---

## Can I use the local filesystem?

Yes. The trick is to leverage the built-in SFTP server which comes with the SSH package. In other words, if you use SSH to connect to your machine, accessing the local filesystem can be done using SFTP where your username is your machine username and password is your password. We wrote about this in details in [this post]({% post_url 2020-10-20-how-to-access-filesystem-using-filestash %})

## Can I disable the admin console?

Yes but you'd need to do it at the reverse proxy level. All the URLs from the admin console use the suffix `/admin`. If you're using Nginx as a reverse proxy it will look like this:
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

We wrote a post about this, [check it out]({% post_url 2019-11-21-s3-browser %})

## My server provider only supports PHP based applications, is that ok?

No. Plus, if you run one of those archaic things, it's time for you to upgrade to an actual server.

## What happens to my credentials?

Credentials are stored in your browser via cookies that are protected by a few mechanisms:
- cookies are [http only](https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies){:rel="nofollow"}
- the data within your cookie is both encrypted and authenticated using state of the art cryptographic algorithms
- various mechanism leveraging HTTP headers (HSTS, CSP, SameSite Cookie, X-XSS-Protection, X-Frame-Options, X-Content-Type-Options and X-Requested-With) to protect against an attacker trying to trick your browser into doing something nefarious
- various other techniques which are left for the reader to discover by digging through the code

Nothing is kept server-side unless you use the share feature. In this scenario, Filestash keeps a persistent, encrypted version of your credentials.

## Why don't you support a proper installer on Windows, OSX and Linux distribution like Ubuntu, Debian, CentOS, RHEL, Fedora, Arch Linux, etc.?

There is support for many Linux distributions but those installers are only provided to my patreons and enterprise users. Everyone else can use Docker to install Filestash or submit pull requests if they are willing to support them as part of the open source offer.

## The code doesn't have tests?! Are you guys cowboys?

We do have an extensive suite of tests but they haven't been open sourced. We discussed the reasons why it is the case [there](https://github.com/mickael-kerjean/filestash/blob/master/CONTRIBUTING.md#tests){:rel="nofollow"}

## Why was Filestash developed?

Filestash's [original author](https://mickael.kerjean.me) couldn't find an open source file-sharing service he was happy with. He was looking for something which would:
1. Only focus on solving the problem of managing personal data in a cloud controlled by the user and doing it well
2. Not try to lock one's data in and make it hard to move away from the service
3. Not try to reinvent the wheel but, rather, leverage the state of technology of the past 20 years (eg: FTP servers, authentication via PAM, access levels of a Linux server, etc.)
4. Have a user interface which wouldn't be a second-class citizen compared to Dropbox or Google Drive
5. Be submillisecond fast
6. Be open source
