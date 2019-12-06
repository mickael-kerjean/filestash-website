---
layout: documentation
title: Configuration
order: 3
---

{% include toc.md %}

Need additional flexibility? [contact us directly](mailto:mickael@kerjean.me), we can even generate custom build just for you!

## The admin console

The admin console enable you to change the settings of your filestash instance. It can be access at: `https://demo.filestash.app/admin`

<img src="https://raw.githubusercontent.com/mickael-kerjean/filestash_images/master/screenshots/admin_console.png" alt="admin console screenshot" height="320"/>

The admin console let you:
1. configure your instance with a whole range of customisation
2. see your logs
3. create the login screen that fit your specific need. As an example: <img src="https://raw.githubusercontent.com/mickael-kerjean/filestash_images/master/screenshots/backend_example.png" alt="other instance screenshot" height="320"/>

## Configure the Dropbox connector

Configuring Dropbox must be done by:
1. requesting access to the Dropbox API. Without this, Filestash can't access anything stored on the Dropbox servers. To do that, go [here](https://www.dropbox.com/developers/apps/){:rel="nofollow"}, then:
   - click: "Create App"
   - select: "dropbox api"
   - select: "Full Dropbox" or "App folder"
   - insert: "whatever name you want"
   - insert at 'redirect URI' => https://example.com/login
2. store the client_id configuration given by Dropbox (also known as the `App key`) in the admin console or by setting the `DROPBOX_CLIENT_ID` environment variable

## Configure the Google Drive connector

Configuring Google drive can be done by:
1. Requesting access to the Google drive API. Without this, Filestash can't get anything store on the server of Google. To do that, you need to [go here](https://console.developers.google.com/apis/api/drive.googleapis.com/overview){:rel="nofollow"} and enable the drive api. Then, go [here](https://console.developers.google.com/apis/credentials/oauthclient){:rel="nofollow"} and create credentials that filestash will be using to communicate with Google
2. Publish the configuration given by Google (client_id and client_secret) in your admin console or by setting the `GDRIVE_CLIENT_ID` and `GDRIVE_CLIENT_SECRET` environment variable
