---
layout: page
title: Support
---

- report an issue or bug on our [issue tracker](https://github.com/mickael-kerjean/filestash/issues)
- community based support in our official IRC channel on Freenode: `#filestash`

It would go a long way [to become a Patreon](https://www.patreon.com/mickaelk). Also you can contact [us](mailto:mickael@kerjean.me) for any other enquiries.


## Contribute to the project

Provide code or becoming a Patreon isn't the only way you can help this project. You can also:

1. Improve the documentation: This website you are reading can be edit straight from the github interface.
2. Report bugs on [our github](http://github.com/mickael-kerjean/filestash)
3. Be active on our freenode IRC channel: `#filestash`

## FAQ

### My server provider only support PHP based applications, is that ok?

No. Plus, if you run one of those archaic things, it's time for you to upgrade to an actual server.

### What happens to my credentials? 

Credentials are stored client's side using a http only cookie that's encrypted and authenticated. Unless you use the share feature for which Filestash is forced to store an encrypted version of your credentials, nothing is kept server side.

### Why don't you support ubuntu, debian, centos, rhel, fedora, arch, ... ?

There's support for many linux distribution but those installers are only provided to my patreons. For everyone else, you can use docker to install Filestash.

### Why did filestash got developed?

Filestash [original author](https://mickael-kerjean.me) couldn't find an open source file sharing service he was happy with, something that:
1. Only focus on solving the problem "Managing your data in a cloud you control" and do it well
2. Doesn't try to own your data but let you sit on the shoulders of giant (eg: many FTP and SFTP servers that have been battles tested for decades, PAM for authentication, the access right of a linux server)
3. has a user interface that doesn't feel like a second class citizen compared to Dropbox or Google Drive
4. is fast and not bloated whilst being open source
