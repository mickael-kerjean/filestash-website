---
layout: documentation
title: Configuration
order: 3
---

This part of the documentation will show you how Filestash can be configured and customised to fit different needs

{% include toc.md %}


## Different type of configuration
If you need customisation that isn't cover in here, you can either:
- open an issue or a pull request
- [contact us directly](mailto:mickael@kerjean.me) if you need specific things, we can even do custom builds that's created just for you!

## The `config.json` file

The `config.json` file is the centerpiece of the configuration that's covered in this article. It is located by default under `/app/data/config/config.json`.

## Connection page
You can customise the connection page by editing [this file](https://github.com/mickael-kerjean/filestash/blob/master/config/config.json). You can add/remove/prefill any field or connector: 
![example of customisation](https://github.com/mickael-kerjean/filestash/blob/master/.assets/img/customisation_1.png?raw=true)

Can be quite a cool way to provide access without your users having knowledge about the underlying system they're connecting to.

## Dropbox and Google Drive

**Google drive**:
1. Enable the drive api: [link](https://console.developers.google.com/apis/api/drive.googleapis.com/overview)
2. Create credentials: [link](https://console.developers.google.com/apis/credentials/oauthclient)
3. Publish your credentials in the config.json or via the `GDRIVE_CLIENT_ID` and `GDRIVE_CLIENT_SECRET` env variable

**Dropbox**:
1. create an third party app: [link](https://www.dropbox.com/developers/apps/create)
2. `dropbox api -> "Full Dropbox" or "App folder" -> whatever name you want -> set redirect URI to https://example.com/login`
3. Publish your credentials in the config.json or via the `DROPBOX_CLIENT_ID` env variable

## Editor keybinding

There's 3 different keybinding available: emacs, vim or sublime. It can be setup from the [config.json](https://github.com/mickael-kerjean/filestash/blob/master/config/config.json#L3)

## Usage statistics

By default, Filestash is sending telemetry data to `log.kerjean.me`. You can opt out by editing the [config.json](https://github.com/mickael-kerjean/filestash/blob/master/config/config.json#L14) file to `telemetry: false`
The purpose of this module is two folds:

1. Get an idea of how many install are in the wild and see if there's any usage from it. It’s very motivating for me to watch the number of users grow over time.

2. Proactively findout about errors and slow request to fix the root cause in the code in order to make filestash better for everyone

The collected data includes: timestamp, response time, HTTP status code, hostname, protocol (http or https), HTTP method, URI, referrer, log level
Those logs aren't share with anybody, the only person who has access to it is [Mickael Kerjean](http://mickael.kerkjean.me)
