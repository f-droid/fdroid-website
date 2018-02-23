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
for f in sorted(glob.glob('po/*.po*')):
    print('\n', f, '==================================================================')
    with open(f, 'r') as fp:
        catalog = read_po(fp)
    for message in catalog:
        if 'type: Title #' in message.auto_comments:
            if ':' in message.string and message.string[0] not in ('"', "'"):
                errorcount += 1
                print('colons not allowed in titles without quotes: %s "%s" "%s"'
                      % (f, message.id, message.string))
            if message.string:
                if '"' in (message.string[0], message.string[-1]) and message.string.count('"') % 2:
                    errorcount += 1
                    print('Mismatched " in title:', message.string)
                if "'" in (message.string[0], message.string[-1]) and message.string.count("'") % 2:
                    errorcount += 1
                    print("Mismatched ' in title:", message.string)

        idlinks = []
        for m in pattern.findall(message.id):
            idlinks.append(m)
        strlinks = []
        for m in pattern.findall(message.string):
            strlinks.append(m)
        if len(strlinks) > 0 and len(idlinks) != len(strlinks):
            print('ERROR', f, len(idlinks), ' != ', len(strlinks), message.id)
            errorcount += 1
        for i in range(len(strlinks)):
            if message.string and idlinks[i] != strlinks[i]:
                errorcount += 1
                print(f, 'msgstr', idlinks[i], '!=', strlinks[i])
                # inputf = f + '.orig'
                # shutil.copy(f, inputf)
                # cmd = ('msgfilter --input=' + inputf + ' --output-file=' + f
                #        + ''' python3 -c 'import sys; sys.stdout.write(sys.stdin.read().replace("""'''
                #        + strlinks[i] + '""", """' + idlinks[i] + '"""))\'')
                # print(cmd)
                # os.system(cmd)
                # os.remove(inputf)

sys.exit(errorcount)
