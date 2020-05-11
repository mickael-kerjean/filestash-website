---
title: A way forward for filebrowser's users
layout: post
language: en
---

[Filebrowser](https://filebrowser.xyz/) used to be an open source web file browser. Following the annoucement of its author moving on, the project has now been been [archived on their Github](https://github.com/filebrowser/filebrowser)

![filebrowser screenshot](/img/posts/2020-02-03-filebrowser.0.png)

If you're trying to find a replacement for filebrowser, Filestash should get you covered. All the features from filebrowser are also available in Filestash and more. See by yourself from our demo:

<iframe id="appframe" frameborder="0" src="https://demo.filestash.app/login?type=webdav&url=http://server_webdav" allow="fullscreen;" style="width: 100%; box-shadow: 0 0 25px rgba(65, 83, 100, 0.5); border-radius: 5px; text-align: center; object-fit: contain; object-position: top; background: var(--bg-color); vertical-align: middle; height: 450px;"></iframe>

The major difference comes to how both work around local filesystem as both software are build around different assumptions. When Filebrowser comes with its own user management system and was able to directly access your filesystem, Filestash can only do the same if you can install an extra server package such as the SSH package and use it through the enabled by default SFTP server.

If you can work around installing an extra package, you can benefit from the extra features offered by Filestash such as:
- flexible shared link
- network drive
- thumbnails generation for images
- video streaming
- plugin mechanism
- org-mode client
- ...more
