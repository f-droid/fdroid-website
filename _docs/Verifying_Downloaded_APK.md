---
layout: page
title: Verifying downloaded F-Droid.apk

---

Some details on this can be found in our documentation at [Release Channels and Signing Keys](../Release_Channels_and_Signing_Keys). To make it easier to understand for non-devs, here are the steps in short:

-   download [https://f-droid.org/F-Droid.apk.asc](https://f-droid.org/F-Droid.apk.asc) and [https://f-droid.org/F-Droid.apk](https://f-droid.org/F-Droid.apk)
-   load the public key for `admin@f-droid.org`
-   compare the fingerprint with what the documentation mentioned above states
-   verify the file

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

The warning about the key not being certified with a trusted signature can be ignored. The important part is the indication of a good signature and that it has the same fingerprint (`37D2 C987 89D8 3119 4839 4E3E 41E7 044E 1DBA 2E89`) that was used to download the key. If the warning bothers you: having verified the signature, you can express your trust in the key and sign it locally (i.e. just for you):

```
gpg --edit-key 37D2C98789D8311948394E3E41E7044E1DBA2E89
gpg> trust
3
gpg> lsign
gpg> save
```

(The value `3` passed to the `trust` command above means trusting the key marginally.)

Run the `gpg --verify` command again and the warning will be gone:

```
gpg: Signature made Mon 09 Aug 2021 11:17:55 PM CEST
gpg:                using RSA key 802A9799016112346E1FEFF47A029E54DD5DCE7A
gpg: checking the trustdb
gpg: marginals needed: 3  completes needed: 1  trust model: pgp
gpg: depth: 0  valid:   3  signed:  19  trust: 0-, 0q, 0n, 0m, 0f, 3u
gpg: depth: 1  valid:  19  signed:   1  trust: 1-, 0q, 0n, 14m, 4f, 0u
gpg: depth: 2  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 1f, 0u
gpg: next trustdb check due at 2021-11-05
gpg: Good signature from "F-Droid <admin@f-droid.org>" [full]
Primary key fingerprint: 37D2 C987 89D8 3119 4839  4E3E 41E7 044E 1DBA 2E89
     Subkey fingerprint: 802A 9799 0161 1234 6E1F  EFF4 7A02 9E54 DD5D CE7A
```

