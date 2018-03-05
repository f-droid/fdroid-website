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
[Docker's](https://docs.docker.com/engine/installation/linux/docker-ce/debian)
and [Dicourse's](https://github.com/discourse/discourse/blob/master/docs/INSTALL-cloud.md)
official installation guides.
Posts from the old forum were not imported
due to time restrictions of the voluntary administrators.

* Installation type: [docker-ce](https://github.com/discourse/discourse_docker)
* Storage driver: [AUFS](https://docs.docker.com/engine/userguide/storagedriver/aufs-driver/)
* Sever's specifications: 2 cores, 4GB RAM, 30GB SSD
* Server's location: Amsterdam

#### Paths

* Installation directory: _/var/discourse_
* App configuration: _/var/discourse/containers/app.yml_
* Backups: _/var/discourse/shared/standalone/backups/default_

#### Discourse

* Version: _tests-passed_
* SSL: Let's Encrypt
* Login methods: local, GitHub
* Backup frequency: every day
* Backups amount: 15

### Upgrading

Upgrading the forum is quite simple.
It is always announced at least 15 minutes beforehand in a dedicated
[maintenance log topic](https://forum.f-droid.org/t/maintenance-log/775)
in the forum.
Upgrades are planned to be done every one to two weeks.
If you feel like there was an important update to Discourse which should
get deployed earlier, feel free to suggest that in the topic mentioned
above.

For administrators, this is the common way on how to upgrade the forum:

* Announce the update at least 15 minutes beforehand in the
[maintenance log topic](https://forum.f-droid.org/t/maintenance-log/775)
* [Make a backup of the forum](https://forum.f-droid.org/admin/backups)
* Wait until the backup finished and download it (you'll get a link by mail)
* Go to the [upgrade section](https://forum.f-droid.org/admin/upgrade)
* Upgrade (the different parts of) the forum, e.g. sometimes
_docker_manager_ has available updates which need to happen before _discourse_
* Report that all updates were successful in the
[maintenance log topic](https://forum.f-droid.org/t/maintenance-log/775)

### Troubleshooting

In case something goes wrong with the forum, stay calm, you're likely
not the first to be affected by this. Mostly a quick internet search
gives you detailed instructions on how to fix a problem.
There is also a really good guide called
[Advanced Troubleshooting with Docker](https://meta.discourse.org/t/advanced-troubleshooting-with-docker/15927)
on Discourse's forum. In the past, the following instructions were
helpful:

#### Rebuilding the container

```bash
cd /var/discourse
git pull
./launcher rebuild app
```

### Installation log

In case we need to set up the virtual machine because of some problem,
you can use this instruction to do so quickly.

#### Install Docker

References:

* https://docs.docker.com/engine/installation/linux/docker-ce/debian

Download Docker's PGP key

```bash
wget -O docker-gpg https://download.docker.com/linux/debian/gpg
apt-key add docker-gpg
```

Check PGP key

```bash
# Must match '9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88'
apt-key fingerprint 0EBFCD88
```

Add Docker repository

```bash
echo 'deb [arch=amd64] https://download.docker.com/linux/debian stretch stable' >> /etc/apt/sources.list.d/docker.com.list
apt update
```

Install Docker

```bash
apt install docker-ce
```

Check Docker

```bash
docker run hello-world
```

#### Install Discourse

If you still have the old _/var/discourse_ directory available,
you can simply deploy it on the new server and start it by
`./launcher rebuild app`.

Follow the
[official installation guide](https://github.com/discourse/discourse/blob/master/docs/INSTALL-cloud.md).
