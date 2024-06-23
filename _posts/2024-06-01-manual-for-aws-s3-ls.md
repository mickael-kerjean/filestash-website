---
title: AWS S3 LS Manual
description: The Manual page for aws s3 ls
layout: post
language: en
head:
  - <link rel="stylesheet" href="/css/guide.css">

---

<div id="toc">
    <ol>
        <li><a href="#name">Name</a></li>
        <li><a href="#description">Description</a></li>
        <li><a href="#synopsis">Synopsis</a></li>
        <li><a href="#examples">Examples</a></li>
    </ol>
</div>

```
LS()                                                                      LS()
```


## NAME
```
       ls -
```

## DESCRIPTION
```
       List  S3  objects and common prefixes under a prefix or all S3 buckets.
       Note that the --output and --no-paginate arguments are ignored for this
       command.
```

## SYNOPSIS
```
       ls
          <S3Uri> or NONE
          [--recursive]
          [--page-size <value>]
          [--human-readable]
          [--summarize]
          [--request-payer <value>]
          [--debug]
          [--endpoint-url <value>]
          [--no-verify-ssl]
          [--no-paginate]
          [--output <value>]
          [--query <value>]
          [--profile <value>]
          [--region <value>]
          [--version <value>]
          [--color <value>]
          [--no-sign-request]
          [--ca-bundle <value>]
          [--cli-read-timeout <value>]
          [--cli-connect-timeout <value>]
          [--cli-binary-format <value>]
          [--no-cli-pager]
          [--cli-auto-prompt]
          [--no-cli-auto-prompt]

OPTIONS
       paths (string)

       --recursive  (boolean) Command is performed on all files or objects un-
       der the specified directory or prefix.

       --page-size (integer) The number of results to return in each  response
       to  a  list operation. The default value is 1000 (the maximum allowed).
       Using a lower value may help if an operation times out.

       --human-readable (boolean) Displays file sizes in human  readable  for-
       mat.

       --summarize  (boolean) Displays summary information (number of objects,
       total size).

       --request-payer (string) Confirms that the requester  knows  that  they
       will  be  charged  for the request. Bucket owners need not specify this
       parameter in their requests. Documentation on downloading objects  from
       requester       pays       buckets       can      be      found      at
       http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html

GLOBAL OPTIONS
       --debug (boolean)

       Turn on debug logging.

       --endpoint-url (string)

       Override command's default URL with the given URL.

       --no-verify-ssl (boolean)

       By  default, the AWS CLI uses SSL when communicating with AWS services.
       For each SSL connection, the AWS CLI will verify SSL certificates. This
       option overrides the default behavior of verifying SSL certificates.

       --no-paginate (boolean)

       Disable automatic pagination.

       --output (string)

       The formatting style for command output.

       o json

       o text

       o table

       o yaml

       o yaml-stream

       --query (string)

       A JMESPath query to use in filtering the response data.

       --profile (string)

       Use a specific profile from your credential file.

       --region (string)

       The region to use. Overrides config/env settings.

       --version (string)

       Display the version of this tool.

       --color (string)

       Turn on/off color output.

       o on

       o off
       o auto

       --no-sign-request (boolean)

       Do  not  sign requests. Credentials will not be loaded if this argument
       is provided.

       --ca-bundle (string)

       The CA certificate bundle to use when verifying SSL certificates. Over-
       rides config/env settings.

       --cli-read-timeout (int)

       The  maximum socket read time in seconds. If the value is set to 0, the
       socket read will be blocking and not timeout. The default value  is  60
       seconds.

       --cli-connect-timeout (int)

       The  maximum  socket connect time in seconds. If the value is set to 0,
       the socket connect will be blocking and not timeout. The default  value
       is 60 seconds.

       --cli-binary-format (string)

       The formatting style to be used for binary blobs. The default format is
       base64. The base64 format expects binary blobs  to  be  provided  as  a
       base64  encoded string. The raw-in-base64-out format preserves compati-
       bility with AWS CLI V1 behavior and binary values must be passed liter-
       ally.  When  providing  contents  from a file that map to a binary blob
       fileb:// will always be treated as binary and use the file contents di-
       rectly  regardless of the cli-binary-format setting. When using file://
       the file contents will need to properly formatted  for  the  configured
       cli-binary-format.

       o base64

       o raw-in-base64-out

       --no-cli-pager (boolean)

       Disable cli pager for output.

       --cli-auto-prompt (boolean)

       Automatically prompt for CLI input parameters.

       --no-cli-auto-prompt (boolean)

       Disable automatically prompt for CLI input parameters.
```

## EXAMPLES
```
       NOTE:
          To  use  the following examples, you must have the AWS CLI installed
          and configured. See the Getting started guide in the  AWS  CLI  User
          Guide for more information.

          Unless  otherwise  stated,  all  examples  have  unix-like quotation
          rules. These examples will need to be  adapted  to  your  terminal's
          quoting rules. See Using quotation marks with strings in the AWS CLI
          User Guide .

       Example 1: Listing all user owned buckets

       The following ls command lists all of the bucket owned by the user.  In
       this  example,  the  user owns the buckets mybucket and mybucket2.  The
       timestamp is the date the bucket was created, shown in  your  machine's
       time  zone.   This  date can change when making changes to your bucket,
       such as editing its bucket policy.  Note if  s3:// is used for the path
       argument <S3Uri>, it will list all of the buckets as well:

          aws s3 ls

       Output:

          2013-07-11 17:08:50 mybucket
          2013-07-24 14:55:44 mybucket2

       Example 2: Listing all prefixes and objects in a bucket

       The  following  ls  command  lists  objects and common prefixes under a
       specified bucket and prefix.  In this example, the user owns the bucket
       mybucket  with the objects test.txt and somePrefix/test.txt.  The Last-
       WriteTime and Length are arbitrary. Note that since the ls command  has
       no  interaction  with the local filesystem, the s3:// URI scheme is not
       required to resolve ambiguity and may be omitted:

          aws s3 ls s3://mybucket

       Output:

                                     PRE somePrefix/
          2013-07-25 17:06:27         88 test.txt

       Example 3: Listing all prefixes and objects in a  specific  bucket  and
       prefix

       The  following  ls  command  lists  objects and common prefixes under a
       specified bucket and prefix.  However, there are no objects nor  common
       prefixes under the specified bucket and prefix:

          aws s3 ls s3://mybucket/noExistPrefix

       Output:

          None

       Example 4: Recursively listing all prefixes and objects in a bucket

       The  following  ls  command  will recursively list objects in a bucket.
       Rather than showing PRE dirname/ in the output, all the  content  in  a
       bucket will be listed in order:

          aws s3 ls s3://mybucket --recursive

       Output:

       The  following  ls  command  will recursively list objects in a bucket.
       Rather than showing PRE dirname/ in the output, all the  content  in  a
       bucket will be listed in order:

          aws s3 ls s3://mybucket --recursive

       Output:

          2013-09-02 21:37:53         10 a.txt
          2013-09-02 21:37:53    2863288 foo.zip
          2013-09-02 21:32:57         23 foo/bar/.baz/a
          2013-09-02 21:32:58         41 foo/bar/.baz/b
          2013-09-02 21:32:57        281 foo/bar/.baz/c
          2013-09-02 21:32:57         73 foo/bar/.baz/d
          2013-09-02 21:32:57        452 foo/bar/.baz/e
          2013-09-02 21:32:57        896 foo/bar/.baz/hooks/bar
          2013-09-02 21:32:57        189 foo/bar/.baz/hooks/foo
          2013-09-02 21:32:57        398 z.txt

       Example 5: Summarizing all prefixes and objects in a bucket

       The  following ls command demonstrates the same command using the --hu-
       man-readable and --summarize options.  --human-readable  displays  file
       size  in  Bytes/MiB/KiB/GiB/TiB/PiB/EiB. --summarize displays the total
       number of objects and total size at the end of the result listing:

          aws s3 ls s3://mybucket --recursive --human-readable --summarize

       Output:

          2013-09-02 21:37:53   10 Bytes a.txt
          2013-09-02 21:37:53  2.9 MiB foo.zip
          2013-09-02 21:32:57   23 Bytes foo/bar/.baz/a
          2013-09-02 21:32:58   41 Bytes foo/bar/.baz/b
          2013-09-02 21:32:57  281 Bytes foo/bar/.baz/c
          2013-09-02 21:32:57   73 Bytes foo/bar/.baz/d
          2013-09-02 21:32:57  452 Bytes foo/bar/.baz/e
          2013-09-02 21:32:57  896 Bytes foo/bar/.baz/hooks/bar
          2013-09-02 21:32:57  189 Bytes foo/bar/.baz/hooks/foo
          2013-09-02 21:32:57  398 Bytes z.txt

          Total Objects: 10
             Total Size: 2.9 MiB

       Example 6: Listing from an S3 access point

       The following ls command list  objects  from  access  point  (myaccess-
       point):

          aws s3 ls s3://arn:aws:s3:us-west-2:123456789012:accesspoint/myaccesspoint/

       Output:

                                     PRE somePrefix/
          2013-07-25 17:06:27         88 test.txt

```

```
                                                                          LS()
(END)
```
