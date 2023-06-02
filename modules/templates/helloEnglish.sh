#!/usr/bin/env bash
set -x
hello='Hello'
output='english.txt'
previous_file=!{previous_file}
dispatcherURL=!{dispatcherURL}
BashMessage ${dispatcherURL} 'taskEvents' '"process":"HelloEnglish"','"status":"started"'
cat ${previous_file} > $output
echo "${hello} world!" >> $output
BashMessage ${dispatcherURL} 'taskEvents' '"process":"HelloEnglish"','"status":"completed"'
