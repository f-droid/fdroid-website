---
layout: post
title: "Publishing an F-Droid Repo using a Hardware Security Module"
author: "Bubu"
authorWebsite: "https://bubu1.eu"
---

The following is a tutorial for publishing apps through F-Droid using a hardware security module (HSM). The HSM used in this post is a [Nitrokey HSM2](https://www.nitrokey.com/#comparison). Other hardware tokens should have similar functionality, but you'll have to use different commands for interacting with the HSM.

Storing signing keys in an HSM provides major security advantages once a key is generated inside a HSM it can never be extracted in plain text form. Instead the data to be signed is sent to the HSM which will produce the signature with the internally held key material. They also apply some tamper resistance technologies which makes physical extraction of the key very difficult.

A signing key for an Android application is part of the identity of said app. As a security measure an update for an app can only be installed when the new apk is signed with the same private key as the old one. Storing the keys in an HSM makes sure that even if an attacker compromises your infrastructure they will not be able to steal the signing keys. In fact there's never any ambiguity if an attacker might have gotten access to the keys. The physical HSM would need to be stolen and that is at least obvious at that point. The intruder could still possibly use the HSM to sign malicious apps though.

F-Droid has two signing steps. All apks as well as the repository index are signed. All of those keys should ideally be stored inside a HSM.

**Disclaimer:** I asked Nitrokey if they could sponsor some Nitrokey HSMs to get F-Droid's publishing workflow to work with it. They agreed to send me three of them and asked me to write a blog post about my results.

### Step 0: Preparing the Nitrokey HSM2

It's highly recommended to initialize the Nitrokey with a Device Key Encryption Key (DKEK) before use. This allows key backup and restore onto another Nitrokey initialized with the same DKEK in case of a Hardware failure. It's also required for importing existing signing keys into the HSM (see below).

A step-by-step guide on how to set this up and the possible options for managing DKEK shares and passphrases can be found [here](https://github.com/OpenSC/OpenSC/wiki/SmartCardHSM#using-key-backup-and-restore)

Needless to say that you should keep the DKEK stored at a very secure place.

### (optional) Step 1: Import Existing Singing Keys into the HSM

The Nitrokey HSM2 can only import keys that are "wrapped" (encrypted) with the correct DKEK, so to import a plain key from a java keystore this key has to be manually wrapped with the DKEK first. The manufacturer of the SmartCard inside the Nitrokey HSMs ([CardContact](http://www.cardcontact.de/)) has a tool called smartcard-shell which can do this. The tools isn't that great to use (it's a java GUI tool scripted with javascript). I ported this process to a small command-line python tool, which can be found [here](https://git.bubu1.eu/Bubu/nitrokeywrapper).

### Step 2: Setting up the F-Droid Repo

You should use the latest [2.0a](https://gitlab.com/fdroid/fdroidserver/-/tags/2.0a0) version of F-Droid or install it from git master. A few HSM usage issues have recently been ironed out.

Initialize a new repo as follows, this will setup the necessary config files for using fdroid with a HSM

```bash
$ fdroid init --keystore NONE  # NONE means using a HSM keystore
```

You'll need to then at least change `keystorepass` in *config.py* which needs to be set to the Nitrokeys smartcard pin. If you have imported an existing repository signing key, this needs to be set as `repo_keyalias`. Otherwise you can create a new key directly on the HSM (change `keydname` to what the certificate details should look like for you repo.)

```bash
$ fdroid update --create-key  # This will take a while...
```

### Step 3: Sign an app and publish an index

From now on everything should work as usual as long as the Nitrokey is plugged into your machine. F-Droid will automatically use it when singing apps with `fdroid publish` and when generating a signed repository index with `fdroid update`.

### What about signing a lot of apps?

The Nitrokey HSM2 has only limited space for signing keys, it can store up to 38 2048 bit RSA keys. There's a [work-in-progress MR](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/783)
making use of the wrapped key functionality to only load app signing keys onto the HSM on demand. This allows using an unlimited amount of different keys with a single Nitrokey. (Many thanks to [Jason Donenfeld (zx2c4)](https://www.zx2c4.com/) for coming up with this idea!)
