---
title: How to connect to S3 using an AWS role
layout: post
tags: guide s3
language: en
---


There's different way to create role on AWS depending on your use case:

<img class="fancy" src="/img/posts/2021-09-12-aws-role.png" />

In this post we'll explore a few ways Filestash can work with AWS role:
- [role of type AWS Service](#when-role-is-of-type-aws-service). Use case: you have an AWS role you want to attach to an EC2 instance that runs Filestash
- [role of type Another AWS Account](#when-role-is-of-type-another-aws-account). Use case: you were given a role you want to start using
- [role of type identity provider](#when-role-is-of-type-identity-provider)
- [role of type SAML](#when-role-is-of-type-saml)


## When role is of type AWS Service

**Step 1**: if this isn't already done, create a role for EC2 to call AWS service. This role should be set with the appropriate policy for your use case. For example:
<img class="fancy" src="/img/posts/2021-09-12-role-awsservice.png" />

**Step 2**: attach this role to an [EC2 instance](https://console.aws.amazon.com/ec2/v2/home#Instances:instanceState=running). Assuming you have an EC2 instance running, modify the IAM role and add the role defined above, in my case `FilestashTestOfTypeAWSService`:
<img class="fancy" src="/img/posts/2021-09-12-ec2-iam-role.png" />

**Step 3**: connect to your EC2 instance via SSH and run the following test using the AWS CLI to ensure everything is configured properly:
<div class="terminal">
<span class="prompt">[ec2-user@ip-172-31-31-239 ~]$ </span>aws s3 ls<br/>
<span class="stdout">
2018-07-18 13:27:57 example-bucket<br/>
2018-07-18 13:27:57 example-bucket2<br/>
2018-05-14 07:46:08 example-bucket3<br/>
</span>
</div>

**Step 4**: Install Filestash and run the S3 backend storage without providing neither the access key id nor the secret access key.


## When role is of type Another AWS account

The idea here is to ask AWS to generate some temporary credentials through `assumeRole`

**Assumption**:
1. you have a [ready to use role](#note-on-role-creation). For the sake of this guide, the role arn we will use is `arn:aws:iam::194524073938:role/FilestashTestOfTypeAnotherAWSAccount`.
2. The user is [authorised to perform](#assume-role-common-issue) `sts:AssumeRole` on this role

**Step 1**: from the AWS CLI, we will generate some temporary credentials you can use to switch role through [assume-role](https://docs.aws.amazon.com/cli/latest/reference/sts/assume-role.html)
<div class="terminal">
<span class="prompt">~/$ </span>export ROLE=arn:aws:iam::194524073938:role/FilestashTestOfTypeAnotherAWSAccount<br/>
<span class="prompt">~/$ </span>aws sts assume-role --role-arn $ROLE --role-session-name foobar
<br/>
<span class="stdout">
{<br/>
&nbsp;&nbsp;&nbsp;&nbsp;"Credentials": {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"AccessKeyId": "ASIAS2SUJZ7JDUCIIUO7",<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"SecretAccessKey": "jrEIGf/VHmxhHeW348ZEPIqFrjx2tjcU+sugJIuJ",<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"SessionToken": "FwoGZXIvYXdzEMX//////////wEaDGFtPJzzBfdYrNhSCSKqAZ1SgufgGCV0RJpumI+rXAX9TM4GyE3ejvsdus7nX2DwS0fOz2ycdL/ejLZjixF8+PUVvbGha3Cpu952n2D4HEFY3irU/GD6d/FYUzXGcdQkoJlUoziFYWln6zqlwG4bCeY6oOspS2uxvYh4o9QH96Yl644dI7FwqgUyXXiFnTEXGilyvcIKeUT5TOBXFp0Bu1sxZl1X3CWrIZxrvCpLLbIRP79iyCcgT1GOKN/c9YkGMi0C4YiJaWJF1OqRRJgHyuUexCEWx/4t8Dx5UBASTwbhozvVzwQzvLrLtumDMUs=",<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Expiration": "2021-09-12T04:05:03Z"<br/>
&nbsp;&nbsp;&nbsp;&nbsp;},<br/>
&nbsp;&nbsp;&nbsp;&nbsp;"AssumedRoleUser": {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"AssumedRoleId": "AROAS2SUJZ7JG2EORNIKC:foobar",</br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Arn": "arn:aws:sts::194524073938:assumed-role/FilestashTestOfTypeAnotherAWSAccount/foobar"<br/>
&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
}<br/>
</span>
</div>

<strong id="access-s3-with-temporary-credentials">Step2</strong>: you can now connect to S3 using the temporary credentials given by `access_key_id`, `secret_access_key` and the `session_token`:
<img class="fancy" src="/img/posts/2021-09-12-login-with-role.png" />


**Note**:
1. Those credentials are temporary and only last 1 hour by default. You might be able to request credentials that last for a different duration depending on the [setup of your role](https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html#API_AssumeRole_RequestParameters).
2. We can provide customers with plugins tailored for their uses that extends the base S3 and don't require the user to manually use the AWS CLI.

<strong id="assume-role-common-issue">Common Issue</strong>: when trying to assume the role, you might see the following error message:
<div class="terminal"><span class="stdout">
An error occurred (AccessDenied) when calling the AssumeRole operation:<br/>
User: arn:aws:iam::194524073938:user/filestash is not authorized to perform: sts:AssumeRole<br/>
on resource: arn:aws:iam::194524073938:role/FilestashTestOfTypeAnotherAWSAccount
</span></div>
To fix it, you need to create a policy that looks like this:
<img class="fancy" src="/img/posts/2021-09-12-sts-assume-role.png" />

<strong id="note-on-role-creation">Note on creating the role</strong>: if you are creating the role, AWS will ask for the `Account ID` that can use this role. This account ID is the 12 digit number you can find from:
<div class="terminal">
<span class="prompt">~/$ </span>aws sts get-caller-identity<br>
<span class="stdout">
{ <br/>
&nbsp;&nbsp;&nbsp;&nbsp;"UserId": "AIDAS2SUJZ7JPNCLVIWRT",<br/>
&nbsp;&nbsp;&nbsp;&nbsp;"Account": "194524073938",<br/>
&nbsp;&nbsp;&nbsp;&nbsp;"Arn": "arn:aws:iam::194524073938:user/filestash"<br/>
}<br/>
</span>
</div>


## When role is of type Identity Provider

The flow is explained in the [AWS doc](https://docs.aws.amazon.com/cli/latest/reference/sts/assume-role-with-web-identity.html):
<div class="terminal">
<span class="prompt">~/$ </span>aws sts assume-role-with-web-identity \<br/>
&nbsp;&nbsp;&nbsp;&nbsp;--duration-seconds 3600 \<br/>
&nbsp;&nbsp;&nbsp;&nbsp;--role-session-name "app1" \<br/>
&nbsp;&nbsp;&nbsp;&nbsp;--provider-id "www.amazon.com" \<br/>
&nbsp;&nbsp;&nbsp;&nbsp;--policy-arns "arn:aws:iam::123456789012:policy/q=webidentitydemopolicy1","arn:aws:iam::123456789012:policy/webidentitydemopolicy2" \<br/>
&nbsp;&nbsp;&nbsp;&nbsp;--role-arn arn:aws:iam::123456789012:role/FederatedWebIdentityRole \<br/>
&nbsp;&nbsp;&nbsp;&nbsp;--web-identity-token "Atza%7CIQEBLjAsAhRFiXuWpUXuRvQ9PZL3GMFcYevydwIUFAHZwXZXXXXXXXXJnrulxKDHwy87oGKPznh0D6bEQZTSCzyoCtL_8S07pLpr0zMbn6w1lfVZKNTBdDansFBmtGnIsIapjI6xKR02Yc_2bQ8LZbUXSGm6Ry6_BG7PrtLZtj_dfCTj92xNGed-CrKqjG7nPBjNIL016GGvuS5gSvPRUxWES3VYfm1wl7WTI7jn-Pcb6M-buCgHhFOzTQxod27L9CqnOLio7N3gZAGpsp6n1-AJBOCJckcyXe2c6uD0srOJeZlKUm2eTDVMf8IehDVI0r1QOnTV6KzzAI3OY87Vd_cVMQ"<br/>
<span class="stdout">
{<br/>
&nbsp;&nbsp;&nbsp;&nbsp;"AssumedRoleUser": {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"AssumedRoleId": "AROA3XFRBF535PLBIFPI4:s3-access-example",<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Arn": "arn:aws:sts::123456789012:assumed-role/xaccounts3access/s3-access-example"<br/>
&nbsp;&nbsp;&nbsp;&nbsp;},<br/>
&nbsp;&nbsp;&nbsp;&nbsp;"Credentials": {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"SecretAccessKey": "9drTJvcXLB89EXAMPLELB8923FB892xMFI",<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"SessionToken": "AQoXdzELDDY//////////wEaoAK1wvxJY12r2IrDFT2IvAzTCn3zHoZ7YNtpiQLF0MqZye/qwjzP2iEXAMPLEbw/m3hsj8VBTkPORGvr9jM5sgP+w9IZWZnU+LWhmg+a5fDi2oTGUYcdg9uexQ4mtCHIHfi4citgqZTgco40Yqr4lIlo4V2b2Dyauk0eYFNebHtYlFVgAUj+7Indz3LU0aTWk1WKIjHmmMCIoTkyYp/k7kUG7moeEYKSitwQIi6Gjn+nyzM+PtoA3685ixzv0R7i5rjQi0YE0lf1oeie3bDiNHncmzosRM6SFiPzSvp6h/32xQuZsjcypmwsPSDtTPYcs0+YN/8BRi2/IcrxSpnWEXAMPLEXSDFTAQAM6Dl9zR0tXoybnlrZIwMLlMi1Kcgo5OytwU=,"<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Expiration": "2016-03-15T00:05:07Z",<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"AccessKeyId": "ASIAJEXAMPLEXEG2JICEA"<br/>
&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
}
</span>
</div>

The given credentials can then be used like we did in this [part 2](#access-s3-with-temporary-credentials)

**Note**: Filestash can leverage this flow via a plugin that extends the base s3 plugin

## When role is of type SAML

The flow is explained in the [AWS doc](https://docs.aws.amazon.com/cli/latest/reference/sts/assume-role-with-saml.html):
<div class="terminal">
<span class="prompt">~/$ </span>aws sts assume-role-with-saml \<br/>
&nbsp;&nbsp;&nbsp;&nbsp;--role-arn arn:aws:iam::123456789012:role/TestSaml \<br/>
&nbsp;&nbsp;&nbsp;&nbsp;--principal-arn arn:aws:iam::123456789012:saml-provider/SAML-test \<br/>
&nbsp;&nbsp;&nbsp;&nbsp;--saml-assertion "VERYLONGENCODEDASSERTIONEXAMPLExzYW1sOkF1ZGllbmNlPmJsYW5rPC9zYW1sOkF1ZGllbmNlPjwvc2FtbDpBdWRpZW5jZVJlc3RyaWN0aW9uPjwvc2FtbDpDb25kaXRpb25zPjxzYW1sOlN1YmplY3Q+PHNhbWw6TmFtZUlEIEZvcm1hdD0idXJuOm9hc2lzOm5hbWVzOnRjOlNBTUw6Mi4wOm5hbWVpZC1mb3JtYXQ6dHJhbnNpZW50Ij5TYW1sRXhhbXBsZTwvc2FtbDpOYW1lSUQ+PHNhbWw6U3ViamVjdENvbmZpcm1hdGlvbiBNZXRob2Q9InVybjpvYXNpczpuYW1lczp0YzpTQU1MOjIuMDpjbTpiZWFyZXIiPjxzYW1sOlN1YmplY3RDb25maXJtYXRpb25EYXRhIE5vdE9uT3JBZnRlcj0iMjAxOS0xMS0wMVQyMDoyNTowNS4xNDVaIiBSZWNpcGllbnQ9Imh0dHBzOi8vc2lnbmluLmF3cy5hbWF6b24uY29tL3NhbWwiLz48L3NhbWw6U3ViamVjdENvbmZpcm1hdGlvbj48L3NhbWw6U3ViamVjdD48c2FtbDpBdXRoblN0YXRlbWVudCBBdXRoPD94bWwgdmpSZXNwb25zZT4="<br/>
<span class="stdout">
{<br/>
&nbsp;&nbsp;&nbsp;&nbsp;"Issuer": "https://integ.example.com/idp/shibboleth",<br/>
&nbsp;&nbsp;&nbsp;&nbsp;"AssumedRoleUser": {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Arn": "arn:aws:sts::123456789012:assumed-role/TestSaml",<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"AssumedRoleId": "ARO456EXAMPLE789:TestSaml"<br/>
&nbsp;&nbsp;&nbsp;&nbsp;},<br/>
&nbsp;&nbsp;&nbsp;&nbsp;"Credentials": {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"AccessKeyId": "ASIAV3ZUEFP6EXAMPLE",<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"SecretAccessKey": "8P+SQvWIuLnKhh8d++jpw0nNmQRBZvNEXAMPLEKEY",<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"SessionToken": "IQoJb3JpZ2luX2VjEOz////////////////////wEXAMPLEtMSJHMEUCIDoKK3JH9uGQE1z0sINr5M4jk+Na8KHDcCYRVjJCZEvOAiEA3OvJGtw1EcViOleS2vhs8VdCKFJQWPQrmGdeehM4IC1NtBmUpp2wUE8phUZampKsburEDy0KPkyQDYwT7WZ0wq5VSXDvp75YU9HFvlRd8Tx6q6fE8YQcHNVXAkiY9q6d+xo0rKwT38xVqr7ZD0u0iPPkUL64lIZbqBAz+scqKmlzm8FDrypNC9Yjc8fPOLn9FX9KSYvKTr4rvx3iSIlTJabIQwj2ICCR/oLxBA==",<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Expiration": "2019-11-01T20:26:47Z"<br/>
&nbsp;&nbsp;&nbsp;&nbsp;},<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Audience": "https://signin.aws.amazon.com/saml",<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"SubjectType": "transient",<br/>
&nbsp;&nbsp;&nbsp;&nbsp;"PackedPolicySize": "6",<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"NameQualifier": "SbdGOnUkh1i4+EXAMPLExL/jEvs=",<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Subject": "SamlExample"<br/>
}
</span>
</div>

The given credentials can then be used like we did in this [part 2](#access-s3-with-temporary-credentials)

**Note**: Filestash can leverage this flow via a plugin that extends the base s3 plugin

**ref**:
- https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRoleWithSAML.html
- https://docs.aws.amazon.com/cli/latest/reference/sts/assume-role-with-saml.html
