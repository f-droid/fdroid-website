---
layout: page
title: Running a Mirror

---

F-Droid's collection of apps and files are run on servers run by the core F-Droid contributors. Originally, this main repository was hosted only on [f-droid.org](https://f-droid.org/), but as F-Droid grew [f-droid.org](https://f-droid.org/) alone was no longer able to handle the entire load. F-Droid now supports "mirror" servers that replicate a full copy of the repositories. Hosting a mirror involves running an HTTPS webserver that has a full copy of the repository synchronized using `rsync`.

#### Requirements

There are two official F-Droid repository sections, the "repo" and the "archive". It's most important to mirror the "repo" since it is used much more than the "archive".

The primary resources required by a mirror are disk space and upload bandwidth. Bandwidth requirements are reduced with each new mirror, but disk requirements grow at a [reasonable rate](https://ftp.fau.de/cgi-bin/show-ftp-stats.cgi?statstype=2&what=mirrorsize&mirrorname=fdroid&timespan=-1&graphsize=large&submit=Go%21). At time of writing (Mar 2019), the primary repository requires just over 60GB of disk space in 24K files, and the archive requires 300GB of disk space in 52K files. The amount of disk space required grows with every new app release.

There are many mirror servers which offer an _rsync_ connection, make sure to select the mirror closest to your mirror server:

{% include running-a-mirror-rsync.html %}

You can find current information on disk space requirements by running the following in your terminal:
```console
$ rsync -v --list-only ftp.fau.de::fdroid
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

2. Synchronize the repositories. These commands are best run in a terminal multiplexer (`screen`, `tmux` etc) as they will take some time to complete. With `--info=progress2` you can see the progress.

```console
$ sudo -u www-data -E /usr/bin/rsync -aHS  --delete --delete-delay --info=progress2 ftp.fau.de::fdroid/repo/ /var/www/fdroid/fdroid/repo/
$ sudo -u www-data -E /usr/bin/rsync -aHS  --delete --delete-delay --info=progress2 ftp.fau.de::fdroid/archive/ /var/www/fdroid/fdroid/archive/
```

3. Establish a cronjob to keep the repositories up to date

Create a cronjob file in `/etc/cron.d`

```console
$ vi /etc/cron.d/fdroid
```

Fill the file with entries to update the repositories. These commands will run at minute 35 past every 6th hour, you can change it to fit your needs.

```
35 */6 * * * www-data /usr/bin/rsync -aHS  --delete --delete-delay ftp.fau.de::fdroid/repo/ /var/www/fdroid/fdroid/repo/
35 */6 * * * www-data /usr/bin/rsync -aHS  --delete --delete-delay ftp.fau.de::fdroid/archive/ /var/www/fdroid/fdroid/archive/
```

4. Configure your webserver

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

5. Submit your mirror for inclusion

* Fork the [mirror monitor repo](https://gitlab.com/fdroid/mirror-monitor), add your mirror to the list in the README, and open a merge request.
* Open an issue on the [admin repo](https://gitlab.com/fdroid/admin), including any pertinent information, requesting the inclusion of your mirror.
* Once the core contributor team deems your mirror trustworthy and reliable, it will be accepted into the official list.

Also, it would be nice to include a privacy policy so users can understand what happens with their metadata when using the mirror. Purdue PLUG https://plug-mirror.rcac.purdue.edu/info.html and FAU https://ftp.fau.de/datenschutz are two examples.


#### Other considerations

* Set up a privacy policy that describes what happens to the metadata (for example [FAU](https://ftp.fau.de/datenschutz/), [PLUG](https://plug-mirror.rcac.purdue.edu/info.html), [Lysator](https://ftp.lysator.liu.se/datahanteringspolicy.txt)).
* Forward emails from cronjob failures so you know if the synchronization fails
* Set up monitoring on your mirror so you know if it goes down (ideally keyword on _/srv/mymirror.org/htdocs/fdroid/repo/index-v1.jar_)
* Harden your SSH server config (disable password authentication, install _fail2ban_)
* Enable unattended security upgrades (in Debian, just `apt-get install unattended-upgrades`)


## Running a Primary Mirror (receiving syncs via push)

The preferred setup is for the F-Droid updates to be pushed to the primary
mirror via _rsync_ over _ssh_ with SSH Key authentication.  This is the same as
[Debian](https://www.debian.org/mirror/push_server#sshtrigger), the key
difference is that there currently is no script used for the `command=""`, but
instead, there is a hard-coded _rsync_ command.  This really nicely restricts
the security interaction to only want needs to happen (Least Authority!).

```
command="rsync --server -logDtpre.iLsfx --log-format=X --delete --delay-updates . /srv/fdroid-mirror.at.or.at/htdocs/fdroid/"
```

The only piece of that command that is customizable is the final path.  It can
be any path but it must point to the `/fdroid/` directory and must have the
trailing slash.  If any of the _rsync_ options are changed, it will break the
sync setup.

As an extra precaution, there should be a user account (e.g. `fdroid`)
dedicated to receiving the _rsync_/_ssh_ connection.  It should have
as little access as possible.  It should definitely not have write
access to the _authorized_keys_ file, since that would allow an
attacker who gains write access to add a separate key configuration
line which circumvents all the restrictions listed there.  This can be
done simply by doing:

```console
$ sudo chown root.root /home/fdroid/.ssh /home/fdroid/.ssh/authorized_keys
$ sudo chmod 0755 /home/fdroid/.ssh
$ sudo chmod 0644 /home/fdroid/.ssh/authorized_keys
```
