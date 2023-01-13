#!/bin/bash

changes=("up" "down")
regions=("upstream_3_SS" "current_5_SS" "current_3_SS" "downstream_5_SS")

awk '{if($(NF-3)<0.05 && $(NF)<0) print $4"\t"$9-50"\t"$9+50"\t"$2"\t0\t"$5}' SE.txt | sort | uniq > up.SE.upstream_3_SS.bed
awk '{if($(NF-3)<0.05 && $(NF)>0) print $4"\t"$9-50"\t"$9+50"\t"$2"\t0\t"$5}' SE.txt | sort | uniq > down.SE.upstream_3_SS.bed
awk '{if($(NF-3)<0.05 && $(NF)<0) print $4"\t"$6-50"\t"$6+50"\t"$2"\t0\t"$5}' SE.txt | sort | uniq > up.SE.current_5_SS.bed
awk '{if($(NF-3)<0.05 && $(NF)>0) print $4"\t"$6-50"\t"$6+50"\t"$2"\t0\t"$5}' SE.txt | sort | uniq > down.SE.current_5_SS.bed
awk '{if($(NF-3)<0.05 && $(NF)<0) print $4"\t"$7-50"\t"$7+50"\t"$2"\t0\t"$5}' SE.txt | sort | uniq > up.SE.current_3_SS.bed
awk '{if($(NF-3)<0.05 && $(NF)>0) print $4"\t"$7-50"\t"$7+50"\t"$2"\t0\t"$5}' SE.txt | sort | uniq > down.SE.current_3_SS.bed
awk '{if($(NF-3)<0.05 && $(NF)<0) print $4"\t"$10-50"\t"$10+50"\t"$2"\t0\t"$5}' SE.txt | sort | uniq > up.SE.downstream_5_SS.bed
awk '{if($(NF-3)<0.05 && $(NF)>0) print $4"\t"$10-50"\t"$10+50"\t"$2"\t0\t"$5}' SE.txt | sort | uniq > down.SE.downstream_5_SS.bed
