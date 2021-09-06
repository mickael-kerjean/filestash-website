---
title: Backup your photos on your Android phone
description: The selfhosted way to backup your photos and videos from your Android phone with termux, rsync and crontab
layout: post
tags: guide
language: en
---

I will assume the following:
1. you already have [termux](https://play.google.com/store/apps/details?id=com.termux&hl=en_AU&gl=US) installed on your Android phone. 
2. you have SSH access to a linux server

To backup your photos, we will go through those steps:
1. [Install dependencies](#install-dependencies)
2. [Prepare the environment](#prepare-the-environment)
3. [Setup the sync program](#sync-setup)

## Install dependencies

In this first part, we will install the program we will need, namely [cron](https://linux.die.net/man/1/crontab) which is used to automate tasks that will execute at a certain time and [rsync](https://linux.die.net/man/1/rsync) which is the sync program. To do this, open up Termux and type the following commands:
<div class="terminal">
<span class="prompt">~/$ </span>pkg install cronie rysnc<br>
<span class="stdout">
Checking availability of current mirror: ok<br/>
Reading package lists... Done<br/>
Building dependency tree... Done<br/>
The following additional packages will be installed:<br/>
&nbsp;&nbsp;krb5 ldns libdb libedit liblz4 libpopt openssh<br/>
&nbsp;&nbsp;openssl openssl-tool termux-auth zstd<br/>
Suggested packages:                                       termux-services<br/>
The following NEW packages will be installed:             cronie krb5 ldns libdb libedit liblz4 libpopt<br/>
&nbsp;&nbsp;openssh openssl-tool rsync termux-auth zstd           The following packages will be upgraded:<br/>
&nbsp;&nbsp;openssl                                               1 upgraded, 12 newly installed, 0 to remove and 41 not upgraded.<br/>
Need to get 4628 kB of archives.<br/>
After this operation, 18.0 MB of additional disk space will be used.<br/>
Do you want to continue? [Y/n]</span>&nbsp;y<br/>
<span class="stdout">
Get:1 https://termux.mentality.rip/termux-packages-24 stable/main aarch64 openssl aarch64 1.1.1l [1150 kB]<br/>
Get:2 https://termux.mentality.rip/termux-packages-24 stable/main aarch64 cronie aarch64 1.5.7 [49.3 kB]<br/>
Get:3 https://termux.mentality.rip/termux-packages-24 stable/main aarch64 libdb aarch64 18.1.40-2 [471 kB]<br/>
...<br/>
..<br/>
</span>
</div>

## Prepare the environment

In this stage, we will need to look after 2 things:

1. termux needs to have access to your pictures which it doesn't have by default. To change this:
```
settings -> apps -> permission -> permission -> storage -> termux -> allow
```

2. setup the mechanism known as RSA authentication that will allow the sync program to securely transfer photos onto your server without you having to type your password:

<div class="terminal">
<span class="prompt">~/$ </span>ssh-keygen -t rsa<br>
<span class="stdout">
Generating public/private rsa key pair.<br/>
Enter file in which to save the key (/data/data/com.termux/files/home/.ssh/id_rsa):<br/>
Enter passphrase (empty for no passphrase):<br/>
Enter same passphrase again:<br/>
Your identification has been saved in /data/data/com.termux/files/home/.ssh/id_rsa<br/>
Your public key has been saved in /data/data/com.termux/files/home/.ssh/id_rsa.pub<br/>
The key fingerprint is:<br/>
SHA256:plowPA4fLXd7QVQFsEjNwzR3bHa3gsGrqpL0nn+dueN u0_a292@localhost<br/>
The key's randomart image is:<br/>
+---[RSA&nbsp;3072]----+<br/>
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.oo.++.|<br/>
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.&nbsp;.o.o.=|<br/>
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;o...=&nbsp;.o|<br/>
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;o&nbsp;*&nbsp;+&nbsp;*..|<br/>
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SX&nbsp;.&nbsp;.&nbsp;o.|<br/>
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;..+&nbsp;O&nbsp;&nbsp;&nbsp;=..|<br/>
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.+&nbsp;&nbsp;&nbsp;=&nbsp;S&nbsp;&nbsp;+|<br/>
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;..&nbsp;=&nbsp;.&nbsp;.&nbsp;=..|<br/>
|&nbsp;&nbsp;&nbsp;&nbsp;.=&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=.Z=..|<br/>
+----[SHA256]-----+<br/>
</span>
<span class="prompt">~/$ </span>ssh-copy-id username@example.com<br>
<span class="stdout">
/data/data/com.termux/files/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/data/data/com.termux/files/home/.ssh/id_rsa.pub"<br/>
The authenticity of host 'rick.kerjean.me (116.203.202.210)' can't be established.<br/>
ED25519 key fingerprint is SHA256:LVtQRuU18v7sFCc5P365iUt1U+YApmt9r+eeKx9cYgA.</br>
This key is not known by any other names<br/>
Are you sure you want to continue connecting (yes/no/[fingerprint])?</span> yes <br/>
<span class="stdout">
/data/data/com.termux/files/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed<br/>
/data/data/com.termux/files/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys<br/>
root@rick.kerjean.me's password:<br/>
<br/>
Number of key(s) added: 1<br/>
<br/>
Now try logging into the machine, with:   "ssh 'username@example.com"<br/>
and check to make sure that only the key(s) you wanted were added.<br/>
</span>
</div>

## Sync setup

Finally, let's setup the cron:
<div class="terminal">
<span class="prompt">~/$ </span><span class="stdout"># run the cron daemon<br></span>
<span class="prompt">~/$ </span>crond<br>
<span class="prompt">~/$ </span><span class="stdout"># actual setup of the cron<br></span>
<span class="prompt">~/$ </span>crontab -l<br>
0 * * * * rsync -avz /storage/emulated/0/DCIM/ username@example.com:~/incoming/<br/>
<span class="stdout"></span>
</div>

The way I have it setup, the sync is running every hour but if that's not what you want, you can use this [cron calculator](https://crontab.guru/#0_*_*_*_*) to find the right syntax for the timing you want to use

<div style="text-align:center;margin:50px 0">
    <img class="fancy" src="https://lh3.googleusercontent.com/proxy/EXKS761ReSgkBHI0Bo5M7e93WbS2oUOfm345So3Br4KAn8cG9kfQXkcO-PCsJARml2G70los0lOVnxF1vRb25I2-GcFDcfjqtqx8RrGe-jW1idUYUhm1u8kJ-qRnD4UDyplvMqN_-hUfq2XtVadVoPn3ObVTUqUPiKY" />
</div>
