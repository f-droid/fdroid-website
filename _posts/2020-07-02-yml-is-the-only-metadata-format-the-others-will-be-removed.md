---
layout: post
title: .yml is the only metadata format, the others will be removed
author: "F-Droid"
---

Back in September, we [announced]({{ site.baseurl }}/{% post_url 2019-09-11-yaml-metadata %})
that the F-Droid ecosystem is moving fully to YAML formats.  That
means the old `.txt` custom metadata format as well as the JSON
metadata format will be entirely removed from all the tools, like
_fdroidserver_.  The upcoming 2.0 release of _fdroidserver_ will only
support `.yml` metadata files.

Now is the time to convert!  Thanks to the hard work of
[@uniqx](https://chaos.social/@uniq) and others, it is easy:

```console
$ fdroid rewritemeta --to yml
```

The `.txt.` and `.json` formats will only be available in
_fdroidserver_ 1.1.x releases from here on out.
