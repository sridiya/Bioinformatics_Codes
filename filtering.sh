#/bin/bash
#Step1:  Filtering the data by removing all the bases for the reads if they are assigned as bad(#) by Illumina.
map(){
 BASE=$(basename $1)
  /data2/Tools/ngsutils-ngsutils-0.5.0c/bin/fastqutils filter -stats -wildcard 3 -suffixqual '#' -size 50 $BASE > $BASE.filtering.fastq 
  /data1/code/bwa-0.7.5a/bwa mem /data2/Tools/hg19.rRNA-tRNA.filter.fa $BASE.filtering.fastq | samtools view -bS -  >$BASE.filtering.bam
  /data2/Tools/ngsutils-ngsutils-0.5.0c/bin/bamutils tofastq -unmapped $BASE.filtering.bam > $BASE.unmapped.fastq
  /data2/Tools/FastQC/fastqc $BASE.unmapped.fastq  --noextract
}
map Control_siRNA_1_IL2778-N1_AAGGGA_L003_R1.fastq
map Control_siRNA_1_IL2778-N1_AAGGGA_L003_R2.fastq
map Control_siRNA_2_IL2779-N3_GGACCC_L003_R1.fastq
map Control_siRNA_2_IL2779-N3_GGACCC_L003_R2.fastq
map Control_siRNA_4_IL2783-N4_TTCAGC_L004_R1.fastq
map Control_siRNA_4_IL2783-N4_TTCAGC_L004_R2.fastq
map EWS_siRNA_1_IL2780-N6_CCTCGG_L004_R1.fastq
map EWS_siRNA_1_IL2780-N6_CCTCGG_L004_R2.fastq
map EWS_siRNA_2_IL2781-N8_TTCGCT_L004_R1.fastq
map EWS_siRNA_2_IL2781-N8_TTCGCT_L004_R2.fastq
map EWS_siRNA_3_IL2784-N5_AAGACG_L003_R1.fastq
map EWS_siRNA_3_IL2784-N5_AAGACG_L003_R2.fastq
