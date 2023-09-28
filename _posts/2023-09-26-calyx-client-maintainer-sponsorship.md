---
layout: post
title: "Client maintenance sponsored by the Calyx Institute"
author: "grote"
authorWebsite: "https://blog.grobox.de"
---

The official client app is an essential piece of the F-Droid ecosystem.
Therefore, the Calyx Institute as a member and benefactor of the F-Droid community
[offered](https://gitlab.com/fdroid/admin/-/issues/388)
to sponsor a maintainer position to ensure continuous maintenance of the client app
independent of grants or available volunteer time.

The Calyx Institute suggested Torsten Grote as the first person they would fund as a maintainer, due to his
familiarity with the code base and due to his substantial contributions in the past year.
Calyx hopes that this would free up time and energy of the current maintainer(s),
so those could benefit F-Droid in other areas.

The offer was discussed with the F-Droid community and the existing maintainer(s).
It was meanwhile [approved and work is already underway](https://calyxos.org/news/2023/09/04/f-droid/).
The new [F-Droid Basic](https://f-droid.org/packages/org.fdroid.basic/) app variant of the client
enabling app updates without root or privileged extension is just one example.
The Calyx Institute hopes that this new maintainer role will enable more external contributions to F-Droid
and encourages other benefactors of F-Droid to set up similar sponsorship agreements.

Other tasks of the maintainer include:

  * Try to identify and fix bugs, prioritizing critical issues
  * Responding to issues filed
  * Reviewing and merging merge requests
  * Continued improvements as the Android app landscape evolves
  * Making releases as needed

### F-Droid Basic

Announcing [F-Droid Basic](https://f-droid.org/packages/org.fdroid.basic/). Testing and feedback appreciated!

F-Droid Basic 1.17.0:

* `targetSdk` set to 33 (Android 13), and a bump to 34 (Android 14) planned soon.
* Need to confirm updates only once per app, after that they’ll install automatically in the background.
* No extra privileges required!
