---
layout: documentation
title: Plugins
order: 5
---

If you find yourself needing something that's not available by default, plugins is the butter of customisation. Concretely, a plugin is a `.so` files that can be drop in the `data/plugins/` directory.

## The image plugin

By default, Filestash ship with the image plugin which is looking after image transcoding and resizing. The plugin is available in 2 flavors:
- [a fast plugin](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/image_light) (the one installed by default on the official docker hub image): that is blazing fast but rely on the installation of 2 c libraries: libraw and libvips
- [a slow plugin](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/image_heavy): that is an order of magnitude slower that the fast one but doesn't require any installation of third party libraries

## Develop a plugin

Develop a plugin is done using the Go programming language. In its simplest form, it looks like this:
```
package main

import (
	. "github.com/mickael-kerjean/filestash/server/common"
	"net/http"
)

func Init(config *Config) {
	plugin_enable := config.Get("feature.myplugin.enable").Default(true).Bool()

	Hooks.Register.ProcessFileContentBeforeSend(func(reader io.Reader, ctx *App, res *http.ResponseWriter, req *http.Request) (io.Reader, error){
        Log.Info("HELLO FROM A USELESS PLUGIN: %v", plugin_enable)
		return reader, nil
	})
}
```
At startup, Filestash will load all its plugins and execute the `Init` function which is the entrypoint of the plugin. When loaded, you have the opportunity to:
1. add your own configuration that will be added to the admin console automatically:
```
// mutate our configuration
Config.Get("general.test").Default("test")
// same as above but the generated field in the admin console will be much more user friendly
Config.Get("general.test").Schema(func(f *FormElement) *FormElement {
	if f == nil {
		f = &FormElement{}
	}
    f.Description = "This is the description a user will see in the admin console"
	f.Name = "test"
	f.Type = "text"
    f.Default = "test"
})
```
2. hook into some events that change how the application behave
3. Register new backends

To transform your plugin into a `.so` file that you can drop in the plugin directory you need to build it:
```
go build -buildmode=plugin -o artifact.so index.go
```
