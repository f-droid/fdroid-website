---
layout: page
title: Running a Mirror

---

F-Droid receives its database and resources from servers that host specifically-formatted repositories of files. Originally, these repositories were hosted only at [f-droid.org](https://f-droid.org/), but as F-Droid grew [f-droid.org](https://f-droid.org/) alone was unable to handle the entire load. F-droid now supports servers that replicate these repositories. Hosting a mirror involves running an HTTP(S) server hosting a copy of the repository synchronized over `rsync`.

#### Requirements

There are two official F-droid repositories, the primary and the archive. It's most valuable to mirror the primary as it's used much more than the archive.

The primary resources required by a mirror are disk space and upload bandwidth. Bandwidth requirements are reduced with each new mirror, but disk requirements are relatively static. At time of writing (Mar 2019), the primary repository requires just over 50GB of disk space in 24K files, and the archive requires 220GB of disk space in 52K files. The amount of disk space required grows with every new app release.

Please note: You will need to seek the password for the originating mirror from an f-droid contributor via any method listed [here](https://f-droid.org/en/about/#contact).

You can find current information on disk space requirements by running the following in your terminal:
```console
$ RSYNC_PASSWORD=[password] rsync -v --list-only fdroid-mirror@mirror.f-droid.org::repo/
$ RSYNC_PASSWORD=[password] rsync -v --list-only fdroid-mirror@mirror.f-droid.org::archive/
```

#### Setup

This guide assumes the use of Nginx with a deb-based distribution, and mirroring the primary repository plus the archive. Please adjust accordingly if you're using alternatives or don't intend to mirror the archive. Also substitute the examples paths and domains for your own.

For assistance with this process, [feel free to reach out to us]({{ "/about/" | prepend: site.baseurl }}).

1. Create appropriate directories

```console
$ sudo mkdir -p /var/www/fdroid/fdroid/repo
$ sudo mkdir -p /var/www/fdroid/fdroid/archive
$ sudo chown -R www-data.www-data /var/www/fdroid
```

1. Synchronize the repositories. These commands are best run in a terminal multiplexer (`screen`, `tmux` etc) as they will take some time to complete.

```console
$ RSYNC_PASSWORD=[password] sudo -u www-data -E /usr/bin/rsync --links --delete --times --recursive --permissions --hard-links --sparse --delay-updates --temp-dir /tmp/ fdroid-mirror@mirror.f-droid.org::repo/ /var/www/fdroid/fdroid/repo/
$ RSYNC_PASSWORD=[password] sudo -u www-data -E /usr/bin/rsync --links --delete --times --recursive --permissions --hard-links --sparse --delay-updates --temp-dir /tmp/ fdroid-mirror@mirror.f-droid.org::archive/ /var/www/fdroid/fdroid/archive/
```

1. Establish a cronjob to keep the repositories up to date

Create a cronjob file in `/etc/cron.d`

```console
$ vi /etc/cron.d/fdroid
```

Fill the file with entries to update the repositories

```
*/5 * * * * www-data RSYNC_PASSWORD=[password] /usr/bin/rsync --links --delete --times --recursive --permissions --hard-links --sparse --delay-updates --temp-dir /tmp/ fdroid-mirror@mirror.f-droid.org::repo/ /var/www/fdroid/fdroid/repo/
*/5 * * * * www-data RSYNC_PASSWORD=[password] /usr/bin/rsync --links --delete --times --recursive --permissions --hard-links --sparse --delay-updates --temp-dir /tmp/ fdroid-mirror@mirror.f-droid.org::archive/ /var/www/fdroid/fdroid/archive/
```

1. Configure your webserver

This is an example server block for nginx. If used, it should be copied to _/etc/nginx/sites-available/_ and symlinked to _/etc/nginx/sites-enabled_. Note that it is important that your URI be `/fdroid/repo` so that the app can automatically add your mirror.

```
server {
  listen [::]:80 ipv6only=off;

  server_name fdroidmirror.example;

  rewrite ^ https://fdroidmirror.example$request_uri permanent;
}

server {
  listen [::]:443 ssl http2 ipv6only=off;

  server_name fdroidmirror.example;

  root /var/www/fdroid/;

  # TODO: https://gitlab.com/snippets/1834032
  location /health {
    proxy_pass http://127.0.0.1:8000/;
  }

  ssl_certificate /etc/letsencrypt/live/fdroidmirror.example/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/fdroidmirror.example/privkey.pem;

  # Insert here a TLS config from Mozilla SSL config generator https://mozilla.github.io/server-side-tls/ssl-config-generator/
}
```

1. Submit your mirror for inclusion

* Fork the [mirror monitor repo](https://gitlab.com/fdroid/mirror-monitor), add your mirror to the list in the readme, and open a merge request.
* Open an issue on the [admin repo](https://gitlab.com/fdroid/admin), including any pertinent information, requesting the inclusion of your mirror.
* Once your mirror is provden trustworth and reliable to the core contributor team, it will be accepted into the official list.

#### Other considerations

* Forward emails from cronjob failures so you know if the synchronization fails
* Set up monitoring on your mirror so you know if it goes down (ideally keyword on _/var/www/fdroid/fdroid/repo/index.html_)
* Harden your SSH server config (disable password authentication, install fail2ban)
* Enable unattended upgrades
