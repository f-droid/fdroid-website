---
author: F-Droid
title: Community-controlled Backup Ceremony
layout: post
---

Seven core contributors and one board member met in Scotland, the birthplace of F-Droid, for the first in-person F-Droid team meeting.  One of the most pressing tasks we needed to take care of was setting up a contributor-controlled backup of all of our signing keys.  The requirements made it necessary to have a lengthy, in-person, consensus-driven planning session.  We found no good documentation of such a procedure, so we're going out on a limb here and publishing the general outline of our process.  This process was informally audited by multiple people with varying expertise before the public key was used to encrypt anything.

![F-Droid core contributors at midnight]({% asset posts/2023-07-15-community-controlled-backup-ceremony/fdroid-at-midnight.jpg %})

F-Droid manages secret signing keys for thousands of apps.  Someone who has control over those keys could create malicious app releases that could be transparently installed as updates.  On top of that, [Android](https://developer.android.com/about/versions/pie/android-9.0#apk-key-rotation) does [not](https://guardianproject.info/2015/12/29/how-to-migrate-your-android-apps-signing-key/) make it [easy](https://anandbose.gitlab.io/android-development/2020/05/08/android-signing-key-rotation-explained/) to rotate to new signing keys, unlike TLS or Signal. So [these keys]({{ site.baseurl }}/docs/Signing_Process/) are very important to [protect]({{ site.baseurl }}/docs/Building_a_Signing_Server/).  They are also very important to backup, since the Android OS uses the signing key combined with the Application ID as the unique identifier to represent each installed app. This meeting gave us the perfect opportunity to create a new backup process that ensures that at least 4 trusted community members must be physically present in order to decrypt the backup of all the keys.  First, we started with the requirements:

* Regular backups as new keys get added.
* Strong, proven encryption for all backups.
* Minimum of four participants to decrypt.
* Specific technical experience should not be required to be a participant.
* The components should be physically spread out across jurisdictions.
* Access should minimized as much as possible (e.g. the signing server maintainer does not need access to the backups).
* As low a stress level as possible for each participant.
* Each participant could hand over their component if they are forced to, without jeopardizing the encryption.

Then we mapped out who was present:

* Seven core contributors.
* One board member.
* One trusted external witness.
* No one else.

From that, we built the process:

* Three roles for physical control: operator of the signing server, encrypted backup holder, passphrase shard holder.
* Each person only takes on a single role, for example, shard holders do not have access to the signing keys or the encrypted backup.
* The encryption key used for the data is public key cryptography.
* The private key was generated on a one-time-use, in-memory, disposable [TAILS](https://tails.boum.org/) session.
* The private key was sharded using [Shamir's Secret Sharing](https://en.wikipedia.org/wiki/Shamir%27s_Secret_Sharing).
* We used an implementation of Shamir's Secret Sharing that has been maintained for over 15 years.  The installation that was used was confirmed via reproducible builds.
* Each shard was written to a removeable storage device bought in a store with cash without pre-order or registration.
* Each removeable storage device with a shard was physically handed each shard holder to pack in a tamper-evident envelope as the others observed.
* Backups must not be transmitted over the internet, only exchanged via in-person meetings between people who know each other.
* All involved sat around a table for the duration of the ceremony.  The security profile of in-person discussions is drastically easier to manage than secure online discussions.
* All present were observers of each step of the process, and verbally confirmed their agreement.
* The operators of the signing server and the holders of the backup data verified each others' identities via F-Droid networks, PGP Web of Trust, and checks of government issued IDs.
* Pieces from a minimum of two jurisdictions are required to decrypt: EU, Europe non-EU, US.

One important factor in reliable backups is regular updates.  New apps are constantly being added, and those usually get a new signing key assigned.  So we needed a system where it was easy to update the backup data while involving as few people as possible.  An operator of the signing server receives the public key to encrypt the backups via in-person exchange with a holder of the backups.  The holders of the backup data receives the encrypted backups from an operator of the signing server via in-person exchange.

Holding such important secrets also brings some unavoidable stresses to the people holding them. One key design goal was to create a protocol that did not add to the stress of any existing operators.  Furthermore, we aimed to keep the individual stress as low as possible for all roles in this protocol.  That makes it possible to empower volunteer contributors without overburdening them.

For restoring, we agreed that it should happen in an in-person meeting.  The process requires three shard holders meet with one encrypted backup holder, then the results need be given to a signing server operator. Requiring an in-person meeting could delay the restore process, but the added trust seemed worth it.  So this is the default process.  We could still switch to partially online process if the need arises.  That would require the agreement of five participants.

We believe this is a secure and reliable backup procedure for very sensitive data.  We welcome further scrutiny and plan to update the procedure as needed in a future meeting.

(_This meeting was paid for by the [FFDW-DVD grant]({% post_url 2022-02-05-decentralizing-distribution %})._)
