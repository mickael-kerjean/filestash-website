---
layout: documentation
title: Tips and tricks
language: en
---

1. Clicking on the edit icon lets you **move a file** either with an absolute or with a relative path. In other words, you can type:
  - `/tmp/foo.txt` to move into your tmp folder and rename your file to foo.txt
  - `../test/bar.txt`
2. Ctrl+F to **search** for something
3. Alt+1, Alt+2: to change the **view mode** while browsing your files
4. Ctrl+h: to toggle visibility of **hidden files**
5. Esc to exit visible popup
6. Going to [/about](http://demo.filestash.app/about){:rel="nofollow"} gives you information about the release
7. The text editor supports many of emacs' **keybindings**. If you're not part of the [church of emacs](https://www.youtube.com/watch?v=ZAnWjQQufgs&t=22){:rel="nofollow"}, we also provide keybindings for vi and Sublime Text. This can be set via the admin console
8. The admin console has a few cool tricks under its belt, my favorite is for it to be enabled from `features => enable_console`. Restart your instance and navigate to `/admin/tty/`: you will be greeted with a fully-fledged bash console straight from your browser, which is very handy when it comes to maintenance.
9. You can create deep links from the login page. Want to know more? See our [FTP client]({% post_url 2019-11-26-ftp-web-client %}) and [S3]({% post_url 2019-11-21-s3-browser %}) pages. *Pro tip:* If your use case allows for it, replace the url parameters with hash params, it will work the same way but won't show on the server logs
10. use the `ADMIN_PASSWORD` environment variable with its value being the bcrypt hash of your password to set the password in stone and disable the default behaviour which is to ask for the password if it's not defined.
11. [documentation]({% post_url 2022-09-01-anatomy-of-logs %}) of the log file in Filestash
