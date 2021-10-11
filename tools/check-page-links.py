#!/usr/bin/env python3

import glob
import io
import os
import re
import shutil
import subprocess
import sys
from babel.messages.pofile import read_po, write_po
from babel.messages.catalog import Message

errorcount = 0
md_link_pattern = re.compile(r'](\([^h][^\)]+\))')
url_link_pattern = re.compile(r'<(https?://[^>]+)>')
bad_md_link = re.compile(r'.*\]\s+\(')
safe_html_pattern = re.compile(r'<https?://[^>]+>')
for f in sorted(glob.glob('po/*.po*')):
    output = ''
    rewrite = False
    with open(f) as fp:
        contents = fp.read()
    try:
        catalog = read_po(io.StringIO(contents))
    except Exception as e:
        errorcount += 1
        output += 'ERROR: %s' % e
    for message in catalog:

        if message.fuzzy:
            continue

        m = re.match(r'\[(_[^\]]+_)]\((#[^ )]+)\)', message.id)
        if m:
            if message.string and message.string[0] != '[' and message.string[-1] != ')':
                newstring = (message.string
                             .replace('"></a>', '')
                             .replace('<a name="', '')
                             .replace(m.group(1), '')
                             .replace(m.group(1)[1:-1], '')
                             .replace(m.group(2), '')
                             .replace('(', '')
                             .replace(')', '')
                             .replace('_', ''))
                if newstring:
                    outstring = '[%s (%s)](%s)' % (m.group(1), newstring, m.group(2))
                    errorcount += 1
                    output += 'Badly formatted metadata link: ' + message.string + '\n'
                    print(message.string, outstring, sep='\t')
                    with open(f) as fp:
                        header = ')"\nmsgstr "'
                        out = fp.read().replace(header + message.string.replace('"', '\\"'),
                                                header + outstring)
                    with open(f, 'w') as fp:
                        fp.write(out)

        if 'type: Title #' in message.auto_comments:
            if message.string:
                if '"' in (message.string[0], message.string[-1]) and message.string.count('"') % 2:
                    errorcount += 1
                    output += 'Mismatched " in title:' + message.string
                if "'" in (message.string[0], message.string[-1]) and message.string.count("'") % 2:
                    errorcount += 1
                    output += "Mismatched ' in title:" + message.string

        m = bad_md_link.search(message.string)
        if m:
            errorcount += 1
            output += 'Space breaks Markdown link: ' + message.id + '\n: ' + m.group()

        # bleach/safe_html plugin messes up Markdown links
        if 'https:>' in message.string.lower():
            output += ('\nMalformed link in: %s\n' % message.string)
            rewrite = True
            url = safe_html_pattern.findall(message.id)[0]
            print('URL', url)
            contents = contents.replace('</https:>', '').replace('<https:>', url)

        idlinks = []
        for m in url_link_pattern.findall(message.id):
            idlinks.append(m)
        for m in md_link_pattern.findall(message.id):
            idlinks.append(m)
        strlinks = []
        for m in url_link_pattern.findall(message.string):
            strlinks.append(m)
        for m in md_link_pattern.findall(message.string):
            strlinks.append(m)
        if message.id and len(strlinks) > 0 and len(idlinks) != len(strlinks):
            output += 'ERROR ' + f + ' ' + str(len(idlinks)) + ' != ' + str(len(strlinks)) + ' ' + message.id + '\n'
            errorcount += 1
        for i in range(len(strlinks)):
            if message.string and i < len(idlinks) and i < len(strlinks) and idlinks[i] != strlinks[i]:
                errorcount += 1
                output += '\n' + f + '\nmsgstr    ' + idlinks[i] + '\n !=       ' + strlinks[i]
                # inputf = f + '.orig'
                # shutil.copy(f, inputf)
                # cmd = ('msgfilter --input=' + inputf + ' --output-file=' + f
                #        + ''' python3 -c 'import sys; sys.stdout.write(sys.stdin.read().replace("""'''
                #        + strlinks[i] + '""", """' + idlinks[i] + '"""))\'')
                # output += (cmd)
                # os.system(cmd)
                # os.remove(inputf)
    if rewrite:
        print('Rewriting', f, flush=True)
        with open(f, 'w') as fp:
            fp.write(contents)
    if output:
        print('\n', f, '==================================================================\n', output)

sys.exit(errorcount)
