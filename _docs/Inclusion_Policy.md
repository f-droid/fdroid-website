---
layout: page
title: Inclusion Policy
---

The purpose of this inclusion policy is to ensure that all applications included in the main F-Droid repository support F-Droid’s core mission: providing a trusted way to find and share privacy-respecting, free and open source software apps for Android. If an app does not meet these criteria, you can still make the app available to F-Droid users via a separate repository.

## Free Software Requirement

All applications in the repository must be Free, Libre and Open Source Software (FLOSS) – for example, released under a [GPL](https://www.gnu.org/licenses/licenses.html) or [Apache](https://www.apache.org/licenses/) license. Every effort is made to verify that this is the case, both by visual inspection of the source and by building the application from the published source. To determine which licenses are FLOSS, we defer to widely trusted organizations that have a proven track record. Specifically, we acknowledge the following standards: Debian Free Software Guidelines ([DFSG](https://wiki.debian.org/DFSGLicenses)), Free Software Foundation ([FSF](https://www.fsf.org/licensing)), [GNU](https://www.gnu.org/licenses/license-list.html), and Open Source Initiative ([OSI](https://opensource.org/licenses)) (_read a brief overview of them all on System Package Data Exchange ([SPDX](https://spdx.org/licenses/))_).

All binary dependencies including JAR files must originate either from source compilation or Debian repository downloads. Prebuilt binaries should only come from authorized trusted sources.

Non-functional assets including artwork and fonts can utilize less restrictive licenses which include game art specific to the project but must allow redistribution when using non-commercial licenses. All assets need to have valid legal licenses or be in the public domain while being free of copyright infringement.

The implementation of proprietary tracking or advertising libraries and analytics tools such as Google Play Services and Firebase and Crashlytics and proprietary ad/tracking SDKs are strictly forbidden in all applications. Upstream developers must implement either a FLOSS alternative or a build flavour that does not require these dependencies when such features become necessary.

## Build Transparency and Reproducibility

The F-Droid infrastructure compiles applications from publicly accessible source code to verify that distributed binaries match their source code. The complete application building process requires a 100% FLOSS toolchain including Debian-packaged tools. The use of proprietary build tools are strictly forbidden, including Oracle's JDK and some pre-release toolchains. Though we try to build everything from source, sometimes prebuilt FLOSS binaries are the only feasible approach. The following sources can be allowed to provide prebuilt binaries:

* Debian "[_main_](https://www.debian.org/doc/debian-policy/ch-archive.html)" package archive.
* Applications can download prebuilt FLOSS binaries with specific conditions from trusted Maven repositories. Those include Maven Central, Google Maven, OSS Sonatype, OSS JFrog, JitPack.io and Clojars. Those binaries must still be freely licensed, simply being included in one of those repositories is not enough.
* The Android SDK, Flutter SDK and Hermes have permission to use official prebuilt binaries until Debian provides alternative solutions.
* The use of prebuilt FLOSS binaries from [PyPI](https://pypi.org/) Wheels, Nix cache, Rust/Rustup, Golang and Node.js (current versions) and compilers or build tools which are not included in Debian can be acceptable. Whenever possible, Debian-packaged dependencies should be chosen above other options.

## Security & Legal Compliance

1. F-Droid does not sign up for any API keys. Even if provided by a third party, we include them in both binary and source code releases.
2. All donation links need verification by upstream developers to stop unauthorized alterations. F-Droid contributors can consider [_funding.json_](https://fundingjson.org/), [_FUNDING.yml_](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/displaying-a-sponsor-button-in-your-repository#about-funding-files) or _README_ files. Also, verification can happen via messages that come from the same account as the app's source code, e.g. `@foobar` for `https://gitlab.com/foobar/myapp`, if that account is on the same GitLab instance as F-Droid itself, e.g. `gitlab.com`. The application's main website can also host donation links.
3. Applications must not infringe third party rights, including third party intellectual property rights such as copyright and trade marks. Applications need to obtain necessary trademark and copyright permissions. Any application with a duplicate android application ID matching another domain name will receive automatic rejection.
4. F-Droid uses pre-defined labels known as [Anti-Features](../Anti-Features) which serve as warning indicators about user freedom, privacy or etc. without necessarily disqualifying applications from inclusion.
5. Applications must not download additional executable binary files (e.g. add-ons, auto-updates, etc.) without explicit user consent. Consent means it needs to be opt-in _(it must not be harder to decline than to accept or presented in a way users are likely to press accept without reading)_ and structured in a way that clearly explains to users that they're choosing to bypass F-Droid's checks if they activate it.

## Quality Control

The applications should also meet some basic quality requirements when they are added to the repo.

1. The application should be actively maintained when it's included and the author should commit to provide ongoing maintenance. Applications that are deprecated or unmaintained shouldn't be included.
1. The application should be functional and implement all the features described in the description.
1. The application should provide native features and enhancements when it wraps a website.
1. The application should be useful to end users. Demo applications shouldn't be included.
1. The application should provide some unique value. Applications that perform only minor rebranding and lack meaningful improvements over other actively maintained applications in the repo shouldn't be included.

## Build & Verification Workflow

* __Unique ID:__ All applications must have their own distinct Android "Application ID".
* __Your domain:__ It is advised to use an Application ID that stems from a domain name owned by the developer.
* __Forks:__ Forked applications need to obtain a fresh Android ID that differs from the original application even if the source app exists outside F-Droid and they must receive corresponding name, icon and string changes including translation adjustments.
* __Dependency Handling:__ Library dependencies must be built from source or provided in a trusted Maven repo. Prebuilt SDKs (Android/Flutter) are permitted to use scanignore until Debian packaging finishes.
* __Automated Checks:__ F-Droid maintainers review applications through a verification process which examines license compliance and source availability, buildability and inclusion policy adherence. Reviewers conduct inspections for non-free dependencies alongside proprietary code, tracking features and advertising elements and other Anti-Features.
* __Manual Review:__ Our contributors will manually review apps and use their discretion to flag issues.

## Our mission and our inclusion policy

Our mission is to safely and transparently distribute free and open source applications, providing users of all ages around the world with useful and privacy-respecting apps.

When making inclusion decisions, we look to our core mission for guidance to determine what type of content is included in the main repo.
We also look at historical precedent when making inclusion decisions. If the proposed app is similar to an app we previously excluded, this will be taken into consideration. In addition to determining whether our app supports our mission, we take into consideration if an app is suitable for all F-Droid users, including children, when making inclusion decisions.

We acknowledge that this is not a precise science and try to make reasonable and rational decisions regarding our inclusion policy. If you believe that an app was wrongly excluded, you can email an appeal to <team@f-droid.org> and the appeal will be considered by a team member who was not involved in the original decision to exclude the app.

Please keep in mind that even if an app is excluded, you may choose to make the app available to F-Droid users, via your own, or a third party, app repository.

## Policy Enforcement

* The repository will remove or reject non-compliant applications until developers fix their issues. The F-Droid community encourages developers to work together to achieve compliance.
* Apps which fail to rebuild (such as requiring Play Services) or contain undisclosed anti-features will receive a rejection.
* Upstream developers can ask for re-review after they make necessary fixes to their applications.
* F-Droid maintains the authority to implement various actions against persistent offenders which may include warnings and temporary suspensions or permanent content removal while providing proper notification and appeal options. The documentation will record all removal actions.
