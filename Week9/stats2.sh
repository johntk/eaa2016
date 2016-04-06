#! /bin/bash
freq=$1
duration=$2
now=`date '+%Y-%m-%d-%H:%M'`
stats="$now-stats.dat"

#Collect the mpstat data
printf "Collecting for $duration seconds\n"
touch $stats
mpstat $freq $duration >> $stats
printf "Collection complete\n"

#Format the dat file
sed -i '1d' $stats
sed -i '2!b;s/......../Time/' $stats
printf "File formatted\n"
