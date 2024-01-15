---
layout: post
title: "More repro apps, featuring Threema, and more monopolies"
author: "paulali"
---

### TWIF generated on Thursday, 14 Dec 2023, Week 50


#### F-Droid core
**[F-Droid](https://f-droid.org/packages/org.fdroid.fdroid)** and **[Basic](https://f-droid.org/packages/org.fdroid.basic)** were updated to `1.19.0-alpha3`:
> * IPFS Gateway settings are now in the Proxy section and no longer in Expert Mode
> * Expert Mode Category header now shows which preferences belong to Expert Mode
> * Unify full and basic preferences.xml files

Back in November our [week 45 TWIF](https://f-droid.org/2023/11/09/twif-contributor-highlights-Arcticons-special-release.html) was relating the news about the 3 years long ongoing 'Epic v. Google' trial in the US. This week the jury found that _Google turned its Google Play app store and Google Play Billing service into an illegal monopoly_.

You can read the TL;DR [here](https://www.theverge.com/23994174/epic-google-trial-jury-verdict-monopoly-google-play) and the long list of interesting facts that surfaced during the trial, eg. [at least points 6, 7 and 11 are related to F-Droid](https://www.theverge.com/23959932/epic-v-google-trial-antitrust-play-store-fortnite-recap)


#### Community News
@dbrgn from Threema announces that the [Threema](https://threema.ch/en) app, an end-to-end encrypted messenger, which has been [open source](https://threema.ch/open-source) for a few years, is now included in the official F-Droid repository as **[“Threema Libre”](https://f-droid.org/packages/ch.threema.app.libre/)**! 

> Previously the messenger was already installable through a [custom repository](https://threema.ch/en/faq/libre_installation), but many users [asked](https://gitlab.com/fdroid/rfp/-/issues/1596) whether it could be included in the official repo as well. Thanks to the work done by [@linsui](https://gitlab.com/linsui), [@obfusk](https://gitlab.com/obfusk), [@Mynacol](https://gitlab.com/Mynacol) and others, our [reproducible build](https://threema.ch/en/open-source/reproducible-builds) could be successfully verified! Thus, builds from our custom repository can be published in identical form through the F-Droid repository. This means that users can use our repository if they want faster updates, or simply use the official F-Droid sources without having to set up any custom repo.
> 
> Thanks to [Threema Push](https://threema.ch/en/blog/posts/threema-push) _(a persistent network connection in a background service)_, the app already supported instant notifications on new messages without having to rely on Firebase / Google Push. With update `5.2`, Threema Libre now also supports waking up Threema Web sessions, the last piece that was missing for Threema Libre to have feature-parity with the “regular” version from Google Play.
> 
> The integration into the F-Droid repo / index is not maintained by us, but we are happy to assist if any questions arise! Feel free to ping me.

[@linsui](https://gitlab.com/linsui) informs us that:

[Xmp Mod Player](https://f-droid.org/packages/org.helllabs.android.xmp/) `4.12.0` was rebuilt in order to fix it. It was published _(or committed)_ in 2018 and there was no more development since then. I updated it in 2021 but I made a mistake and the app didn’t really work since libxmp was not built at all. Recently I got a report about that and fixed the build with some patches so that it can be built with JDK 11 and NDK r26. It’s a music player for modules, an older sound format. You can find some modules on [The Mod Archive](https://modarchive.org). _(Note: while the package has been updated, the date of it will still be shown as 2021)_

In hiatus news, **[Orion Viewer - Pdf & Djvu](https://f-droid.org/packages/universe.constellation.orion.viewer)** was updated to `0.82.5` and **[Transdroid](https://f-droid.org/packages/org.transdroid.full)** was updated to `2.5.23`, both back after a two and a half years pause.

[@Licaon_Kter](https://gitlab.com/licaon-kter) muses over:

**[Minetest](https://f-droid.org/packages/net.minetest.minetest)** was updated to `5.8.0`, bringing a [long list of new features and fixes](https://dev.minetest.net/Changelog#5.7.0_.E2.86.92_5.8.0), but also an important change: _"Minetest Game is no longer the default game and will no longer be shipped by Minetest. If you want it back, install it by using the “Content” tab"_

**[Syncthing-Fork](https://f-droid.org/packages/com.github.catfriend1.syncthingandroid)** users complained about the app not starting so there's a tentative fix in latest update `1.27.0.1`. _(and if that does not magically fix it do try 'this one wierd trick': enable Airplane mode, start app, check if it runs ok, then disable Airplane mode)_


#### Removed Apps
##### 1 apps were removed
**Uploadgram** got archived as its proxy server is no longer online.


#### Newly Added Apps
##### 6 more apps were newly added
* **[BendyStraw](https://f-droid.org/packages/rocks.mm_dev.BendyStraw)** - An app for managing NewPipe databases.
* **[Blazed Cloud](https://f-droid.org/packages/com.chancesoftwarellc.blazedcloud)** - Minimalistic cloud backup.
* **[Flux News](https://f-droid.org/packages/de.circle_dev.flux_news)** - A simple Newsreader for the [miniflux backend](https://miniflux.app).
* **[LibreBible](https://f-droid.org/packages/xyz.yeikoff.librebible)** - The libre software Latin Vulgate Bible reader
* **[Untracker](https://f-droid.org/packages/me.zhanghai.android.untracker)** - Remove tracking information before sharing links.
* **[UpVPN - Serverless VPN](https://f-droid.org/packages/app.upvpn.upvpn)** - Serverless VPN enables you to connect unlimited devices to VPN.


#### Updated Apps
##### 109 more apps were updated
* **[Activity Launcher](https://f-droid.org/packages/de.szalkowski.activitylauncher)** was updated from `1.14.8` to `1.15.0`
* **[Ad-Free](https://f-droid.org/packages/ch.abertschi.adfree)** was updated from `3.1` to `3.2`
* **[AnLinux](https://f-droid.org/packages/exa.lnx.a)** was updated from `6.50 Stable` to `6.55 Stable`
* **[AndBible: Bible Study](https://f-droid.org/packages/net.bible.android.activity)** was updated from `5.0.771` to `5.0.781`
* **[AndStatus](https://f-droid.org/packages/org.andstatus.app)** was updated from `60.04` to `61.00`
* **[AndrOBD](https://f-droid.org/packages/com.fr3ts0n.ecu.gui.androbd)** was updated from `V2.6.6` to `V2.6.7`
* **[Asgardius S3 Manager](https://f-droid.org/packages/asgardius.page.s3manager)** was updated from `0.10.0` to `0.10.1`
* **[Asgardius S3 Music](https://f-droid.org/packages/asgardius.page.s3music)** was updated from `0.2.0` to `0.2.1`
* **[Aster Launcher](https://f-droid.org/packages/com.series.aster.launcher)** was updated from `1.0.6` to `1.0.7`
* **[Audile](https://f-droid.org/packages/com.mrsep.musicrecognizer)** was updated from `1.1.5` to `1.2.0`
* **[Boxcars](https://f-droid.org/packages/com.rocket9labs.boxcars)** was updated from `1.1.5` to `1.1.7`
* **[CIFS Documents Provider](https://f-droid.org/packages/com.wa2c.android.cifsdocumentsprovider)** was updated from `1.8.0` to `2.0.2`
* **[Cache Cleaner](https://f-droid.org/packages/com.github.bmx666.appcachecleaner)** was updated from `1.9.2` to `1.9.5`
* **[Chubby Click - Metronome](https://f-droid.org/packages/agrigolo.chubbyclick)** was updated from `v2.5` to `v2.5.1`
* **[Clima](https://f-droid.org/packages/co.prestosole.clima)** was updated from `3.2.0` to `3.2.1`
* **[Clipious](https://f-droid.org/packages/com.github.lamarios.clipious)** was updated from `1.17.4` to `1.17.5`
* **[Compass](https://f-droid.org/packages/com.bobek.compass)** was updated from `1.12.0` to `1.13.0`
* **[Copy SMS Code - OTP Helper](https://f-droid.org/packages/io.github.jd1378.otphelper)** was updated from `1.8.0` to `1.9.0`
* **[Crazyflie Client](https://f-droid.org/packages/se.bitcraze.crazyfliecontrol2)** was updated from `0.7.3` to `0.7.3`
* **[DataBackup](https://f-droid.org/packages/com.xayah.databackup.foss)** was updated from `1.1.0-alpha04` to `1.1.0-alpha05`
* **[DeadHash](https://f-droid.org/packages/com.codedead.deadhash)** was updated from `1.7.8` to `1.8.1`
* **[Deku SMS](https://f-droid.org/packages/com.afkanerd.deku)** was updated from `0.32.0` to `0.33.0`
* **[Delta Chat](https://f-droid.org/packages/com.b44t.messenger)** was updated from `1.42.4` to `1.42.6`
* **[DiskUsage](https://f-droid.org/packages/com.google.android.diskusage)** was updated from `5.0-alpha0` to `5.0-alpha1`
* **[Drinkable](https://f-droid.org/packages/com.moimob.drinkable)** was updated from `1.44.2` to `1.45.0`
* **[DuckDuckGo Privacy Browser](https://f-droid.org/packages/com.duckduckgo.mobile.android)** was updated from `5.179.2` to `5.180.1`
* **[EasySync](https://f-droid.org/packages/com.phpbg.easysync)** was updated from `1.1` to `1.2`
* **[Encointer Wallet](https://f-droid.org/packages/org.encointer.wallet)** was updated from `1.11.4` to `1.11.6`
* **[FREE Browser](https://f-droid.org/packages/org.woheller69.browser)** was updated from `1.5` to `1.6`
* **[FairEmail](https://f-droid.org/packages/eu.faircode.email)** was updated from `1.2135` to `1.2136`
* **[Fennec F-Droid](https://f-droid.org/packages/org.mozilla.fennec_fdroid)** was updated from `120.0.0` to `120.1.0`
* **[FluffyChat](https://f-droid.org/packages/chat.fluffy.fluffychat)** was updated from `1.15.1` to `1.16.0`
* **[Forkgram](https://f-droid.org/packages/org.forkgram.messenger)** was updated from `10.2.9.0` to `10.3.2.0`
* **[Gauguin](https://f-droid.org/packages/org.piepmeyer.gauguin)** was updated from `0.14.0` to `0.15.0`
* **[Ghost Commander](https://f-droid.org/packages/com.ghostsq.commander)** was updated from `1.62.3` to `1.63b1`
* **[Graded - Grade tracker](https://f-droid.org/packages/com.NightDreamGames.Grade.ly)** was updated from `2.5.1` to `2.6.0`
* **[Green](https://f-droid.org/packages/com.greenaddress.greenbits_android_wallet)** was updated from `4.0.4` to `4.0.21`
* **[Grocy: Self-hosted Grocery Management](https://f-droid.org/packages/xyz.zedler.patrick.grocy)** was updated from `3.4.1` to `3.4.2`
* **[Gurgle](https://f-droid.org/packages/org.billthefarmer.gurgle)** was updated from `1.26` to `1.27`
* **[Hacki for Hacker News](https://f-droid.org/packages/com.jiaqifeng.hacki)** was updated from `2.5.0` to `2.6.0`
* **[Husky](https://f-droid.org/packages/su.xash.husky)** was updated from `1.5.2` to `1.5.3`
* **[Immich](https://f-droid.org/packages/app.alextran.immich)** was updated from `1.89.0` to `1.90.0`
* **[Jami](https://f-droid.org/packages/cx.ring)** was updated from `20231129-01` to `20231208-01`
* **[Jellyfin for Android TV](https://f-droid.org/packages/org.jellyfin.androidtv)** was updated from `0.15.12` to `0.16.0`
* **[Karma Firewall](https://f-droid.org/packages/net.stargw.fok)** was updated from `61` to `62`
* **[LibreOffice Viewer](https://f-droid.org/packages/org.documentfoundation.libreoffice)** was updated from `7.6.3.2-android/8c4c8a83119e/F-Droid` to `7.6.4.1/e19e193f88cd/F-Droid`
* **[LibrePass](https://f-droid.org/packages/dev.medzik.librepass.android)** was updated from `1.0.0` to `1.1.1`
* **[Librera Reader](https://f-droid.org/packages/com.foobnix.pro.pdf.reader)** was updated from `8.9.85-fdroid` to `8.9.105-fdroid`
* **[Lighthouse Power Management](https://f-droid.org/packages/com.jeroen1602.lighthouse_pm)** was updated from `1.2.0` to `1.3.1`
* **[Linwood Butterfly](https://f-droid.org/packages/dev.linwood.butterfly.nightly)** was updated from `2.0.0-rc.0` to `2.0.0-rc.1`
* **[LiveWallpaperIt - Muzei plugin for Reddit](https://f-droid.org/packages/rocks.tbog.livewallpaperit)** was updated from `1.0` to `2.0`
* **[LocalSend](https://f-droid.org/packages/org.localsend.localsend_app)** was updated from `1.12.0` to `1.13.1`
* **[LogFox](https://f-droid.org/packages/com.f0x1d.logfox)** was updated from `1.5.1` to `1.5.2`
* **[Magisk](https://f-droid.org/packages/com.topjohnwu.magisk)** was updated from `26.3` to `26.4`
* **[Mightier Amp](https://f-droid.org/packages/com.tuntori.mightieramp)** was updated from `1.0.7` to `1.0.10`
* **[MinCal Widget](https://f-droid.org/packages/cat.mvmike.minimalcalendarwidget)** was updated from `2.14.0` to `2.15.0`
* **[Minesweeper - Antimine](https://f-droid.org/packages/dev.lucanlm.antimine)** was updated from `17.6.0 F` to `17.6.3 F`
* **[Mull](https://f-droid.org/packages/us.spotco.fennec_dos)** was updated from `120.0.0` to `120.1.0`
* **[Mullvad VPN: privacy is a universal right](https://f-droid.org/packages/net.mullvad.mullvadvpn)** was updated from `2023.8` to `2023.9`
* **[Musify](https://f-droid.org/packages/com.gokadzev.musify.fdroid)** was updated from `6.9.0` to `7.0.1`
* **[My Expenses](https://f-droid.org/packages/org.totschnig.myexpenses)** was updated from `3.6.8.1` to `3.6.9`
* **[Next Actualités informatiques](https://f-droid.org/packages/com.pcinpact)** was updated from `2.7.1` to `2.7.2`
* **[Nextcloud Dev](https://f-droid.org/packages/com.nextcloud.android.beta)** was updated from `20231205` to `20231209`
* **[Nighthawk Wallet](https://f-droid.org/packages/com.nighthawkapps.wallet.android)** was updated from `2.2.11` to `2.2.12`
* **[OONI Probe](https://f-droid.org/packages/org.openobservatory.ooniprobe)** was updated from `3.8.4` to `3.8.5`
* **[Omni Notes](https://f-droid.org/packages/it.feio.android.omninotes.foss)** was updated from `6.2.8` to `6.3.0`
* **[OpenVK Legacy](https://f-droid.org/packages/uk.openvk.android.legacy)** was updated from `1.1.214-f` to `1.1.218-f`
* **[PasseGares](https://f-droid.org/packages/fr.nocle.passegares)** was updated from `1.4.7` to `1.4.8`
* **[Pepper&Carrot Reader](https://f-droid.org/packages/nightlock.peppercarrot)** was updated from `1.3` to `1.4`
* **[Petals](https://f-droid.org/packages/br.com.colman.petals)** was updated from `3.18.0` to `3.19.1`
* **[Podverse](https://f-droid.org/packages/com.podverse.fdroid)** was updated from `4.15.0` to `4.15.2`
* **[ProtonVPN - Secure and Free VPN](https://f-droid.org/packages/ch.protonvpn.android)** was updated from `4.8.70.0` to `4.8.99.0`
* **[QRAlarm](https://f-droid.org/packages/com.sweak.qralarm)** was updated from `1.5.10` to `1.5.11`
* **[QuickWeather](https://f-droid.org/packages/com.ominous.quickweather)** was updated from `2.5.7` to `2.6.0`
* **[Quinb: 4 players reaction game](https://f-droid.org/packages/xyz.deepdaikon.quinb)** was updated from `1.2.3` to `1.2.4`
* **[Really Basic Vocab](https://f-droid.org/packages/de.herrmann_engel.rbv)** was updated from `3.3.4` to `3.4.0`
* **[Ricochlime](https://f-droid.org/packages/com.adilhanney.ricochlime)** was updated from `1.0.6` to `1.1.0`
* **[Saber](https://f-droid.org/packages/com.adilhanney.saber)** was updated from `0.18.3` to `0.18.4`
* **[Sapio](https://f-droid.org/packages/com.klee.sapio)** was updated from `1.0.7` to `1.1.1`
* **[SchildiChat](https://f-droid.org/packages/de.spiritcroc.riotx)** was updated from `1.6.6.sc73` to `1.6.8.sc74`
* **[Screenshot Tile (NoRoot)](https://f-droid.org/packages/com.github.cvzi.screenshottile)** was updated from `2.6.2` to `2.7.0`
* **[Shelter](https://f-droid.org/packages/net.typeblog.shelter)** was updated from `1.9` to `1.9.1`
* **[Shitter](https://f-droid.org/packages/org.nuclearfog.twidda)** was updated from `3.5` to `3.5.1`
* **[Simple Alarm Clock](https://f-droid.org/packages/com.better.alarm)** was updated from `3.15.01` to `3.15.04`
* **[Simple Crypto Widget](https://f-droid.org/packages/com.brentpanther.bitcoinwidget)** was updated from `8.4.4` to `8.4.5`
* **[Slideshow Wallpaper](https://f-droid.org/packages/io.github.doubi88.slideshowwallpaper)** was updated from `1.0.4` to `1.1.0`
* **[Squawker](https://f-droid.org/packages/org.ca.squawker)** was updated from `3.5.3` to `3.5.4`
* **[Syncthing](https://f-droid.org/packages/com.nutomic.syncthingandroid)** was updated from `1.26.1` to `1.27.0`
* **[The Light](https://f-droid.org/packages/org.hlwd.bible)** was updated from `3.73` to `3.74`
* **[Tiny Weather Forecast Germany](https://f-droid.org/packages/de.kaffeemitkoffein.tinyweatherforecastgermany)** was updated from `0.61.2` to `0.61.3`
* **[TorrServe](https://f-droid.org/packages/ru.yourok.torrserve)** was updated from `MatriX.127.F-Droid` to `MatriX.128.F-Droid`
* **[Track Work Time](https://f-droid.org/packages/org.zephyrsoft.trackworktime)** was updated from `1.1.21` to `1.1.22`
* **[Tusky](https://f-droid.org/packages/com.keylesspalace.tusky)** was updated from `24.0 beta 1` to `24.0`
* **[Tuta Mail](https://f-droid.org/packages/de.tutao.tutanota)** was updated from `3.118.30` to `3.119.3`
* **[Unciv](https://f-droid.org/packages/com.unciv.app)** was updated from `4.9.5` to `4.9.6`
* **[VCMI](https://f-droid.org/packages/is.xyz.vcmi)** was updated from `1.3.2` to `1.4.0`
* **[Voyager for Lemmy](https://f-droid.org/packages/app.vger.voyager)** was updated from `1.28.0` to `1.30.3`
* **[Wattz](https://f-droid.org/packages/dubrowgn.wattz)** was updated from `1.13` to `1.14`
* **[Wikipedia](https://f-droid.org/packages/org.wikipedia)** was updated from `r/2.7.50460-r-2023-11-21` to `r/2.7.50463-r-2023-12-04`
* **[Zoysii - Logic game](https://f-droid.org/packages/xyz.deepdaikon.zoysii)** was updated from `2.4.1` to `2.4.2`
* **[Zulip](https://f-droid.org/packages/com.zulipmobile)** was updated from `27.220` to `27.221`
* **[aTalk](https://f-droid.org/packages/org.atalk.android)** was updated from `3.2.3` to `3.2.4`
* **[ente - encrypted photo storage](https://f-droid.org/packages/io.ente.photos.fdroid)** was updated from `0.8.11` to `0.8.13`
* **[floccus bookmark sync](https://f-droid.org/packages/org.handmadeideas.floccus)** was updated from `4.19.1` to `5.0.2`
* **[hwloc lstopo](https://f-droid.org/packages/com.hwloc.lstopo)** was updated from `2.9.3a1-1-1.5.3` to `2.10.0-1-1.5.3`
* **[monocles chat](https://f-droid.org/packages/de.monocles.chat)** was updated from `1.7.7.5` to `1.7.8.2`
* **[openHAB Beta](https://f-droid.org/packages/org.openhab.habdroid.beta)** was updated from `3.7.9-beta` to `3.7.10-beta`
* **[ownCloud](https://f-droid.org/packages/com.owncloud.android)** was updated from `4.1.1` to `4.2-beta.1`
* **[psychphinder](https://f-droid.org/packages/com.daih.psychphinder)** was updated from `1.1.3` to `1.1.4`


Thank you for reading this week's TWIF :)
Please subscribe to the [RSS feed](https://f-droid.org/news/) in your favourite RSS application to be updated of new TWIFs when they come up.


You are welcome to join the [TWIF forum thread](https://forum.f-droid.org/t/new-twif-submission-thread/23546) if you have any news from around the community, maybe it will be featured next week ;)
