---
layout: default
permalink: /
---

{% assign strings = site.data.strings.index %}

<h2>{{strings.title}}</h2>

{{strings.introduction}}

<div class="download-and-screenshot">
    <div class="download">
        <div class="button">
            <a class="material-button" href="https://f-droid.org/FDroid.apk">{{ strings.download_fdroid }}</a>
        </div>
        <div class="gpg">
            <a href="https://f-droid.org/FDroid.apk.asc">{{ strings.gpg_signature }}</a>
        </div>
        <div class="qr">
            <img src="{{ site.baseurl }}/assets/download-fdroid-qr.png" />
        </div>
    </div>
    <div class="screenshot">
        <img
            src="assets/phone-frame.png"
            style="background: url('{{ site.baseurl }}/{% fdroid_screenshot %}') center center no-repeat; background-size: 78% auto" />
    </div>
</div>
