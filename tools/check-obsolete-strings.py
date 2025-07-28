#!/usr/bin/env python3
# gettext "obsolete" strings are just a pain, remove them.
# https://www.gnu.org/software/gettext/manual/gettext.html#Obsolete-Entries

import glob
import re

obsolete_pattern = re.compile(r"\n?(\n#, [a-z, -]*)?\n#~[^\n]*")
for f in sorted(glob.glob("po/*.po*")):
    output = ""
    rewrite = False
    print(f)
    with open(f) as fp:
        contents = fp.read()

    m = obsolete_pattern.search(contents)
    if m:
        output += f"\n found obsolete string, rewriting: {m.group()}\n"
        rewrite = True
        contents = obsolete_pattern.sub("", contents)
    if rewrite:
        print("Rewriting", f, flush=True)
        with open(f, "w") as fp:
            fp.write(contents)
    if output:
        print(
            "\n",
            f,
            "==================================================================\n",
            output,
        )
