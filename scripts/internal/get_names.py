#!/usr/bin/env python

# we're using python 3.x style print but want it to work in python 2.x,
from __future__ import print_function
import re, os, argparse, sys, math, warnings
try:              # since gzip will only be needed if there are gzipped files, accept
    import gzip   # failure to import it.
except:
    pass


parser = argparse.ArgumentParser(description="This script gets the mapping from integers to names for "
                                 "a text directory.  E.g. if a directory contain foo.txt.gz and bar.txt.gz "
                                 "(or foo.txt and bar.txt), plus dev.txt or dev.txt.gz, it would write "
                                 "something like\n"
                                 "1 foo\n"
                                 "2 bar\n"
                                 "to the standard output.\n",
                                 epilog="E.g. scripts/internal/get_names.py data/text");

parser.add_argument("text_dir",
                    help="Directory in which to look for text data\n");

args = parser.parse_args()


if not os.path.exists(args.text_dir):
    sys.exit("validate_text_dir.py: Expected directory {0} to exist".format(args.text_dir))

if (not os.path.exists("{0}/dev.txt".format(args.text_dir)) and
    not os.path.exists("{0}/dev.txt.gz".format(args.text_dir))):
    sys.exit("get_names.py: Expected file {0}/dev.txt (or {0}/dev.txt.gz) to exist".format(args.text_dir))


all_names = [ ]


for f in os.listdir(args.text_dir):
    if f.endswith(".txt") and f != "dev.txt":
        all_names.append(f[:-4])
    if  f.endswith(".txt.gz") and f != "dev.txt.gz":
        all_names.append(f[:-7])


if len(all_names) == 0:
    sys.exit("get_names.py: Directory {0} should contain at least one .txt file "
              "other than dev.txt.".format(args.text_dir));


# make sure the order is well defined.
all_names = sorted(all_names)

# here is where we produce the output.
for i in range(len(all_names)):
    print(i + 1, all_names[i])
