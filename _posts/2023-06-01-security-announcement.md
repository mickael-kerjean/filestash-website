---
title: Security Annoucement - Disclosure of Admin bcrypt Hash
description: Disclosure of Admin bcrypt Hash
layout: post
language: en
---

## Impact

=plg_authenticate_admin= did expose the bcrypt hash of the password when accessing a public endpoint part of Filestash core. This plugin is installed in the AGPL release by default. A potential threat actor can use this vulnerability to get the admin bcrypt hash and perform brute force type of attacks to find the password, circumventing the rate limiting that is currently in place to prevent this type of attack in the first place.

We have gone through all the opt in telemetry data and haven't seen any exploit of this issue in the wild.

## Patches

The issue was fix in 2 ways:
- we've hidden the relevant data from the plg_authenticate_admin plugin
- we've added a couple failsafe in the core to ensure that even if someone tries to expose sensitive data via an authentication plugin, this information won't be visible from that endpoint


## References

The vulnerability was reported by: Daniel Abeles daniel@oxeye.io, Gal Goldshtein gal@oxeye.io
Thank you to them
