#get the count from a fastq file
cat file.fastq |echo $((`wc -l`/4))
#for zipped fastq files
zcat file.fastq.gz |echo $((`wc -l`/4))
