# Website of F-Droid.org

This website will going to be used on [F-Droid.org](https://f-droid.org).
It is based on Jekyll and you can find the development version
[here](https://fdroid.gitlab.io/fdroid-website/).

## Building

### Install Jekyll 3.2+

To build the website, you need to have Jekyll 3.2+ installed.
This is easily done by with Gem. Therefore you need Ruby 2.0+.

```
sudo apt-get install ruby-full build-essential
sudo gem install jekyll
```

### Install Node.js 6.x

On Debian and Ubuntu, you can download a script that sets up a ppa and then you can install Node.js with the package manager.

````
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
````

Or have a look at the [official website](https://nodejs.org/en/download/) for other distros and installation possibilities.

### Build the fdroid website

First, navigate into the root directory of this repository.

For the very first time (or if the `package.json` file has been updated in newer versions),
you have to install all dependencies needed for Node.js by running:


````
npm install
````


To generate the data (e. g. apps), execute the `build.js` script:

````
nodejs build.js
````

To build the website with Jekyll, run:

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
