#!/usr/bin/env bash
set -x
hello='Hello'
output='english.txt'
previous_file=!{previous_file}
BashMessage 'taskEvents' '"process":"HelloEnglish"','"status":"started"'
cat ${previous_file} > $output
echo "${hello} world!" >> $output
BashMessage 'taskEvents' '"process":"HelloEnglish"','"status":"completed"'
