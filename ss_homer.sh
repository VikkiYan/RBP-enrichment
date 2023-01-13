#!/bin/bash

conds=('up' 'down')

for c in ${conds[@]}
do
	types=('current_3_SS' 'upstream_3_SS')

		for t in ${types[@]}
		do
			filename="${c}.SE.${t}.bed"
			var="SE_${c}_${t}"
			nohup findMotifsGenome.pl $filename hg38 ${var}_output -p 10 -size given -norevopp -nomotif -nlen 0 -noweight -mis 0 -preparsedDir ../../../../results_Ziwei/motifs/parsed_genome -mknown pwm_combined.motifs -bg exon_3_ends.downsampled.sorted.bed > out.homer.$var &
		done

	types=('current_5_SS' 'downstream_5_SS')

		for t in ${types[@]}
		do
			filename="${c}.SE.${t}.bed"
			var="SE_${c}_${t}"
			nohup findMotifsGenome.pl $filename hg38 ${var}_output -p 10 -size given -norevopp -nomotif -nlen 0 -noweight -mis 0 -preparsedDir ../../../../results_Ziwei/motifs/parsed_genome -mknown pwm_combined.motifs -bg exon_5_ends.downsampled.sorted.bed > out.homer.$var &
		done
done
