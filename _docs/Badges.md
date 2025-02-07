---
layout: page
title: Get it on F-Droid Badges

---

The Get it on F-Droid badge is available in PNG and SVG format in
several languages.

<img src="https://f-droid.org/badge/get-it-on.png"
    alt="Get it on F-Droid"
    height="80">

The English badge is available at `https://f-droid.org/badge/get-it-on.png`
in PNG format and at `https://f-droid.org/badge/get-it-on.svg` in SVG
format.

### Localized badges

Localized badges are available at https://f-droid.org/badge/get-it-on-xx.png in PNG format and
at https://f-droid.org/badge/get-it-on-xx.svg in SVG format, where `xx` is a locale in
<https://gitlab.com/fdroid/artwork/-/tree/master/badge/src>.

For instance:

<img src="https://f-droid.org/badge/get-it-on-ja.png" height="80">
<img src="https://f-droid.org/badge/get-it-on-he.png" height="80">

Localization of the badges is handled via Weblate at
<https://hosted.weblate.org/projects/f-droid/badge/>.

### Linking to an app

HTML:

```html
<a href="https://f-droid.org/packages/YOUR.APP.ID">
    <img src="https://f-droid.org/badge/get-it-on.png"
    alt="Get it on F-Droid"
    height="80">
</a>
```

Markdown:

```markdown
[<img src="https://f-droid.org/badge/get-it-on.png"
    alt="Get it on F-Droid"
    height="80">](https://f-droid.org/packages/YOUR.APP.ID)
```

### Source code and license

The source code of the badges and the scripts used to generate them is
available at <https://gitlab.com/fdroid/artwork>. 

The badges are licensed CC-BY-SA-3.0 and the scripts GPL-3.0-or-later.

### Third-party F-Droid repositories

These badges are intended to be used to point to apps in the main
F-Droid repository.

For third-party F-Droid repositories, a landing page with instruction to
add the repository via a QR code is recommended.

For instance:

* <https://guardianproject.info/fdroid/>
* <https://microg.org/fdroid.html>
* <https://grobox.de/fdroid/>
* <https://briarproject.org/fdroid.html>
