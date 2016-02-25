#!/bin/bash
# $HOME == /root on raspberry pi, so I havent used it bellow.
now=`date '+%d/%m/%Y %H:%M:%S'`
logs="/home/pi/logs"
diary="$logs/diary.txt"

if [ ! -d "$logs" ]; then
  mkdir $logs
   if [ -w "$logs" ]; then
     touch $diary
     printf "Please write an entry for your diary $USER\n"
     read entry
     printf "Time: $now\n$entry\n" >> $diary
     printf "You have created your diary\nYour diary so far contains:\n"
     less -FX $diary
   else
     printf "$logs is not writeable by $USER"
   fi
else
    printf "Please write an entry for your diary $USER\n"
    read entry
    printf "Time: $now\n$entry\n" >> $diary
    printf "Your diray so far contains:\n"
    less -FX $diary
fi
