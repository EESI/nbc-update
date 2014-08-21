#!/bin/bash 

echo $1

counts="$1/bothsides/nmer_counts/minimum_of_1"
total="$1/bothsides/nmer_total_num"
uniq="$1/bothsides/nmer_uniq_num"

for size in 3 5 6 9 12 15; do
  counts_f=$PWD/$counts/$size.txt.gz
  uniq_f=$PWD/$uniq/$size.txt.gz
  total_f=$PWD/$total/$size.txt.gz

  if [[ ! -e "$counts_f" ]]; then
    echo "! $counts_f"
  fi

  if [[ ! -e "$uniq_f" ]]; then
    echo "! $uniq_f"
  fi

  if [[ ! -e "$total_f" ]]; then
    echo "! $total_f"
  fi

done;
