---
layout: documentation
title: API
language: en
order: 4
---

Filestash has a powerfull Rest API that interact with any storage in a transparent manner. For example, the endpoint to list files returns results like this:
```
{
    "status": "ok",
    "results": [
        {
            "name": "README.org",
            "type": "file",
            "size": 281,
            "time": 1591432761000
        },
        {
            "name": "Documents",
            "type": "directory",
            "size": 0,
            "time": 1591432774000
        }
    ]
}
```

There's different endpoints for any file operation you could think of from listing files, download something, upload something, create files and directory, rename or delete anything anywhere. 

Documenting things takes time and making it easier to use for general usage is a bigger task, I will only get to do this if 100 persons are showing interests by giving a thumb up on [this github issue](https://github.com/mickael-kerjean/filestash/issues/503)

<!--
Idea for SDK?

const remote = new Filestash({"type": "ftp", "hostname": "ftp.slackware.com"})
remote.setInstance("http://test.com", "api_key");

remote.list("/") -> IResult
remote.download("/test/output.txt") stream
remote.upload("/test/input.txt", stream) ok
remote.touch("/test/.txt") ok
remote.mkdir("/test/folder/") ok
remote.remove("/test/") ok
remote.rename("/test/test.txt", "/test/test2.txt") ok
-->
