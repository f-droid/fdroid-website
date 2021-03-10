---
author: eighthave
layout: post
title: F-Droid Metrics and Clean Insights
---

The F-Droid community has been discussing how to measure what apps are popular for a long time.  From [2012 through 2015](https://gitlab.com/fdroid/fdroiddata/-/commits/078f32f6/stats/total_downloads_app.txt), some simple download counts were maintained in _fdroiddata_.  We also sketched out an idea based on Debian's "[Popularity Contest](https://gitlab.com/fdroid/fdroidclient/-/issues/396)".  Then we determined a safe way to [gather logs]({{ site.baseurl }}{% post_url 2019-04-15-privacy-preserving-analytics %}) from our webservers.

One central idea has always been that a good metrics system for F-Droid would **never** include any Personally Identifiable Information (PII) like telephone numbers, IP Addresses, MAC, SSID, IMSI, IMEI, user accounts, etc.  Also, any additional data gathering must opt-in, for example, anything that would be reported by client software.

I had some time recently to devote to exploring actual metrics, thanks to Guardian Project's [Clean Insights](https://cleaninsights.org) project for private, [ethical](https://guardianproject.info/2021/02/18/usability-the-wonderful-powerful-idea-that-betrayed-us/) metrics.  Now, there are some actual numbers for people to work with!


## F-Droid websites

We have added new privacy-preserving logging setups to all our webservers except _f-droid.org_.  [Apache configurations](https://guardianproject.info/2017/06/08/tracking-usage-without-tracking-people/) use the "`privacy+geo`" format that strips the date/time/time zone to only the date, removes the IP address, user agent, and referer.  The [nginx configurations]({{ site.baseurl }}{% post_url 2019-04-15-privacy-preserving-analytics %}) use "`privacy+geo`" log format that also strips IP address, user agent, and referer.  The key difference is that it is not possible with _nginx_ log configs to normalize the date, so they are stored intact.  The logs are then stored not longer than two weeks, after which they are deleted.  The [metrics](https://gitlab.com/fdroid/metrics) process runs on the server itself, then pushes only the sanitized data to [private, per-site git repos](https://gitlab.com/fdroid/metrics-data).  These are kept private to core contributors in case private data is leaked.  It can then be manually removed before going public.

The stricter Apache log format will eventually come to _f-droid.org_.  For now we are sticking with its existing setup of keeping the default Apache logs.  It is a large site and we are a small team, so we need to be very conservative about changes there.  The metrics coming from _f-droid.org_ are currently manually processed and reviewed.  The public, sanitized data for _f-droid.org_ is generated using the same strict process as the rest of the sites.

All that data is then assembled and published for public consumption at <https://fdroid.gitlab.io/metrics>.  This is currently just JSON data files: _index.json_ lists the available per-week reports, then each report is named after the first day of the report, e.g. _2021-02-15.json_.  The reporting period is Monday 0:00:00 til Sunday 23:59:59.

This sanitized JSON data is also uploaded to the [Clean Insights Matomo](https://metrics.cleaninsights.org/) analytics instance (run by Guardian Project) to experiment whether Matomo is a useful analytics tool for data with no PII.  Even though, the [submission script](https://gitlab.com/fdroid/metrics/-/blob/22b56074/submit-to-cimp.py) only works with sanitized data, the reports are submitted to the [Clean Insights Matomo Proxy (CIMP)](https://gitlab.com/cleaninsights/clean-insights-matomo-proxy/), which strips out unnecessary information, including the IP address, before it is submitted to Matomo.  The CIMP then submits the sanitized data to Matomo, which generates views on the data.


### Interpreting the data

For all the web servers except _f-droid.org_, they are a simple, one server setup.  That means the web server logs will include all hits to the website  For _f-droid.org_, it is more [complicated](https://gitlab.com/fdroid/wiki/-/wikis/Internal/Servers#f-droidorg).  The current metrics are from the canonical web server.  That means most hits are stopping at the caching servers and never show up in the canonical web server's logs.  The logs from the caching servers are currently not processed or published anywhere.


## F-Droid client

There is also [metrics submission](https://gitlab.com/fdroid/fdroidclient/-/merge_requests/985) for the official F-Droid Android client. At its core, it gathers information from the previous week (e.g. the most recent completed week), and puts that into a JSON report.  That JSON is then submitted to <https://metrics.cleaninsights.org>, respecting network preferences like requiring Tor.  It must be first enabled by switching "Expert Mode" on, then "Keep Install History", then "Send to F-Droid Metrics".  There is a report viewer in the "Install History" viewer.  If this proves useful and there are no privacy leaks or other ethical concerns, it can be expanded.  That said, it will always be opt-in.  Right now, that is a global toggle.  We are exploring per-report opt-in and other ideas for ensuring that metrics always respects the user's wishes first and foremost.


Here's an actual, but relatively simple, report as an example:

```json
{
  "events" : [ {
    "action" : "isPrivilegedInstallerEnabled",
    "category" : "device",
    "name" : "true",
    "period_end" : 1613606400,
    "period_start" : 1613001600,
    "times" : 1
  }, {
    "action" : "Build.VERSION.SDK_INT",
    "category" : "device",
    "name" : "25",
    "period_end" : 1613606400,
    "period_start" : 1613001600,
    "times" : 1
  }, {
    "action" : "Build.SUPPORTED_ABIS",
    "category" : "device",
    "name" : "[armeabi-v7a, armeabi]",
    "period_end" : 1613606400,
    "period_start" : 1613001600,
    "times" : 1
  }, {
    "action" : "PackageInfo.firstInstall",
    "category" : "APK",
    "period_end" : 1614211200,
    "period_start" : 1613606400,
    "times" : 1
  }, {
    "action" : "PackageInfo.firstInstall",
    "category" : "APK",
    "name" : "org.fdroid.fdroid.privileged",
    "period_end" : 1614211200,
    "period_start" : 1613606400,
    "times" : 1
  }, {
    "action" : "PackageInfo.lastUpdateTime",
    "category" : "APK",
    "name" : "org.fdroid.fdroid.privileged",
    "period_end" : 1614211200,
    "period_start" : 1613606400,
    "times" : 1
  }, {
    "action" : "org.fdroid.fdroid.installer.Installer.action.INSTALL_STARTED",
    "category" : "package",
    "name" : "ryey.easer.beta",
    "period_end" : 1614211200,
    "period_start" : 1613606400,
    "times" : 1
  }, {
    "action" : "org.fdroid.fdroid.installer.Installer.action.INSTALL_COMPLETE",
    "category" : "package",
    "name" : "ryey.easer.beta",
    "period_end" : 1614211200,
    "period_start" : 1613606400,
    "times" : 1
  } ],
  "idsite" : 3,
  "lang" : "en",
  "ua" : "F-Droid 1.12-alpha1-4-gbc8ae2144-debug"
}

```

