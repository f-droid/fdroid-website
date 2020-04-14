#!/usr/bin/env python3

import glob
import os
import re
import shutil
import subprocess
import sys
from babel.messages.pofile import read_po, write_po
from babel.messages.catalog import Message

errorcount = 0
pattern = re.compile(r'](\([^h][^\)]+\))')
bad_md_link = re.compile(r'.*\]\s+\(')
for f in sorted(glob.glob('po/*.po*')):
    output = ''
    with open(f) as fp:
        catalog = read_po(fp)
    for message in catalog:
        if message.fuzzy:
            continue

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

        idlinks = []
        for m in pattern.findall(message.id):
            idlinks.append(m)
        strlinks = []
        for m in pattern.findall(message.string):
            strlinks.append(m)
        if len(strlinks) > 0 and len(idlinks) != len(strlinks):
            output += 'ERROR ' + f + ' ' + str(len(idlinks)) + ' != ' + str(len(strlinks)) + ' ' + message.id
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
    if output:
        print('\n', f, '==================================================================\n', output)

sys.exit(errorcount)
