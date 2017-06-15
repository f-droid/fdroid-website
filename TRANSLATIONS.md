## Configuring Weblate

The translation setup is designed to work with three different Weblate Components:

 * Website (navigation, home page, sidebars)
 * Documentation
 * Website News

Below is the list of important properties to set when adding a new Weblate component.
These are important or else the translation system will not work.
It does not document the more simple things such as Name/URL/etc.

### Website

 * **File mask:** `_data/*/strings.json`
 * **Monolingual base language file:** `_data/strings.json`
 * **Edit base file:** No
 * **Base file for new translations:** `_data/strings.json`
 * **File format:** JSON file
 * **Pre-commit script:** `hook-json_restore_hierarchy` ([info about this script](https://docs.weblate.org/en/latest/formats.html#json-files))
 * **Priority:** Very high

The priority doesn't _need_ to be "Very high", but it is the most front-facing of all parts of the website.
In addition, it is also the smallest part and hopefully the easiest to translate.

## Pulling translations

This section documents pulling translations from Weblate and integrating them with the website.
As with the Weblate documentation, it will describe the three different projects.

From your local repository, ensure you have a `git` remote for each Weblate component.
Here is an example for the "Website" component, where `example.com` is the weblate server you are using (e.g. `hosted.weblate.org`):

```bash
git remote add weblate-website https://example.com/weblategit/fdroid/website/
```
 
### Website

Merge the latest translations, for example:

```bash
git fetch weblate-website
git merge weblate-website/master
```

Once the translations are available, we need to update the `_config.yml` to ensure it is aware of the translations which are available.
The following script will update the `languages: [ 'en', ... ]` attribute in the config file.
In addition, it will also attempt to download a flag for any new translations for the language chooser widget:

```bash
./tools/update_langs.py
```

#### Troubleshooting

**A new translation was added, but all the strings are blank when viewing the translation on the website.**

This can happen if the **Pre-commit script** in the Weblate component is not setup correctly.
Check the newly added `_data/[LANG]/strings.json` file and see if it is a flat file like this:

```json
{
  "navigation.browse": "...",
  "navigation.documentation": "...",
  ...
}
```

instead of what it should be:

```json
{
  "navigation": {
    "browse": "...",
    "documentation": "...",
    ...
  }
}
```

If so, the `hook-json_restore_hierarchy` [script needs to be configured correctly](https://docs.weblate.org/en/latest/formats.html#json-files) in Weblate.
This script can also be downloaded and run locally on the problem file, e.g. `hook-json_restore_hierarchy _data/[LANG]/strings.json`.