#!/bin/bash
# My other script doesn't work in Fedora.
printf "$(file $1/* | cut  -c48-60 | sort | uniq -c)\n"
