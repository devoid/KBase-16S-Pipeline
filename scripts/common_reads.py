#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Created on Thu Jul 12 16:43:23 2012

@author: patricio
"""

import sys

fasta_1= sys.argv[1]
fasta_2= sys.argv[2]
common_file= sys.argv[3]

names_1= set((line.strip().strip(">") for line in open(fasta_1, "rU") if line.strip()[0] is '>' and line.strip()[0] is not ''))
names_2= set((line.strip().strip(">") for line in open(fasta_2, "rU") if line.strip()[0] is '>' and line.strip()[0] is not ''))

if len(names_1) > len(names_2):
    common= (name for name in names_2 if name in names_1)
else:
    common= (name for name in names_1 if name in names_2)

with open(common_file, "w") as out:
    out.write('\n'.join(common) + '\n')


    