---
title: Benchmark
layout: post
language: en
---

Filestash has very light requirement when it comes to hardware. We made some experiments using SFTP (using openssh server) and performed some benchmark using the apache benchmark tool for different type of queries:
- Static file: measure of the througput when requesting a static asset (eg: index.html)
- List file: measure of the throughput when requesting a folder content
- Transcode image: measure of the throughput when asking for a thumbnail

<!--
```
docker run -ti --cpuset-cpus=0 --memory 32M --net=host -v /home/mickael/Documents/projects/go/src/github.com/mickael-kerjean/filestash/dist:/app/ --name debian_runner32 debian:stretch bash

docker run -ti --cpuset-cpus=0,1 --memory 128M --net=host -v /home/mickael/Documents/projects/go/src/github.com/mickael-kerjean/filestash/dist:/app/ --name debian_runner128 debian:stretch bash

docker run -ti --cpuset-cpus=0,1,2,3 --memory 512M --net=host -v /home/mickael/Documents/projects/go/src/github.com/mickael-kerjean/filestash/dist:/app/ --name debian_runner512 debian:stretch bash
```

```
ab -k -c 5 -n 1000 http://127.0.0.1:8334/

ab -k -c 80 -n 1000 -H "X-Requested-With: XmlHttpRequest" -H "Cookie: auth=xxx;" http://127.0.0.1:8334/api/files/ls?path=%2F

ab -k -c 80 -n 1000 -H "X-Requested-With: XmlHttpRequest" -H "Cookie: auth=xxx;" http://127.0.0.1:8334/api/files/cat?path=%2Fhome%2Fmickael%2FDesktop%2Fscreenshot_20190424_200826.png&thumbnail=true
```
-->


**32MB of RAM on 1 core:**
```
|----------------------+-------------+------------+-----------------|
| Level of concurrency | Static file | List files | Transcode image |
|----------------------+-------------+------------+-----------------|
|                    1 | 3000 req/s  | 1357 req/s | 284 req/s       |
|                    5 | 4120 req/s  | 2373 req/s | 364 req/s       |
|                   10 | 4135 req/s  | 2504 req/s | 374 req/s       |
|                   20 | 4316 req/s  | 2492 req/s | 394 req/s       |
|                   50 | 4207 req/s  | 2723 req/s | 344 req/s       |
|                  100 | 4146 req/s  | 2735 req/s | failed          |
|                  500 | 4156 req/s  | 1767 req/s | failed          |
|                 1000 | 4048 req/s  | failed     | failed          |
|----------------------+-------------+------------+-----------------|
```
**128MB of RAM on 2 cores:**
```
|----------------------+-------------+------------+-----------------|
| Level of concurrency | Static file | List files | Transcode image |
|----------------------+-------------+------------+-----------------|
|                    1 | 3101 req/s  | 1322 req/s | 290 req/s       |
|                    5 | 5288 req/s  | 2449 req/s | 432 req/s       |
|                   10 | 5639 req/s  | 2742 req/s | 458 req/s       |
|                   20 | 5858 req/s  | 3015 req/s | 488 req/s       |
|                   50 | 6152 req/s  | 3323 req/s | 554 req/s       |
|                  100 | 6235 req/s  | 3690 req/s | 566 req/s       |
|                  500 | 6117 req/s  | 4012 req/s | failed          |
|                 1000 | 6138 req/s  | 4126 req/s | failed          |
|----------------------+-------------+------------+-----------------|
```
**512MB of RAM on 4 cores:**
```
|----------------------+-------------+------------+-----------------|
| Level of concurrency | Static file | List files | Transcode image |
|----------------------+-------------+------------+-----------------|
|                    1 | 3069 req/s  | 1336 req/s | 280 req/s       |
|                    5 | 5664 req/s  | 2970 req/s | 412 req/s       |
|                   10 | 5833 req/s  | 3523 req/s | 453 req/s       |
|                   20 | 5936 req/s  | 3953 req/s | 478 req/s       |
|                   50 | 5860 req/s  | 4124 req/s | 508 req/s       |
|                  100 | 5564 req/s  | 3282 req/s | 536 req/s       |
|                  500 | 5863 req/s  | 3554 req/s | 545 req/s       |
|                 1000 | 5826 req/s  | 3481 req/s | 449 req/s       |
|----------------------+-------------+------------+-----------------|
```
-----------------------------------------

**On a Lenovo X270: i5  4 cores and 8GB of RAM**

**10 concurrent connection**

`ab -k -c 10 -n 50000 http://127.0.0.1:8334/`

```
Server Software:        
Server Hostname:        127.0.0.1
Server Port:            8334

Document Path:          /
Document Length:        11413 bytes

Concurrency Level:      10
Time taken for tests:   8.553 seconds
Complete requests:      50000
Failed requests:        0
Keep-Alive requests:    0
Total transferred:      581500000 bytes
HTML transferred:       570650000 bytes
Requests per second:    5845.90 [#/sec] (mean)
Time per request:       1.711 [ms] (mean)
Time per request:       0.171 [ms] (mean, across all concurrent requests)
Transfer rate:          66394.38 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.1      0       3
Processing:     0    2   1.2      1      29
Waiting:        0    1   0.9      1      23
Total:          0    2   1.2      1      29

Percentage of the requests served within a certain time (ms)
  50%      1
  66%      2
  75%      2
  80%      2
  90%      3
  95%      4
  98%      5
  99%      6
 100%     29 (longest request)
```

**100 concurrent connection**

`ab -k -c 100 -n 50000 http://127.0.0.1:8334/`:

```
Server Software:        
Server Hostname:        127.0.0.1
Server Port:            8334

Document Path:          /
Document Length:        11413 bytes

Concurrency Level:      100
Time taken for tests:   7.926 seconds
Complete requests:      50000
Failed requests:        0
Keep-Alive requests:    0
Total transferred:      581500000 bytes
HTML transferred:       570650000 bytes
Requests per second:    6308.11 [#/sec] (mean)
Time per request:       15.853 [ms] (mean)
Time per request:       0.159 [ms] (mean, across all concurrent requests)
Transfer rate:          71643.87 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    1   1.1      1      16
Processing:     0   15  10.2     13     112
Waiting:        0   10   7.9      8     109
Total:          0   16  10.2     14     112

Percentage of the requests served within a certain time (ms)
  50%     14
  66%     18
  75%     21
  80%     23
  90%     29
  95%     35
  98%     42
  99%     48
 100%    112 (longest request)
```

peak RAM: 55MB


**1000 concurrent connection**

`ab -k -c 1000 -n 50000 http://127.0.0.1:8334/`

```
Server Software:        
Server Hostname:        127.0.0.1
Server Port:            8334

Document Path:          /
Document Length:        11413 bytes

Concurrency Level:      1000
Time taken for tests:   8.596 seconds
Complete requests:      50000
Failed requests:        0
Keep-Alive requests:    0
Total transferred:      581500000 bytes
HTML transferred:       570650000 bytes
Requests per second:    5816.75 [#/sec] (mean)
Time per request:       171.917 [ms] (mean)
Time per request:       0.172 [ms] (mean, across all concurrent requests)
Transfer rate:          66063.31 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0  104 367.3      1    3187
Processing:     0   49  53.2     35     527
Waiting:        0   38  51.5     22     527
Total:          0  153 384.8     38    3382

Percentage of the requests served within a certain time (ms)
  50%     38
  66%     55
  75%     72
  80%     86
  90%    194
  95%   1071
  98%   1243
  99%   1389
 100%   3382 (longest request)
```
peak RAM: 71MB


**4000 concurrent connection**

`ab -k -c 3000 -n 50000 http://127.0.0.1:8334/`

```
Server Software:        
Server Hostname:        127.0.0.1
Server Port:            8334

Document Path:          /
Document Length:        11413 bytes

Concurrency Level:      4000
Time taken for tests:   14.842 seconds
Complete requests:      50000
Failed requests:        0
Keep-Alive requests:    0
Total transferred:      581500000 bytes
HTML transferred:       570650000 bytes
Requests per second:    3368.73 [#/sec] (mean)
Time per request:       1187.390 [ms] (mean)
Time per request:       0.297 [ms] (mean, across all concurrent requests)
Transfer rate:          38260.12 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0  421 888.9      2    7285
Processing:     0  162 439.8     71   13601
Waiting:        0  147 439.3     50   13601
Total:          0  584 1111.2    115   14627

Percentage of the requests served within a certain time (ms)
  50%    115
  66%    326
  75%   1060
  80%   1095
  90%   1300
  95%   2007
  98%   3776
  99%   4870
 100%  14627 (longest request)
```
peak RAM: 96MB


**API call to list file within a directory using openssh-server in the same machine**

```
ab -k -c 1000 -n 100000 -H "X-Requested-With: XmlHttpRequest" -H "Cookie: xxxxx" http://127.0.0.1:8334/api/files/ls?path=%2F
```

```
Server Software:        
Server Hostname:        127.0.0.1
Server Port:            8334

Document Path:          /api/files/ls?path=%2F
Document Length:        1344 bytes

Concurrency Level:      1000
Time taken for tests:   28.417 seconds
Complete requests:      100000
Failed requests:        0
Keep-Alive requests:    100000
Total transferred:      160800000 bytes
HTML transferred:       134400000 bytes
Requests per second:    3518.99 [#/sec] (mean)
Time per request:       284.172 [ms] (mean)
Time per request:       0.284 [ms] (mean, across all concurrent requests)
Transfer rate:          5525.91 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    1  22.8      0    1027
Processing:    20  283  40.7    281    1211
Waiting:        1  283  40.7    281    1211
Total:         20  284  47.0    281    1318

Percentage of the requests served within a certain time (ms)
  50%    281
  66%    291
  75%    298
  80%    303
  90%    316
  95%    330
  98%    351
  99%    365
 100%   1318 (longest request)
```
peak RAM: 108MB
