---
layout: documentation
title: Plugins
language: en
order: 5
---

<style>
.banner { display: none }
</style>

Most of Filestash code is made of plugins which you can add / remove or add new ones so it can fit your use case without compromise.

## Plugin type

- backend plugin (aka plugin implementing the [IBackend interface](https://github.com/mickael-kerjean/filestash/blob/master/server/common/types.go#L11-L21)): all the available storage Filestash supports by default is done that way. Here are some [sample code](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin) if you want to make your own.
- authentication middleware plugin (aka plugin implementing the [IAuthentication interface](https://github.com/mickael-kerjean/filestash/blob/master/server/common/types.go#L23-L27)): they are middleware who can be used to connect any source of user to the storage of your choosing. For example, if you use FTP, you might think you can't link it to your IDP via SAML, authentication middleware are the glue that make the magic happen where the Callback function returns the bindings available for the attribute mappings.
- authorisation middleware plugin (aka plugin implementing the [IAuthorisation interface](https://github.com/mickael-kerjean/filestash/blob/master/server/common/types.go#L29-L37)): this plugin hook onto the filesystem to overwrite who can do what and where, giving the plugin developer an opportunity to deny access to some ressource based on some custom conditions.
- search plugin (aka plugin implementing the [ISearch interface](https://github.com/mickael-kerjean/filestash/blob/master/server/common/types.go#L44-L46)): By default Filestash ships with a [recursive search plugin](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_search_stateless) but we have a [full text search plugin](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_search_sqlitefts) available as well and you can create your own if you have some specific needs. Eg: we know some companies who have made their own search based on elastic search but you can also disable search altogether if you don't specific a search plugin at all.
- config plugin: this type of plugin changes the default storage mechanism of the config file. We've helped companies scale Filestash to store config in S3 buckets and environment variable but anything is possible
- file transformer plugin: this is how you can transform the content of a file before it's send back to the browser. You're using this whenever the browser request a thumbnail version of an image (see [here](https://github.com/mickael-kerjean/filestash/blob/master/server/plugin/plg_image_thumbnail/index.go)) or whenever a user is trying to load an SVG picture via the [plg_security_svg](https://github.com/mickael-kerjean/filestash/blob/master/server/plugin/plg_security_svg/index.go) plugin to either block svg entirely or accept them (FYI: svg can contain/run javascript and could cause XSS). Some "fun" example includes [this plugin](https://github.com/mickael-kerjean/filestash/blob/master/server/plugin/plg_image_ascii/index.go) which convert an image into ascii art so it can be displayed nicely from a terminal instead of a regular browser
- starter plugin: this type of plugin make it possible to expose your instance with whatever protocol of your choosing, we've implemented a range of these to expose Filestash using HTTP, HTTP2 and TOR and have a couple others we keep for customers like HTTPS via letsencrypt and HTTPS using certificates from the filesystem either via env variable or the filesystem.
- audit plugin: when installed this kind of plugins make it possible for auditors to do their jobs, seeing who did what and when with various filters to drill down on the history of events and create excel reports
- log plugin: this type of plugin changes how log behaves so you can change the default behavior of logs which is to write it on stdout and a file to push those to any system you might want

Some other cool things you can do with plugin:
- change what viewer should be open for every possible type of files you might have
- register your own viewer application to handle a particular file type. A good example of this is how we've implemented support for [microsoft office documents](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_editor_onlyoffice)
- add your own endpoints to the application. That's how we've made the [microsoft office document integration](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_editor_onlyoffice) and how plugins such as [plg_handler_console](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_handler_console) or [plg_handler_syncthing](https://github.com/mickael-kerjean/filestash/tree/master/server/plugin/plg_handler_syncthing) works
- change any kind of endpoints provided by default. This is how we typically adapt the branding so companies can see their own logo instead of the Filestash one alongside some more advanced use case

## Add or remove a plugin

Plugins are developed using the Go programming language. To add or remove a plugin, you need to edit [this file](https://github.com/mickael-kerjean/filestash/blob/master/server/plugin/index.go) and recompile the software. The list of plugin is visible from the [/about](https://demo.filestash.app/about) page alongside some extra information about the build

## Plugin configuration

A Plugin can query and/or mutate the configuration state using the global `Config` object. The resulting configuration can be seen and updated from the admin UI (`/admin/settings`).

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
If you want to dig deeper [check this](https://github.com/mickael-kerjean/filestash/blob/master/server/plugin/plg_video_transcoder/index.go#L36-L68) and [this](https://github.com/mickael-kerjean/filestash/blob/master/server/common/config.go).


## Custom plugin development

We can help you customisating Filestash for your needs, [reach out to us](/pricing/?modal=enterprise). We can offer custom development of plugin and custom build services.

To give some concrete examples of what we've already done, we've made plugins for the like of:
- [MIT](https://www.media.mit.edu/posts/file-sharing/) to integrate their samba file sharing server with their two factor authentication and LDAP.
- [DHL](https://www.deutschepost.de/) enabling their employees to access and manage workspaces in their artifactory server
- [Schneider Electric](https://se.com/) enabling their technical documentation team to push changes to their online help pages embed onto their softwares
- a lot more ...
