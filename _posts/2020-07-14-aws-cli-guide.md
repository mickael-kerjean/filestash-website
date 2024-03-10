---
title: A cheat sheet for the AWS S3 CLI
description: Find your way on the AWS S3 CLI - list files with ls, removal with rm, copy, download, move ...
layout: post
permalink: /aws-s3-cli.html
tags: s3 guide
language: en
---

The [AWS command line interface](https://docs.aws.amazon.com/cli/latest/reference/s3/) is the goto tools from which you can perform pretty much any operation that relates to AWS. This post only cover the most common operations:
- [list files / buckets](#list-files-and-buckets)
- [create and sync files in a bucket](#manage-data-on-s3)
- [delete / move and copy files](#manage-data-on-s3)

If that's not already the case, you first need to [install and configure the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).

## List Files and buckets with 'aws s3 ls'

**list buckets**:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 ls<br>
<span class="stdout">
2018-07-18 23:27:57 kerjean<br>
2018-05-14 17:46:08 orgmode-emacs<br>
2018-11-15 13:10:20 testgithubissue<br>
</span>
</div>

**list files in a bucket**:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 ls kerjean/<br>
<span class="stdout">
                           PRE test/<br>
2019-02-26 20:57:12          7 encrypted.txt<br>
2020-05-17 02:20:18        557 releasenote.org<br>
2018-08-01 19:43:01         15 test2.txt<br>
</span>
</div>

**list files under a key**:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 ls kerjean/test/<br>
<span class="stdout">
2020-02-05 01:50:22          0 <br>
2020-05-27 22:06:08         79 mytextfile.txt<br>
2020-02-05 01:50:32          7 test.txt<br>
</span>
</div>


**list files in a bucket in a recursive manner**:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 ls --recursive kerjean/<br>
<span class="stdout">
2019-02-26 20:57:12          7 encrypted.txt<br>
2020-05-17 02:20:18        557 releasenote.org<br>
2020-02-05 01:50:22          0 test/<br>
2020-05-27 22:06:08         79 test/mytextfile.txt<br>
2020-02-05 01:50:32          7 test/test.txt<br>
2018-08-01 19:43:01         15 test2.txt<br>
</span>
</div>

## Manage data on S3 via the CLI

**create a bucket**:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 mb s3://testing-tutorial<br>
<span class="stdout">
make_bucket: testing-tutorial<br>
</span>
</div>

**upload a folder**:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 sync local s3://testing-tutorial/local/<br>
<span class="stdout">
upload: local/bar.txt to s3://testing-tutorial/local/bar.txt<br>
upload: local/foo.txt to s3://testing-tutorial/local/foo.txt<br>
</span>
<span class="prompt">~/$ </span>echo "lorem ipsum" > local/foo.txt<br>
<span class="prompt">~/$ </span>aws s3 sync local s3://testing-tutorial/local/<br>
<span class="stdout">
upload: local/foo.txt to s3://testing-tutorial/local/foo.txt<br>
</span>
</div>

**upload a file**:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 cp local/foo.txt s3://testing-tutorial/local/foobar.txt<br>
<span class="stdout">
upload: local/foo.txt to s3://testing-tutorial/local/foobar.txt
</span>
</div>

**rename a file**:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 mv s3://testing-tutorial/local/foobar.txt s3://testing-tutorial/local/foo/foo.txt<br>
<span class="stdout">
move: s3://testing-tutorial/local/foobar.txt to s3://testing-tutorial/local/foo/foo.txt
</span>
</div>

**download a file**:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 mv s3://testing-tutorial/local/foo.txt new.txt<br>
<span class="stdout">
move: s3://testing-tutorial/local/foo.txt to ./new.txt
</span>
</div>

**download a folder**:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 sync s3://testing-tutorial/local/ local<br>
<span class="stdout">
download: s3://testing-tutorial/local/foo/foo.txt to local/foo/foo.txt
</span>
</div>

**remove a file**:
<div class="terminal" style="margin-bottom:10px">
<span class="prompt">~/$ </span>aws s3 rm s3://testing-tutorial/local/foo.txt<br>
<span class="stdout">
delete: s3://testing-tutorial/foo.txt
</span>
</div>

**remove a folder**:
<div class="terminal" style="margin-bottom:10px">
<span class="prompt">~/$ </span>aws s3 rm --recursive s3://testing-tutorial/local/<br>
<span class="stdout">
delete: s3://testing-tutorial/local/bar.txt<br>
delete: s3://testing-tutorial/local/foo/foo.txt<br>
</span>
</div>

**remove an entire bucket with its content**:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 rb --force s3://testing-tutorial<br>
<span class="stdout">
remove_bucket: testing-tutorial
</span>
</div>


<script type="application/ld+json">
 {

     "@context": "https://schema.org",
     "@type": "FAQPage",
     "mainEntity": [
         {
             "@type": "Question",
             "name": "The AWS CLI command to list S3 buckets?",
             "acceptedAnswer": {
                 "@type": "Answer",
                 "text": "aws s3 ls"
             }
         },
         {
             "@type": "Question",
             "name": "How to list things on S3?",
             "acceptedAnswer": {
                 "@type": "Answer",
                 "text": "aws s3 ls --recursive /optional_bucketname/"
             }
         },
         {
             "@type": "Question",
             "name": "How to create a bucket on S3?",
             "acceptedAnswer": {
                 "@type": "Answer",
                 "text": "aws s3 mb s3://new-bucket42"
             }
         },
         {
             "@type": "Question",
             "name": "How to upload a file on S3?",
             "acceptedAnswer": {
                 "@type": "Answer",
                 "text": "aws s3 cp local/foo.txt s3://testing-tutorial/local/foobar.txt"
             }
         },
         {
             "@type": "Question",
             "name": "How to upload a folder on S3?",
             "acceptedAnswer": {
                 "@type": "Answer",
                 "text": "aws s3 sync local s3://testing-tutorial/local/"
             }
         },
         {
             "@type": "Question",
             "name": "How to rename a file on S3?",
             "acceptedAnswer": {
                 "@type": "Answer",
                 "text": "aws s3 mv s3://testing-tutorial/foobar.txt s3://testing-tutorial/foo/foo.txt"
             }
         },
         {
             "@type": "Question",
             "name": "How to download a file on S3?",
             "acceptedAnswer": {
                 "@type": "Answer",
                 "text": "aws s3 mv s3://testing-tutorial/local/foo.txt new.txt"
             }
         },
         {
             "@type": "Question",
             "name": "How to download a folder on S3?",
             "acceptedAnswer": {
                 "@type": "Answer",
                 "text": "aws s3 sync s3://testing-tutorial/local/ local"
             }
         },
         {
             "@type": "Question",
             "name": "How to remove a file on S3?",
             "acceptedAnswer": {
                 "@type": "Answer",
                 "text": "aws s3 rm s3://testing-tutorial/local/foo.txt"
             }
         },
         {
             "@type": "Question",
             "name": "How to remove a folder on S3?",
             "acceptedAnswer": {
                 "@type": "Answer",
                 "text": "aws s3 rm --recursive s3://testing-tutorial/local/"
             }
         },
         {
             "@type": "Question",
             "name": "How to remove a bucket on S3?",
             "acceptedAnswer": {
                 "@type": "Answer",
                 "text": "aws s3 rb --force s3://testing-tutorial"
             }
         }
     ]
 }
</script>

## Manager data on S3 via our web client

The S3 CLI is great but sometime you might need something usable by people who would get scared of the terminal, in those scenario, the Filestash <a href="{% post_url 2019-11-21-s3-browser %}">S3 browser</a> is very handy:

<a href="{% post_url 2019-11-21-s3-browser %}"><img class="fancy" src="/img/screenshots/viewerpage.png" /></a>

<div class="related">
    <div class="title">
        Related Pages <br>
        <img src="https://mickael.kerjean.me/assets/img/arrow_bottom.png"/>
    </div>
    <div class="related_content">
        <a href="{% post_url 2019-11-21-s3-browser %}"><h3 class="no-anchor">S3 Browser</h3></a><a href="{% post_url 2020-05-03-how-to-get-aws-keys %}"><h3 class="no-anchor">AWS Keys</h3></a>
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
