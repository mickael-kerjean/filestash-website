---
title: Quick Guide - Setting up a local S3 testing server
description: Create a simple local bucket in 30seconds with docker and localstack
layout: post
permalink: /s3-server.html
tags: S3
language: en
---

Deploying a local S3 server that mimic the [S3 API](https://awsdocs.s3.amazonaws.com/S3/latest/s3-api.pdf) is straightforward:

<div class="terminal">
<span class="prompt">~/$ </span>docker run --name s3 --rm -p 4566:4566 localstack/localstack:s3-latest<br>
<span class="stdout">
<br>
<br>
LocalStack version: 3.0.2.dev<br>
LocalStack build date: 2023-11-24<br>
LocalStack build git hash: 9289d8a<br>
<br>
2024-03-01T06:40:00.825  INFO --- [-functhread3] hypercorn.error            : Running on https://0.0.0.0:4566 (CTRL + C to quit)<br>
2024-03-01T06:40:00.825  INFO --- [-functhread3] hypercorn.error            : Running on https://0.0.0.0:4566 (CTRL + C to quit)<br>
2024-03-01T06:40:00.837  INFO --- [  MainThread] localstack.utils.bootstrap : Execution of "start_runtime_components" took 601.89ms<br>
Ready.<br>
<br>
</span>
</div>

And you're all set to start interacting with you local S3 buckets either via the [AWS CLI]({% post_url 2020-07-14-aws-cli-guide %}):

<div class="terminal">
<span class="prompt">~/$ </span> aws s3 --region us-east-2 --endpoint http://127.0.0.1:4566 mb s3://my-bucket<br>
<span class="stdout">
make_bucket: my-bucket<br>
</span>
<span class="prompt">~/$ </span>aws s3 --endpoint http://127.0.0.1:4566 ls<br>
<span class="stdout">
2024-03-01 17:44:33 my-bucket<br>
</span>
</div>

or by using any other [S3 browser]({% post_url 2019-11-21-s3-browser %}) like ours:

<a href="{% post_url 2019-11-21-s3-browser %}"><img class="fancy" src="/img/screenshots/viewerpage.png" /></a>
