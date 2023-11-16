---
layout: post
title: "F-Droid Alphas and good news for CJK users"
author: "Licaon_Kter"
---

### TWIF generated on Thursday, 16 Nov 2023, Week 46


#### F-Droid core
**[F-Droid Basic](https://f-droid.org/packages/org.fdroid.basic)** and **[F-Droid](https://f-droid.org/packages/org.fdroid.fdroid)** were updated to `1.19.0-alpha1` as development continues. _Note that this is still in beta so brave users need to install this manually (enable Beta updates for the app or from Client expert settings)._


#### Community News
[@Licaon_Kter](https://gitlab.com/licaon-kter) highlights that **[Orgzly Revived](https://f-droid.org/packages/com.orgzlyrevived)** was newly added, and as its name spells it out, it's a fork of **[Orgzly](https://f-droid.org/packages/com.orgzly)** that appeared out of necessity given that Orgzly's main developer has not been seen for the last year. We hope [@Neven](https://github.com/nevenz) if fine and safe!

As announced last week **[Arcticons Dark](https://f-droid.org/packages/com.donnnno.arcticons)**, **[Arcticons Light](https://f-droid.org/packages/com.donnnno.arcticons.light)** and **[Arcticons You](https://f-droid.org/packages/com.donnnno.arcticons.you)** were updated to `8.0.6` so you can now enjoy more than 8000 icons. And if your favourite app is not yet in, do ask for it!

[@Vasyl Gello](https://forum.f-droid.org/u/basilgello) shared with us that **[RustDesk](https://f-droid.org/packages/com.carriez.flutter_hbb)** was updated to `1.2.3-1` bringing significant changes like:
> * Hardware keyboard support for Android: now you can use your favourite mechanics paired to your phone to control other desktops, servers or even phones!
> * Updated libraries: fixes [CVE-2023-5217](https://www.openwall.com/lists/oss-security/2023/09/28/5) and several other security vulnerabilities exploited in the wild.
> * Builds for all 4 platforms: arm, arm64, x86 and x86_64. Rustdesk becomes F-Droid’s first submission built with Flutter framework on 32-bit x86 Android.
> * Automated update support: new versions will be built automatically as soon as new upstream version becomes public!

_Small note from [@Licaon_Kter](https://gitlab.com/licaon-kter): RustDesk currently is flagged with the [Tracking](https://gitlab.com/fdroid/fdroiddata/-/blob/24dd4c6385701057ab11f359ea498da76ed73282/metadata/com.carriez.flutter_hbb.yml#L3-L4) [antifeature](https://f-droid.org/en/docs/Anti-Features/#Tracking), but Vasyl promised they're on track to fix that so F-Droid users get the chance to use their remote devices in a privacy-friendly way!_

[@rocka](https://github.com/rocka) let us know that **[Fcitx5 for Android](https://f-droid.org/packages/org.fcitx.fcitx5.android)** (and its plugins) have been updated to `0.0.8`. [Fcitx5](https://github.com/fcitx/fcitx5) is a generic input method framework on Linux, the Android port includes virtual keyboard with customizable color scheme, clipboard management, as well as plugin support for adding more languages. English and Chinese (Pinyin, Wubi, Cangjie) are bundled within the application. Two plugins got updated this release:
> * **[Anthy](https://f-droid.org/packages/org.fcitx.fcitx5.android.plugin.anthy)**: Japanese input method based on anthy-unicode
> * **[Clipboard Filter](https://f-droid.org/packages/org.fcitx.fcitx5.android.plugin.clipboard_filter)**: strip tracking parameters from URLs in clipboard

And 6 more are now available:
> * **[Chewing](https://f-droid.org/packages/org.fcitx.fcitx5.android.plugin.chewing)**: Zhuyin/Bopobomfo for Traditional Chinese based on libchewing
> * **[Hangul](https://f-droid.org/packages/org.fcitx.fcitx5.android.plugin.hangul)**: Korean input method based on libhangul
> * **[Jyutping](https://f-droid.org/packages/org.fcitx.fcitx5.android.plugin.jyutping)**: Cantonese input method based on libime-jyutping
> * **[RIME](https://f-droid.org/packages/org.fcitx.fcitx5.android.plugin.rime)**: Rime Input Method Engine with custom schemas
> * **[Sayura](https://f-droid.org/packages/org.fcitx.fcitx5.android.plugin.sayura)**: Sinhala input method
> * **[Unikey](https://f-droid.org/packages/org.fcitx.fcitx5.android.plugin.unikey)**: Vietnamese input method

_[@linsui](https://gitlab.com/linsui) comments: Fcitx5 Android 0.0.8 is an exciting update for CJK users! The input methods apps are very important - without them you can't input anything. English users maybe didn't notice this since they can use the keyboard shipped with AOSP and there are many other keyboards like AnySoftKeyboard in F-Droid which support many more languages. However, CJK users have had much less choices, specially in F-Droid. We only had two general IME apps for Chinese users: Trime and Lime. There are few other apps supporting specific schemes. For Japanese users, there were only two choices: OpenWnn and Mozc Android, both of which are not maintained anymore, unfortunately. And we had no IME app for Korean users nor Sinhala users. Then what app were they using? Maybe GBoard was their only choice. But now the situation has changed! Fcitx5 Android brings many input methods to F-Droid and, since 0.0.8, most plugins available on Linux desktop are also available on Android. Besides that, as a input method framework, it's much easier to develop a new input method for Android with it. So, if you're stuck with GBoard, please give Fcitx5 a try!_


#### Removed Apps
##### 5 apps were removed
**Como** was no longer able to download words from its server.

**Curator**, **LifeHQ** and **Wrotto** are no longer developed, so their developer asked the team for them to be archived.

**YARR**'s repo was archived by its developer and it is no longer actively maintained.

_Small note from [@Licaon_Kter](https://gitlab.com/licaon-kter): Some of the apps were archived because users reported them to the F-Droid team, so if you see an app that suddenly misbehaves, fails to run, to connect to its services or otherwise malfunction, feel free to [open an issue](https://gitlab.com/fdroid/fdroiddata/-/issues) so the team can investigate and take measures as needed._


#### Newly Added Apps
##### 6 more apps were newly added
* **[Bible Verse App](https://f-droid.org/packages/ch.joshuah.bibleverseapp)**
* **[FREE Browser](https://f-droid.org/packages/org.woheller69.browser)**
* **[Flip a coin](https://f-droid.org/packages/org.ecos.logic.flip_a_coin)**
* **[LiveWallpaperIt - Muzei plugin for Reddit](https://f-droid.org/packages/rocks.tbog.livewallpaperit)**
* **[NiDeau](https://f-droid.org/packages/com.gitlab.schaerphix_tool_nideau.nideau)**
* **[Pirate Solitaire](https://f-droid.org/packages/io.itch.pirate_solitaire)**


#### Updated Apps
##### 149 more apps were updated
* **[2048 Open Fun Game](https://f-droid.org/packages/org.andstatus.game2048)** was updated from `1.12.0` to `1.14.3`
* **[AAAAXY](https://f-droid.org/packages/io.github.divverent.aaaaxy)** was updated from `1.4.72+20231030.3091.de20c129` to `1.4.101+20231111.3120.29c354f1`
* **[AF Weather Widget](https://f-droid.org/packages/net.gitsaibot.af)** was updated from `2.3` to `2.4`
* **[AirGuard - AirTag protection](https://f-droid.org/packages/de.seemoo.at_tracking_detection)** was updated from `2.1` to `2.1.1`
* **[Amethyst](https://f-droid.org/packages/com.vitorpamplona.amethyst)** was updated from `0.80.4` to `0.80.7`
* **[AndBible: Bible Study](https://f-droid.org/packages/net.bible.android.activity)** was updated from `5.0.742` to `5.0.755`
* **[APK Explorer & Editor](https://f-droid.org/packages/com.apk.editor)** was updated from `v0.27` to `v0.28`
* **[Audile](https://f-droid.org/packages/com.mrsep.musicrecognizer)** was updated from `1.1.0` to `1.1.3`
* **[AusweisApp](https://f-droid.org/packages/com.governikus.ausweisapp2)** was updated from `1.26.7` to `2.0.0`
* **[BetterUntis](https://f-droid.org/packages/com.sapuseven.untis)** was updated from `4.0.2` to `4.0.3`
* **[Bimba](https://f-droid.org/packages/xyz.apiote.bimba.czwek)** was updated from `3.1.0` to `3.1.1`
* **[blocker](https://f-droid.org/packages/com.merxury.blocker)** was updated from `2.0.2976-fdroid` to `2.0.3058-fdroid`
* **[Boxcars](https://f-droid.org/packages/com.rocket9labs.boxcars)** was updated from `1.0.8` to `1.1.1`
* **[Burger Party](https://f-droid.org/packages/com.agateau.burgerparty)** was updated from `1.4.2` to `1.4.3`
* **[Cache Cleaner](https://f-droid.org/packages/com.github.bmx666.appcachecleaner)** was updated from `1.8.4` to `1.8.6`
* **[Calculator++](https://f-droid.org/packages/org.solovyev.android.calculator)** was updated from `2.2.7` to `2.3.3`
* **[CameraAlign](https://f-droid.org/packages/org.jshobbysoft.cameraalign)** was updated from `3.0` to `3.1`
* **[Casio G-Shock Smart Sync](https://f-droid.org/packages/org.avmedia.gshockGoogleSync)** was updated from `10.7` to `11.0`
* **[Chaldea](https://f-droid.org/packages/cc.narumi.chaldea.fdroid)** was updated from `2.4.20` to `2.5.0`
* **[Chip Defense](https://f-droid.org/packages/de.chadenas.cpudefense)** was updated from `1.22` to `1.26`
* **[Copy SMS Code - OTP Helper](https://f-droid.org/packages/io.github.jd1378.otphelper)** was updated from `1.6.0` to `1.7.0`
* **[CPU Stats](https://f-droid.org/packages/jp.takke.cpustats)** was updated from `2.1.5` to `2.2.0`
* **[croc](https://f-droid.org/packages/com.github.howeyc.crocgui)** was updated from `1.10.12` to `1.10.13`
* **[Crossword](https://f-droid.org/packages/org.billthefarmer.crossword)** was updated from `1.22` to `4.4.199`
* **[Currency](https://f-droid.org/packages/org.billthefarmer.currency)** was updated from `1.55` to `1.56`
* **[Dark theme](https://f-droid.org/packages/com.phstudio.darktheme)** was updated from `2.5` to `2.6`
* **[Databag](https://f-droid.org/packages/com.databag)** was updated from `1.0` to `1.1`
* **[DataStats](https://f-droid.org/packages/jp.takke.datastats)** was updated from `2.8.2` to `2.8.3`
* **[Diary](https://f-droid.org/packages/org.billthefarmer.diary)** was updated from `1.102` to `1.103`
* **[DPC](https://f-droid.org/packages/cz.slaby.dpc)** was updated from `1.1.0` to `1.2.0`
* **[DuckDuckGo Privacy Browser](https://f-droid.org/packages/com.duckduckgo.mobile.android)** was updated from `5.175.1` to `5.177.1`
* **[Editor](https://f-droid.org/packages/org.billthefarmer.editor)** was updated from `1.89` to `1.90`
* **[EinkBro](https://f-droid.org/packages/info.plateaukao.einkbro)** was updated from `10.15.0` to `10.16.1`
* **[ente - encrypted photo storage](https://f-droid.org/packages/io.ente.photos.fdroid)** was updated from `0.7.102` to `0.7.108`
* **[Every Door](https://f-droid.org/packages/info.zverev.ilya.every_door)** was updated from `4.0.0` to `4.1.0`
* **[EVMap - EV chargers](https://f-droid.org/packages/net.vonforst.evmap)** was updated from `1.7.0` to `1.7.1`
* **[FairEmail](https://f-droid.org/packages/eu.faircode.email)** was updated from `1.2118` to `1.2123`
* **[Feeder](https://f-droid.org/packages/com.nononsenseapps.feeder)** was updated from `2.6.7-1` to `2.6.8`
* **[Fennec F-Droid](https://f-droid.org/packages/org.mozilla.fennec_fdroid)** was updated from `119.0.0` to `119.1.0`
* **[FluffyChat](https://f-droid.org/packages/chat.fluffy.fluffychat)** was updated from `1.15.0` to `1.15.1`
* **[Forkgram](https://f-droid.org/packages/org.forkgram.messenger)** was updated from `10.2.3.0` to `10.2.6.0`
* **[FOSS Warn](https://f-droid.org/packages/de.nucleus.foss_warn)** was updated from `0.5.1` to `0.6.0`
* **[FreePaint](https://f-droid.org/packages/io.github.pastthepixels.freepaint)** was updated from `1.0.2` to `1.1.0`
* **[Gallery for PhotoPrism](https://f-droid.org/packages/ua.com.radiokot.photoprism)** was updated from `1.20.3` to `1.21.0`
* **[Gauguin](https://f-droid.org/packages/org.piepmeyer.gauguin)** was updated from `0.9.4` to `0.10.0`
* **[GPSLogger](https://f-droid.org/packages/com.mendhak.gpslogger)** was updated from `127` to `129`
* **[gptAssist](https://f-droid.org/packages/org.woheller69.gptassist)** was updated from `1.20` to `1.30`
* **[Graded - Grade tracker](https://f-droid.org/packages/com.NightDreamGames.Grade.ly)** was updated from `2.4.2` to `2.5.0`
* **[Gridle](https://f-droid.org/packages/org.billthefarmer.gridle)** was updated from `1.15` to `1.16`
* **[Groestlcoin Wallet](https://f-droid.org/packages/hashengineering.groestlcoin.wallet)** was updated from `10.03` to `10.07`
* **[Groestlcoin Wallet TestNet](https://f-droid.org/packages/hashengineering.groestlcoin.wallet_test)** was updated from `10.03` to `10.07`
* **[Hacki for Hacker News](https://f-droid.org/packages/com.jiaqifeng.hacki)** was updated from `2.2.0` to `2.3.1`
* **[Hamfisted](https://f-droid.org/packages/org.nhcham.hamfisted)** was updated from `0.1.3` to `0.1.4`
* **[Handy Reading](https://f-droid.org/packages/ru.yanus171.feedexfork)** was updated from `0.18.18` to `0.19.7`
* **[Harmony Music](https://f-droid.org/packages/com.anandnet.harmonymusic)** was updated from `1.5.0` to `1.6.0`
* **[HK Transport](https://f-droid.org/packages/app.hkTransport)** was updated from `1.0.1` to `1.0.2`
* **[idTech4A++](https://f-droid.org/packages/com.karin.idTech4Amm)** was updated from `1.1.0harmattan33natasha` to `1.1.0harmattan35natasha`
* **[Immich](https://f-droid.org/packages/app.alextran.immich)** was updated from `1.84.0` to `1.85.0`
* **[Inner Breeze](https://f-droid.org/packages/io.naox.inbe)** was updated from `1.0.1` to `1.0.8`
* **[Inure App Manager (Trial)](https://f-droid.org/packages/app.simple.inure)** was updated from `Build94` to `Build95`
* **[Inventory](https://f-droid.org/packages/com.codelv.inventory)** was updated from `1.0.5` to `1.0.6`
* **[Invoice Ninja](https://f-droid.org/packages/com.invoiceninja.app)** was updated from `5.0.138` to `5.0.139`
* **[IYPS](https://f-droid.org/packages/com.iyps)** was updated from `1.4.2` to `1.4.3`
* **[Joplin](https://f-droid.org/packages/net.cozic.joplin)** was updated from `2.13.5` to `2.13.6`
* **[jtx Board journals&notes&tasks](https://f-droid.org/packages/at.techbee.jtx)** was updated from `2.06.01.ose` to `2.06.03.ose`
* **[KitchenOwl](https://f-droid.org/packages/com.tombursch.kitchenowl)** was updated from `0.4.13` to `0.4.14`
* **[Kotatsu](https://f-droid.org/packages/org.koitharu.kotatsu)** was updated from `6.2.6` to `6.2.7`
* **[Library App VideLibri](https://f-droid.org/packages/de.benibela.videlibri)** was updated from `2.752` to `2.765`
* **[Librera Reader](https://f-droid.org/packages/com.foobnix.pro.pdf.reader)** was updated from `8.9.46-fdroid` to `8.9.58-fdroid`
* **[Linux Command Library](https://f-droid.org/packages/com.inspiredandroid.linuxcommandbibliotheca)** was updated from `3.2.2` to `3.2.3`
* **[Linwood Flow](https://f-droid.org/packages/dev.linwood.flow.nightly)** was updated from `0.2.0` to `0.2.1`
* **[LMS](https://f-droid.org/packages/com.craigd.lmsmaterial.app)** was updated from `0.4.1` to `0.4.2`
* **[Logcat](https://f-droid.org/packages/com.tananaev.logcat)** was updated from `2.0` to `2.1`
* **[LogFox](https://f-droid.org/packages/com.f0x1d.logfox)** was updated from `1.4.9` to `1.5.0`
* **[Markdownr](https://f-droid.org/packages/com.sanzoghenzo.markdownr)** was updated from `1.5.1` to `1.6.0`
* **[Massive](https://f-droid.org/packages/com.massive)** was updated from `1.167` to `1.185`
* **[Metronome](https://f-droid.org/packages/com.bobek.metronome)** was updated from `1.4.3` to `1.4.4`
* **[Minesweeper - Antimine](https://f-droid.org/packages/dev.lucanlm.antimine)** was updated from `17.5.1 F` to `17.5.10 F`
* **[monocles chat](https://f-droid.org/packages/de.monocles.chat)** was updated from `1.7.5` to `1.7.7.2`
* **[Mull](https://f-droid.org/packages/us.spotco.fennec_dos)** was updated from `119.0.0` to `119.1.0`
* **[MuPDF mini](https://f-droid.org/packages/com.artifex.mupdf.mini.app)** was updated from `1.23.4a` to `1.23.5a`
* **[MuPDF viewer](https://f-droid.org/packages/com.artifex.mupdf.viewer.app)** was updated from `1.23.4a` to `1.23.5a`
* **[Musify](https://f-droid.org/packages/com.gokadzev.musify.fdroid)** was updated from `6.6.0` to `6.7.1`
* **[NetGuard](https://f-droid.org/packages/eu.faircode.netguard)** was updated from `2.324` to `2.325`
* **[Nextcloud Cookbook](https://f-droid.org/packages/de.lukasneugebauer.nextcloudcookbook)** was updated from `0.14.4` to `0.14.5`
* **[Nextcloud Dev](https://f-droid.org/packages/com.nextcloud.android.beta)** was updated from `20231102` to `20231114`
* **[NextDNS Manager](https://f-droid.org/packages/com.doubleangels.nextdnsmanagement)** was updated from `4.7.12` to `4.8`
* **[Notes](https://f-droid.org/packages/org.billthefarmer.notes)** was updated from `1.37` to `1.38`
* **[NOVA Video Player](https://f-droid.org/packages/org.courville.nova)** was updated from `6.2.33` to `6.2.34`
* **[Offi](https://f-droid.org/packages/de.schildbach.oeffi)** was updated from `12.1.13-aosp` to `12.1.14-aosp`
* **[Oinkoin](https://f-droid.org/packages/com.github.emavgl.piggybankpro)** was updated from `1.0.22` to `1.0.23`
* **[OpenDNS Updater](https://f-droid.org/packages/fr.guillaumevillena.opendnsupdater)** was updated from `2.2.3` to `2.2.4`
* **[OpenVPN for Android](https://f-droid.org/packages/de.blinkt.openvpn)** was updated from `0.7.49` to `0.7.50`
* **[Opus 1 Music Player](https://f-droid.org/packages/de.kromke.andreas.opus1musicplayer)** was updated from `2.61.2` to `2.61.3`
* **[Pachli](https://f-droid.org/packages/app.pachli)** was updated from `1.3.0` to `1.4.0`
* **[PasswdSafe](https://f-droid.org/packages/com.jefftharris.passwdsafe)** was updated from `6.23.1` to `6.23.3`
* **[Persian Calendar](https://f-droid.org/packages/com.byagowi.persiancalendar)** was updated from `8.3.6` to `8.4.0`
* **[PhotoChiotte](https://f-droid.org/packages/la.daube.photochiotte)** was updated from `1.45` to `1.46`
* **[Pie Launcher](https://f-droid.org/packages/de.markusfisch.android.pielauncher)** was updated from `1.14.1` to `1.14.2`
* **[PlainApp: File & Web Access](https://f-droid.org/packages/com.ismartcoding.plain)** was updated from `1.2.10` to `1.2.11`
* **[Podverse](https://f-droid.org/packages/com.podverse.fdroid)** was updated from `4.14.2` to `4.14.3`
* **[Prepaid Balance](https://f-droid.org/packages/com.github.muellerma.prepaidbalance)** was updated from `2.3` to `2.4`
* **[ProtonVPN - Secure and Free VPN](https://f-droid.org/packages/ch.protonvpn.android)** was updated from `4.8.32.1` to `4.8.38.0`
* **[psychphinder](https://f-droid.org/packages/com.daih.psychphinder)** was updated from `1.1.2` to `1.1.3`
* **[QRAlarm](https://f-droid.org/packages/com.sweak.qralarm)** was updated from `1.5.8` to `1.5.10`
* **[QR Scanner (PFA)](https://f-droid.org/packages/com.secuso.privacyFriendlyCodeScanner)** was updated from `4.3.1` to `4.4.0`
* **[Railway station photos](https://f-droid.org/packages/de.bahnhoefe.deutschlands.bahnhofsfotos)** was updated from `15.0.2` to `15.0.3`
* **[Retro Stack](https://f-droid.org/packages/ro.hume.cosmin.retrostack)** was updated from `0.2.4` to `0.2.5`
* **[Revengate](https://f-droid.org/packages/org.revengate.revengate)** was updated from `0.10.0` to `0.11.0`
* **[SatDump](https://f-droid.org/packages/org.satdump.SatDump)** was updated from `1.1.1` to `1.1.2`
* **[Sayboard](https://f-droid.org/packages/com.elishaazaria.sayboard)** was updated from `v4.1.0` to `v4.1.1`
* **[Seeneva: smart comic reader](https://f-droid.org/packages/app.seeneva.reader)** was updated from `0.1.1-fdroid` to `0.1.2-fdroid`
* **[SerialPipe](https://f-droid.org/packages/io.github.wh201906.serialpipe)** was updated from `v0.0.1` to `v0.0.2`
* **[Shitter](https://f-droid.org/packages/org.nuclearfog.twidda)** was updated from `3.4.5` to `3.4.6`
* **[Signal Generator](https://f-droid.org/packages/org.billthefarmer.siggen)** was updated from `1.34` to `1.35`
* **[SilverDict](https://f-droid.org/packages/com.gmail.blandilyte.silverdict)** was updated from `1.0.6` to `1.1.0`
* **[Simlar - secure calls](https://f-droid.org/packages/org.simlar)** was updated from `2.9.4 (alwaysOnline)` to `2.10.0 (alwaysOnline)`
* **[SimpleTextEditor](https://f-droid.org/packages/com.maxistar.textpad)** was updated from `1.24.1` to `1.24.2`
* **[Smart AutoClicker](https://f-droid.org/packages/com.buzbuz.smartautoclicker)** was updated from `2.3.5` to `2.3.6`
* **[Specie](https://f-droid.org/packages/org.billthefarmer.specie)** was updated from `1.12` to `1.13`
* **[SpMp](https://f-droid.org/packages/com.toasterofbread.spmp)** was updated from `0.2.3` to `0.2.4`
* **[Squircle CE - Code Editor](https://f-droid.org/packages/com.blacksquircle.ui)** was updated from `2023.1.5` to `2023.2.0`
* **[Stopwatch](https://f-droid.org/packages/com.github.muellerma.stopwatch)** was updated from `1.2` to `1.3`
* **[Stroke Input Method (筆畫輸入法)](https://f-droid.org/packages/io.github.yawnoc.strokeinput)** was updated from `1.2.6` to `1.2.7`
* **[Sudoku (Privacy Friendly)](https://f-droid.org/packages/org.secuso.privacyfriendlysudoku)** was updated from `3.1` to `3.1.1`
* **[Symphony](https://f-droid.org/packages/io.github.zyrouge.symphony)** was updated from `2023.8.105` to `2023.11.106`
* **[Syncthing-Fork](https://f-droid.org/packages/com.github.catfriend1.syncthingandroid)** was updated from `1.23.6.0` to `1.26.0.2`
* **[Syncthing](https://f-droid.org/packages/com.nutomic.syncthingandroid)** was updated from `1.23.7` to `1.26.0`
* **[Table Habit](https://f-droid.org/packages/io.github.friesi23.mhabit)** was updated from `1.9.1` to `1.9.2`
* **[Tabletop Tools](https://f-droid.org/packages/com.github.muellerma.tabletoptools)** was updated from `1.23` to `1.24`
* **[Tailscale](https://f-droid.org/packages/com.tailscale.ipn)** was updated from `1.51.207-t35d7b3aa2-g3a305b158ca` to `1.53.115-t6cce5fe00-gab4a672a4eb`
* **[Taler Wallet](https://f-droid.org/packages/net.taler.wallet.fdroid)** was updated from `0.9.3+p9` to `0.9.3+p10`
* **[taz](https://f-droid.org/packages/de.taz.android.app.free)** was updated from `1.7.4` to `1.8.0`
* **[Telegram FOSS](https://f-droid.org/packages/org.telegram.messenger)** was updated from `10.1.1` to `10.2.6`
* **[The Light](https://f-droid.org/packages/org.hlwd.bible)** was updated from `3.71` to `3.72`
* **[TorrServe](https://f-droid.org/packages/ru.yourok.torrserve)** was updated from `MatriX.126.2.F-Droid` to `MatriX.127.F-Droid`
* **[Tuner](https://f-droid.org/packages/org.billthefarmer.tuner)** was updated from `1.53` to `1.54`
* **[Tuta Mail](https://f-droid.org/packages/de.tutao.tutanota)** was updated from `3.118.22` to `3.118.27`
* **[Unciv](https://f-droid.org/packages/com.unciv.app)** was updated from `4.8.16` to `4.8.18`
* **[URLSanitizer](https://f-droid.org/packages/moe.dic1911.urlsanitizer)** was updated from `2.0.3` to `2.1.0`
* **[Vespucci](https://f-droid.org/packages/de.blau.android)** was updated from `19.2.4.0` to `19.3.1.0`
* **[Voyager for Lemmy](https://f-droid.org/packages/app.vger.voyager)** was updated from `1.20.1` to `1.23.2`
* **[wallabag](https://f-droid.org/packages/fr.gaulupeau.apps.InThePoche)** was updated from `2.4.3` to `2.5.0`
* **[WG Tunnel](https://f-droid.org/packages/com.zaneschepke.wireguardautotunnel)** was updated from `3.2.0` to `3.2.1`
* **[Wikipedia](https://f-droid.org/packages/org.wikipedia)** was updated from `r/2.7.50455-r-2023-10-10` to `r/2.7.50458-r-2023-11-09`
* **[Wulkanowy](https://f-droid.org/packages/io.github.wulkanowy)** was updated from `2.2.5` to `2.2.6`
* **[Xtra](https://f-droid.org/packages/com.github.andreyasadchy.xtra)** was updated from `2.26.0` to `2.26.1`
* **[Zulip](https://f-droid.org/packages/com.zulipmobile)** was updated from `27.217` to `27.218`
* **[μlogger](https://f-droid.org/packages/net.fabiszewski.ulogger)** was updated from `3.9` to `3.10`


Thank you for reading this week's TWIF :)
Please subscribe to the [RSS feed](https://f-droid.org/news/) in your favourite RSS application to be updated of new TWIFs when they come up.


You are welcome to join the [TWIF forum thread](https://forum.f-droid.org/t/new-twif-submission-thread/23546) if you have any news from around the community, maybe it will be featured next week ;)
