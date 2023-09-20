---
layout: page
title: Verifying downloaded F-Droid.apk

---

Some details on this can be found in our documentation at [Release Channels and Signing Keys](../Release_Channels_and_Signing_Keys). To make it easier to understand for non-devs, here are the steps in short:

* download [https://f-droid.org/F-Droid.apk.asc](https://f-droid.org/F-Droid.apk.asc) and [https://f-droid.org/F-Droid.apk](https://f-droid.org/F-Droid.apk)
* load the public key for `admin@f-droid.org`
* compare the fingerprint with what the documentation mentioned above states
* verify the file

On Linux, this is what it would look like:

```
# download the files
wget -q https://f-droid.org/F-Droid.apk.asc
wget -q https://f-droid.org/F-Droid.apk
# load the public key
gpg --keyserver keyserver.ubuntu.com --recv-key 37D2C98789D8311948394E3E41E7044E1DBA2E89
# verify the file
gpg --verify F-Droid.apk.asc F-Droid.apk
```

The expected output of the last command should look like:

```
gpg: Signature made Mon 09 Aug 2021 11:17:55 PM CEST
gpg:                using RSA key 802A9799016112346E1FEFF47A029E54DD5DCE7A
gpg: Good signature from "F-Droid <admin@f-droid.org>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 37D2 C987 89D8 3119 4839  4E3E 41E7 044E 1DBA 2E89
     Subkey fingerprint: 802A 9799 0161 1234 6E1F  EFF4 7A02 9E54 DD5D CE7A
```

The date will vary as the client .APK is updated, it's not an issue if it is newer. The warning about the key not being certified with a trusted signature can be ignored. The important part is the indication of a good signature and that it has the same fingerprint (`37D2 C987 89D8 3119 4839 4E3E 41E7 044E 1DBA 2E89`) that was used to download the key. 
