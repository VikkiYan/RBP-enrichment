#!/bin/bash

samples=('8con' '8F39')

for s in ${samples[@]}
do
	for((i=1;i<=3;i++))
	do
		samp_name=${s}_rep${i}
		bamfile=${s}_rep${i}.filtered.bam
		nohup htseq-count -f bam -r pos -q -s no ../bam/$bamfile ~/data0/working/genome/GRCh38/Homo_sapiens.GRCh38.104.gtf > ../results/count.${samp_name} &
	done
done
