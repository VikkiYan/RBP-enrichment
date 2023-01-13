#!/bin/bash

groups=("K431R_control" "K431R_WT")
changes=("up" "down")
regions=("upstream_3_SS" "downstream_5_SS")


for g in ${groups[@]}
do
	awk '{if($(NF-3)<0.05 && $(NF)<0) print $4"\t"$9-50"\t"$9+50"\t"$2"\t0\t"$5}' RI_${g}.txt | sort | uniq > down.RI_${g}.upstream_3_SS.bed
	awk '{if($(NF-3)<0.05 && $(NF)>0) print $4"\t"$9-50"\t"$9+50"\t"$2"\t0\t"$5}' RI_${g}.txt | sort | uniq > up.RI_${g}.upstream_3_SS.bed
	awk '{if($(NF-3)<0.05 && $(NF)<0) print $4"\t"$10-50"\t"$10+50"\t"$2"\t0\t"$5}' RI_${g}.txt | sort | uniq > down.RI_${g}.downstream_5_SS.bed
	awk '{if($(NF-3)<0.05 && $(NF)>0) print $4"\t"$10-50"\t"$10+50"\t"$2"\t0\t"$5}' RI_${g}.txt | sort | uniq > up.RI_${g}.downstream_5_SS.bed
done

for c in ${changes[@]}
do
	for rr in ${regions[@]}
	do
		file1="${c}.RI_K431R_control.${rr}.bed"
		file2="${c}.RI_K431R_WT.${rr}.bed"
		fileout="RI_shared_${c}_${rr}.bed"
		grep -Fxf $file1 $file2 > $fileout
	done
done
