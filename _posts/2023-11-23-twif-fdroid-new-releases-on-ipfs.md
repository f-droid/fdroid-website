---
layout: post
title: "New F-Droid releases on IPFS"
author: "paulali"
---

### TWIF generated on Thursday, 23 Nov 2023, Week 47

#### F-Droid core
##### Android Apps now on IPFS
New app releases on [F-Droid](https://f-droid.org/) are now being pushed to [IPFS](https://ipfs.tech/) too, providing an additional mirroring channel that can be managed more flexibly. If this goes smoothly, we intend to upload all releases on F-Droid to IPFS. In the next F-Droid and Basic alpha versions the IPFS settings [get overhauled](https://gitlab.com/fdroid/fdroidclient/-/merge_requests/1315), thanks to [@uniqx](https://gitlab.com/uniqx)


#### Community News
##### Tor on Mobile Devices Developer Guide
[Guardian Project](https://guardianproject.info/) is working on a guide on how to integrate [Tor](https://www.torproject.org/) into a mobile application, touching the broader goal of promoting online privacy and freedom. You can follow the progress [here](https://guardian-project.gitbook.io/tor-mobile-developer-guide/).

[@Licaon_Kter](https://gitlab.com/licaon-kter)'s comments:

**[Organic Maps: Hike, Bike, Drive Offline](https://f-droid.org/packages/app.organicmaps)** was updated to `2023.11.17-17-FDroid` which, besides the usual maps updates, fixes and features, also brings _"experimental 'Details on KAYAK' affiliate link to hotels"_.

Missed in [last weeks TWIF](https://f-droid.org/2023/11/16/twif-enter-the-alphas.html), **[FreePaint](https://f-droid.org/packages/io.github.pastthepixels.freepaint/)** got a new signature key from its developer because _"something happened to the old key"_. We encourage developers to [take great care of their keys](https://f-droid.org/2023/09/03/reproducible-builds-signing-keys-and-binary-repos.html) but I guess this information _it's just not yet very evenly distributed_. What does this mean for you? If this is the first time you install the app, just enjoy it, everything is fine. But if you had it installed before version `1.1.0 (4)` please uninstall it and reinstall it. ([!14020](https://gitlab.com/fdroid/fdroiddata/-/merge_requests/14020#note_1645005664))

**[KeePassDX](https://f-droid.org/packages/com.kunzisoft.keepass.libre)** was updated to `4.0.5` after a long hiatus. The issue delaying its update is that the upstream code repo has _a historic mistake_ that can't be easily fixed _([read in more detail here](https://github.com/Kunzisoft/KeePassDX/issues/1333))_. Security measures set up in the F-Droid build server were blocking this _mistake_ and the team had to provision code to handle such known exceptions. 


#### Removed Apps
##### 4 apps were removed
While **Androidacy Module Manager**'s license is LGPL-3.0, users are forced to agree to an extra [EULA](https://wikipedia.org/wiki/End-user_license_agreement) too just to be able to actually start the app. This makes the situation [confusing for the users](https://www.fsf.org/blogs/licensing/protecting-free-software-against-confusing-additional-restrictions) who expect a FOSS app, not restrictions. ([#3129](https://gitlab.com/fdroid/fdroiddata/-/issues/3129))

**ForkHub for GitHub** is no longer maintained and it can't even login.

**LibGen Mobile** and **SimpleWeatherForecast** depend on servers or services that are no longer accessible.


#### Newly Added Apps
##### 3 apps were newly added
**[fWallet](https://f-droid.org/packages/business.braid.f_wallet)** - A beautiful cross-platform wallet application for your PkPass files.

**[Prayer Book](https://f-droid.org/packages/io.jozo.prayerbook)** for Catholic prayers.

**[Simple Counter](https://f-droid.org/packages/org.quicksc0p3r.simplecounter)** - Keep track of things with a Material You interface.


#### Updated Apps
##### 153 more apps were updated
* **[8Vim Keyboard](https://f-droid.org/packages/inc.flide.vi8)** was updated from `0.16.2` to `0.16.3`
* **[AndBible: Bible Study](https://f-droid.org/packages/net.bible.android.activity)** was updated from `5.0.755` to `5.0.762`
* **[ANOTHERpass](https://f-droid.org/packages/de.jepfa.yapm)** was updated from `1.8.1` to `1.8.2`
* **[aTalk](https://f-droid.org/packages/org.atalk.android)** was updated from `3.2.1` to `3.2.2`
* **[Audile](https://f-droid.org/packages/com.mrsep.musicrecognizer)** was updated from `1.1.3` to `1.1.4`
* **[Audio Share](https://f-droid.org/packages/io.github.mkckr0.audio_share_app)** was updated from `0.0.11` to `0.0.12`
* **[Auxio](https://f-droid.org/packages/org.oxycblt.auxio)** was updated from `3.2.0` to `3.2.1`
* **[BetterUntis](https://f-droid.org/packages/com.sapuseven.untis)** was updated from `4.0.3` to `4.1.0-beta01`
* **[Binary Eye](https://f-droid.org/packages/de.markusfisch.android.binaryeye)** was updated from `1.61.0` to `1.61.1`
* **[Blitzortung Lightning Monitor](https://f-droid.org/packages/org.blitzortung.android.app)** was updated from `2.2.1` to `2.2.2`
* **[Blood pressure monitor](https://f-droid.org/packages/com.derdilla.bloodPressureApp)** was updated from `1.5.6` to `1.5.7`
* **[boQwI'](https://f-droid.org/packages/org.tlhInganHol.android.klingonassistant)** was updated from `2022.08.12a` to `2023.11.20b`
* **[Boxcars](https://f-droid.org/packages/com.rocket9labs.boxcars)** was updated from `1.1.1` to `1.1.4`
* **[Buses](https://f-droid.org/packages/org.billthefarmer.buses)** was updated from `1.05` to `1.06`
* **[BusTO](https://f-droid.org/packages/it.reyboz.bustorino)** was updated from `2.1.0` to `2.1.1`
* **[Cache Cleaner](https://f-droid.org/packages/com.github.bmx666.appcachecleaner)** was updated from `1.8.6` to `1.9.2`
* **[Casio G-Shock Smart Sync](https://f-droid.org/packages/org.avmedia.gshockGoogleSync)** was updated from `11.0` to `11.4`
* **[Chaldea](https://f-droid.org/packages/cc.narumi.chaldea.fdroid)** was updated from `2.5.0` to `2.5.1`
* **[Cheogram](https://f-droid.org/packages/com.cheogram.android)** was updated from `2.12.8-3+free` to `2.13.0-1+free`
* **[Classical Music Scanner](https://f-droid.org/packages/de.kromke.andreas.mediascanner)** was updated from `1.7.1` to `1.7.2`
* **[Classical Music Tagger](https://f-droid.org/packages/de.kromke.andreas.musictagger)** was updated from `1.9.2` to `1.9.3`
* **[Clock You](https://f-droid.org/packages/com.bnyro.clock)** was updated from `6.2` to `6.4`
* **[Connect You](https://f-droid.org/packages/com.bnyro.contacts)** was updated from `7.1` to `8.1`
* **[Conversations](https://f-droid.org/packages/eu.siacs.conversations)** was updated from `2.12.12+free` to `2.13.0+free`
* **[Copy SMS Code - OTP Helper](https://f-droid.org/packages/io.github.jd1378.otphelper)** was updated from `1.7.0` to `1.7.1`
* **[Crossword](https://f-droid.org/packages/org.billthefarmer.crossword)** was updated from `1.23` to `1.24`
* **[Cryptographic ID](https://f-droid.org/packages/io.gitlab.cryptographic_id)** was updated from `0.4.3` to `0.4.4`
* **[Daily Diary](https://f-droid.org/packages/com.voklen.daily_diary)** was updated from `1.3.1` to `1.4.1`
* **[DAVx⁵](https://f-droid.org/packages/at.bitfire.davdroid)** was updated from `4.3.10-ose` to `4.3.10-ose`
* **[Deku SMS](https://f-droid.org/packages/com.afkanerd.deku)** was updated from `0.25.0` to `0.26.0`
* **[DialogMusicPlayer](https://f-droid.org/packages/phone.vishnu.dialogmusicplayer)** was updated from `v2.1.1` to `v2.1.2`
* **[Disroot app](https://f-droid.org/packages/org.disroot.disrootapp)** was updated from `2.0.6` to `2.0.8`
* **[Drinkable](https://f-droid.org/packages/com.moimob.drinkable)** was updated from `1.42.1` to `1.43.0`
* **[DumpSeeker](https://f-droid.org/packages/org.woheller69.dumpseeker)** was updated from `1.2` to `1.3`
* **[ente Authenticator](https://f-droid.org/packages/io.ente.auth)** was updated from `2.0.15` to `2.0.22`
* **[ente - encrypted photo storage](https://f-droid.org/packages/io.ente.photos.fdroid)** was updated from `0.7.108` to `0.8.0`
* **[e-Passport Reader](https://f-droid.org/packages/com.tananaev.passportreader)** was updated from `3.0` to `3.1`
* **[Etar - OpenSource Calendar](https://f-droid.org/packages/ws.xsoh.etar)** was updated from `1.0.36` to `1.0.38`
* **[FairEmail](https://f-droid.org/packages/eu.faircode.email)** was updated from `1.2123` to `1.2127`
* **[Fast Draw](https://f-droid.org/packages/peterfajdiga.fastdraw)** was updated from `1.7` to `2.0`
* **[F-Droid Build Status](https://f-droid.org/packages/de.storchp.fdroidbuildstatus)** was updated from `4.7.0` to `5.0.1`
* **[Feeder](https://f-droid.org/packages/com.nononsenseapps.feeder)** was updated from `2.6.8` to `2.6.9`
* **[Forkgram](https://f-droid.org/packages/org.forkgram.messenger)** was updated from `10.2.6.0` to `10.2.9.0`
* **[FOSS Browser](https://f-droid.org/packages/de.baumann.browser)** was updated from `11` to `12`
* **[Gauguin](https://f-droid.org/packages/org.piepmeyer.gauguin)** was updated from `0.10.0` to `0.12.1`
* **[Glider for Hacker News](https://f-droid.org/packages/nl.viter.glider)** was updated from `2.2.0` to `2.3.0`
* **[GLPI Agent](https://f-droid.org/packages/org.glpi.inventory.agent)** was updated from `1.3.0` to `1.4.0`
* **[Guileless Bopomofo Keyboard](https://f-droid.org/packages/org.ghostsinthelab.apps.guilelessbopomofo)** was updated from `1.9.44` to `1.9.45`
* **[Hacki for Hacker News](https://f-droid.org/packages/com.jiaqifeng.hacki)** was updated from `2.3.1` to `2.4.1`
* **[HexViewer](https://f-droid.org/packages/fr.ralala.hexviewer)** was updated from `1.49` to `1.50`
* **[HK Transport](https://f-droid.org/packages/app.hkTransport)** was updated from `1.0.2` to `1.0.3`
* **[HTTP Request Shortcuts](https://f-droid.org/packages/ch.rmy.android.http_shortcuts)** was updated from `3.6.0` to `3.7.0`
* **[IITC-CE Mobile](https://f-droid.org/packages/org.exarhteam.iitc_mobile)** was updated from `0.37.0` to `0.37.1`
* **[Image Toolbox (Resizer)](https://f-droid.org/packages/ru.tech.imageresizershrinker)** was updated from `2.4.3-alpha02` to `2.4.3-alpha03`
* **[Immich](https://f-droid.org/packages/app.alextran.immich)** was updated from `1.85.0` to `1.88.1`
* **[Infomaniak Mail](https://f-droid.org/packages/com.infomaniak.mail)** was updated from `1.0.20` to `1.1.0`
* **[Inner Breeze](https://f-droid.org/packages/io.naox.inbe)** was updated from `1.0.8` to `1.0.10`
* **[Invoice Ninja](https://f-droid.org/packages/com.invoiceninja.app)** was updated from `5.0.139` to `5.0.141`
* **[IR Remote](https://f-droid.org/packages/us.spotco.ir_remote)** was updated from `1.5.6` to `1.6.0`
* **[Joplin](https://f-droid.org/packages/net.cozic.joplin)** was updated from `2.13.6` to `2.13.7`
* **[JS-Dict](https://f-droid.org/packages/io.github.petlyh.jsdict)** was updated from `1.0.3` to `1.1.0`
* **[Keep Screen On](https://f-droid.org/packages/com.elasticrock.keepscreenon)** was updated from `1.12.1` to `1.13.1`
* **[KISS Launcher](https://f-droid.org/packages/fr.neamar.kiss)** was updated from `3.20.1` to `3.21.0`
* **[KitchenOwl](https://f-droid.org/packages/com.tombursch.kitchenowl)** was updated from `0.4.14` to `0.4.16`
* **[Kotatsu](https://f-droid.org/packages/org.koitharu.kotatsu)** was updated from `6.2.7` to `6.3.0`
* **[Les Pas - Photo Album for Nextcloud](https://f-droid.org/packages/site.leos.apps.lespas)** was updated from `2.9.5` to `2.9.6`
* **[LibreRandonaut](https://f-droid.org/packages/com.github.librerandonaut.librerandonaut)** was updated from `1.0.0` to `1.0.1`
* **[LibreTube](https://f-droid.org/packages/com.github.libretube)** was updated from `0.19.0` to `0.20.1`
* **[Linwood Butterfly](https://f-droid.org/packages/dev.linwood.butterfly.nightly)** was updated from `2.0.0-beta.14` to `2.0.0-beta.15`
* **[Massive](https://f-droid.org/packages/com.massive)** was updated from `1.185` to `2.6`
* **[Mastodon](https://f-droid.org/packages/org.joinmastodon.android)** was updated from `2.2.1` to `2.2.2`
* **[Mattermost Beta](https://f-droid.org/packages/com.mattermost.rnbeta)** was updated from `2.9.0` to `2.10.0`
* **[Mealient](https://f-droid.org/packages/gq.kirmanak.mealient)** was updated from `0.4.1` to `0.4.4`
* **[Mightier Amp](https://f-droid.org/packages/com.tuntori.mightieramp)** was updated from `1.0.6` to `1.0.7`
* **[Mines3D](https://f-droid.org/packages/cos.premy.mines)** was updated from `1.4.1` to `1.4.2`
* **[Minesweeper - Antimine](https://f-droid.org/packages/dev.lucanlm.antimine)** was updated from `17.5.10 F` to `17.6.0 F`
* **[MoasdaWiki App](https://f-droid.org/packages/net.moasdawiki.app)** was updated from `3.6.2.1` to `3.6.3.1`
* **[monocles chat](https://f-droid.org/packages/de.monocles.chat)** was updated from `1.7.7.2` to `1.7.7.3`
* **[Musify](https://f-droid.org/packages/com.gokadzev.musify.fdroid)** was updated from `6.7.1` to `6.8.0`
* **[My Expenses](https://f-droid.org/packages/org.totschnig.myexpenses)** was updated from `3.6.6` to `3.6.7.2`
* **[NClientV2](https://f-droid.org/packages/com.dar.nclientv2)** was updated from `3.0.2-stable-release` to `3.0.5-stable-release`
* **[neutriNote CE](https://f-droid.org/packages/com.appmindlab.nano)** was updated from `4.4.8` to `4.4.8b`
* **[Nextcloud Dev](https://f-droid.org/packages/com.nextcloud.android.beta)** was updated from `20231114` to `20231121`
* **[NextcloudServices](https://f-droid.org/packages/com.polar.nextcloudservices)** was updated from `1.0-beta16` to `1.0-beta17`
* **[Nextcloud Talk](https://f-droid.org/packages/com.nextcloud.talk2)** was updated from `17.1.2` to `17.1.3`
* **[Notesnook - Private notes app](https://f-droid.org/packages/com.streetwriters.notesnook)** was updated from `2.6.8` to `2.6.10`
* **[NOVA Video Player](https://f-droid.org/packages/org.courville.nova)** was updated from `6.2.34` to `6.2.35`
* **[Offi](https://f-droid.org/packages/de.schildbach.oeffi)** was updated from `12.1.14-aosp` to `12.1.15-aosp`
* **[Oinkoin](https://f-droid.org/packages/com.github.emavgl.piggybankpro)** was updated from `1.0.23` to `1.0.24`
* **[omWeather](https://f-droid.org/packages/org.woheller69.omweather)** was updated from `2.1` to `2.2`
* **[OpenFoodFacts](https://f-droid.org/packages/openfoodfacts.github.scrachx.openfood)** was updated from `4.11.0` to `4.12.0`
* **[Openreads](https://f-droid.org/packages/software.mdev.bookstracker)** was updated from `2.1.0` to `2.2.0`
* **[OpenTracks](https://f-droid.org/packages/de.dennisguse.opentracks)** was updated from `v4.9.4` to `v4.9.5`
* **[OpenVK Legacy](https://f-droid.org/packages/uk.openvk.android.legacy)** was updated from `1.1.207-beta.f` to `1.1.213-f`
* **[OUI Lookup and Database](https://f-droid.org/packages/org.alberto97.ouilookup)** was updated from `1.6.0` to `1.6.1`
* **[ParkenUlm](https://f-droid.org/packages/development.parkenulm)** was updated from `2.0.0` to `2.2`
* **[Petals](https://f-droid.org/packages/br.com.colman.petals)** was updated from `3.16.0` to `3.17.0`
* **[Phonograph Plus](https://f-droid.org/packages/player.phonograph.plus)** was updated from `1.3.2` to `1.4.0`
* **[Pie Launcher](https://f-droid.org/packages/de.markusfisch.android.pielauncher)** was updated from `1.14.2` to `1.14.3`
* **[PipePipe](https://f-droid.org/packages/InfinityLoop1309.NewPipeEnhanced)** was updated from `3.1.5` to `3.1.7`
* **[Pocket Paint](https://f-droid.org/packages/org.catrobat.paintroid)** was updated from `2.11.0` to `2.12.0`
* **[Prepaid Balance](https://f-droid.org/packages/com.github.muellerma.prepaidbalance)** was updated from `2.4` to `2.5`
* **[pretixPRINT](https://f-droid.org/packages/eu.pretix.pretixprint)** was updated from `2.16.2-foss` to `2.16.3-foss`
* **[Print](https://f-droid.org/packages/org.billthefarmer.print)** was updated from `1.07` to `1.08`
* **[Privacy Browser](https://f-droid.org/packages/com.stoutner.privacybrowser.standard)** was updated from `3.15.1` to `3.16`
* **[Quicksy](https://f-droid.org/packages/im.quicksy.client)** was updated from `2.12.12+free` to `2.13.0+free`
* **[QuickWeather](https://f-droid.org/packages/com.ominous.quickweather)** was updated from `2.5.5` to `2.5.7`
* **[Quran 16 Line - Quran Revision Helper](https://f-droid.org/packages/com.wqar.quran_mem_helper)** was updated from `1.1.0` to `1.1.1`
* **[Railway station photos](https://f-droid.org/packages/de.bahnhoefe.deutschlands.bahnhofsfotos)** was updated from `15.0.3` to `15.0.4`
* **[Really Basic Vocab](https://f-droid.org/packages/de.herrmann_engel.rbv)** was updated from `3.3.3` to `3.3.4`
* **[Record You](https://f-droid.org/packages/com.bnyro.recorder)** was updated from `7.1` to `7.2`
* **[RustDesk](https://f-droid.org/packages/com.carriez.flutter_hbb)** was updated from `1.2.3-1` to `1.2.3-2`
* **[Seal](https://f-droid.org/packages/com.junkfood.seal)** was updated from `1.10.0-(F-Droid)` to `1.11.0-(F-Droid)`
* **[Shader Editor](https://f-droid.org/packages/de.markusfisch.android.shadereditor)** was updated from `2.31.1` to `2.32.0`
* **[SilverDict](https://f-droid.org/packages/com.gmail.blandilyte.silverdict)** was updated from `1.1.0` to `1.2.1`
* **[Simple Crypto Widget](https://f-droid.org/packages/com.brentpanther.bitcoinwidget)** was updated from `8.4.1` to `8.4.3`
* **[SimpMusic](https://f-droid.org/packages/com.maxrave.simpmusic)** was updated from `0.1.4-beta` to `0.1.6`
* **[Smart AutoClicker](https://f-droid.org/packages/com.buzbuz.smartautoclicker)** was updated from `2.3.6` to `2.4.0`
* **[SMS Import / Export](https://f-droid.org/packages/com.github.tmo1.sms_ie)** was updated from `2.2.0` to `2.3.0`
* **[Squawker](https://f-droid.org/packages/org.ca.squawker)** was updated from `3.5.2` to `3.5.3`
* **[SshDaemon](https://f-droid.org/packages/com.daemon.ssh)** was updated from `2.1.10` to `2.1.13`
* **[StoneAge](https://f-droid.org/packages/com.cweb.messenger)** was updated from `2.12.8+free` to `2.12.12+free`
* **[Super Retro Mega Wars](https://f-droid.org/packages/com.serwylo.retrowars)** was updated from `0.31.12` to `0.31.13`
* **[Syncthing-Fork](https://f-droid.org/packages/com.github.catfriend1.syncthingandroid)** was updated from `1.26.0.2` to `1.26.1.0`
* **[Syncthing](https://f-droid.org/packages/com.nutomic.syncthingandroid)** was updated from `1.26.0` to `1.26.1`
* **[Tailscale](https://f-droid.org/packages/com.tailscale.ipn)** was updated from `1.53.115-t6cce5fe00-gab4a672a4eb` to `1.55.47-tb88929edf-g0a44d50e8b0`
* **[TaiwanEbookSearcher](https://f-droid.org/packages/liou.rayyuan.ebooksearchtaiwan)** was updated from `2.1.1` to `2.1.2`
* **[Tarnhelm](https://f-droid.org/packages/cn.ac.lz233.tarnhelm)** was updated from `1.5.5` to `1.6.0`
* **[Tasks.org: Open-source To-Do Lists & Reminders](https://f-droid.org/packages/org.tasks)** was updated from `13.6` to `13.6.2`
* **[Thumb-Key](https://f-droid.org/packages/com.dessalines.thumbkey)** was updated from `2.5.2` to `2.6.1`
* **[TimePlanner](https://f-droid.org/packages/ru.aleshin.timeplanner)** was updated from `0.7.8` to `0.8.0`
* **[Traccar Client](https://f-droid.org/packages/org.traccar.client)** was updated from `7.0` to `7.2`
* **[Translate You](https://f-droid.org/packages/com.bnyro.translate)** was updated from `7.1` to `8.0`
* **[Tridenta](https://f-droid.org/packages/org.stypox.tridenta)** was updated from `1.2` to `1.3`
* **[Tuner](https://f-droid.org/packages/de.moekadu.tuner)** was updated from `6.4.0` to `6.5.0`
* **[Tuner by BillTheFarmer](https://f-droid.org/packages/org.billthefarmer.tuner)** was updated from `1.54` to `1.55`
* **[Tuta Mail](https://f-droid.org/packages/de.tutao.tutanota)** was updated from `3.118.27` to `3.118.30`
* **[twitter2nitter](https://f-droid.org/packages/eu.auct.twitter2nitter)** was updated from `1.8` to `1.9`
* **[Unciv](https://f-droid.org/packages/com.unciv.app)** was updated from `4.8.18` to `4.9.0`
* **[Unofficial Golem.de Reader](https://f-droid.org/packages/de.eknoes.inofficialgolem)** was updated from `1.2.7` to `1.2.8`
* **[Unstoppable Wallet](https://f-droid.org/packages/io.horizontalsystems.bankwallet)** was updated from `0.36.0` to `0.36.1`
* **[Vibe You](https://f-droid.org/packages/app.suhasdissa.vibeyou)** was updated from `1.0` to `2.0`
* **[Voyager for Lemmy](https://f-droid.org/packages/app.vger.voyager)** was updated from `1.23.2` to `1.24.2`
* **[wallabag](https://f-droid.org/packages/fr.gaulupeau.apps.InThePoche)** was updated from `2.5.0` to `2.5.1`
* **[Wall You](https://f-droid.org/packages/com.bnyro.wallpaper)** was updated from `6.1` to `6.2`
* **[Wattz](https://f-droid.org/packages/dubrowgn.wattz)** was updated from `1.12` to `1.13`
* **[Wave Lines Live Wallpaper](https://f-droid.org/packages/de.markusfisch.android.wavelines)** was updated from `1.13.2` to `1.13.3`
* **[wger Workout Manager](https://f-droid.org/packages/de.wger.flutter)** was updated from `1.5.6` to `1.6.2`
* **[Xtra](https://f-droid.org/packages/com.github.andreyasadchy.xtra)** was updated from `2.26.1` to `2.26.2`
* **[Yivi](https://f-droid.org/packages/org.irmacard.cardemu)** was updated from `7.5.2` to `7.5.3`
* **[ZipXtract](https://f-droid.org/packages/com.wirelessalien.zipxtract)** was updated from `3.0` to `4.0`
* **[Zulip](https://f-droid.org/packages/com.zulipmobile)** was updated from `27.218` to `27.219`


Thank you for reading this week's TWIF :)
Please subscribe to the [RSS feed](https://f-droid.org/news/) in your favourite RSS application to be updated of new TWIFs when they come up.


You are welcome to join the [TWIF forum thread](https://forum.f-droid.org/t/new-twif-submission-thread/23546) if you have any news from around the community, maybe it will be featured next week ;)
