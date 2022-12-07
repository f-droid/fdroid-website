## Adding/updating translatable content

There are two different ways in which content on the website is translated.

### Website

If you are adding content to the home page, sidebars, navigation, or
other static parts of the website (i.e. not Jekyll posts/pages) then
it is done using
[localised site data](https://github.com/untra/polyglot#localized-sitedata).

Say you want to add a new paragraph to the home page.
Firstly, add a new entry to the `_data/strings.json` file:

```json
{
  "index": {
    "introduction": "Here is the paragraph to be added (and also translated)",
    ...
  },
  ...
}
```

Then, reference this from the `index.md` file:

```markdown
{{ site.data.strings.index.introduction }}
```

If you need to reference many strings in a single `.md` file, then it may be more concise to first assign a variable:

```markdown
{% assign strings = site.data.strings.index %}
{{ strings.introduction }}
```

### Documentation + Website News

When a new `.md` file is added to the `_docs/`, `_pages/`, or `_posts/` directory, then you need to run:

```bash
./tools/i18n.sh
```

This will extract the strings from all Markdown files in these two
directories and output them to `po/_docs.po`, `po/_posts.po`, and
`po/_pages.po`.  These will then subsequently be translated by Weblate
into additional files such as `po/_docs.fr.po`.

In addition, the script will update any already existing translations such as `po/_docs.fr.po`.
It does so by using the [msgmerge](https://www.gnu.org/software/gettext/manual/html_node/msgmerge-Invocation.html) program from GNU gettext.
This takes care of fuzzy string matches, new strings, and deleted strings.

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

### Documentation + Website News

These two components are managed in exactly the same way.
The only difference is that one generates translations from `_docs/*.md` and the other from `_posts/*.md`.
As such, this will only document the process for Documentation.
For Website News, do the same, but wherever you see `_docs` replace it with `_posts`.

 * **File mask:** `po/_docs.*.po`
 * **Edit base file:** No
 * **Base file for new translations:** `po/_docs.po`
 * **File format:** Gettext PO file

It is suggested that the Documentation has a higher **Priority** than Website News.

## Pulling translations

This section documents pulling translations from Weblate and integrating them with the website.
As with the Weblate documentation, it will describe the three different projects.

From your local repository, ensure you have a `git` remote for each Weblate component.
Here is an example for the "Website" component, where `example.com` is the weblate server you are using (e.g. `hosted.weblate.org`):

```bash
git remote add weblate-website https://example.com/weblategit/fdroid/website/
```

Then, regardless of the component, you will need to pull the translations from the relevant remote, e.g:

```bash
git fetch weblate-website
git merge weblate-website/master
```

Once the translations are available, we need to update the `_config.yml` to ensure it is aware of the translations which are available.
The following script will update the `languages: [ 'en', ... ]` attribute in the config file to those which are marked as 100% translated
in the ["Website" project on Weblate](https://hosted.weblate.org/projects/f-droid/website/):

```bash
$ ./tools/update_langs.py


```

For development, you can also request all translations be included, regardless of how complete they are:

```bash
./tools/update_langs.py --partial
```

### Documentation + Website News

For these two components, all Weblate does is produce translated `.po`
file.  Once you have merged the translations from Weblate, this `.po`
file needs to be processed to generate localised versions of each
`.md` file.  This is done by running:

```bash
./tools/i18n.sh po2md
```

### Website

There is no special requirements once the Website translations are pulled from Weblate.
This is because Jekyll directly uses the JSON files that Weblate created.

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
