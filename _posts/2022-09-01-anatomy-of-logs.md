---
title: Anatomy of logs
description: The structure of logs in Filestash
layout: post
language: en
---

Logs in Filestash are organised around 3 dimensions:
1. [HTTP logs](#log-of-type-http)
2. [System logs](#system-logs)
3. [Audit logs](#audit-logs)

Each log line contained various elements separated by a space using this schema:
```
[DATE] [TIME] [LOG TYPE] ...

ref:
[DATE]: date when the information was collected
[TIME]: time the information was collected
[LOG TYPE]: ENUM('HTTP', 'SYST', 'AUDIT')
...: various things depending on the value of [LOG TYPE]
```

## Log of Type: HTTP
Example:
```
2022/08/31 23:16:58 HTTP 200 GET    0.3ms /api/files/ls?path=%2F
----1----- ----2--- -3-- -4- -5-    --5-- ----------6-----------
```

legend:
1. date
2. time
3. log type => HTTP
4. status code
5. http method
6. response time
7. request uri

## System Logs

System logs have different levels
```
2022/08/31 23:06:00 SYST DEBUG Plugin loader
2022/08/31 23:06:00 SYST INFO Filestash v0.5 starting
2022/08/31 23:06:00 SYST INFO [http] starting ...
2022/08/31 23:06:00 SYST INFO [http] listening on :8334
----1----- ---2---- -3-- --4- ----------5--------------
```

legend:
1. date
2. time
3. log type => System log
4. level: ENUM('DEBUG', 'INFO', 'WARN', 'ERROR')
5. message string

We use:
- ERROR level for issues that require the attention of the person who control the server
- WARN level for issues that would affect the user
- INFO level for general information about the running server
- DEBUG level to get the most information possible about what is going on. That level is particularly helpful to troubleshoot your Filestash instance

## Audit Logs

When enabled, audit logs look like this:
```
2022/08/31 23:06:00 AUDIT action[list] path[/] backend[ftp] session[foo] share[]
----1----- ---2---- --3-- -----------------------4------------------------------
```

legend:
1. date
2. time
3. log type => audit log
4. key/value pair which can be used to analyse who did what when and where alongside any dimension of interest. For example backend tells you where did the user did connect, be it an [s3 bucket]({% post_url 2019-11-21-s3-browser %}) or a [sftp server]({% post_url 2020-04-30-sftp-browser %}) and what action did they performed, ...


## Other things to know about logs

The default in Filestash is to send the logs on stdout and store a copy in the filesystem under `/app/data/state/log/access.log`. Plugins can overwrite that default if needed
