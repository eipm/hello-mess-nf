#!/usr/bin/env bash
set -x
BashMessage !{params.dispatcherURL} 'A_progress' '"name1":"value1","name2":"value2","name3":"value3"'

hello='Ciao'
output='italian.txt'
previous_file=!{previous_file}
dispatcherURL=!{dispatcherURL}
BashMessage ${dispatcherURL} 'helloItalian.process' '"status":"started""'
cat ${previous_file} > $output
echo "${hello} world!" >> $output
BashMessage ${dispatcherURL} 'helloItalian.process' '"status":"completed""'
