# Website of F-Droid.org

This website will going to be used on [F-Droid.org](https://f-droid.org).
It is based on Jekyll and you can find the development version
[here](https://fdroid.gitlab.io/fdroid-website/).

## Building

Always navigate into the root directory of this repository before you run the build commands.

#### Generate app data (optional, only for browsing)

You need to have Node.js 6.x installed. On Debian and Ubuntu, you can download a script that sets up a ppa which lets you install Node.js with the package manager.
Or have a look at the [official website](https://nodejs.org/en/download/) for other distros and installation possibilities.

````
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
````

For the very first time (or if the `package.json` file has been updated in newer versions),
you have to install all dependencies needed for Node.js by running:

````
npm install
````

To generate the app data, execute the `build.js` script each time:

````
nodejs build.js
````

#### Build website with Jekyll

You need to have Jekyll 3.2+ installed.
This is easily done with Gem which depends on Ruby 2.0+. You also need to install the dependencies described in `_config.yml` with gem.

```
sudo apt-get install ruby-full build-essential
sudo gem install jekyll jekyll-include-cache jekyll-paginate-v2
```

To build the website, run:

```
jekyll build
```

Or if you want to build and also start a local server at localhost:4000, use:

```
jekyll serve
```

## License

This program is Free Software:
You can use, study share and improve it at your will.
Specifically you can redistribute and/or modify it under the terms of the
[GNU Affero General Public License](https://www.gnu.org/licenses/agpl.html)
as published by the Free Software Foundation,
either version 3 of the License,
or (at your option) any later version.
