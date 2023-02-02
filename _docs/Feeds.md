---
layout: page
title: Feeds

---

### News

Sometimes there is a newsworthy item (submissions welcome!) or client release and details get posted on the blog: <https://f-droid.org/news/>.

### Builds

Find out the build status of the APKs on: <https://monitor.f-droid.org/builds>.

### Source Code

If you have an account on GitLab you can watch the F-Droid repos, or subscribe to atom feeds for them. A feed including actions from all fdroid repositories is available at <https://gitlab.com/fdroid.atom>.

### Forums

You can subscribe to new [forum](https://forum.f-droid.org/) posts and threads via the following URLs:

* <https://forum.f-droid.org/posts.rss>
* <https://forum.f-droid.org/latest.rss>

### Bugs and Suggestions

<https://gitlab.com/fdroid/fdroidclient/issues>, <https://gitlab.com/fdroid/fdroidserver/issues>, <https://gitlab.com/fdroid/fdroiddata/issues>: All expose RSS feeds, and also email notifications if desired.

### Matrix

The room can be previewed without an account on https://matrix.to/#/#fdroid:f-droid.org or https://matrix.to/#/#fdroid-dev:f-droid.org

### IRC

Old IRC logs are available at <https://botbot.me/freenode/fdroid/> and <https://botbot.me/freenode/fdroid-dev/>.

## OPML import to a feed reader

For importing into your favourite news reader, save the following text as feeds.opml and add/remove feeds your are interested in.

On Android we have [Feeder]({{ site.baseurl }}/packages/com.nononsenseapps.feeder/), [Handy News Reader]({{ site.baseurl }}/packages/ru.yanus171.feedexfork/), [Antennapod](https://f-droid.org/repository/browse/?fdfilter=de.danoeh.antennapod&fdid=de.danoeh.antennapod), [FreshRSS]({{ site.baseurl }}/packages/fr.chenry.android.freshrss/), [Flym DecSync]({{ site.baseurl }}/packages/org.decsync.flym/) and many more. On the desktop you could use the Akregator for KDE, Liferea for Gnome or [http://newsbeuter.org newsbeuter] which is nice if you like working in a terminal.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<opml version="1.0">
  <head>
    <title>F-Droid related feeds</title>
  </head>
  <body>
    <outline title="F-Droid">
      <outline type="rss" title="News and Reviews" xmlUrl="https://f-droid.org/feed" htmlUrl="https://f-droid.org/news-and-reviews/"/>
      <outline type="rss" title="Latest Builds" xmlUrl="https://f-droid.org/wiki/api.php?action=feedcontributions&amp;user=Robot&amp;feedformat=atom" htmlUrl="https://f-droid.org/wiki/page/Special:Contributions/Robot"/>
    </outline>
  </body>
</opml>
```
