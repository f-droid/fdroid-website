---
layout: post
title: "F-Droid Client 1.19 alpha and KDE Connect"
author: "paulali"
---


### TWIF generated on Thursday, 19 Oct 2023, Week 42


#### F-Droid core
##### F-Droid Client 1.19 
F-Droid Client 1.19.0-alpha is almost here. You aren't ready for this release; please prepare :)
Some of the updates in this client release include:
- Completely overhauled adding repositories and mirrors, both the user experience and the code
- Preview repo contents before adding new repos
- Include integrated QR scanner for adding new repos and mirrors
- Use Session Installer on both F-Droid and F-Droid Basic, including support for
  automatic background updates
- On Android 14, mark apps with unsupported Target SDK Version as incompatible [#2692](https://gitlab.com/fdroid/fdroidclient/-/issues/2692)
- Long click to copy Links, Permissions and Versions on App Details screen ([@Tobias_Groza](https://gitlab.com/Tobias_Groza))
- Incompatible apps are no longer shown anywhere when they are disabled [#41](https://gitlab.com/fdroid/fdroidclient/-/issues/41) ([@pigpig](https://gitlab.com/pigpig))
- Include `lysator7eknrfl47rlyxvgeamrv7ucefgrrlhk7rouv3sna25asetwid.onion` as default mirror
- Fix Litecoin button linking to Bitcoin address [#2683](https://gitlab.com/fdroid/fdroidclient/-/issues/2683) ([@Tobias_Groza](https://gitlab.com/Tobias_Groza))


#### Community News
##### Google removes KDE Connect app installed via F-Droid
This past week, Google Play Protect removed [KDE Connect](https://f-droid.org/packages/org.kde.kdeconnect_tp/) from many users devices because it was installed via F-Droid. The developer tried for days to reach out to the support team at Google to get the issue fixed. You can follow their struggle [here](https://nitter.net/albertvaka/status/1712954968477401478).

To learn more about this. please check out this [article](https://www.golem.de/news/play-protect-google-entfernt-kde-app-aus-f-droid-von-android-smartphones-2310-178521.html) (in German, links to Reddit discussion in English).


#### Removed Apps
##### 3 apps were removed
It is sad to report that **Dash Electrum** and **Retroshare** are no longer in the official F-Droid Repository. 
But they'll be the F-Droid Archive Repository for the foreseeable future.
The reason for this is that they are not maintained anymore and are affected by the [libwebcp CVE vulnerability](https://stackdiary.com/critical-vulnerability-in-webp-codec-cve-2023-4863/) as we reported in [last week's TWIF](https://f-droid.org/2023/10/12/twif-vulnerability-patching-fdroid-client-radiodroid-revival.html).

**Private Location** was also removed as was no longer functioning and development has stopped years ago, as reported in [#3096](https://gitlab.com/fdroid/fdroiddata/-/issues/3096).


#### Newly Added Apps
##### 2 apps were newly added
* **[Canta](https://f-droid.org/packages/org.samo_lego.canta)**
* **[Cosmic IDE](https://f-droid.org/packages/org.cosmicide)**


#### Updated Apps
##### 86 apps were updated
* **[Acode editor - Android code editor](https://f-droid.org/packages/com.foxdebug.acode)** was updated from 1.8.7 to 1.8.7
* **[AddisMapTransit](https://f-droid.org/packages/com.addismaptransit.app)** was updated from 0.3.0 to 1.0.2
* **[Alovoa](https://f-droid.org/packages/com.alovoa.expo)** was updated from 1.5.0 to 1.6.1
* **[Android 2 Linux Notifications](https://f-droid.org/packages/dev.patri9ck.a2ln)** was updated from 1.2.8 to 1.3.1
* **[Arcticons Dark](https://f-droid.org/packages/com.donnnno.arcticons)** was updated from 7.2.6 to 7.3.7
* **[Arcticons Light](https://f-droid.org/packages/com.donnnno.arcticons.light)** was updated from 7.2.6 to 7.3.7
* **[Arcticons You](https://f-droid.org/packages/com.donnnno.arcticons.you)** was updated from 7.2.6 to 7.3.7
* **[Aria2Android](https://f-droid.org/packages/com.gianlu.aria2android)** was updated from 2.6.6 to 2.6.8
* **[Aria2App](https://f-droid.org/packages/com.gianlu.aria2app)** was updated from 5.9.14 to 5.9.16
* **[Aurora Store](https://f-droid.org/packages/com.aurora.store)** was updated from 4.3.2 to 4.3.3
* **[Blitzortung Lightning Monitor](https://f-droid.org/packages/org.blitzortung.android.app)** was updated from 2.1.12 to 2.1.14
* **[Blood pressure monitor](https://f-droid.org/packages/com.derdilla.bloodPressureApp)** was updated from 1.5.3 to 1.5.5
* **[Ceno Browser: Share the Web](https://f-droid.org/packages/ie.equalit.ceno)** was updated from 2.0.3 to 2.0.6
* **[Clima](https://f-droid.org/packages/co.prestosole.clima)** was updated from 3.1.3 to 3.2.0
* **[Copy SMS Code - OTP Helper](https://f-droid.org/packages/io.github.jd1378.otphelper)** was updated from 1.2.0 to 1.3.0
* **[DAVx⁵](https://f-droid.org/packages/at.bitfire.davdroid)** was updated from 4.3.7-ose to 4.3.8-ose
* **[Databag](https://f-droid.org/packages/com.databag)** was updated from 1.0 to 1.0
* **[Drinkable](https://f-droid.org/packages/com.moimob.drinkable)** was updated from 1.38.0 to 1.39.0
* **[DuckDuckGo Privacy Browser](https://f-droid.org/packages/com.duckduckgo.mobile.android)** was updated from 5.171.1 to 5.172.2
* **[Editor](https://f-droid.org/packages/org.billthefarmer.editor)** was updated from 1.88 to 1.89
* **[F-Droid](https://f-droid.org/packages/org.fdroid.fdroid)** was updated from 1.18.0-alpha0 to 1.18.0
* **[F-Droid Basic](https://f-droid.org/packages/org.fdroid.basic)** was updated from 1.18.0-alpha0 to 1.18.0
* **[FairEmail](https://f-droid.org/packages/eu.faircode.email)** was updated from 1.2107 to 1.2108
* **[Feeder](https://f-droid.org/packages/com.nononsenseapps.feeder)** was updated from 2.6.5 to 2.6.6
* **[Finamp](https://f-droid.org/packages/com.unicornsonlsd.finamp)** was updated from 0.6.17 to 0.6.18
* **[Fulguris Web Browser](https://f-droid.org/packages/net.slions.fulguris.full.fdroid)** was updated from 1.9.15 to 1.9.17
* **[Gallery for PhotoPrism](https://f-droid.org/packages/ua.com.radiokot.photoprism)** was updated from 1.19.0 to 1.20.0
* **[Gotify](https://f-droid.org/packages/com.github.gotify)** was updated from 2.7.0 to 2.7.1
* **[Guileless Bopomofo Keyboard](https://f-droid.org/packages/org.ghostsinthelab.apps.guilelessbopomofo)** was updated from 1.9.36 to 1.9.42
* **[HTTP Request Shortcuts](https://f-droid.org/packages/ch.rmy.android.http_shortcuts)** was updated from 3.5.0 to 3.6.0
* **[Home Assistant](https://f-droid.org/packages/io.homeassistant.companion.android.minimal)** was updated from 2023.9.2-minimal to 2023.10.2-minimal
* **[Husky](https://f-droid.org/packages/su.xash.husky)** was updated from 1.4.5 to 1.4.6
* **[Infomaniak kDrive](https://f-droid.org/packages/com.infomaniak.drive)** was updated from 4.2.26 to 4.2.30
* **[Infomaniak kSync](https://f-droid.org/packages/com.infomaniak.sync)** was updated from 4.3.7 to 4.3.8
* **[Insigno](https://f-droid.org/packages/org.mindshub.insigno)** was updated from 1.3.1 to 1.4.0
* **[Jerboa for Lemmy](https://f-droid.org/packages/com.jerboa)** was updated from 0.0.48 to 0.0.49
* **[JustChess](https://f-droid.org/packages/com.alaskalinuxuser.justchess)** was updated from 2.0 to 2.4
* **[Kodi](https://f-droid.org/packages/org.xbmc.kodi)** was updated from 20.0-ALPHA3 to 20.2
* **[Ladefuchs](https://f-droid.org/packages/app.ladefuchs.android)** was updated from 2.0.6 to 2.0.7
* **[Loud Bang](https://f-droid.org/packages/aq.metallists.loudbang)** was updated from 0.47 to 0.48
* **[MOROway App](https://f-droid.org/packages/de.moroway.oc)** was updated from 8.1.6 to 8.1.8
* **[Markor](https://f-droid.org/packages/net.gsantner.markor)** was updated from 2.10.9 to 2.11.1
* **[Material Files](https://f-droid.org/packages/me.zhanghai.android.files)** was updated from 1.6.1 to 1.6.2
* **[Mattermost Beta](https://f-droid.org/packages/com.mattermost.rnbeta)** was updated from 2.8.1 to 2.8.2
* **[Mull](https://f-droid.org/packages/us.spotco.fennec_dos)** was updated from 118.1.0 to 118.2.0
* **[Mullvad VPN: privacy is a universal right](https://f-droid.org/packages/net.mullvad.mullvadvpn)** was updated from 2023.6 to 2023.7
* **[MusicBrainz](https://f-droid.org/packages/org.metabrainz.android)** was updated from 6.1.1 to 7.0.0
* **[Neo Backup](https://f-droid.org/packages/com.machiav3lli.backup)** was updated from 8.3.3 to 8.3.4
* **[Nextcloud Dev](https://f-droid.org/packages/com.nextcloud.android.beta)** was updated from 20231008 to 20231012
* **[Olauncher](https://f-droid.org/packages/app.olauncher)** was updated from v4.1.4 to v4.1.5
* **[OneTwo](https://f-droid.org/packages/com.nicue.onetwo)** was updated from 1.1.9 to 1.2.0
* **[Open Stable Diffusion](https://f-droid.org/packages/com.openstablediffusion)** was updated from 1.6 to 1.7
* **[OpenLauncher](https://f-droid.org/packages/com.benny.openlauncher)** was updated from 0.7.4 to 1.0.0
* **[OpenTracks](https://f-droid.org/packages/de.dennisguse.opentracks)** was updated from v4.9.0 to v4.9.1
* **[Overload](https://f-droid.org/packages/cloud.pablos.overload)** was updated from 0.11.0 to 0.11.1
* **[Pachli](https://f-droid.org/packages/app.pachli)** was updated from 1.2.1 to 1.2.2
* **[PlainApp: File & Web Access](https://f-droid.org/packages/com.ismartcoding.plain)** was updated from 1.2.9 to 1.2.10
* **[ReLaunchX](https://f-droid.org/packages/com.gacode.relaunchx)** was updated from 2.1.5 to 2.1.6
* **[Reader for Selfoss](https://f-droid.org/packages/bou.amine.apps.readerforselfossv2.android)** was updated from 123061811-github to 123102852-github
* **[Really Basic Vocab](https://f-droid.org/packages/de.herrmann_engel.rbv)** was updated from 3.3.2 to 3.3.3
* **[Rtl-sdr driver](https://f-droid.org/packages/marto.rtl_tcp_andro)** was updated from 3.14 to 3.15
* **[SMS Import / Export](https://f-droid.org/packages/com.github.tmo1.sms_ie)** was updated from 2.1.0 to 2.2.0
* **[Screenshot Tile (NoRoot)](https://f-droid.org/packages/com.github.cvzi.screenshottile)** was updated from 2.3.5 to 2.3.7
* **[SelfPrivacy](https://f-droid.org/packages/pro.kherel.selfprivacy)** was updated from 0.9.0 to 0.9.1
* **[Session F-Droid](https://f-droid.org/packages/network.loki.messenger.fdroid)** was updated from 1.17.1 to 1.17.3
* **[SimpMusic](https://f-droid.org/packages/com.maxrave.simpmusic)** was updated from 0.1.3-beta to 0.1.4-beta
* **[Simple Gallery Pro](https://f-droid.org/packages/com.simplemobiletools.gallery.pro)** was updated from 6.28.0 to 6.28.1
* **[SimpleX Chat](https://f-droid.org/packages/chat.simplex.app)** was updated from 5.3.1 to 5.3.2
* **[SshDaemon](https://f-droid.org/packages/com.daemon.ssh)** was updated from 2.1.9 to 2.1.10
* **[TTL Changer](https://f-droid.org/packages/com.mrsep.ttlchanger)** was updated from 1.1.1 to 1.2.0
* **[Taler Wallet](https://f-droid.org/packages/net.taler.wallet.fdroid)** was updated from 0.9.3+p7 to 0.9.3+p8
* **[Tournant](https://f-droid.org/packages/eu.zimbelstern.tournant)** was updated from 2.2.2 to 2.2.3
* **[Tuner](https://f-droid.org/packages/org.billthefarmer.tuner)** was updated from 1.52 to 1.53
* **[URLCheck](https://f-droid.org/packages/com.trianguloy.urlchecker)** was updated from 2.12 to 2.13
* **[Unlauncher](https://f-droid.org/packages/com.jkuester.unlauncher)** was updated from 2.0.0-beta.5 to 2.0.0
* **[VCMI](https://f-droid.org/packages/is.xyz.vcmi)** was updated from 1.4 to 1.3.2
* **[Vinyl Music Player](https://f-droid.org/packages/com.poupa.vinylmusicplayer)** was updated from 1.5.2 to 1.5.3
* **[WG Tunnel](https://f-droid.org/packages/com.zaneschepke.wireguardautotunnel)** was updated from 3.0.3 to 3.1.0
* **[Wikipedia](https://f-droid.org/packages/org.wikipedia)** was updated from r/2.7.50452-r-2023-09-06 to r/2.7.50454-r-2023-10-10
* **[YAACC](https://f-droid.org/packages/de.yaacc)** was updated from 4.0.1 to 4.0.2
* **[Zulip](https://f-droid.org/packages/com.zulipmobile)** was updated from 27.214 to 27.216
* **[ente - encrypted photo storage](https://f-droid.org/packages/io.ente.photos.fdroid)** was updated from 0.7.93 to 0.7.100
* **[ente Authenticator](https://f-droid.org/packages/io.ente.auth)** was updated from 2.0.6 to 2.0.8
* **[gptAssist](https://f-droid.org/packages/org.woheller69.gptassist)** was updated from 1.9 to 1.10
* **[monocles chat](https://f-droid.org/packages/de.monocles.chat)** was updated from 1.7.4 to 1.7.5
* **[neutriNote CE](https://f-droid.org/packages/com.appmindlab.nano)** was updated from 4.4.6a to 4.4.7


Thank you for reading this week's TWIF :).
Please subscribe to the RSS feed at https://f-droid.org/news/ in your favourite RSS application to be updated of new TWIFs when they come up.


You are welcome to join the [TWIF forum thread](https://forum.f-droid.org/t/new-twif-submission-thread/23546) if you have any news from around the community, maybe it will be featured next week. ;)
