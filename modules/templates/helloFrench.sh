#!/usr/bin/env bash
set -x
hello='Bonjour'
output='french.txt'
previous_file=!{previous_file}
dispatcherURL=!{dispatcherURL}
BashMessage ${dispatcherURL} 'taskEvents' '"process":"HelloFrench"','"status":"started"'
cat ${previous_file} > $output
echo "${hello} world!" >> $output
BashMessage ${dispatcherURL} 'taskEvents' '"process":"HelloFrench"','"status":"completed"'

