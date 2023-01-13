#!/bin/bash

samples=('8con' '8F39')

for s in ${samples[@]}
do
	for((i=1;i<=3;i++))
	do
		filename1=${s}-${i}A/${s}-${i}A_1.fq.gz
		filename2=${s}-${i}A/${s}-${i}A_2.fq.gz
		nohup STAR --runThreadN 10 --genomeDir ~/data0/working/genome/GRCh38/genome_index --readFilesIn ../raw/$filename1 ../raw/$filename2 --readFilesCommand gunzip -c --outSAMtype BAM SortedByCoordinate --outFileNamePrefix ../bam/${s}_rep${i} --genomeLoad LoadAndKeep --limitBAMsortRAM 12000000000 --outBAMsortingThreadN 10 &
		sleep 1
	done
done
