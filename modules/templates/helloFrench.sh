#!/usr/bin/env bash
set -x
hello='Bonjour'
output='french.txt'
previous_file=!{previous_file}
dispatcherURL=!{dispatcherURL}
BashMessage ${dispatcherURL} 'helloFrench.process' '"status":"started""'
cat ${previous_file} > $output
echo "${hello} world!" >> $output
BashMessage ${dispatcherURL} 'helloFrench.process' '"status":"completed""'

