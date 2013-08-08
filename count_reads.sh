#get the count from a fastq file
cat file.fastq |echo $((`wc -l`/4))
#for zipped fastq files
zcat file.fastq.gz |echo $((`wc -l`/4))
#if there is a directory with .fastq files and we want to know the total reads and unique reads then use
for read in `ls *.fq`; do echo -n "$read "; awk '((NR-2)%4==0){read=$1;total++;count[read]++}END{for(read in count){if(!max||count[read]>max) {max=count[read];maxRead=read};if(count[read]==1){unique++}};print total,unique,unique*100/total,maxRead,count[maxRead],count[maxRead]*100/total}' $read; done
