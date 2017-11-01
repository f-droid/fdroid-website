# Website of F-Droid.org

This website will going to be used on [F-Droid.org](https://f-droid.org).
It is based on Jekyll and you can find the development version
[here](https://fdroid.gitlab.io/fdroid-website/).

## Building

You need to have Jekyll 3.2+ installed what is easily done with Gem which depends on Ruby 2.0+.
Because of the F-Droid plugin you need to have zlib installed.

```
sudo apt-get install ruby-full build-essential zlib1g-dev
sudo gem install jekyll bundler
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

## Local development

* Clone [F-Droid's Jekyll plugin](https://gitlab.com/fdroid/jekyll-fdroid)
* Configure bundle to use it: `bundle config --local local.jekyll-fdroid ../jekyll-fdroid`
* Follow the steps above

If you want to use the official Git repository again,
run `bundle config --delete local.jekyll-fdroid`.

If you want to have another values for `site.url` and `site.baseurl` (default: `localhost:4000` and `fdroid-website`) you can add the from git ignored config file `userconfig.yml` and run all jekyll commands with this additional parameter:

```
--config _config.yml,userconfig.yml
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


### documentation and pages

[![docs translation status](https://hosted.weblate.org/widgets/f-droid/-/website-docs/multi-auto.svg)](https://hosted.weblate.org/engage/f-droid/?utm_source=widget)


### blog posts

[![posts translation status](https://hosted.weblate.org/widgets/f-droid/-/website-posts/multi-auto.svg)](https://hosted.weblate.org/engage/f-droid/?utm_source=widget)

