#!/usr/bin/env bash
set -x

hello='Ciao'
output='italian.txt'
previous_file=!{previous_file}
dispatcherURL=!{dispatcherURL}
BashMessage ${dispatcherURL} 'helloProcess' '"process":"HelloItalian"','"status":"started"'
cat ${previous_file} > $output
echo "${hello} world!" >> $output
BashMessage ${dispatcherURL} 'helloProcess' '"process":"HelloItalian"','"status":"completed"'
