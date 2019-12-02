---
layout: post
title: "Trusted Update Channels vs. Scratching Your Itch"
author: "eighthave"
---

One of the great things about free software is that people can easily take a functional program or library and customize it as they see fit.  Anyone can come along, submit bug fixes or improvements, and they can be easily shared across many people, projects, and organizations.  With distribution systems like Python's [pypi](https://pypi.python.org), there is an update channel that the trusted maintainers can publish fixes so consumers of the library can easily get updates.  When talking about update channels and code, it is unavoidable to also talk about people and trust.  One key piece is the trust relationship between the consumer and the maintainer.  The ideal software distribution system would be a blind, trustworthy pipe between the software maintainers and each end user.

Since we are talking about libraries of code, the natural relationship turns out to be different than the trust relationship: it is between the consumer and the library itself, not the maintainers.  I use Requests for handling HTTP, not @nateprewitt's fork.  My _setup.py_ includes a reference to `'requests'`, not to the maintainers who I trust to keep the library updated.

There have been cases were libraries were [taken](https://www.zdnet.com/article/backdoor-code-found-in-11-ruby-libraries/) [over](https://www.theregister.co.uk/2018/07/12/npm_eslint/) and used to distribute malware.  Or [another case](https://www.theregister.co.uk/2018/11/26/npm_repo_bitcoin_stealer/) where someone offered to take over a popular library, then inserted malware into it.  If it is really easy for maintainers to hand over a library to someone else, then that will be abused.  If they are too hard to hand over, then many valuable libraries will be abandoned or forked.  Having to check for forks is an added cost for library consumers, so ideally there would always be a trusted maintainer.

For large projects like Requests or distros like Debian, there is a process for ensuring that new maintainers are doing the right thing.  There are also many small libraries that are very valuable.  For example, [apache_log_parser](https://github.com/rory/apache-log-parser) or [pymtp](https://pypi.org/project/PyMTP/).   In these cases, the cost of doing a proper process of handing over to a new maintainer is quite large as compared to the overall effort the library author put into the library.  Or it might be a single maintainer who is now overburdened with other work.

In F-Droid, reviewing app merge requests, aka _fdroiddata_, is also about reviewing whether the trust relationship is changing.  This is on top of making sure the new code works, ensuring its still free software, and that all of the Anti-Features are properly marked.  Getting this review right is important especially when you consider that in F-Droid, many apps are automatically updated without core contributors reviewing it.

All developers must consider these trust issues at a number of key points in the process of developing software, including:

* when adding a library to any piece of software
* helping a new maintainer take over existing software
* reviewing changes to the URL of the source code reposistory

There are also some ideas about how to better map who we need to trust to the process of including software.  One interesting example is [_cargo-crev_](https://dpc.pw/cargo-crev-and-rust-2019-fearless-code-reuse) for the Rust ecosystem.  It provides a system of describing and cryptographically linking trusted developers and their reviews of software packages.

