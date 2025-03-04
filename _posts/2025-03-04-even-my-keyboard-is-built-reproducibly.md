---
layout: post
title: "Even my keyboard is built reproducibly"
author: "Licaon_Kter"
---

Two years ago, almost to the day, we've spoken about how ["VPN trust requires free software"](https://f-droid.org/2023/03/08/vpn-trust-requires-free-software.html) outlining the importance of [reproducible builds](https://reproducible-builds.org/) in general, and specially when it comes to your Internet connection security. That post sparked some interest and led to improvements in the way F-Droid packages reproducible builds.

Last year we were sadden to read that [proprietary keyboards are (still) spying by their users](https://f-droid.org/2024/04/25/twif.html#community-news) and encouraged you to seek better FOSS keyboard apps.  The keyboard is perhaps the most sensitive app on the device.  Everything you write will go through the keyboard app, including passwords and private messages.  In order to have a trustworthy device, we need to know that our keyboard app is treating our secrets with the utmost care.  The best ones do not even request internet access or any other way to send our precious keystrokes anywhere besides where they are intended to go.

As we push for apps to be [reproducible when included](https://f-droid.org/docs/Inclusion_How-To/#reproducible-builds), let's take a look at the current F-Droid offer in regards to keyboards.

Our [F-Droid Verification Server](https://verification.f-droid.org/) continuously rebuilds apps and compares them to the published version. This allows us to spot sources of non-determinism in all apps, no matter if setup as reproducible or not.

We split our available keyboard apps based on their reproducible status as:
* Reproducible - _we host the developer signed packages after we verify them as reproducible_
* Verified - _we host our signed packages, and the Verification Server confirms them as reproducible_
* Soon to be Verified - _we host our signed packages, verification fails, but we've contributed upstream to hopefully fix the issues, so **maybe** the next version will be fine_ 
* Not verified - _we host our signed packages, verification fails or the app is so old that there are lower chances to be fixed_

#### Reproducible:
* Latin script: [Colemak Mod-DH Keyboard](https://f-droid.org/packages/io.github.colemakmods.mod_dh/), [Fossify Keyboard](https://f-droid.org/packages/org.fossify.keyboard/), [HeliBoard](https://f-droid.org/packages/helium314.keyboard/)
* Asian script: [Fcitx5](https://f-droid.org/packages/org.fcitx.fcitx5.android/) + [plugins](https://search.f-droid.org/?q=org.fcitx.fcitx5.android.plugin), [Kuaizi IME](https://f-droid.org/packages/org.crazydan.studio.app.ime.kuaizi/), [Sithakuru](https://f-droid.org/packages/sithakuru.sinhala.keyboard/)
* Special layout: [FlickBoard](https://f-droid.org/packages/se.nullable.flickboard/), [Thumb-Key](https://f-droid.org/packages/com.dessalines.thumbkey/), [Traditional T9](https://f-droid.org/packages/io.github.sspanak.tt9/)
* Voice input: [Sayboard](https://f-droid.org/packages/com.elishaazaria.sayboard/)
* Misc: [KryptEY](https://f-droid.org/packages/com.amnesica.kryptey/)

#### Verified:
* Latin script: [Brailliac: Braille Keyboard](https://f-droid.org/packages/com.lukeneedham.braillekeyboard/), [DroidTR IME](https://f-droid.org/packages/org.droidtr.keyboard/), [Irregular Expressions](https://f-droid.org/packages/mf.asciitext.lite/), [Key Mapper GUI Keyboard](https://f-droid.org/packages/io.github.sds100.keymapper.inputmethod.latin/), [Simple Keyboard](https://f-droid.org/packages/rkr.simplekeyboard.inputmethod/), [Unexpected Keyboard](https://f-droid.org/packages/juloo.keyboard2/)
* Asian script: [Guileless Bopomofo](https://f-droid.org/packages/org.ghostsinthelab.apps.guilelessbopomofo/), [Stroke Input Method (筆畫輸入法)](https://f-droid.org/packages/io.github.yawnoc.strokeinput/)
* Voice input: [Kõnele](https://f-droid.org/packages/ee.ioc.phon.android.speak/), [Whisper](https://f-droid.org/packages/org.woheller69.whisper/)
* Misc: [FutharkBoard](https://f-droid.org/packages/de.drmaxnix.futharkboard/)

#### Soon to be Verified:
* Latin script: [8Vim](https://f-droid.org/packages/inc.flide.vi8/), [FlorisBoard](https://f-droid.org/packages/dev.patrickgold.florisboard/)
* Asian script: [Indic Keyboard](https://f-droid.org/packages/org.smc.inputmethod.indic/), [Trime](https://f-droid.org/packages/com.osfans.trime/)

#### Not Verified:
* Latin script: [AnySoftKeyboard](https://f-droid.org/packages/com.menny.android.anysoftkeyboard/) + [plugins](https://search.f-droid.org/?q=AnySoftKeyboard), [Hacker's Keyboard](https://f-droid.org/packages/org.pocketworkstation.pckeyboard/)
* Misc: [KeePassDX - FOSS Password Safe](https://f-droid.org/packages/com.kunzisoft.keepass.libre/)

#### Too old to even be checked:
* [Changjie Input Method](https://f-droid.org/packages/com.linkomnia.android.Changjie/), [Dasher](https://f-droid.org/packages/dasher.android/), [Mozc for Android](https://f-droid.org/packages/org.mozc.android.inputmethod.japanese/), [Sophia Keyboard](https://f-droid.org/packages/com.htruong.inputmethod.latin/)

Interesting list, looks like we offer a large variety of input apps that, hopefully, not only cover your typing needs but also allow you to do this on a build reproducible verified app.

This work was supported by your donations, and from [NLnet](https://nlnet.nl/project/Reproducible-F-Droid/).  To help support F-Droid, please check out the [donation page](https://f-droid.org/donate/) and contribute what you can.
