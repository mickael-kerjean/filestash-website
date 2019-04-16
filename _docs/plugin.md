---
layout: documentation
title: Plugins
order: 5
---

When you find yourself needing something that's not available by default, plugins helps you make things happen. The scope of plugin is large, from creating a view of your CRM to send notification when someone access a presentation and everything in between.

## Anatomy of a Filestash plugin

Plugins are developped using the Go programming language. Concretly they are given as a `.so` file that when located in the `data/plugins` directories provide extra functionalities.

Internally, plugins have a few key parts:
- an entry point: which will be called when Filestash boots up. The entry point has the following signature: `func Init(config *Config)`
- a list of hooks that's available for your plugin to register on and provide its extra functionality

The list of installed plugin is available for everyone to see under `/about` along with the version of Filestash for which the plugins were compiled and their associated hash. This information makes the build reproducible whilst allowing anyone to verify the integrity of a deployement.

## Basic example

``` go
package main

import (
	. "github.com/mickael-kerjean/filestash/server/common"
	"net/http"
)

func Init(config *Config) {
    plugin_enable := config.Get("features.nothing.enable").Default(true).Bool()

    Hooks.Register.ProcessFileContentBeforeSend(func(reader io.ReadCloser, ctx *App, res *http.ResponseWriter, req *http.Request) (io.ReadCloser, error){
        if plugin_enable {
            Log.Info("Can do something here: %v", plugin_enable)
        }
        return reader, nil
    })
}
```

To work, plugins needs to be:
1. compiled into a `.so`:
```
go build -buildmode=plugin -o plugin.so index.go
```
2. placed in the plugin folder. To be loaded, Filestash will need to be restarted

## Configuration management

A Plugin can query and/or mutate the configuration state via the `Config` object provided in its entry point. The resulting configuration can be seen and update by an application admin from the UI by visiting `/admin/configure`.

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

## Complete example

Filestash has a range of builtin plugins you can [see here](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin). Those are all built along the same model given in the [anatomy of a Filestash plugin](/docs/plugin#anatomy-of-a-filestash-plugin) section and serve as code sample for a plugin developer to build upon.

*Tips*:
1. The list of available hooks is defined [here](https://github.com/mickael-kerjean/filestash/blob/master/server/common/plugin.go). Those will be extended when a need is identified, pull request are welcome
2. Backend are registered [like this](https://github.com/mickael-kerjean/filestash/blob/master/server/plugin/plg_backend_dav/index.go#L33) and needs to implement [this interface](https://github.com/mickael-kerjean/filestash/blob/master/server/common/types.go#L10-L20)