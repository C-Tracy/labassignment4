#! /bin/sh

if [ $# -lt 1 ] || [ $# -gt 1 ]
then
echo "Specify FASTA file to be used with this script."
exit
else

#initialize variable
reverse=""

#read in data
name=`grep ">" $1`
sequence=`grep -v ">" $1`

echo "Name: $name"

#calculate length of sequence
len=${#sequence}

echo "Length: $len"

#loop through sequence in reverse
for (( i=$len; i>=0; i-- ))
do
    reverse="$reverse${sequence:$i:1}"
    reverse=$(echo $len | rev)
done

echo "$sequence
$reverse
"

#complement sequence
rc=`echo $reverse | tr 'atcg' 'tagc'`

echo "$rc
"

echo $name >$1.rc.txt
echo $rc >>$1.rc.txt
