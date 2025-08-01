#!/usr/bin/env python3
# gettext "obsolete" strings are just a pain, remove them.
# https://www.gnu.org/software/gettext/manual/gettext.html#Obsolete-Entries

import glob
import re
import subprocess
import sys

remotes = subprocess.check_output(["git", "remote"], text=True).split("\n")
conflicts = []
if "--all" not in sys.argv and "upstream" in remotes and "weblate" in remotes:
    output = subprocess.check_output(
        ["git", "diff", "--name-only", "upstream/master...weblate/master"], text=True
    )
    conflicts = output.split("\n")

obsolete_pattern = re.compile(r"\n?(\n#, [a-z, -]*)?\n#~[^\n]*")
for f in sorted(glob.glob("po/*.po*")):
    if f in conflicts:
        continue
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
