---
layout: post
title: "We're modernizing our App Database"
author: "uniqx"
authorWebsite: "https://chaos.social/@uniq"
---

We keep a database containing structured information about all apps we're
shipping. Architecture-wise, this is a set of plain text files in a version
control system. It's the heart of our data-driven app building- and
distribution- systems. Maybe you've heard someone mentioning
[F-Droid Data](https://gitlab.com/fdroid/fdroiddata) already.
Occasionally we also refer to this as app metadata.

We started out with a custom domain specific language (DSL) for storing
our metadata files using GIT for version control. Not very surprisingly
our custom DSL looks a lot like the popular markup language YAML. That's
why we started supporting to store app metadata in `.yml` file format a
year ago.

We're finally deprecating `.txt` metadata support altogether. Our
amazing packaging team is almost done moving our entire database to
`.yml`.

To keep things easy, we will continue to ship a handy sub-command
so everyone can conveniently convert now deprecated `.txt` metadata files
to `.yml`:

```
$ fdroid rewritemeta --to yml
```

In the long run, removing `.txt` metadata support will allow us to get rid of
a substantial amount of source-code. This will make maintenance a lot
simpler for us and also lower the learning curve for new contributors.
It will also make adding new features faster and simplify creating
tooling, CI, auditing, metrics, etc.

Additionally, this will make our database more accessible to everyone. We
hope to see developers, enthusiasts and scientists to come up with
interesting third party tools, use-cases or studies.

Our thanks goes to: [Izzy](https://gitlab.com/IzzySoft) and
[Bubu](https://gitlab.com/Bubu) for migrating our
database and [Hans](https://gitlab.com/eighthave) and
[me (uniqx)](https://gitlab.com/uniqx) for implementing YAML metadata
support.
