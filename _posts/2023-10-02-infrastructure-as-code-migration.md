---
title: Infrastructure-as-code migration
author: F-Droid
layout: post
---

We just completed migrating one more key piece of our infrastructure to a completely automated setup: the "_originserver_".   The _originserver_ is the holder of all of the public files for the website and the f-droid.org repository.  It is also responsible for pushing out the updates to all of the primary mirrors.  So it is safe to say that the _originserver_ is central to our operations.  Ciaran Gultnieks, the founder of the F-Droid project, has been quietly and dutifully maintaining the _originserver_ since he first set it up more than a decade ago.  The F-Droid users and community owe him a debt of gratitude for so many years of faithful service, keeping things going through thick and thin.

The main reason why we undertook this migration is to improve our "[bus factor](https://en.wikipedia.org/wiki/Bus_factor)".  F-Droid relies on contributors to keep it running, but no single person should be solely responsible for any key piece of infrastructure.  We are still a small team, so we focused on migrating this central server to be "[Infrastructure as code](https://en.wikipedia.org/wiki/Infrastructure_as_code)".  Specifically, the whole central web and mirroring setup is now maintained in Ansible projects in the F-Droid GitLab group.  Maintaining servers as code has a number of key advantages:

* The servers can be easily recreated by anyone who can run Ansible.
* Automated server config makes it feasible to create highly detailed, custom security sandboxes.
* Temporary instances making auditing easy, anyone with access to the code can test.

This provides a huge "bus factor" improvement.  Now anyone with access to the code can recreate a copy of our infrastructure.  The F-Droid board controls the domain names, so in case of emergency, the board can direct the domain name to point to new infrastructure.  Since F-Droid is all about free software, there are very few things that need to be kept secret, basically, just the cryptographic keys for signing, encryption, and access control.  These keys can be regenerated and set up where they are needed (e.g. mirrors).  The f-droid.org data is replicated across many mirrors around the world.  And the f-droid.org website and repository comes from pulling in many public source code repositories to build the apps.


## Last one: signing server

There is one last production server that is not maintained as Ansible code: the signing server.  We do intend to eventually manage that machine as code as well.  It is a quite simple setup, so converting it to Ansible is currently not high priority.  It requires a bare bones Debian install with _fdroidserver_ installed from the Git repository.  We have pushed the rest of the required tools, like _apksigner_, to Debian, where they are maintained and available to all.  If you are looking for a fun project to contribute, we still need an Ansible project for creating a standalone [signing servers]({{ site.baseurl }}/docs/Building_a_Signing_Server/). Once we have that, we can iterate on it to build a very hardened setup.


## Infrastructure as code

Here are the key servers that are now managed as code. Not all of these are public yet, we want to ensure they are carefully reviewed and audited before publishing them (let us know if you want to contribute auditing or pentesting, and we can set something up).

* _buildserver_: <https://gitlab.com/fdroid/fdroid-bootstrap-buildserver/>
* _f-droid.org deployserver_: <https://gitlab.com/fdroid/fdroid-deployserver/>
* _f-droid.org_: <https://gitlab.com/fdroid/fdroid-http-fronters/>
* _fdroid.link_: <https://gitlab.com/fdroid/fdroid-http-fronters/>
* _fdroidstatus.org_: <https://gitlab.com/fdroid/fdroid-statuspage-deployment/>
* _forum.f-droid.org_: <https://f-droid.org/docs/Maintaining_the_Forum/>
* IPFS pinning server: <https://gitlab.com/fdroid/ipfs-pinning-server>
* _matrix.f-droid.org_: <https://gitlab.com/fdroid/wiki/-/wikis/Internal/Servers#matrixf-droidorg>
* _monitor.f-droid.org_: <https://gitlab.com/fdroid/fdroid-monitor-deployment/>
* _search.f-droid.org_: <https://gitlab.com/fdroid/fdroid-website-search-deployment/>


The F-Droid community works to serve its users as openly and transparently as possible.  This is a big step to making F-Droid ever more accountable to all of you who trust us to provide the apps you need.
