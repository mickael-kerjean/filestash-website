---
title: Writing a selfhosted software
description: What goes on creating selfhosted software? Insights onto my selfhosted journey
layout: post
language: en
---

I wouldn't have started working on Filestash if the selfhosted ecosystem had the tools I wanted and what I wanted was a selfhosted fast alternative to Dropbox. The objective was always and still is to make the fastest file browser there is and I've been working on that for quite some time already.

This post will be part of a serie that explore the many facets of making things fast and in this first episode we will explore one aspect of it: getting rid of loading spinner or how to make navigation on Dropbox feel faster than on dropbox.com itself?

You might think this is a fool errand but stay with me, when you navigate on any browser based file browser including Dropbox, you end up asking a server for a list of files/folder in a particular location and while the server is busy computing stuff you are shown a loading spinner.

This is a perfectly fine approach until you start jumping back and forth between folders you've already visited and still get to see this terrible spinner in folders you already know the content of ...

Why couldn't we get rid of the spinner when we already know the content of those folders you've already visited? How hard would it be to cache the content of a folder somewhere in your browser and get rid of that spinner?

Well this is the trick we've been using ever since the beginning to make it feel faster to navigate around than any other browser based file browser there is. Under the hood it works like this:


<!--
@startuml

Participant Browser
Participant Server
Participant Storage


Browser -> Server: list files & folders under "/home/"
Browser -> Browser: hey indexedDB, do you know about "/home/"?
Browser -> Browser: yes I do, here is the list of files & folders for "/home/"
Browser -> Browser: cool I will display that for now instead of showing a spinner
Server -> Storage: LIST /home/
Storage -> Server
Server -> Browser: here is the files & folders under "/home/"

Browser -> Browser: update the screen with the latest files/folders
Browser -> Browser: update the indexedDB cache with the latest files & folders
@enduml
-->

<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" contentStyleType="text/css" height="403px" preserveAspectRatio="none" style="width:572px;height:403px;background:#FFFFFF;" version="1.1" viewBox="0 0 572 403" width="572px" zoomAndPan="magnify"><defs/><g><line style="stroke:#181818;stroke-width:0.5;stroke-dasharray:5.0,5.0;" x1="41" x2="41" y1="36.2969" y2="368.3594"/><line style="stroke:#181818;stroke-width:0.5;stroke-dasharray:5.0,5.0;" x1="431.5" x2="431.5" y1="36.2969" y2="368.3594"/><line style="stroke:#181818;stroke-width:0.5;stroke-dasharray:5.0,5.0;" x1="530.5" x2="530.5" y1="36.2969" y2="368.3594"/><rect fill="#E2E2F0" height="30.2969" rx="2.5" ry="2.5" style="stroke:#181818;stroke-width:0.5;" width="72" x="5" y="5"/><text fill="#000000" font-family="sans-serif" font-size="14" lengthAdjust="spacing" textLength="58" x="12" y="24.9951">Browser</text><rect fill="#E2E2F0" height="30.2969" rx="2.5" ry="2.5" style="stroke:#181818;stroke-width:0.5;" width="72" x="5" y="367.3594"/><text fill="#000000" font-family="sans-serif" font-size="14" lengthAdjust="spacing" textLength="58" x="12" y="387.3545">Browser</text><rect fill="#E2E2F0" height="30.2969" rx="2.5" ry="2.5" style="stroke:#181818;stroke-width:0.5;" width="61" x="401.5" y="5"/><text fill="#000000" font-family="sans-serif" font-size="14" lengthAdjust="spacing" textLength="47" x="408.5" y="24.9951">Server</text><rect fill="#E2E2F0" height="30.2969" rx="2.5" ry="2.5" style="stroke:#181818;stroke-width:0.5;" width="61" x="401.5" y="367.3594"/><text fill="#000000" font-family="sans-serif" font-size="14" lengthAdjust="spacing" textLength="47" x="408.5" y="387.3545">Server</text><rect fill="#E2E2F0" height="30.2969" rx="2.5" ry="2.5" style="stroke:#181818;stroke-width:0.5;" width="71" x="495.5" y="5"/><text fill="#000000" font-family="sans-serif" font-size="14" lengthAdjust="spacing" textLength="57" x="502.5" y="24.9951">Storage</text><rect fill="#E2E2F0" height="30.2969" rx="2.5" ry="2.5" style="stroke:#181818;stroke-width:0.5;" width="71" x="495.5" y="367.3594"/><text fill="#000000" font-family="sans-serif" font-size="14" lengthAdjust="spacing" textLength="57" x="502.5" y="387.3545">Storage</text><polygon fill="#181818" points="420,63.4297,430,67.4297,420,71.4297,424,67.4297" style="stroke:#181818;stroke-width:1.0;"/><line style="stroke:#181818;stroke-width:1.0;" x1="41" x2="426" y1="67.4297" y2="67.4297"/><text fill="#000000" font-family="sans-serif" font-size="13" lengthAdjust="spacing" textLength="210" x="48" y="62.3638">list files &amp; folders under "/home/"</text><line style="stroke:#181818;stroke-width:1.0;" x1="41" x2="83" y1="96.5625" y2="96.5625"/><line style="stroke:#181818;stroke-width:1.0;" x1="83" x2="83" y1="96.5625" y2="109.5625"/><line style="stroke:#181818;stroke-width:1.0;" x1="42" x2="83" y1="109.5625" y2="109.5625"/><polygon fill="#181818" points="52,105.5625,42,109.5625,52,113.5625,48,109.5625" style="stroke:#181818;stroke-width:1.0;"/><text fill="#000000" font-family="sans-serif" font-size="13" lengthAdjust="spacing" textLength="294" x="48" y="91.4966">hey indexedDB, do you know about "/home/"?</text><line style="stroke:#181818;stroke-width:1.0;" x1="41" x2="83" y1="138.6953" y2="138.6953"/><line style="stroke:#181818;stroke-width:1.0;" x1="83" x2="83" y1="138.6953" y2="151.6953"/><line style="stroke:#181818;stroke-width:1.0;" x1="42" x2="83" y1="151.6953" y2="151.6953"/><polygon fill="#181818" points="52,147.6953,42,151.6953,52,155.6953,48,151.6953" style="stroke:#181818;stroke-width:1.0;"/><text fill="#000000" font-family="sans-serif" font-size="13" lengthAdjust="spacing" textLength="338" x="48" y="133.6294">yes I do, here is the list of files &amp; folders for "/home/"</text><line style="stroke:#181818;stroke-width:1.0;" x1="41" x2="83" y1="180.8281" y2="180.8281"/><line style="stroke:#181818;stroke-width:1.0;" x1="83" x2="83" y1="180.8281" y2="193.8281"/><line style="stroke:#181818;stroke-width:1.0;" x1="42" x2="83" y1="193.8281" y2="193.8281"/><polygon fill="#181818" points="52,189.8281,42,193.8281,52,197.8281,48,193.8281" style="stroke:#181818;stroke-width:1.0;"/><text fill="#000000" font-family="sans-serif" font-size="13" lengthAdjust="spacing" textLength="377" x="48" y="175.7622">cool I will display that for now instead of showing a spinner</text><polygon fill="#181818" points="519,218.9609,529,222.9609,519,226.9609,523,222.9609" style="stroke:#181818;stroke-width:1.0;"/><line style="stroke:#181818;stroke-width:1.0;" x1="432" x2="525" y1="222.9609" y2="222.9609"/><text fill="#000000" font-family="sans-serif" font-size="13" lengthAdjust="spacing" textLength="75" x="439" y="217.895">LIST /home/</text><polygon fill="#181818" points="443,232.9609,433,236.9609,443,240.9609,439,236.9609" style="stroke:#181818;stroke-width:1.0;"/><line style="stroke:#181818;stroke-width:1.0;" x1="437" x2="530" y1="236.9609" y2="236.9609"/><polygon fill="#181818" points="52,262.0938,42,266.0938,52,270.0938,48,266.0938" style="stroke:#181818;stroke-width:1.0;"/><line style="stroke:#181818;stroke-width:1.0;" x1="46" x2="431" y1="266.0938" y2="266.0938"/><text fill="#000000" font-family="sans-serif" font-size="13" lengthAdjust="spacing" textLength="260" x="58" y="261.0278">here is the files &amp; folders under "/home/"</text><line style="stroke:#181818;stroke-width:1.0;" x1="41" x2="83" y1="295.2266" y2="295.2266"/><line style="stroke:#181818;stroke-width:1.0;" x1="83" x2="83" y1="295.2266" y2="308.2266"/><line style="stroke:#181818;stroke-width:1.0;" x1="42" x2="83" y1="308.2266" y2="308.2266"/><polygon fill="#181818" points="52,304.2266,42,308.2266,52,312.2266,48,308.2266" style="stroke:#181818;stroke-width:1.0;"/><text fill="#000000" font-family="sans-serif" font-size="13" lengthAdjust="spacing" textLength="291" x="48" y="290.1606">update the screen with the latest files/folders</text><line style="stroke:#181818;stroke-width:1.0;" x1="41" x2="83" y1="337.3594" y2="337.3594"/><line style="stroke:#181818;stroke-width:1.0;" x1="83" x2="83" y1="337.3594" y2="350.3594"/><line style="stroke:#181818;stroke-width:1.0;" x1="42" x2="83" y1="350.3594" y2="350.3594"/><polygon fill="#181818" points="52,346.3594,42,350.3594,52,354.3594,48,350.3594" style="stroke:#181818;stroke-width:1.0;"/><text fill="#000000" font-family="sans-serif" font-size="13" lengthAdjust="spacing" textLength="373" x="48" y="332.2935">update the indexedDB cache with the latest files &amp; folders</text><!--SRC=[XP71ReCm44JlVCKeXvuISUVGIb4laNg8bFw0YvUmYkj5jYdbxxi16b2BnCdssZCx-tms8N79ZV49no1Tf92T5xKBXQ-_fIJ1N2dBiac0m_Fqhe3Zc52neuWdLE8iXOZMwu9TNiidvRkbRDeMgAa7wxDlig_7FQoWbnOtBntCXxJfeNvPbVVQxwIglHe50aUaciOmKltBKyb6cbB4gL_7pi5oR9pfrT2aGNdFn3ucClPk7clfs5zX41lsNc6DB0Og8we2RwVBEyQEsLISgIq42nxp61iuLoTe6siI3V9O1YAlmwHwfA8Nlv-KJvvR7e-lGMbAFQ-QpH5_0000]--></g></svg>

But this wasn't a simple thing to do, in fact it was one of those big technical decision that was taken early on and we had to make a ton of code to nicely handle all the edge cases to get things behaving properly when you move files/folder around, try to upload some stuff, ...

Some other things I think I got right is to stay away from any synchronous browser storage like localstorage which most people prefer because it's easy to use but have the major drawback of locking the main thread which as a result can easily degrade the performance.

If you ever need to go through something similar in your app, beware of the dragons. For some reasons Firefox doesn't allow application to store anything in indexedDB when using incognito mode, hence why we had to create another implementation that does the same thing than indexedDB but in memory, effectively resetting the cache when you refresh the page.

This is the end of the first episode, the next ones should be about:
- thumbnailing: how fast can it be? C to the rescue.
- architecture insight:
  - backend architecture: core + plugins
  - leveraging streams for faster software
  - language choice: golang and plain javascript, a no framework approach to things
