#!/usr/bin/env bash
set -x
hello='Hola'
output='spanish.txt'
previous_file=!{previous_file}
BashMessage 'taskEvents' '"process":"HelloSpanish"','"status":"started"'
cat ${previous_file} > $output
echo "${hello} world!" >> $output
BashMessage 'taskEvents' '"process":"HelloSpanish"','"status":"completed"'
