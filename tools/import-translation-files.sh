#!/bin/sh -e
#
# This imports .po files into Weblate, provided they are not for a
# language that is already launched on f-droid.org.

for f in $@; do
    language=`echo $f | sed -E 's/.*?_(posts|pages|docs)\.([a-z]{2,3}(:?_[A-Z][A-Za-z]+)*)\.po/\2/'`
    # if its a supported language, do not force import into Weblate
    grep ^languages: _config.yml | grep -F " $language" > /dev/null && continue
    component=weblate-$(echo $f | cut -d _ -f 2 | cut -d . -f 1)
    echo $language $component
    curl -X POST \
	 -F file=@$f \
	 -H "Authorization: Token $WEBLATE_API_KEY" \
	 https://hosted.weblate.org/api/translations/f-droid/$component/$language/file/
done
