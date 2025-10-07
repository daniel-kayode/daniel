#!/bin/bash


# Create dummy files with various sizes and categorize them into small, medium and large

dd if=/dev/zero of=small1.txt bs=1K count=100 # ~100 KB
dd if=/dev/zero of=small2.txt bs=1K count=500 # ~500 KB
dd if=/dev/zero of=medium1.txt bs=1M count=2 # ~2 MB
dd if=/dev/zero of=medium2.txt bs=1M count=5 # ~5 MB
dd if=/dev/zero of=large1.txt bs=1M count=15 # ~15 MB

# Also Create 3 folder within this lab_files_size directory

mkdir -p small medium large


#  Filter thru all the directory;  get all file sizes

#use the if, else and  if  to get various sizes and move them to varing  directories


for f in *; do

  [ -f "$f" ] || continue

  size=$(stat -c %s "$f")  # get file size in bytes

  if [ $size -lt 1048576 ]; then
    mv "$f" small/
  elif [ $size -le 10485760 ]; then
    mv "$f" medium/
  else
    mv "$f" large/
  fi
done

# create archives
tar -czf small.tar.gz small
tar -czf medium.tar.gz medium
tar -czf large.tar.gz large


# List all files with their size
 ls -lh
