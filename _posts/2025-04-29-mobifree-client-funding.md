---
layout: post
title: "NGI Mobifree funds client app overhaul"
author: "grote"
---

The F-Droid app was created in 2009 in the early days of Android
and lots of its code is still that old.
While the ecosystem has seen many drastic shifts,
the F-Droid community heroically kept the app alive with band aids and chewing gum.

However, this task becomes increasingly difficult.
In a project's life, there comes a time when the accumulated technical debt can't be managed anymore
and the only way forward is to rewrite the project from scratch.
This effort is under way [for a while already]({% post_url 2023-05-02-three-client-libraries %}).
We've been rewriting the basic parts of the app and put them into reusable libraries.
However, most of the upper layers of the code still need rewriting as well.

Unfortunately, we have reached a point where this can't be done bit by bit anymore,
because of historic entanglement of the remaining pieces.
The rest requires one big swoop which is too big for a single volunteer contribution
and typically not the kind of work that is attractive for external funders.

Therefore, we are especially thrilled to announce that the [Mobifree programme](https://nlnet.nl/mobifree/)
of the [Next Generation Internet initiative](https://ngi.eu/)
agreed to fund this monumental effort.
With their support, we aim to modernize the F-Droid app
with a focus on the user interface to make the app easier to use
and more appealing especially for new users.
At the same time, the modernization should make it easier and more attractive to contribute to the app
while also making it easier for the maintainers to review and merge external contributions
due to better test coverage and less code entanglement.

The rewrite will be exclusively in Kotlin
and use [Compose](https://developer.android.com/develop/ui/compose/documentation) for the UI
while using modern architectural patterns that will make the app easier to maintain and more fun to contribute to.
It will also allow for a responsive UI that adapts to the available screen size,
be it a phone, a foldable, a tablet or even a desktop screen.
