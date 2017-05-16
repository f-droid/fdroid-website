---
layout: page
title: Contribute
permalink: /contribute/
---
The project is entirely developed and maintained by volunteers. You can help in the following ways:

### Report Problems

If you experience problems with the site or client software, you can report them in the issue tracker (see below), or discuss them in the [Forum](https://forum.f-droid.org/) or on IRC (#fdroid on freenode).

For reporting issues, choose an appropriate tracker from the following:

* [F-Droid client app](https://gitlab.com/fdroid/fdroidclient/issues)
* [Server and build tools](https://gitlab.com/fdroid/fdroidserver/issues)
* [Official F-Droid repository metadata](https://gitlab.com/fdroid/fdroiddata/issues)

### Submit Applications

If you see an application missing from the repository (after reading the [inclusion policy](http://f-droid.org/wiki/page/Inclusion_Policy)), please feel free to submit it via the dedicated [Submission Queue](https://gitlab.com/fdroid/rfp/issues) section of the forum. If you have the technical skills required, you can also put together the relevant metadata and submit that via the git repository, which will drastically speed up the inclusion of the application.

[The manual]({{ "/manual/" | prepend: site.baseurl }}) should help with this.

### Translate

The client application is available in many languages, but if yours is not included, or if it needs updating or improving, please create an account and use the [translation system](https://hosted.weblate.org/projects/f-droid/) to make your changes.

Start with the overview of [Translation and Localization](docs/Translation_and_Localization).  There’s also a [dedicated forum section](https://forum.f-droid.org/c/translation) for translation discussions.

### Help with Development

There are four git repositories hosted at Gitlab –
one for the [Android client application](https://gitlab.com/fdroid/fdroidclient),
one for the [server tools](https://gitlab.com/fdroid/fdroidserver) for running a repository and building/installing applications locally,
and one for the associated [metadata files for applications in the main F-Droid repository](https://gitlab.com/fdroid/fdroiddata).
The last repo is handling [website and documentation](https://gitlab.com/fdroid/fdroid-website).
The easiest way to contribute to development is to make clones of these projects and submit merge requests.
If you are making large changes,
it would be good to discuss them on IRC or in the forum first,
to ensure they fit with the direction of the project,
and do not clash with or duplicate work already in development.

For working with the server and data projects, it’s a good idea to read [the manual]({{ "/manual/" | prepend: site.baseurl }}).
