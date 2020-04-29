---
layout: page
title: MIA Process

---


Maintainers come and go, interests and priorities change and time flies. This
is true for every project and F-Droid as well. To keep the credentials and
permissions in F-Droid reasonable, there is this missing in action (MIA) process.

This means we regularly check if F-Droid team members are still active, i.e.
when they last contributed, and drop those that don't respond to messages after
some time. The idea is to improve F-Droid's quality, not to hunt developers.

### What are F-Droid team members

- [Gitlab](https://gitlab.com/fdroid/admin/-/project_members)
- [Forum](https://forum.f-droid.org/g/contributors)

### What are contributions

- Commits to one of the repos hosted on [Gitlab](https://gitlab.com/fdroid/).
- Contributions to issues on [Gitlab](https://gitlab.com/groups/fdroid/-/issues).
- Activity on the forum.

### Who is MIA

No contribution or pong to a MIA ping for at least six month.

### How are MIAs tracked

For every member that is MIA, an internal issue in the [admin
project](https://gitlab.com/fdroid/admin/issues/) is opened. Every ping and
pong is documented there. If a number of pings don't receive a pong, the team
is mentioned in the issue, to ask if someone has an other way to contact the
person.

### The removal

- Status: First warning -> wait 16 weeks.
- Status: Second warning -> wait 8 weeks.
- Status: Final warning -> wait 4 weeks.

Afterwards, MIA accounts are removed from all F-Droid directories (Gitlab) or
downgraded to normal user account (forum) and the issue is closed.

### References

- [Debian reference](https://www.debian.org/doc/manuals/developers-reference/beyond-pkging.html#dealing-with-inactive-and-or-unreachable-maintainers)
- [Debian team site](https://wiki.debian.org/Teams/MIA)
- [Debian tools](https://salsa.debian.org/qa/qa/tree/master/mia)
