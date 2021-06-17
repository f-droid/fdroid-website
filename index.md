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
            <a id="fdroid-download" data-donate-link="{{ site.baseurl }}/donate" class="material-button" href="{{ site.fdroid_apk_download_url }}">{{ strings.download_fdroid }}</a>
        </div>
        <div class="gpg">
            <a href="{{ site.fdroid_apk_download_url }}.asc">{{ strings.gpg_signature }}</a>
        </div>
        <div class="qr">
            <img src="{% asset download-fdroid-qr.png %}" />
        </div>
    </div>
    <div class="screenshot">
        <img
            src="{% asset phone-frame.png %}" alt="{{ strings.screenshot }}"
            style="background: url('{{ site.baseurl }}/{% fdroid_screenshot %}') center center no-repeat; background-size: 78% auto" />
    </div>
</div>

<script src="{% asset donate.js %}"></script>
