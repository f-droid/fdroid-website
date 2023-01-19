---
layout: page
title: Update Processing

---

The F-Droid tools can automatically detect and build updates to apps
and packages.

### Detecting<a name="Detecting"></a>

There are various mechanisms in place for automatically detecting that
updates are available for applications, with the _UpdateCheckMode_
field in the metadata determining which method is used for a particular
application.

Running the `fdroid checkupdates` command will apply this method to each
application in the repository and update the _CurrentVersion_ and
_CurrentVersionCode_ fields in the metadata accordingly.

As usual, the `-p` option can be used with this, to restrict processing
to a particular application.

Note that this only updates the metadata such that we know what the
current published/recommended version is. It doesn't make that version
available in the repository - for that, see the next section.


### Adding<a name="Adding"></a>

Adding updates (i.e. new versions of applications already included in
the repository) happens in two ways. The simple case is applications
where the APK files are binaries, retrieved from a developer's published
build. In this case, all that's required is to place the new binary in
the _Repo_ directory, and the next run of `fdroid update` will pick it
up.

For applications built from source, it is necessary to add a new
`Build Version` line to the metadata file. At the very least, the
version name, version code and commit will be different. It is also
possible that the additional build flags will change between versions.

For processing multiple updates in the metadata at once, it can be
useful to run `fdroid update --interactive`. This will check all the
applications in the repository, and where updates are required you will
be prompted to \[E\]dit the metadata, \[I\]gnore the update, or \[Q\]uit
altogether.
