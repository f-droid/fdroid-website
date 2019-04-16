---
layout: post
title: "Privacy Preserving Analytics"
author: "eighthave"

---

F-Droid always avoids tracking users as much as we can.  We will never
require an account, and we have put a lot of 
[effort]({{ site.baseurl }}/docs/Security_Model) into making it hard
for even the _f-droid.org_ server to track users.  We also recognize
that usage data has value.  It can be used to help show the level of
popularity, and to provide app developers some feedback on what users
like.

After years of moving totally away from data, including disabling
download counts on _f-droid.org_, we have started an experiment with
tracking __usage__ without tracking users.  We are building upon the
work of
[Tor Project](https://gitweb.torproject.org/webstats.git/tree/src/sanitize.py)
and
[Guardian Project](https://guardianproject.info/2017/06/08/tracking-usage-without-tracking-people/).
We have enabled access logging on <https://search.f-droid.org> and
<https://mirror.f-droid.org/> for the initial trial.  (_Note: search
on f-droid.org [could happen](https://gitlab.com/fdroid/fdroid-website/issues/175)
fully client-side using javascript, in that case, those searches will
never hit search.f-droid.org and therefore will not be logged_).

The one caveat here is that Nginx does not allow custom time formats
like Apache does, so the web logs will contain exact date and time of
each hit.  The time zone is zeroed out.  The raw logs will not be
published, and they will be sanitized before being fed into any
analytics system like Matomo/Piwik.  Also, Nginx does not allow custom
error log formats, so errors will have complete information.  The
error logs will therefore not be used in analytics without full
sanitation, and are only kept for a short time period.

## Our Setup

Our servers run Debian, so this gives commands for that
context. First, ensure that Nginx is set up with the "geoip" extension.
That enables Nginx to convert IP addresses into country codes, so that
country codes are logged instead of IP addresses.

```console
# apt-get install libnginx-mod-http-geoip geoip-database
```

Then enable the custom logging setup in _/etc/nginx/nginx.conf_:

```conf
geoip_country /usr/share/GeoIP/GeoIP.dat;
log_format privacy '0.0.0.0 - $remote_user [$time_local] "$request" $status $body_bytes_sent "$http_referer" "-" $geoip_country_code';

access_log /var/log/nginx/access.log privacy;
```

This then makes the access log data look like:

```console
# tail /var/log/nginx/access.log
0.0.0.0 - - [12/Apr/2019:07:01:37 +0000] "GET /android-free/repository/ HTTP/1.1" 200 949 "-" "-" PL
0.0.0.0 - - [12/Apr/2019:07:02:27 +0000] "GET /robots.txt HTTP/1.1" 200 24 "-" "-" US
0.0.0.0 - - [12/Apr/2019:07:02:27 +0000] "GET /android-free/repository/ HTTP/1.1" 200 949 "-" "-" US
0.0.0.0 - - [12/Apr/2019:07:04:08 +0000] "GET / HTTP/1.1" 200 278 "-" "-" BR
0.0.0.0 - - [12/Apr/2019:07:06:41 +0000] "GET /android-free/repository/ HTTP/1.1" 200 949 "-" "-" US
0.0.0.0 - - [12/Apr/2019:07:11:45 +0000] "GET /android-free/repository/ HTTP/1.1" 200 949 "-" "-" FR
0.0.0.0 - - [12/Apr/2019:07:16:32 +0000] "GET / HTTP/1.1" 200 278 "-" "-" CA
0.0.0.0 - - [12/Apr/2019:07:16:49 +0000] "GET /android-free/repository/ HTTP/1.1" 200 949 "-" "-" GB
0.0.0.0 - - [12/Apr/2019:07:19:42 +0000] "GET / HTTP/1.1" 200 278 "-" "-" VN
0.0.0.0 - - [12/Apr/2019:07:20:20 +0000] "GET /robots.txt HTTP/1.1" 200 24 "-" "-" US
0.0.0.0 - - [12/Apr/2019:07:21:51 +0000] "GET /android-free/repository/ HTTP/1.1" 200 949 "-" "-" US
0.0.0.0 - - [12/Apr/2019:07:26:57 +0000] "GET /android-free/repository/ HTTP/1.1" 200 949 "-" "-" DE
0.0.0.0 - - [12/Apr/2019:07:32:01 +0000] "GET /android-free/repository/ HTTP/1.1" 200 949 "-" "-" SE
0.0.0.0 - - [12/Apr/2019:07:32:23 +0000] "GET /android-free/repository/sys-img/android/sys-img-9.0.0_r33-sdk.xml HTTP/1.1" 200 904 "-" "-" US
0.0.0.0 - - [12/Apr/2019:07:37:04 +0000] "GET /android-free/repository/ HTTP/1.1" 200 949 "-" "-" DE
0.0.0.0 - - [12/Apr/2019:07:38:55 +0000] "\x03\x00\x00/*\xE0\x00\x00\x00\x00\x00Cookie: mstshash=Administr" 400 173 "-" "-" RU
0.0.0.0 - - [12/Apr/2019:07:39:12 +0000] "GET / HTTP/1.1" 200 278 "-" "-" EC
```
