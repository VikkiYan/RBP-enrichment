#!/bin/bash

changes=("down" "up")

for c in ${changes[@]}
do
	regions=("upstream_3_SS" "current_5_SS" "current_3_SS" "downstream_5_SS")
	for rr in ${regions[@]}
	do
		folder="SE_${c}_${rr}_output"
		fileout="SE_${c}_${rr}_motifs.txt"
		cp $folder/knownResults.txt $fileout
	done
done
