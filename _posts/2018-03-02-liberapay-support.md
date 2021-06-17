---
layout: post
title: "Liberapay, a fully free Donation Platform"
author: "Bubu"
authorWebsite: "https://forum.f-droid.org/u/Bubu"
---

<p align="center">
  <img width="150" src="{% asset posts/2018-03-02-liberapay-support/liberapay_icon-v2_yellow-r.svg %}" style="box-shadow: unset;" />
</p>

Recently F-Droid has gained support for [Liberapay](https://liberapay.com/), a
fully free donation platform aimed at software projects.  Liberapay itself is
fully free and [open source](https://github.com/liberapay/liberapay.com)
software focusing on recurrent donations to software projects. These recurrent
donations are important for the long-term sustainability of projects.  Another
interesting feature for software projects is the possibility to create
[teams](https://liberapay.com/about/teams) which the members of the project can
join and then split the donations in a way where everyone sets the share he or
she wants to take.

The donation part of F-Droid has always relied on closed platforms like PayPal
but not anymore!

#### Integration into F-Droid

F-Droid now has full support for projects offering donation via Liberapay:

* The Liberapay ID of a person or team can be entered into a dedicated
  [metadata field](https://f-droid.org/en/docs/Build_Metadata_Reference/#LiberapayID). 
  10 apps in F-Droid already offer this as a donation option. Hopefully more
  will join soon.
* The android client now shows the Liberapay widget: 
  <p align="center">
   <img width="400" src="{% asset posts/2018-03-02-liberapay-support/liberapay-client-screenshot.png %}" />
  </p>
* The website now includes [all donation options]({{ site.baseurl }}/2018/03/01/website-updates.html).
* F-Droid itself has a [Liberapay team](https://liberapay.com/F-Droid-Data).
  After about two month we are already receiving ~30€/week, making us currently
  the third most funded [team](https://en.liberapay.com/explore/teams) on
  Liberapay.

#### Next steps

Liberapay is still a young and very small platform (remember, we became the
third most funded team in two months ;-)) so it needs both more projects and
more patrons. So spread the word and [ask your favourite](https://github.com/TeamNewPipe/NewPipe/issues/1153)
open source project if you can start giving them money through Liberapay.

Do you know any app or developer with a Liberapay account that is not yet shown
in F-Droid? Help us by adding it to the [apps metadata](https://gitlab.com/fdroid/fdroiddata).

You can also fund the further development of Liberapay through Liberapay itself here:
<a href="https://liberapay.com/Liberapay/"><img src="{% asset liberapay_donate_button.svg %}" style="box-shadow: unset;" /></a>
