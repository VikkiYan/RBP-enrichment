#!/bin/bash

samples=('8con' '8F39')

for s in ${samples[@]}
do
	for((i=1;i<=3;i++))
	do
		bam_in=${s}_rep${i}Aligned.sortedByCoord.out.bam
		bam_out=${s}_rep${i}.filtered.bam
		outfile=out.sam2bam.${s}_rep${i}
		nohup samtools view -q 5 -bS ../bam/$bam_in | samtools sort > ../bam/$bam_out &
	done
done
