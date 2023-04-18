#!/usr/bin/env bash
set -x
hello='Hola'
output='spanish.txt'
previous_file=!{previous_file}
cat ${previous_file} > $output
echo "${hello} world!" >> $output
