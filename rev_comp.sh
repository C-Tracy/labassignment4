#!/bin/bash

if [ $# -lt 1 ]; then echo "no file input, please include a fasta file with command"; fi
if [ $# -gt 1 ]; then echo "more than one file was input, please provide only one fasta file"; fi

#initialize variable
reverse=""

#read in data
name=`grep ">" $1`
sequence=`grep -v ">" $1`

echo "Name: $name"

echo "$sequence"

#complement sequence
rc=`echo $sequence | rev | tr 'atcgATCG' 'tagcTAGC'`
#complement sequence#
rc=`echo $reverse | tr [A-Z] [a-z] | tr 'atcg' 'tagc'`
echo "$rc"

echo $name >$1.rc.txt
echo $rc >>$1.rc.txt
