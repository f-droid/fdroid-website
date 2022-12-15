---
author: F-Droid
title: Update to app descriptions
layout: post
---

F-Droid aims to give app developers a nice way to present their apps to users.  Each app can include descriptions, related metadata, and [translations](https://docs.weblate.org/en/latest/formats.html#appstore).  We have just updated the list of HTML formatting tags that are allowed in app descriptions to make it clearer what works and what does not.  This should make it easier to sync the description texts with other app stores that also allow some HTML.  There are two key [changes](https://gitlab.com/fdroid/jekyll-fdroid/-/merge_requests/77) to the website generation:

* Disallowed HTML tags are now automatically removed ("stripped"), whereas before they were escaped (e.g. `&lt;script&gt;`).
* The list of [allowed tags]({{ site.baseurl }}/docs/All_About_Descriptions_Graphics_and_Screenshots#html-descriptions) is now strictly enforced.

This change was prompted by some security [issues](https://rubysec.com/advisories/CVE-2022-23515/) in Loofah, the tool we rely on to strip dangerous HTML from the app descriptions.  f-droid.org uses multiple layers of defense, that greatly limits the scope of security vulnerabilities.  For example, this site includes a [Content Security Policy](https://gitlab.com/fdroid/fdroid-website/-/blob/dee66df9ba5c9bc5608d2292a456615e005c33c9/.htaccess#L321) that disables the most dangerous features, and [limits](https://observatory.mozilla.org/analyze/f-droid.org) the rest to URLs that are part of this site.

For those interested in the technical details: HTML allows data blobs to be included inline via the `data:` scheme.  That can then be abused to load malicious things.  Loofah was not properly handling those.  This site's Content Security Policy already disallows all uses of `data:`, so it was not an issue here.  The `self` keyword means "[only allow resources from the current origin](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy#self)", and that is `https://f-droid.org`.
