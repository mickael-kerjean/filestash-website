---
title: SFTP As a service
description: The latest techs for fully managed SFTP services running in the cloud
layout: post
permalink: /sftp-as-a-service.html
language: en
---

SFTP might not be the new shiny technology but it's awesome, rock solid and has prooven itself to be a battle tested solution you can rely on. In this post we're exploring how to do SFTP as a service both from [a server](#sftp-server-as-a-service) and [client](#sftp-client) point of view.

## SFTP client

The SFTP client category is split in 3 categories, CLI clients, desktop clients and web clients. As a CLI application, the builtin `sftp` tool is awesome and is likely already installed on your machine:
```
$ sftp username@example.com
Connected to example.com
sftp> ls -lah /home/
drwxr-xr-x    ? 0        0            4.0K Jun 19 02:46 /home/.
drwxr-xr-x    ? 0        0            4.0K Jun  5 18:10 /home/..
drwxr-xr-x    ? 1001     1001         4.0K Jun 24 02:23 /home/foo
drwxr-xr-x    ? 1001     1001         4.0K Jun 24 02:23 /home/bar
```

When it comes to desktop client, you're probably already familiar with [Filezilla](https://filezilla-project.org/) which is probably the most popular choice. If you're a window user, honorable mention to [WinSCP](https://winscp.net/eng/index.php) and you can find some other serious contender like [Cyberduck](https://cyberduck.io/) which we like a lot:

![https://cdn.cyberduck.io/img/mac/browser.png](https://cdn.cyberduck.io/img/mac/browser.png)


If you're after a web application, [Filestash]({% post_url 2020-04-30-sftp-browser %}) is a simple as it gets for your users:

![](https://qph.fs.quoracdn.net/main-qimg-b1263917f542141ff92c0b88b025368c)


## SFTP Server as a service

Depending on your use case and application, we've gathered a few good options:

1. [openssh](#openssh)

2. [rsync.net](#rsyncnet)

3. [Couchdrop](#couchdrop)

4. [Amazon](#amazon)

### OpenSSH

OpenSSH is by far the most popular and widely available implementation of SFTP. As far as SFTP as a service is concerned, you can get started in under 2 minutes by creating a VM from your favorite cloud vendor:

![hetzner dashboard screenshot](/img/posts/2020-06-29-sftp-as-a-service-openssh.png)

pro:
- widely available
- widely used
- integration with PAM

cons:
- limited scope and functionality compared to other servers like proFTPd
- you need to handle things like backup and ugprades

### Rsync.net

The guys from [rsync](https://www.rsync.net/), have built their own cloud to provide standard unix tool a home so that you don't have to handle anything maintenance related on your own but leverage the experience of a team of professional

pro:
- as standard as it gets
- professionally hosted

cons:
- still searching

### Amazon

Amazon now has an [SFTP bridge](https://aws.amazon.com/aws-transfer-family/?whats-new-cards.sort-by=item.additionalFields.postDateTime&whats-new-cards.sort-order=desc) to their popular S3 service.

![amazon cloud](https://d1.awsstatic.com/product-marketing/AWS%20Transfer%20Family/How-it-works-diagram-Transfer-family.9253476414113931316355159133dd1657ab5128.jpg)

pro:
- supported by Amazon

cons:
- the feature isn't builtin with S3, you need to pay extra to use it.
- the implementation doesn't comply with the entire spec. Some client will have issues with it
- closed source making fixing the bugs in their implementation impossible.


### CouchDrop

When you're not starting from scratch and have data living in different place, couchdrop provide an SFTP layer on top of many external cloud providers like Dropbox, Google Drive, Box, Backblaze, S3, and many others

![https://couchdrop.io/content/images/CD_VFS.PNG](https://couchdrop.io/content/images/CD_VFS.PNG)


<div class="related">
    <div class="title">
        Related Pages <br>
        <img src="https://mickael.kerjean.me/assets/img/arrow_bottom.png"/>
    </div>
    <div class="related_content">
        <a href="{% post_url 2020-04-30-sftp-browser %}"><h3 class="no-anchor">SFTP Browser</h3></a><a href="{% post_url 2019-11-26-ftp-web-client %}"><h3 class="no-anchor">FTP Client</h3></a><a href="{% post_url 2020-07-01-sftp-example %}"><h3 class="no-anchor">SFTP Examples</h3></a>
    </div>
</div>

<style>
.related{ text-align:center;margin-top:50px;}
.related .title{
    font-size: 1.5em;
    margin-top: 30px;
}
.related .title img{
    animation: bounce 1s infinite alternate;
    width: 16px;
    height: 17px;
}
.related .related_content { margin-top:5px; }
.related .related_content h3 {
    background: var(--bg-color);
    padding: 50px 0;
    border-radius: 5px;
    margin: 0!important;
}
.related .related_content a{
    display: inline-block;
    width: 33%;
    padding: 5px;
    text-decoration: none!important;
}
.related .related_content a:hover{
    transform: scale(1.1);
    transition: ease 0.3s transform;
}
.related .related_content a:hover h3{
    background: var(--emphasis-primary);
    transition: ease 0.3s background;
}

@media only screen and (max-width: 550px) {
    .related .related_content a{ width: 100%; }
}
@keyframes bounce {
    from {
        transform: translate3d(0,0,0);
    }
    to {
        transform: translate3d(0,-8px,0);
    }
}
</style>
