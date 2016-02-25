#!/bin/bash
#prints all the files in the passed in \dir, cuts the bits we want out, sorts them, counts uniq names
printf "$(file $1/* | cut  -c21-50 | cut -d',' -f1 | cut -d'`' -f1 | sort | uniq -c)\n"
