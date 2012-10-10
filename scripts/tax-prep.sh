#!/bin/bash

$TMP_DIR=$1
R1_file=$2
R2_file=$3
R1_names=$4
R2_names=$5
GROUPS=$6

$PREFIX_R1=`echo $R1_file | sed 's/\.fasta//'`
$PREFIX_R2=`echo $R2_file | sed 's/\.fasta//'
$PREFIX_GROUPS=`echo $GROUPS | sed 's/\.groups//'

#Deunique the sequences
mothur "#deunique.seqs(fasta=$TMP_DIR/$PREFIX_R1.fasta, name=$R1_names)"
mothur "#deunique.seqs(fasta=$TMP_DIR/$PREFIX_R2.fasta, name=$R2_names)"

#find the common reads in R1 and R2
./common_reads.py $TMP_DIR/$PREFIX_R1.redundant.fasta $TMP_DIR/$PREFIX_R2.redundant.fasta $TMP_DIR/common_align_R1R2.accnos

#select the common reads from the FASTA and group files
mothur "#get.seqs(accnos=$TMP_DIR/common_align_R1R2.accnos, fasta=$TMP_DIR/$PREFIX_R1.redundant.fasta)"
mothur "#get.seqs(accnos=$TMP_DIR/common_align_R1R2.accnos, fasta=$TMP_DIR/$PREFIX_R2.redundant.fasta)"

#Select groups file
mothur "#get.seqs(accnos=$TMP_DIR/common_align_R1R2.accnos, group=$TMP_DIR/$PREFIX_GROUPS.groups)"

#fix the groups file
sort -u $TMP_DIR/$PREFIX_GROUPS.pick.groups > $TMP_DIR/tmp.groups
mv $TMP_DIR/tmp.groups $TMP_DIR/ns_R1R2.pick.groups

#sort the FASTA files by name in the commons file
mothur "#sort.seqs(accnos=$TMP_DIR/common_align_R1R2.accnos, fasta=$TMP_DIR/$PREFIX_R1.redundant.pick.fasta)"
mothur "#sort.seqs(accnos=$TMP_DIR/common_align_R1R2.accnos, fasta=$TMP_DIR/$PREFIX_R2.redundant.pick.fasta)"
#Paste sorted R1 and R2 (check the tab character)
PAD=`grep -e '>' $TMP_DIR/$PREFIX_R1.redundant.pick.sorted.fasta|wc -l`
for i in `seq $PAD`; do echo; echo NNNNNNNN; done > $TMP_DIR/pad.txt
sed -n '/^>/!p' $TMP_DIR/$PREFIX_R2.align2.redundant.pick.sorted.fasta | sed 's/^/\n/' > $TMP_DIR/3prime.txt
paste $TMP_DIR/$PREFIX_R1.align2.redundant.pick.sorted.fasta $TMP_DIR/pad.txt $TMP_DIR/3prime.txt |tr -d '\t' | sed '/^>/!s/[\.-]//g' > $TMP_DIR/for_taxonomy.fasta