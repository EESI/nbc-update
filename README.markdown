README:

```
# score these genomes
cd folder_of_genomes_with_fasta_files_in_folder/
ls -1 | parallel -j12  bash ../../count-database.sh  {}

# Check if any didn't correctly run
for i in *; do bash ../../count-verify.sh $i; done | grep $'!'
```
