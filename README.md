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

## License

This program is Free Software:
You can use, study share and improve it at your will.
Specifically you can redistribute and/or modify it under the terms of the
[GNU Affero General Public License](https://www.gnu.org/licenses/agpl.html)
as published by the Free Software Foundation,
either version 3 of the License,
or (at your option) any later version.
