---
layout: default
permalink: /
---

{% assign strings = site.data.strings.index %}

## {{strings.title}}

{{strings.introduction}}

**[{{strings.download_fdroid}}](https://f-droid.org/FDroid.apk){:class="material-button"}**
[{{strings.gpg_signature}}](https://f-droid.org/FDroid.apk.asc)

<img
    src="assets/phone-frame.png"
    style="background: url('{% fdroid_screenshot %}') center center no-repeat; background-size: 78% auto" />
