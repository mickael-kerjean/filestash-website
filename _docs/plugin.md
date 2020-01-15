---
layout: documentation
title: Plugins
order: 5
---

When you find yourself needing something that's not available by default, plugins helps you make things happen. The scope of plugin is large, it allows to built on top of core to extends beyond the current capabilities.

## Plugin Marketplace
- [plg_backend_backblaze](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_backend_backblaze){:rel="nofollow"}: this plugin provide an integration with the Blackblaze B2 cloud storage services
- [plg_backend_dav](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_backend_dav){:rel="nofollow"}: this plugin provide an integration with a CalDAV server and a CardDAV server
- [plg_backend_ldap](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_backend_ldap){:rel="nofollow"}: this plugin provide an integration with an LDAP server
- [plg_backend_mysql](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_backend_mysql){:rel="nofollow"}: this plugin provide an integration with a Mysql server
- [plg_handler_console](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_handler_console){:rel="nofollow"}: a full fledge tty console that's handy to maintain your instance when SSH access is blocked ([screenshot](https://raw.githubusercontent.com/mickael-kerjean/filestash_images/master/screenshots/admin_tty.png){:rel="nofollow"})
- [plg_image_light](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_image_light){:rel="nofollow"}: this plugin handle image transcoding and resizing.
- [plg_security_scanner](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_security_scanner){:rel="nofollow"}: this plugin handle non legitimate traffic from scanners with a bunch of tricks that are randomly pick: things like gzip bomb, XML bomb, redirection to the attacker own IP, redirection to localhost, sendout of HTTP headers that don't match with the sent content and other fun stuff
- [plg_security_svg](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_security_svg){:rel="nofollow"}: this plugin handle the security aspect of SVG images (by default, SVG images could be crafted to execute javascript or break the browser with XML bomb). This plugin has 2 modes that are configurable from the admin console: mitigation mode where SVG images are allowed but filtered to remove potential harms and blocking mode where SVG images are simply blocked
- [plg_starter_http](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_starter_http){:rel="nofollow"}: serve application via HTTP. This plugin is the legacy server that was used til May 2019
- [plg_starter_http2](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_starter_http2){:rel="nofollow"}: same as plg_starter_http but with an HTTP2 server
- [plg_started_https](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_starter_https){:rel="nofollow"}: same as plg_starter_http but with an HTTPS server.
- [plg_starter_tor](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_starter_tor){:rel="nofollow"}: same as plg_starter_http but the server is expose on TOR with an onion URL
- [plg_starter_tunnel](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_starter_tunnel){:rel="nofollow"}: this is the default server that's use since May 2019

- *add you own with a PR*


## Anatomy of a Filestash plugin

Plugins are developed using the Go programming language. Those are listed from [this file](https://github.com/mickael-kerjean/filestash/blob/master/server/plugin/index.go){:rel="nofollow"} before getting compiled (see [our guide](https://github.com/mickael-kerjean/filestash/blob/master/CONTRIBUTING.md){:rel="nofollow"} to make a build)

Internally, plugins have a few key parts:
- an entry point: which will be called when Filestash boots up. The entry point of a plugin is its `init` function
- they can call a series of hooks and APIs to perform their functions (see [here](https://github.com/mickael-kerjean/filestash/blob/master/server/common/plugin.go){:rel="nofollow"})

## Basic example

``` go
package main

import (
	. "github.com/mickael-kerjean/filestash/server/common"
	"io"
	"net/http"
)

func init() {
    plugin_enable := Config.Get("features.nothing.enable").Default(true).Bool()

    Hooks.Register.ProcessFileContentBeforeSend(func(reader io.ReadCloser, ctx *App, res *http.ResponseWriter, req *http.Request) (io.ReadCloser, error){
        if plugin_enable {
            Log.Info("Can do something here: %v", plugin_enable)
        }
        return reader, nil
    })
}
```

## Configuration management

A Plugin can query and/or mutate the configuration state using the global `Config` object. The resulting configuration can be seen and update by an application admin from the UI by visiting `/admin/configure`.

Usage Example:
``` go
// mutate the configuration state
var testConfig0 string = Config.Get("general.test").Default("test").String()

// same as above except that the admin console will be more user friendly
var testConfig1 string = Config.Get("general.test").Schema(func(f *FormElement) *FormElement {
	if f == nil {
		f = &FormElement{}
	}
    f.Description = "This is the description a user will see in the admin console"
	f.Name = "test"
	f.Type = "text"
    f.Default = "test"
    f.Placeholder = "Input placeholder"
}).String()
```

## Development Hints

- The list of available hooks is defined [here](https://github.com/mickael-kerjean/filestash/blob/master/server/common/plugin.go){:rel="nofollow"}. Those will be extended when a need is identified, pull request are welcome
- Backend are registered [like this](https://github.com/mickael-kerjean/filestash/blob/master/server/plugin/plg_backend_dav/index.go#L33){:rel="nofollow"} and need to implement [this interface](https://github.com/mickael-kerjean/filestash/blob/master/server/common/types.go#L10-L20){:rel="nofollow"}
- There's a range of middleware available for reusable logic (all things like managing access, permissions and sessions, ...), reuse them as you see fit (see [examples](https://github.com/mickael-kerjean/filestash/blob/master/server/main.go){:rel="nofollow"})
