
files=$(ls /proj/g2020008/3_Christel_2017/reference/*)
for entry in $files
do
ln -s $entry reference/
done

files=$(ls /proj/g2020008/3_Christel_2017/RNA_raw_data/*)
for entry in $files
do
ln -s $entry RNA/ 
done

files=$(ls /proj/g2020008/3_Christel_2017/RNA_trimmed_reads/*)
for entry in $files
do
ln -s $entry RNA_trimmed_reads/
done


