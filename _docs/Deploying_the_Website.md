---
layout: page
title: Deploying the Website

---

The F-Droid website is built using [Jekyll](https://jekyllrb.com/) and
[gitlab-ci](https://about.gitlab.com/features/gitlab-ci-cd/).  The
whole website now works using a standard git
["fork" workflow](https://docs.gitlab.com/ce/workflow/forking_workflow.html)
that is well supported by GitLab, and well known from services like
GitHub.  For all of the pages and information about apps and packages
distributed by _f-droid.org_, those pages are generated using our
[jekyll-fdroid](https://gitlab.com/fdroid/jekyll-fdroid) plugin, which
takes the content from the
[_f-droid.org_ index file](https://f-droid.org/repo/index-v1.jar).


### Staging on development forks

All development forks of
[fdroid-website](https://gitlab.com/fdroid/fdroid-website)
automatically have a staging server setup and maintained by the
_gitlab-ci_ configuration.  This automatically deploys the content of
the fork's _master_ branch to
[GitLab Pages](https://pages.gitlab.io/).  For example, _nicoalt_'s
git fork is at <https://gitlab.com/nicoalt/fdroid-website>, and the
_master_ branch from that is automatically deployed to
<https://nicoalt.gitlab.io/fdroid-website>.


### Staging of the official website

Like with forks, the _master_ branch of the main git repo for the
website, <https://gitlab.com/fdroid/fdroid-website>, is automatically
deployed to <https://fdroid.gitlab.io/fdroid-website>.  That is the
place to review the current state of the website before tagging a
release.


### Deploying to https://f-droid.org

When an update to the website is tested and ready to go, a release
manager creates a PGP-signed release tag in the main git repo.  The
deploy server monitors the main git repo for new tags.  When it sees a
new tag, it first checks the PGP signature on the git tag using a
manually configured GnuPG keyring that contains only the public keys
of the PGP keys that are allowed to tag website releases.

After the git tag is verified, the `f-droid.org` target in
[.gitlab-ci.yml](https://gitlab.com/fdroid/fdroid-website/blob/master/.gitlab-ci.yml)
is run to generate the actual files for the site.  Those files are
then copied into place on the _f-droid.org_ servers.

The deploy tags use a "semantic versioning" naming scheme:

* _\<major>.\<minor>_
* _\<minor>_ is incremented on each deployment
* _\<major>_ is only incremented when there are major changes


### Setting up and running the deploy procedure

The deploy procedure was tested on a machine running Debian/stretch.
It should be triggered whenever the repo index is published, so it can
rebuild with the latest app information.  This whole procedure can be
run as root, or just `gitlab-runner`.  This final procedure is not
part of a script committed into the website git repo so that the
commands that run outside of docker cannot be modified via git.

1. [setup docker](https://docs.docker.com/engine/installation/linux/debian/)
2. [setup gitlab-ci-multi-runner](https://docs.gitlab.com/runner/install/linux-repository.html)
3. prepare _deploy-allowlist-keyring.gpg_ using GnuPG:
```console
$ gpg --recv-keys 00aa5556
$ gpg --fingerprint 00aa5556  # verify it!
$ gpg --export 00aa5556 > /path/to/deploy-allowlist-keyring.gpg
```
4. get the website source code:
```console
$ git clone https://gitlab.com/fdroid/fdroid-website
```
5.  run the generation:
```console
$ cd fdroid-website
$ git fetch --tags
$ sudo gitlab-runner exec docker f-droid.org \
              --pre-build-script ./tools/prepare-for-deploy.py \
              --docker-volumes "/path/to/deploy-allowlist-keyring.gpg:/root/.gnupg/pubring.gpg:ro" \
              --docker-volumes `pwd`/_site:/builds/output
```
6. deploy the site's files to the webserver, while preventing the
   _jekyll_ generated files from overwriting
   [parts of the website](https://gitlab.com/fdroid/fdroid-website/blob/master/.rsync-deploy-exclude-list)
   that other things manage:
```console
$ rsync -ax --delete --exclude-from=_site/build/.rsync-deploy-exclude-list  _site/build/  f-droid.org:/var/www/
```

### Base Debian/Apache setup

These instructions are based on Debian/stretch, but they should be
very similar on both older and newer versions of Debian, as well as
any Debian derivatives like Ubuntu, Mint, Elementary, etc.

```console
$ sudo su -
# apt install apache2 certbot tor ca-certificates geoip-bin libapache2-mod-geoip \
  python-certbot-apache rsync unattended-upgrades locales
# dpkg-reconfigure unattended-upgrades  # turn them on!
# sed -i 's,^# \(.* UTF-8\)$,\1,' /etc/locale.gen  # enable all UTF-8 locales
# locale-gen
# a2dismod status
# a2enmod headers
# a2enmod rewrite
# a2enmod ssl
# a2enconf security
# apachectl configtest && apachectl restart
# certbot --apache
```

### Apache2 config

The F-Droid website is translated into several languages.  There are a
few things required to ensure this works.

The first is taken care of by `.gitlab-ci.yml`, which is to run the
`./tools/prepare-multi-langs.sh` script _without_ the `--no-type-maps`
argument.  This ensures that each `.html` file is replaced with an
Apache2
[TypeMap](https://httpd.apache.org/docs/current/mod/mod_negotiation.html#typemaps).

The second is to enable _mod_rewrite_, which is used to automatically
choose the correct language for browsers that are not using
Javascript.  The easiest way to do that is to run `sudo a2enmod
rewrite`.

The last is to add the following to the Apache2 server or
_VirtualHost_ config so that the _TypeMaps_ are used correctly,
telling apache where to find the translated version of the file
(replace `/var/www/html` with the actual webroot):

```apache
<Directory /var/www/html>
    Options FollowSymLinks
    AllowOverride FileInfo
</Directory>

<Files *.html>
    SetHandler type-map
</Files>

# Virtualize the language sub"directories"
AliasMatch ^(?:/(?:ach|af|ak|sq|am|anp|ar|ar_DZ|ar_MA|an|es_AR|hy|as|ast|de_AT|ay|az|ba|eu|bar|be|be_Latn|bn|bn_BD|bn_IN|brx|bs|bs_Cyrl|bs_Latn|br|bg|my|ca|km|ch|chr|hne|cgg|zh|zh_HK|zh_Hans|zh_Hant|ksh|kw|cr|hr|cs|da|doi|nl|nl_BE|dz|en|en_AU|en_CA|en_IE|en_PH|en_ZA|en_GB|en_US|eo|et|fo|fil|fi|frp|fr|fr_CA|fy|fur|ff|gd|gl|ka|de|el|kl|gu|gun|ht|ha|haw|he|hi|hu|is|ig|id|ia|ga|it|ja|jv|kab|kn|ks|csb|kk|rw|tlh|tlh-qaak|kok|ko|ku|ckb|ky|lo|la|lv|li|ln|lt|jbo|nds|lb|mk|mai|mg|ms|ml|mt|mnk|mi|arn|mr|mni|mn|me|mfe|nqo|nah|nap|ne|se|no|nb_NO|nb|nn|ny|oc|or|oj|os|pap|nso|fa|pms|pr|pl|pt|pt_BR|pt_PT|pa|ps|ro|rm|ru|sa|sat|sc|sco|sr|sr_Cyrl|sr_Latn|sh|sn|szl|sd|si|sk|sl|so|son|st|es|es_US|es_MX|es_PR|su|sw|sv|de_CH|tl|tg|ta|tt|te|th|bo|ti|ts|tr|tk|ug|uk|hsb|ur|ur_PK|uz|uz_Latn|ca@valencia|ve|vec|vi|wa|cy|vls|wo|sah|yi|yo|yue|zu)/)?(.*)?$ /var/www/html/$1

# Tell mod_negotiation which language to prefer
SetEnvIf Request_URI ^/(ach|af|ak|sq|am|anp|ar|an|hy|as|ast|ay|az|ba|eu|bar|be|bn|brx|bs|br|bg|my|ca|km|ch|chr|hne|cgg|zh|ksh|kw|cr|hr|cs|da|doi|nl|dz|en|eo|et|fo|fil|fi|frp|fr|fy|fur|ff|gd|gl|ka|de|el|kl|gu|gun|ht|ha|haw|he|hi|hu|is|ig|id|ia|ga|it|ja|jv|kab|kn|ks|csb|kk|rw|tlh|tlh-qaak|kok|ko|ku|ckb|ky|lo|la|lv|li|ln|lt|jbo|nds|lb|mk|mai|mg|ms|ml|mt|mnk|mi|arn|mr|mni|mn|me|mfe|nqo|nah|nap|ne|se|no|nb|nn|ny|oc|or|oj|os|pap|nso|fa|pms|pr|pl|pt|pa|ps|ro|rm|ru|sa|sat|sc|sco|sr|sh|sn|szl|sd|si|sk|sl|so|son|st|es|su|sw|sv|tl|tg|ta|tt|te|th|bo|ti|ts|tr|tk|ug|uk|hsb|ur|uz|ca@valencia|ve|vec|vi|wa|cy|vls|wo|sah|yi|yo|yue|zu)/ prefer-language=$1

# Language codes from Weblate containing capital letters and underscores need to be treated
# differently, namely the language they refer to is lower case with a hyphen
SetEnvIf Request_URI ^/ar_DZ/ prefer-language=ar-dz
SetEnvIf Request_URI ^/ar_MA/ prefer-language=ar-ma
SetEnvIf Request_URI ^/be_Latn/ prefer-language=be-latn
SetEnvIf Request_URI ^/bn_BD/ prefer-language=bn-bd
SetEnvIf Request_URI ^/bn_IN/ prefer-language=bn-in
SetEnvIf Request_URI ^/bs_Cyrl/ prefer-language=bs-cyrl
SetEnvIf Request_URI ^/bs_Latn/ prefer-language=bs-latn
SetEnvIf Request_URI ^/de_AT/ prefer-language=de-at
SetEnvIf Request_URI ^/de_CH/ prefer-language=de-ch
SetEnvIf Request_URI ^/en_AU/ prefer-language=en-au
SetEnvIf Request_URI ^/en_CA/ prefer-language=en-ca
SetEnvIf Request_URI ^/en_GB/ prefer-language=en-gb
SetEnvIf Request_URI ^/en_IE/ prefer-language=en-ie
SetEnvIf Request_URI ^/en_PH/ prefer-language=en-ph
SetEnvIf Request_URI ^/en_US/ prefer-language=en-us
SetEnvIf Request_URI ^/en_ZA/ prefer-language=en-za
SetEnvIf Request_URI ^/es_AR/ prefer-language=es-ar
SetEnvIf Request_URI ^/es_MX/ prefer-language=es-mx
SetEnvIf Request_URI ^/es_PR/ prefer-language=es-pr
SetEnvIf Request_URI ^/es_US/ prefer-language=es-us
SetEnvIf Request_URI ^/fr_CA/ prefer-language=fr-ca
SetEnvIf Request_URI ^/nb_NO/ prefer-language=nb-no
SetEnvIf Request_URI ^/nl_BE/ prefer-language=nl-be
SetEnvIf Request_URI ^/pt_BR/ prefer-language=pt-br
SetEnvIf Request_URI ^/pt_PT/ prefer-language=pt-pt
SetEnvIf Request_URI ^/sr_Cyrl/ prefer-language=sr-cyrl
SetEnvIf Request_URI ^/sr_Latn/ prefer-language=sr-latn
SetEnvIf Request_URI ^/ur_PK/ prefer-language=ur-pk
SetEnvIf Request_URI ^/uz_Latn/ prefer-language=uz-latn
SetEnvIf Request_URI ^/zh_Hans/ prefer-language=zh-hans
SetEnvIf Request_URI ^/zh_Hant/ prefer-language=zh-hant
SetEnvIf Request_URI ^/zh_HK/ prefer-language=zh-hk
```

If this is not done or done incorrectly, then you will see something like the following when viewing any page:

> URI: index.html.en Content-language: en Content-type: text/html URI: index.html.fr Content-language: fr Content-type: text/html 

This is the result of the actual TypeMap being returned to the browser, rather than the translated file.

Note that this also depends on `mod_alias` and `mod_negotiation` being enabled, but this happens by default when
installing apache2 on Debian.
