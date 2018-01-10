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
When setting up the forum, we followed the
[official installation guide](https://github.com/discourse/discourse/blob/master/docs/INSTALL-cloud.md).
Posts from the old forum were not imported
due to time restrictions of the voluntary administrators.

* Installation type: [docker](https://github.com/discourse/discourse_docker)
* Installation directory: _/var/discourse_
* App configuration: _/var/discourse/containers/app.yml_
* Version: _tests-passed_ (planned to switch to _stable_)
* SSL: Let's Encrypt

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

#### Manually downloading backups

If you ever have problems with Discourse not starting,
you can always download backups manually over SSH to ensure
no user data is lost.
Discourse creates backups itself once a week and stores them
at the following path:
_/var/discourse/shared/standalone/backups/default_

#### Rebuilding the container

```bash
cd /var/discourse
git pull
./launcher rebuild app
```
