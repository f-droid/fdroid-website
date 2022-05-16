#!/bin/sh
#
# Any mirror that provides rsync at the standard ::fdroid location can
# be added to the DNS round-robin for mirror.f-droid.org.

cd $(dirname $0)/..

results=`mktemp .domainsXXXXX`
for domain in `sed 's,[^:]*:,,' _data/rsync_mirrors.yaml`; do
    host $domain | grep address >> $results
    host $domain 1.1.1.1 | grep address >> $results
    host $domain 8.8.8.8 | grep address >> $results
    host $domain 9.9.9.9 | grep address >> $results
done
grep -Eo '[0-9]+(\.[0-9]+){3}' $results | sort -u | xargs printf 'mirror.f-droid.org\tA\t%s\n'
grep -Eo '[0-9a-f]+(:{1,2}[0-9a-f]+)+' $results | sort -u | xargs printf 'mirror.f-droid.org\tAAAA\t%s\n'
rm -f $results
