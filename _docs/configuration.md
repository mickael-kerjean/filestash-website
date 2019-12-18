---
layout: documentation
title: Configuration
order: 3
---

{% include toc.md %}

Need additional flexibility? [contact us directly](mailto:mickael@kerjean.me), we can even generate a custom build just for you!

## The admin console

The admin console enables you to change the settings of your Filestash instance. It can be accessed at: `https://demo.filestash.app/admin`

<img src="https://raw.githubusercontent.com/mickael-kerjean/filestash_images/master/screenshots/admin_console.png" alt="admin console screenshot" height="320"/>

The admin console lets you:
1. configure your instance with a whole range of customisations
2. see your logs
3. create the login screen to suit your specific needs. As an example: <img src="https://raw.githubusercontent.com/mickael-kerjean/filestash_images/master/screenshots/backend_example.png" alt="other instance screenshot" height="320"/>

## Configure the Dropbox connector

Configuring Dropbox must be done by:
1. requesting access to the Dropbox API. Without this, Filestash can't access anything stored on the Dropbox servers. To do that, go [here](https://www.dropbox.com/developers/apps/){:rel="nofollow"}, then:
   - click: "Create App"
   - select: "dropbox api"
   - select: "Full Dropbox" or "App folder"
   - insert: "whatever name you want"
   - insert at 'redirect URI' => https://example.com/login
2. store the `client_id` configuration given by Dropbox (also known as the `App key`) in the admin console or by setting the `DROPBOX_CLIENT_ID` environment variable

## Configure the Google Drive connector

Configuring Google drive can be done by:
1. Requesting access to the Google Drive API. Without this, Filestash cannot store anything on Google's servers. To do that, you need to [go here](https://console.developers.google.com/apis/api/drive.googleapis.com/overview){:rel="nofollow"} and enable the Drive API. Then, go [here](https://console.developers.google.com/apis/credentials/oauthclient){:rel="nofollow"} and create credentials that Filestash will be using to communicate with Google
2. Publish the configuration provided by Google (`client_id` and `client_secret`) in your Filestash admin console or by setting the `GDRIVE_CLIENT_ID` and `GDRIVE_CLIENT_SECRET` environment variables
