---
layout: post
title: AWS Marketplace install
permalink: /docs/marketplace/
redirect_from:
  - /install-cloud.html
---
<style>
img.fancy { margin: 15px 0 0 0; }
h1 { margin-top: 4rem; }
</style>

{% include banner.html %}
<div class="banner" style="text-align:justify">
    Assumption: you have an AWS Account. If that's not the case, <a href="/redirect.html?origin=pricing::selfhosted&url=https://aws.amazon.com/resources/create-account/">create your account</a> or get a <a href="/docs/support/?origin=doc::marketplace">support contract</a>.
</div>

This guide is split in 3 parts:

1. [part 1: Register the product on AWS](#step1-register-to-our-product)
2. [part 2: Do some configuration magics from AWS](#step2-aws-configuration)
3. [part 3: Access the software](#step3-access-the-software)

# Step1: Register to our product

From the AWS marketplace, subscribe to our product from our <a href="https://aws.amazon.com/marketplace/pp/prodview-ngwkedxz2dtrk">vendor page</a>:

<img src="/img/posts/2022-02-21-image0001.png" class="fancy" />
<img src="/img/posts/2022-02-21-image0002.png" class="fancy" />

<img src="/img/posts/2022-02-21-image0011.png" class="fancy" />

<img src="/img/posts/2022-02-21-image0015.png" class="fancy" />

At this stage, the status should show pending for about 2 minutes after which you see this:

<img src="/img/posts/2022-02-21-image0016.png" class="fancy" />

# Step2: AWS Configuration

<img src="/img/posts/2022-02-21-image0020.png" class="fancy" />

<img src="/img/posts/2022-02-21-image0025.png" class="fancy" />

<img src="/img/posts/2022-02-21-image0029.png" class="fancy" />

# Step3: Access the software

<img src="/img/posts/2022-02-21-image0032.png" class="fancy" />

<img src="/img/posts/2022-02-21-image0035.png" class="fancy" />

You now have 2 options:

- OPTION1: you want to use your own domain name. In that scenario, create either a CNAME or A record that points to the machine. Once this is done, access the application via your domain name using HTTP.

- OPTION2: you don't care about the domain name for now. In that scenario, access the machine via HTTP. In my scenario, the URL is: http://3.236.113.29

<img src="/img/posts/2022-02-21-image0040.png" class="fancy" />

This will setup SSL certificate so you can access your application via HTTPS. After a few seconds, you will be great by Filestash:

<img src="/img/posts/2022-02-21-image0050.png" class="fancy" />

*Tips*: if you don't use your own domain name but the IP address or the amazonaws.com domain, Filestash will generate self signed certificate meaning users will be asked to follow through a scary prompt to access the application. That prompt won't be there if you use your own domain name.
