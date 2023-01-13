#!/bin/bash

nohup ./run_rmats --b1 WT_bams.txt --b2 WNT_bams.txt --gtf /home/daizw/data0/working/genome/GRCm39/GCF_000001635.27_GRCm39_genomic.gtf -t paired --readLength 150 --nthread 20 --od /home/daizw/USP39_KImice/results/WT_WNT --tmp /home/daizw/USP39_KImice/outputs/WT_WNT --task both --novelSS > out.WT_WNT &
nohup ./run_rmats --b1 KNT_bams.txt --b2 WNT_bams.txt --gtf /home/daizw/data0/working/genome/GRCm39/GCF_000001635.27_GRCm39_genomic.gtf -t paired --readLength 150 --nthread 20 --od /home/daizw/USP39_KImice/results/KNT_WNT --tmp /home/daizw/USP39_KImice/outputs/KNT_WNT --task both --novelSS > out.KNT_WNT &
nohup ./run_rmats --b1 KT_bams.txt --b2 WT_bams.txt --gtf /home/daizw/data0/working/genome/GRCm39/GCF_000001635.27_GRCm39_genomic.gtf -t paired --readLength 150 --nthread 20 --od /home/daizw/USP39_KImice/results/KT_WT --tmp /home/daizw/USP39_KImice/outputs/KT_WT --task both --novelSS > out.KT_WT &
