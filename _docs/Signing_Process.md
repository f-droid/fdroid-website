---
layout: page
title: Signing Process

---


Cryptographic signatures using public/private key parts are central to
[how F-Droid](../Security_Model) provides secure app
distribution. Signing keys are required to make your own releases with
the F-Droid tools.  Consider the location, security and backup status
of your key files carefully.  The keys need to remain secure for the
entire lifetime of an F-Droid repo, or an Android app.  The signing
key is central the identity of an Android app and an F-Droid repo, so
those keys must be kept safe, secure and well backed up!  Also, take
note that Google's directions for
[securing these private keys](https://developer.android.com/studio/publish/app-signing.html#secure-key)
provides only the minimal steps to take to safeguard the keys.

There are two kinds of signing involved in running a repository:

-   the signing of the repo index itself
-   the standard Android APK signing process

### Repo Index Signing

When setting up the repository, one of the first steps should be to
generate a signing key for the repository index. This will also create
a keystore, which is the file that holds the signing keys.

`fdroid init` will automatically create a new signing key for an
F-Droid repo.  It is possible to manually create keys just like
creating
[Android signing keys](https://developer.android.com/studio/publish/app-signing.html#signing-manually),
with a command like:

```bash
keytool -genkey -v -keystore my.keystore -alias repokey \
  -keyalg RSA -keysize 2048 -validity 10000
```

In the above, replace _my.keystore_ with the name of the keystore file
to be created, and ’repokey’ with a name to identify the repo index
key by.  You’ll be asked for a password for the keystore, AND a
password for the key. They shouldn’t be the same. In between, you’ll
be asked for some identifying details which will go in the
certificate.

The two passwords entered go into _config.yml_, as `keystorepass` and
`keypass` respectively. The path to the keystore file is set in
`keystore`, and the alias you chose for the key also go into that file
is called `repo_keyalias`.


### APK Signing

The F-Droid tools can automatic generate and manage APK signing keys
for each app that it maintains.  With the repo index signing
configured, all that remains to be done for package signing to work is
to set the _keydname_ field in _config.yml_ to contain the same
identifying details you entered before.  A new key will be generated
using these details, for each application that is built. If a
specific key is required for a particular application, this system can
be overridden using the _keyaliases_ config settings.

To set up `fdroid publish`, do these steps on the same machine where
you copy APKs to and run `fdroid update`.  First, set _keydname_ in
_config.yml_, it should be something like this:

```python
keydname = "CN=example.com, O=Example Ltd, C=UK"
```

Create a dir called _unsigned/_ next to the _metadata/_ and _repo/_
dirs, and run these commands to move the APK into place with a new
name based on _Application ID_ and _Version Code_:

```console
$ cd /path/to/repobasedir
$ touch metadata/com.example.app.yml
$ mkdir unsigned
$ cp /path/to/app-release-unsigned.apk unsigned/com.example.app_1234.apk
$ fdroid publish --verbose
$ fdroid update --verbose
$ fdroid server update --verbose
```


### Package Signing

All packages built and/or distributed using F-Droid tools can also be
signed by PGP using [GnuPG](https://gnupg.org), anything from APKs to
media files will be signed.  This process is run with `fdroid
gpgsign`.  Add `gpghome` and `gpgkey` to your _config.yml_ to configure
it, there is more information in
[examples/config.yml][examples/config.yml].


### Hardware Security Modules

Hardware Security Modules (HSMs) are specially designed pieces of
hardware for securely storing and using cryptographic keys.  They
provide write-only storage, so that a private key can only be written
to the HSM and never read off of it.  _fdroidserver_ has support for
using HSMs for repo signing keys.

For information on how to configure an F-Droid repo to use an HSM, see
the "smartcard" sections of [examples/config.yml][examples/config.yml],
specifically `keystore` and `smartcardoptions`.  Most likely,
[OpenSC](https://github.com/OpenSC/OpenSC) will need to be set up as a
PKCS11 provider for Java.

For more in-depth information, see
[Security in a thumb drive: the promise and pain of hardware security modules, take one!](https://guardianproject.info/2014/03/28/security-in-a-thumb-drive-the-promise-and-pain-of-hardware-security-modules-take-one/)


[examples/config.yml]: https://gitlab.com/fdroid/fdroidserver/blob/0.7.0/examples/config.yml "example config file"
