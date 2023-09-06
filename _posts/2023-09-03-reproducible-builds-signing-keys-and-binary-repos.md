---
layout: post
title: "Reproducible builds, signing keys, and binary repos"
author: "izzy"
authorWebsite: "https://android.izzysoft.de/"
---

Earlier this year, we reported about our progress concerning [reproducible builds]({{ site.baseurl }}/{% post_url 2023-01-15-towards-a-reproducible-fdroid %}). Meanwhile, more and more apps are using this; you can find [some statistics here](https://gitlab.com/obfusk/fdroid-misc-scripts/-/blob/master/reproducible/overview.md): compared to about 20 apps in November 2022, the number of apps being built reproducibly went up by almost a factor of 10 to around 191 in September 2023\. About 2 out of every 3 apps newly added to F-Droid are using this path. But what exactly does „reproducible build“ mean, in easy terms and without all the „tech-buzz“?

All the years before, F-Droid created a dedicated key for each app to sign the published APKs, but now with reproducible builds F-Droid ships APKs that are signed by the upstream developer(s). Which proves to you that the developer confirmed: „this is what I intended to publish, this was built from my code“. And that it's distributed by F-Droid tells you: „F-Droid confirms, too, that this is the APK built from the very code the developer provided“. So neither of the two could have „sneaked in“ something not contained in the app's source code repository.

Verification at F-Droid, again in easy terms, happens this way: the app is built from the source code on F-Droid's build servers. Then the corresponding APK built by the developer is fetched, and compared against it. The only differences should be the signature files – as the APKs from the developer was signed using their private key, which F-Droid has no access to. If this is the case (i.e. the two APKs match), it was proven to be the very same „binary“ – and F-Droid can distribute the one signed by the developer.

You can find an outline of the process [here]({{ site.baseurl }}/en/docs/Inclusion_How-To/#reproducible-builds), and technical details in [this documentation]({{ site.baseurl }}/docs/Reproducible_Builds/).


### Wins and caveats
A few advantages are pretty clear: higher trust is the first thing coming to mind, as now two parties (F-Droid and the developer) can both confirm the integrity of the distributed APK. But there's more to it. For one, if a developer has to push out some „emergency update“ (e.g. to fix a security issue, or something critical was broken) you'd no longer need to wait for a full build cycle or two to get hold of it. As the APK you've installed from F-Droid was signed using the developers' private key, you can simply take an APK they provide you directly by other means (e.g. via the app's repository at Codeberg, GitLab or Github) and update to that – provided you trust the developer enough – which you then must, as such builds are not (yet) verified by F-Droid.

So are there any „drawbacks“? Why does the header mention „caveats“? Well… F-Droid now provides APKs it did not sign itself. So what if an app's source repo was compromised by a malicious party which then modified the code and provided their own release, while the original author e.g. was on vacation, at the hospital or otherwise indisposed? They'd of course sign the APK with their own private key (as hopefully the original author kept their private key safe). But that must somehow be considered and dealt with. So meet:


### AllowedAPKSigningKeys
Whenever a reproducible build is established at F-Droid, the hash of the corresponding developer's certificate used to sign their APKs is stored along with the other metadata on F-Droid's end. The keyword for that in the [Build Metadata]({{ site.baseurl }}/docs/Build_Metadata_Reference) is `AllowedAPKSigningKeys`. So when the developer's APK is fetched for comparison, the signature is compared against that:

```
apksigner verify --print-certs app-release.apk 2>/dev/null \
 | sed -n 's/^Signer #1 certificate SHA-256 digest: \(.*\)/\1/p'
```

will give us the SHA-256 hash of the certificate used to sign the APK. Should it not match, the APK will be rejected – and the build is considered „failed“. This ensures that F-Droid really only ships the intended APKs, signed by the proper key – and the above mentioned potential „malicious party“ cannot easily „sneak in things“. A good security feature to be used in this context, though it originally was intended for something else:


### Binary repositories
What is that you ask? Well: F-Droid is not tied to the single repository operated by F-Droid itself. Everyone can set up a custom repository. Like the apps F-Droid distributes, all its code is free and libre, too. One of the best known third-party repositories probably is the one known as „[IzzyOnDroid Repo](https://apt.izzysoft.de/fdroid)“ or „IzzySoft Repo“, currently providing more than 1,111 apps. There, `AllowedAPKSigningKeys` was established for all its apps in the first week of August 2023. As this repo takes its APKs directly from the developers' repositories instead of building them from the source code, this extra measure of security is especially useful – for the reason outlined above: to ensure all updates are „legit“ (and not placed to the repo by a malicious actor).

So whenever the updater fetches a new APK from the corresponding app's repo at Codeberg, GitLab, Github etc., fdroidserver validates it was really signed with the key of its author. If it was not, it will never be included in the repository's index (so it will not be shipped to you and thus cannot endanger you). Instead, the repo's maintainer will receive an alert and has to investigate:

```
2023-09-01 20:56:25,845 WARNING: "com.example.app_123.apk" is signed by a key that is not allowed:
a0fe1234567890abcdefa0fe1234567890abcdefa0fe1234567890abcdef1234
```

Which means: Now it's time to investigate what happened. As the APK will never reach the index before the new key has been acknowledged by the repository maintainer, this can be done thoroughly without haste.


### Is that really a frequent issue?
Unfortunately, it is. During the process of updating the metadata at the IzzyOnDroid repository, 26 of the 1105 apps checked encountered that issue: the signing keys were changed since the first version present. That makes 2.35% of the apps checked. As if that wouldn't be bad enough, not one of the following 4 weeks passed without at least one other app encountering that issue. Making the raw stats: the year has 52 weeks, the repo has 1000+ apps – with just one app per week, roughly one out of 20 apps (5%) are affected by this problem at least once!

In each case, the corresponding developer was reached out to so the reason could be found, and the issue (hopefully) be fixed. You might wonder what could have caused this, so here are some of the reasons given. All of them meant, one way or the other:

> „Ugh, I lost the signing key…“

* disk crashes (or entire PCs giving up)
* accidentally deleting the directory where the „important stuff“ is in
* signing was done by a team member that left (with the key)
* the development environment was freshly set up, or moved to a new machine – and somehow the keystore was not moved along (when the problem was discovered, the original environment was no longer accessible)
* the developer had used a „debug key“ when development was started (fine if you locally develop things for yourself – but not a good thing if the app shall be distributed), so they had to switch to a „release key“
* the original key was „too weak“ and had to be replaced by a stronger one

In the last two cases, legitimacy was easy to establish by providing the latest APK in two variants: the very same build, but once signed with the original, and another with the new key. Thus the two APKs could be compared similarly to the procedure used with reproducible builds – provided the original key was not already deleted for being „obsolete“.


### Lessons learned #1: the repository maintainer
It is a good measure to establish `AllowedAPKSigningKeys` in your binary repo for **all** apps it contains. This issue happens far too often to be ignored. The apps you distribute must be safe: you have a responsibility towards the people using your repository. While such updates would be rejected if the app was already installed on a device („incompatible signature“), the problem won't be detected by those installing the app „freshly“, for the first time. Those must be protected as well.

The good part: in none of the cases, a malicious action was the reason for the key change. That does not mean it will never be the case – but it's good to know we can trust our FOSS developers pretty well.

The bad part: the importance of keeping the keystore safe seems not to be self-evident enough. We need to raise awareness for this.


### Lessons learned #2: how to keep your key safe and what measures to take for the event of loss?
The obvious: Make backups! Not just on your development machine. Have another backup off-device – e.g. on an encrypted thumbdrive stored in a secure place, on a trustable server/machine elsewhere (with a friend, a family member, or a cloud service – again, an **encrypted** backup). And be sure you know how to restore it. You might not need a Backup Ceremony like the one the [F-Droid team performed]({{ site.baseurl }}/{% post_url 2023-07-15-community-controlled-backup-ceremony %}) – but some measures should be taken. And no: uploading them to your app's public git repo is **not** a good idea, not even for a backup (don't laugh, but that happened, too).

The less obvious: make sure someone/something can „vouch“ for you. Again, from the cases encountered:

* sign your commits (GPG/PGP), ideally all of them and from the very start. And of course keep your GPG/PGP key safe as well. That way your signed commits from **after** the event prove you're still in control of that key. It's rather unlikely someone compromised your Git repo **and** your GPG/PGP key but not your keystore for signing the apps.
* provide different (independent) ways to contact you. Your Git repo compromised **could** mean it was entered via your compromised mail account – but probably not your XMPP or Matrix account. This information should also be available from early on: all details provided only afterwards could come from the potential „malicious actor“ and would not prove your ownership.
* again early on, introduce a person knowing you that can vouch for you – for example as they can verify your story by giving you a phone call or meeting you in person, and then testify about it. Ideally, this person is a contributor to your repo. But most importantly, the community must know they can trust them. Which is either because it's a well-known person – or at least someone introduced long before the incident.


### Lessons learned #3: what to do when it happened?
Most important: do **not** try to simply „cover up“ or „hush up“. This is a security incident; sweeping it under the carpet just makes you lose trust entirely. Updates won't work without uninstall/reinstall, so folks will notice anyway (except on Google Play Store, which re-signs the APKs). Rather be transparent about it:

* mention it in the release notes (and in the per-release changelogs if you use [Fastlane](https://gitlab.com/-/snippets/1895688) or [Triple-T](https://gitlab.com/snippets/1901490)).
* maybe have a short article on it (e.g. a public issue with your app's repo, or a blog entry) explaining what happened, what you had to do and what you learned from it (so others can learn from it, too).
* if you have some means to prove your identity (you've always signed your commits, you have some person to vouch for you, etc.), mention it with the release notes/article so everyone can verify. If you still have access to your old keystore but had to change it for some reason, provide an additional APK built from the same commit but signed with the old key, which would be a definite proof: the methods of verifying reproducible builds could be applied then to compare the two APKs – which then again should only differ in the signature.
* nobody was ever „born wise“ – we're all students for all of our lives („who ceases to be a student, never was a student at all“). So yes, this is bad, and you might feel „ashamed“. But it shows character and establishes trust to stand by your mistakes, to admit them. That way people know you won't „fool“ them and they can believe you.
