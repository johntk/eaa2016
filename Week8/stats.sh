#! /bin/bash
freq=$1
duration=$2
dir=$3
now=`date '+%Y-%m-%d-%H:%M'`
stats="$dir/$now-stats.txt"

#Check if the dir is set && exists
if [ ! -z "${dir}" ]; then
  if [ ! -d "$dir" ]; then
    mkdir $dir
     if [ "$?" -eq 0 ]; then
       printf "Collection directory created\n"
     else
       printf "Directory creation failed with exit status $?\n"
       exit 3
     fi
  fi
else
  printf "Please enter a collection directory\n"
  exit 3
fi

#Create the data file and append the time and collected data
touch $stats
printf "Time: $now\n" >> $stats
printf "Collecting\n"
mpstat $freq $duration >> $stats

#Zip file
printf "Compressing\n"
gzip -k $stats

#Check compression success and delete uncompressed version
if [ "$?" -eq 0 ]; then
    printf "Collection & Compression complete\n"
    rm -r $stats
else
    printf "Collection & Compression failed with exit status $?\n"
    exit 3
fi

