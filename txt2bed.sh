#!/bin/bash

events=('A3SS' 'A5SS' 'RI' 'MXE' 'SE')


for var in ${events[@]}
do
	filename="$var.MATS.JCEC.txt"
	fileout_up="up.$var.bed"
	fileout_down="down.$var.bed" #up and down were defined by changes in the alt_splicing form (that is, the exon-skipped isoform in the case of SE)
	awk '{if($(NF-3)<0.05 && $(NF)<0) print $4"\t"$6"\t"$7"\t"$2"\t"$(NF-3)"\t"$5}' $filename | sort | uniq > $fileout_up
	awk '{if($(NF-3)<0.05 && $(NF)>0) print $4"\t"$6"\t"$7"\t"$2"\t"$(NF-3)"\t"$5}' $filename | sort | uniq > $fileout_down
done
