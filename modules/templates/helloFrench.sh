#!/usr/bin/env bash
set -x
hello='Bonjour'
output='french.txt'
previous_file=!{previous_file}
BashMessage 'taskEvents' '"process":"HelloFrench"','"status":"started"'
cat ${previous_file} > $output
echo "${hello} world!" >> $output
BashMessage 'taskEvents' '"process":"HelloFrench"','"status":"completed"'

