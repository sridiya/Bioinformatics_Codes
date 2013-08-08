#Count mapped reads
samtools view -F 0X04 <bam>
#Print uniquely mapped reads 
samtools view -bq 1 <bam>
#Print reversely mapped reads
samtools view -f 0X10 <bam>
