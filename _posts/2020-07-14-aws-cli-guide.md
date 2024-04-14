---
title: A cheat sheet for the AWS S3 CLI
description: Find your way on the AWS S3 CLI - list files with ls, removal with rm, copy, download, move ...
layout: post
permalink: /aws-s3-cli.html
tags: s3 guide
language: en
---

The [AWS command line interface](https://docs.aws.amazon.com/cli/latest/reference/s3/) is the goto tools from which you can perform pretty much any operation that relates to AWS. This post only cover the most common operations:
- [list files / buckets](#list-files-and-buckets-with-aws-s3-ls)
- [create](#manage-data-on-s3-via-the-cli) and [sync files](#upload-a-folder)
- [delete](#remove-a-file) / [move](#rename-a-file) files

*Assumption*: [the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) is installed in your system.

## List Files and buckets with 'aws s3 ls'

**list S3 buckets**:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 ls<br>
<span class="stdout">
2021-07-25 23:15:52 mybucket<br>
2022-05-11 16:45:11 filestash-config<br>
</span>
<span class="prompt">~/$ </span><span class="stdout"># or using the s3api directly: </span><br>
<span class="prompt">~/$ </span>aws s3api list-buckets --output text<br>
<span class="stdout">
BUCKETS 2021-07-25T13:15:52+00:00       mybucket<br>
BUCKETS 2022-05-11T06:45:11+00:00       filestash-config<br>
OWNER   mickael 8b7a5480bc570db5e2898b4ebaea25fad30839b8a8c165ecfaef4edbf92eba58<br>
</span>
</div>

**list files / objects in a bucket**:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 ls mybucket/<br>
<span class="stdout">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
PRE test/<br>
2020-05-17 02:20:18        557 releasenote.org<br>
</span>
<span class="prompt">~/$ </span>aws s3api list-objects --bucket mybucket --output text<br>
<span class="stdout">
None<br>
CONTENTS        "1068cea62cf71ec63b5824cc85508bb8"      releasenote.org 2020-05-17 02:20:18       557    STANDARD<br>
OWNER   mickael 8b7a5480bc570db5e2898b4ebaea25fad30839b8a8c165ecfaef4edbf92eba58<br>
CONTENTS        "244abb13c672c19841b2e74d80283e3a"      test/notes.org  2020-04-14T09:25:58+00:00       11850   STANDARD<br>
OWNER   mickael 8b7a5480bc570db5e2898b4ebaea25fad30839b8a8c165ecfaef4edbf92eba58<br>
</span>
</div>

**list files / objects under a key**:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 ls mybucket/test/<br>
<span class="stdout">
2020-04-14 19:25:58      11850 notes.org<br>
</span>
<span class="prompt">~/$ </span>aws s3api list-objects --bucket mybucket --prefix test/ --output text<br>
<span class="stdout">
None<br>
CONTENTS        "244abb13c672c19841b2e74d80283e3a"      test/notes.org  2020-04-14T09:25:58+00:00              11850   STANDARD<br>
OWNER   mickael 8b7a5480bc570db5e2898b4ebaea25fad30839b8a8c165ecfaef4edbf92eba58<br>
</span>
<span class="prompt">~/$ </span>aws s3api list-objects-v2 --bucket mybucket --prefix test/ --output text<br>
<span class="stdout">
None<br>
CONTENTS        "244abb13c672c19841b2e74d80283e3a"      test/notes.org  2020-04-14T09:25:58+00:00       11850   STANDARD<br>
</span>
</div>


**list files in a bucket in a recursive manner**:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 ls --recursive mybucket/<br>
<span class="stdout">
2020-05-17 02:20:18       557 releasenote.org<br>
2020-04-14 19:25:58      11850 test/notes.org<br>
</span>
</div>

## Manage data on S3 via the CLI

**create a bucket**:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 mb s3://mybucket<br>
<span class="stdout">
make_bucket: mybucket<br>
</span>
</div>

**create a folder**:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3api put-object --bucket mybucket --key foldername/<br>
<span class="stdout">
{<br>
&nbsp;&nbsp;&nbsp;&nbsp;"ETag": "\"d41d8cd98f00b204e9800998ecf8427e\"",<br>
&nbsp;&nbsp;&nbsp;&nbsp;"ServerSideEncryption": "AES256"<br>
}<br>
</span>
</div>


<strong id="upload-a-folder">upload a folder</strong>:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 sync local s3://mybucket/local/<br>
<span class="stdout">
upload: local/bar.txt to s3://mybucket/local/bar.txt<br>
upload: local/foo.txt to s3://mybucket/local/foo.txt<br>
</span>
<span class="prompt">~/$ </span>echo "lorem ipsum" > local/foo.txt<br>
<span class="prompt">~/$ </span>aws s3 sync local s3://mybucket/local/<br>
<span class="stdout">
upload: local/foo.txt to s3://mybucket/local/foo.txt<br>
</span>
</div>

**upload a file**:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 cp local/foo.txt s3://mybucket/local/foobar.txt<br>
<span class="stdout">
upload: local/foo.txt to s3://mybucket/local/foobar.txt
</span>
<span class="prompt">~/$ </span># or using the s3api directly: <br>
<span class="prompt">~/$ </span>aws s3api put-object --bucket mybucket --key local/foo.txt --body foobar.txt<br>
<span class="stdout">
TODO
</span>
</div>

**download a file**:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 cp s3://mybucket/local/foo.txt -<br>
<span class="stdout">
lorem ipsum
</span>
<span class="prompt">~/$ </span>aws s3 cp s3://mybucket/local/foo.txt -<br>
<span class="stdout">
lorem ipsum
</span>

aws s3api get-object --bucket filestash-config --key clovertex.json /dev/stdout
</div>

**download a folder**:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 sync s3://mybucket/local/ local<br>
<span class="stdout">
download: s3://mybucket/local/foo/foo.txt to local/foo/foo.txt
</span>
</div>


<strong id="rename-a-file">rename a file</strong>:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 mv s3://mybucket/local/foobar.txt s3://mybucket/local/foo/foo.txt<br>
<span class="stdout">
move: s3://mybucket/local/foobar.txt to s3://mybucket/local/foo/foo.txt
</span>
</div>

<strong id="remove-a-file">remove a file</strong>:
<div class="terminal" style="margin-bottom:10px">
<span class="prompt">~/$ </span>aws s3 rm s3://mybucket/local/foo.txt<br>
<span class="stdout">
delete: s3://mybucket/foo.txt
</span>
</div>

**remove a folder**:
<div class="terminal" style="margin-bottom:10px">
<span class="prompt">~/$ </span>aws s3 rm --recursive s3://mybucket/local/<br>
<span class="stdout">
delete: s3://mybucket/local/bar.txt<br>
delete: s3://mybucket/local/foo/foo.txt<br>
</span>
</div>

**remove an entire bucket with its content**:
<div class="terminal">
<span class="prompt">~/$ </span>aws s3 rb --force s3://mybucket<br>
<span class="stdout">
remove_bucket: mybucket
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
                 "text": "aws s3 cp local/foo.txt s3://mybucket/local/foobar.txt"
             }
         },
         {
             "@type": "Question",
             "name": "How to upload a folder on S3?",
             "acceptedAnswer": {
                 "@type": "Answer",
                 "text": "aws s3 sync local s3://mybucket/local/"
             }
         },
         {
             "@type": "Question",
             "name": "How to rename a file on S3?",
             "acceptedAnswer": {
                 "@type": "Answer",
                 "text": "aws s3 mv s3://mybucket/foobar.txt s3://mybucket/foo/foo.txt"
             }
         },
         {
             "@type": "Question",
             "name": "How to download a file on S3?",
             "acceptedAnswer": {
                 "@type": "Answer",
                 "text": "aws s3 mv s3://mybucket/local/foo.txt new.txt"
             }
         },
         {
             "@type": "Question",
             "name": "How to download a folder on S3?",
             "acceptedAnswer": {
                 "@type": "Answer",
                 "text": "aws s3 sync s3://mybucket/local/ local"
             }
         },
         {
             "@type": "Question",
             "name": "How to remove a file on S3?",
             "acceptedAnswer": {
                 "@type": "Answer",
                 "text": "aws s3 rm s3://mybucket/local/foo.txt"
             }
         },
         {
             "@type": "Question",
             "name": "How to remove a folder on S3?",
             "acceptedAnswer": {
                 "@type": "Answer",
                 "text": "aws s3 rm --recursive s3://mybucket/local/"
             }
         },
         {
             "@type": "Question",
             "name": "How to remove a bucket on S3?",
             "acceptedAnswer": {
                 "@type": "Answer",
                 "text": "aws s3 rb --force s3://mybucket"
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
        <a href="{% post_url 2019-11-21-s3-browser %}"><h3 class="no-anchor">S3 Browser</h3></a><a href="{% post_url 2020-05-03-how-to-get-aws-keys %}"><h3 class="no-anchor">AWS Keys</h3></a><a href="{% post_url 2024-03-01-s3-testing-server %}"><h3 class="no-anchor">S3 Testing server</h3></a><a href="{% post_url 2023-02-01-s3-with-cognito %}"><h3 class="no-anchor">S3 with Cognito</h3></a>
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
