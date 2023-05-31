#!/usr/bin/env bash
set -x
hello='Hola'
output='spanish.txt'
previous_file=!{previous_file}
dispatcherURL=!{dispatcherURL}
BashMessage ${dispatcherURL} 'helloProcess' '"process":"HelloSpanish"','"status":"started"'
cat ${previous_file} > $output
echo "${hello} world!" >> $output
BashMessage ${dispatcherURL} 'helloProcess' '"process":"HelloSpanish"','"status":"completed"'
