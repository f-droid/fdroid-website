---
layout: page
title: Maintaining the forum
---

[F-Droid's forum](https://forum.f-droid.org) is powered by
[Discourse](https://www.discourse.org/) and
[maintained by volunteers](https://forum.f-droid.org/about).

This page is the central place where all information needed to maintain
the forum are stored.

### General information

Here is some general, non-sensitive information about our instance.
When setting up the forum, we followed
[Discourse's](https://github.com/discourse/discourse/blob/main/docs/INSTALL-cloud.md)
official installation guides.
Posts from the old forum were not imported
due to time restrictions of the voluntary administrators.

* Installation type: [docker-ce](https://github.com/discourse/discourse_docker)
* Server's specifications: 2 cores, 4GB RAM, 75GB SSD
* Server's location: Amsterdam
* Ansible Playbook: <https://gitlab.com/fdroid/fdroid-forum-server>

#### Paths

* Installation directory: _/var/discourse_
* App configuration: _/var/discourse/containers/app.yml_
* Backups: _/var/discourse/shared/standalone/backups/default_

#### Discourse

* Version: _stable_
* SSL: Let's Encrypt
* Login methods: local, GitHub
* Backup frequency: daily
* Amount of backups stored: Last 15 ones

### Upgrading

Upgrading the forum is quite simple.
Upgrades are planned to be done every one to two weeks.
If you feel like there was an important update to Discourse which should
get deployed earlier,
[please reach out to us]({{ site.baseurl }}/about/).

For administrators, this is the common way how to upgrade the forum:

* [Make a backup of the forum](https://forum.f-droid.org/admin/backups)
* Wait until the backup finished and download it (you'll get a link by mail)
* Go to the [upgrade section](https://forum.f-droid.org/admin/upgrade)
* Upgrade (the different parts of) the forum, e.g. sometimes
_docker_manager_ has available updates which need to happen before _discourse_
* Report that all updates were successful in the
[maintenance log](https://forum.f-droid.org/t/maintenance-log/775)

### Troubleshooting

In case something goes wrong with the forum, stay calm, you're likely
not the first to be affected by this. Mostly a quick internet search
gives you detailed instructions on how to fix a problem.
In the past, the following instructions were helpful:

#### Rebuilding the container

This also updates all the parts of Discourse to their newest versions.
Therefore, it's also of interest if there are many available updates
in the updates section on the web interface and you want to quickly
update all of them.

Sometimes you even have to update the forum this way because
a new version of _Docker manager_ got installed, causing Discourse
to refuse updates through its web interface.

```bash
cd /var/discourse
./launcher rebuild app
```

#### Cleaning up Docker

Docker stores copies of a lot of stuff that _could_ be used in the future,
but mostly is not. From time to time it's required to clean up that stuff
which sometimes results in more than 10 GB of freed space.

```bash
docker system prune -a
```

With this, the following things get deleted:

* all stopped containers
* all networks not used by at least one container
* all images without at least one container associated to them
* all build cache

### Installation log

In case we need to set up the virtual machine because of some problem,
you can use this instruction to do so quickly.

#### Install Discourse

If you still have the old _/var/discourse_ directory available,
you can simply deploy it on the new server and start it by
`./launcher rebuild app`.

Follow the
[official installation guide](https://github.com/discourse/discourse/blob/main/docs/INSTALL-cloud.md).

#### More Info

You can find more info about updating and maintaining the forum as well as other admin tasks in the [F-Droid forum administrator training](https://forum.f-droid.org/t/f-droid-forum-administrator-training/5527?u=paulakreuzer) topic.
