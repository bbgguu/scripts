#!/bin/bash
#
# Get all IPs from the source file and sort them by numbers, then output the result to the destination file.

SRC_FILE=""
DST_FILE=./ip_list

grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' "${SRC_FILE}" \
    | sort \
    | uniq \
    | sort -t '.' -k 1,1n -k 2,2n -k 3,3n -k 4,4n -o "${DST_FILE}"
