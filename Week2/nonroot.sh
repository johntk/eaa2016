#!/bin/bash

Log_File=$HOME/logs/wk2.log

root=`ps -ef | grep -v root | wc -l`

overLimit=$(($root - $1))

echo "THere are $cnt non-root processes ruunning"

echo "$1 is the limit"

if [ $root -gt $1 ]
 then
 echo "`date -u` Root processes $overLimit over limit" >> $Log_File
fi
