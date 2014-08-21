cd $1

counts="bothsides/nmer_counts/minimum_of_1"
total="bothsides/nmer_total_num"
uniq="bothsides/nmer_uniq_num"

mkdir -p $total
mkdir -p $uniq
mkdir -p $counts

echo $1

for size in 3 5 6 9 12 15; do
				counts_f=$counts/$size.txt
				uniq_f=$uniq/$size.txt
				total_f=$total/$size.txt


				if [[ ! -e "$counts_f.gz" ]]; then
								echo "scoring $1 $size"
								cat *.fna | kmer_total_count -n -c -l -k $size  > "$counts_f"
								cat $counts_f | awk '{ sum+=$1 } END {print sum}' > "$total_f" 
								cat "$counts_f" | wc -l > "$uniq_f"

								pigz "$total_f"
								pigz "$counts_f" 
								pigz "$uniq_f"
				fi
done;
