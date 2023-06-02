#!/usr/bin/env bash
set -x

hello='Ciao'
output='italian.txt'
previous_file=!{previous_file}
BashMessage 'taskEvents' '"process":"HelloItalian"','"status":"started"'
cat ${previous_file} > $output
echo "${hello} world!" >> $output
BashMessage 'taskEvents' '"process":"HelloItalian"','"status":"completed"'
