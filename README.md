# The F-Droid Website

This is the repository for the website at <https://f-droid.org>.  It
is based on Jekyll and you can find the development version
[here](https://fdroid.gitlab.io/fdroid-website/).

## Building

### Using Debian/buster

First, make sure [_buster-backports_ is enabled](https://backports.debian.org/Instructions/).  

```
sudo apt-get install -t buster-backports \
  gettext linkchecker po4a python3 python3-babel rsync rubocop ruby-bundler \
  ruby-git ruby-jekyll-include-cache ruby-jekyll-redirect-from ruby-json \
  ruby-loofah ruby-rchardet ruby-rouge ruby-rspec ruby-zip unzip
bundle install --local
jekyll build
```

If you experience an error during the build process, try also:

```
bundle update
```

Look at the [_.gitlab-ci.yml_](https://gitlab.com/fdroid/fdroid-website/blob/master/.gitlab-ci.yml)
for more examples of custom setups, like building only a subset of the languages.


### Using Ruby Gems

You need to have Jekyll 3.2+ installed what is easily done with Gem which depends on Ruby 2.0+.
Because of the F-Droid plugin you need to have zlib installed.

```bash
sudo apt-get install build-essential git ruby-full zlib1g-dev
sudo gem install bundler
bundle install
```

To build the website, run:

```
bundle exec jekyll build
```

If you want to build the website and
serve it with a local server at [localhost:4000](http://localhost:4000),
use:

```
bundle exec jekyll serve
```


### Using a Vagrant VM

[Vagrant](https://www.vagrantup.com/) makes it easy to setup and
destroy VMs.  That is handy for making a clean and predictable build
environment, regardless of the base system.  If used with VirtualBox,
then the current directory will be shared into the VM, so you can edit
locally, and have `jekyll serve` running in the VM.

```console
$ vagrant up
$ vagrant ssh
vagrant@buster:~$ cd /vagrant
vagrant@buster:/vagrant$ bundle install --local
vagrant@buster:/vagrant$ jekyll serve --host 0.0.0.0
```

Then connect to http://localhost:4000 to see the generated site.


## Local development

* Clone [F-Droid's Jekyll plugin](https://gitlab.com/fdroid/jekyll-fdroid)
* Configure bundle to use it: `bundle config --local local.jekyll-fdroid ../jekyll-fdroid`
* Follow the steps above

If you want to use the official Git repository again,
run `bundle config --delete local.jekyll-fdroid`.

Alternatively you may also set the `jekyll-fdroid` dependeny line in Gemfile to
your local clone, e.g.: `gem 'jekyll-fdroid', :path => './jekyll-fdroid'`

### Some config changes

To avoid building 4000+ packages you can change the F-Droid repo configuration for a smaller one:

```
  fdroid-repo: https://guardianproject.info/fdroid/repo
```

## License

This program is Free Software:
You can use, study share and improve it at your will.
Specifically you can redistribute and/or modify it under the terms of the
[GNU Affero General Public License](https://www.gnu.org/licenses/agpl.html)
as published by the Free Software Foundation,
either version 3 of the License,
or (at your option) any later version.


## Translation

Everything on this website can be translated.  See
[Translation and Localization](https://f-droid.org/docs/Translation_and_Localization)
for more info.  The [staging site](https://staging.f-droid.org)
includes all translations, whether they are complete or not.


### chrome strings

[![chrome translation status](https://hosted.weblate.org/widgets/f-droid/-/website/multi-auto.svg)](https://hosted.weblate.org/engage/f-droid/?utm_source=widget)

### pages

[![pages translation status](https://hosted.weblate.org/widgets/f-droid/-/website-pages/multi-auto.svg)](https://hosted.weblate.org/engage/f-droid/?utm_source=widget)

### tutorials

[![tutorials translation status](https://hosted.weblate.org/widgets/f-droid/-/website-tutorials/multi-auto.svg)](https://hosted.weblate.org/engage/f-droid/?utm_source=widget)

### documentation

[![docs translation status](https://hosted.weblate.org/widgets/f-droid/-/website-docs/multi-auto.svg)](https://hosted.weblate.org/engage/f-droid/?utm_source=widget)

### blog posts

[![posts translation status](https://hosted.weblate.org/widgets/f-droid/-/website-posts/multi-auto.svg)](https://hosted.weblate.org/engage/f-droid/?utm_source=widget)

