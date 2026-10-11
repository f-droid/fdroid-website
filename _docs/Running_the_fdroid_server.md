# Introduction 

This tutorial will walk you through installing, running the fdroidserver and serving your repository. This guide is based on debian.


## Installation

To install the fdroid-server, there are some dependencies and requirements that we will need in order for you to be able to add a fdroid repository and share your apps. These include

- [Java]()
- [Android SDK]()
- [Fdroid-server tools]()

Depending on your Operating system, you might need to install the fdroid-server tools using a python environment or a package manager. You can [find which method best suits you](../_docs/Installing_the_Server_and_Repo_Tools.md). 

After installations is done verify that fdroid server tools have been installed by running
```bash

```

To get the latest version, the simplest way is to create a python environment, and download the upstream code directly from [fdroid's gitlab repository](https://gitlab.com/fdroid/fdroidserver). You can do this by creating a directory and running the followinf commands;

```bash

$ python -m venv fdroidserver-env #This creates a python-virtual envronment

$ source fdroidserver-env/bin/activate # This activates your environment

$ pip install git+https://gitlab.com/fdroid/fdroidserver.git #This downloads the code and dependencies needed to run the server

```
### Running your repository

To make your repository accessible over the internet, you need a [webserver](https://developer.mozilla.org/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_web_server) to be able to serve your files. For that, we will be using the [nginx webserver](https://nginx.org/en/). 

To install nginx, run the following command in your terminal. Since I'm using debian, I will use the apt package manager. 
You can see the best way to [install nginx for your machine from nginx website](https://nginx.org/en/docs/install.html).

```bash
$ sudo apt install nginx 

Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  nginx-common
  Suggested packages:
    fcgiwrap nginx-doc
    The following NEW packages will be installed:
      nginx nginx-common
      0 upgraded, 2 newly installed, 0 to remove and 7 not upgraded.
      Need to get 566 kB of archives.
      After this operation, 1626 kB of additional disk space will be used.
      Do you want to continue? [Y/n] #press y to finish

```

Once you have installed nginx and fdroid-server tools. The next step will be to create your repository and make it accessible over the internet. To do this, create a directory in `/var/www/html/fdroid-repo`. The file name does not have to be `fdroid-repo` you can rename it anything you want, but for simplicity, we will keep this name. In your terminal, run;

```bash 

$ mkdir -p /var/www/html/fdroid-repo #This command creates the repository
$ cd /var/www/html/fdroid-repo # go into the created directory

```

Once you're inside the directory, the next step will be initializing it to a fdroid repository, to do this, run 

```bash
$ fdroid init . #initialize fdroid repo in the current repository

```
Now, this directory is the main fdroid repo.

#### Adding an app/apk to the repo

Before sharing your repository, we need to add applications so that you can share apps and apks through your fdroid repository. To add an appliaction, make sure you have the application apk file in your system, alternatively, you can download the apk the copy it to your repository. 

Currently, I do not have an apk in my system, I will download the [fdroid apk](https://f-droid.org/F-Droid.apk) from [fdroid website](../index.md) and add it in my repository, to download it will use [wget](https://www.gnu.org/software/wget/) command.

```bash

$ wget -O ~/Downloads https://f-droid.org/F-Droid.apk  #This will download the apk file from fdroid website and save it to the ~/Downloads directory

```

Once the apk is downloaded, copy it to your repository under the `repo` directory. You can use this command to copy it from downloads into your repo directory

```bash 

$ cp ~/Downloads/Fdroid.apk /var/www/fdroid-repo/repo 

```
The next step is to create metadata for the application, for that, we run the following command

```bash
$ fdroid update --create-metadata

```

Congratulations!! You have deployed you fdroid repository.
