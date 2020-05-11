---
title: How to create your AWS access Key ID and AWS Secret Access key
description: Getting started on S3, creating your own AWS acces Key ID and AWS Secret Access key
layout: post
language: en
permalink: /aws-access-key.html
---

<style>
figure{ margin: 35px 0; font-size: 1.05em; }
figure img{ margin-bottom: 2px; }
figure .steper{ font-style: italic; opacity: 0.8; }
#main h2{ padding-top: 20px; }
#main iframe{
    height: 600px;
    width: 100%;
    box-shadow: 0 0 25px rgba(65, 83, 100, 0.5);
    border-radius: 5px;
}
</style>

In this guide I will show how to get started with S3 by creating your AWS credentials that Amazon refers as **AWS Access Key ID** and **AWS Secret Access Key** to access and manage Amazon S3 buckets:
- [Step 0: creating your AWS account](#step-0-create-an-account-with-aws)
- [Step 1: connect to the AWS console](#step-1-connect-to-the-aws-console)
- [Step 2: create your Amazon S3 keys](#step-2-create-your-aws-access-keys)
- [Step 3: access S3 with your newly created AWS keys](#step-3-test-your-key-is-working-fine-by-accessing-s3)

## Step 0: Create an account with AWS

If that's not already done, you first need to create a AWS account:

<figure>
    <figcaption>Head to <a href="https://aws.amazon.com">https://aws.amazon.com</a>:</figcaption>
    <img class="fancy" src="/img/posts/2020-05-03-how-to-get-aws-keys_1.png" />
</figure>
<figure>
    <figcaption>Fill the multiple step registration form:</figcaption>
    <img class="fancy" src="/img/posts/2020-05-03-how-to-get-aws-keys_2.png" />
</figure>
<figure>
    <figcaption>After adding your credit card details and going through the verification steps, you should see this message:</figcaption>
    <img class="fancy" src="/img/posts/2020-05-03-how-to-get-aws-keys_3.png" />
</figure>

## Step 1: Connect to the AWS console

<figure>
    <figcaption>Head to <a href="https://console.aws.amazon.com/">https://console.aws.amazon.com/</a> and connect using your root account or IAM user if it exists:</figcaption>
    <img class="fancy" src="/img/posts/2020-05-03-how-to-get-aws-keys_4.png" />
</figure>

<figure>
    <figcaption>Once logged in you should see the AWS console</figcaption>
    <img class="fancy" src="/img/posts/2020-05-03-how-to-get-aws-keys_5.png" />
</figure>


## Step 2: Create your AWS access keys

<figure>
    <figcaption><span class="steper">(1/5)</span> - Go to the <strong>IAM</strong> service either by:<br>
    1. using the direct link: <a href="https://console.aws.amazon.com/iam/">https://console.aws.amazon.com/iam/</a><br>
    2. using the Find features search box from the admin console<br>
    3. locating the service from the admin console under <em>Security, Identify & Compliance</em>
    </figcaption>
    <img class="fancy" src="/img/posts/2020-05-03-how-to-get-aws-keys_6.png" />
</figure>

<figure>
    <figcaption><span class="steper">(2/5)</span> - Create a user if needed:</figcaption>
    <img class="fancy" src="/img/posts/2020-05-03-how-to-get-aws-keys_7.png" />
    <img class="fancy" src="/img/posts/2020-05-03-how-to-get-aws-keys_8.png" />
    <img class="fancy" src="/img/posts/2020-05-03-how-to-get-aws-keys_9.png" />
</figure>

<figure>
    <figcaption><span class="steper">(3/5)</span> - Create a group if needed:</figcaption>
    <img class="fancy" src="/img/posts/2020-05-03-how-to-get-aws-keys_10.png" />
    <img class="fancy" src="/img/posts/2020-05-03-how-to-get-aws-keys_11.png" />
</figure>

<figure>
    <figcaption><span class="steper">(4/5)</span> - Link the user with the relevant group and create tags if needed:</figcaption>
    <img class="fancy" src="/img/posts/2020-05-03-how-to-get-aws-keys_12.png" />
    <img class="fancy" src="/img/posts/2020-05-03-how-to-get-aws-keys_13.png" />
</figure>


<figure>
    <figcaption><span class="steper">(5/5)</span> - Final review before AWS can generate your <strong>AWS acces Key ID</strong> and <strong>AWS Secret Access key</strong>:</figcaption>
    <img class="fancy" src="/img/posts/2020-05-03-how-to-get-aws-keys_14.png" />
</figure>

<figure>
    <figcaption>You got it! A fresh <strong>AWS Access Key ID</strong> and <strong>AWS Secret Access Key</strong> you can now use in your application!</figcaption>
    <img class="fancy" src="/img/posts/2020-05-03-how-to-get-aws-keys_15.png" />
</figure>


## Step 3: Test your key is working fine by accessing S3

There's many way to test if your S3 keys is working:
- the [AWS CLI](https://aws.amazon.com/cli/)
- use a GUI for S3 like [Filestash]({% post_url 2019-11-21-s3-browser %}):

<iframe id="appframe" frameborder="0" src="https://demo-s3.filestash.app/" allow="fullscreen;speaker"></iframe>

Our [S3 browser and explorer](({% post_url 2019-11-21-s3-browser %})) thrives at making S3 user friendly by non technical users. With Filestash, you can easily edit / upload and explore your buckets, create shared links that are as easy to set up as on Dropbox and providing a range of access control to keep your buckets secure.

On premise or on the cloud, you can install the web client anywhere you want. Our code is [open source](https://github.com/mickael-kerjean/filestash) if you feel like reading some code.
