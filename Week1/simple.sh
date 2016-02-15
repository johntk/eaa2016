#!/bin/bash

echo "Performance stats for $USER"

cnt=`ps -ef | wc -l`

echo "There are $cnt proccesses running"

echo "$1 is the limit"

if [ $cnt -gt $1 ]
 then
 echo "Limit exceeded"
fi

cpu=`more /proc/cpuinfo | grep processor | wc -l`

echo "$cpu"
