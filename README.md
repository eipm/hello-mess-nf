![logo](doc/zero-mess-logo.png)

Hello Mess Pipeline
====================
[![Nextflow](https://img.shields.io/badge/nextflow-%E2%89%A523.04.1-brightgreen.svg)](https://www.nextflow.io/)

This pipeline demonstrates how to integrate the Zero-Mess library to send events to a
Kafka-compatible broker.

# Description
4 processes, each of them appends a line (in a different language) to a file consumed by the next process.
At the end of the execution, the content of the final file is shown.

## Messages
There are two types of messages:
* Stateful messages (<code>PipelineMessage</code>, <code>ProcessMessage</code>)
* Stateless messages (<code>BashMessage</code>)

Stateful messages are used inside the main pipeline code and benefit from the current state of the execution.

Stateless messages are executed locally or remotely inside a process execution (task). They don't have a state nor can access to the pipeline's state.
They need more parameters as they must be 'self-contained'.

### Pipeline Messages
Pipeline messages can be sent at any point in the pipeline Groovy code (main workflow, subworkflows, etc.).

The following code shows how to build and send a message that notifies the pipeline has started:
```groovy
PipelineMessage.started().forTopic('pipelineEvents')
        .data('launch time', "${workflow.start.format('dd-MMM-yyyy HH:mm:ss')}")
        .data('hope', 'wish it works').send()
```

or
```groovy
PipelineMessage.started(workflow).forTopic('pipelineEvents')
        .data('hope', 'wish it works').send()
```
In the latter case, `PipelineMessage` extracts some default metadata from the workflow object and add them to the message.

`data()` can be invoked as many times as needed, and it keeps appending information to the message payload.

### Process Messages
A process can log started and completed events using <code>ProcessMessage</code> inside the
<code>beforeScript</code> and <code>afterScript</code> directives.

These two directives allow to specify one or more commands to execute in a shell before and after the process execution.
For this reason, the <code>buildCommand()</code> should be invoked instead of <code>send()</code>
```groovy
process A {
    // Messaging
    beforeScript ProcessMessage.started('A').forTopic('processEvents').data('my info','message').buildCommand()
    
    afterScript ProcessMessage.completed('A').forTopic('processEvents').data('another info','another message').buildCommand()

    input:
    
    output:
    
    """
    """
}
```
As for `PipelineMessage`, `data()` can be invoked as many times as needed.

### Bash messages
If the process' script is a Bash script, the <code>BashMessage</code> function can be used at any point in the script.

The expected parameters are:
* the topic where to publish the message
* the data for the payload. Format: <pre>"name1":"value1","name2":"value2","name3":"value3"</pre> surrounded by single quotes.
For example:
```bash
BashMessage 'taskEvents' '"process":"A"','"messageStatus":"about to echo from A"'
echo 'Hello from A' > helloA.txt
if [[ $? != 0 ]]; then
    BashMessage 'A.failure' '"process":"A"',"exitStatus":"127","message":"A failed to echo"'
    exit 127
fi
```

# Execution
Clone the project and run:

    nextflow run main.nf  

or with [pipeline sharing](https://www.nextflow.io/docs/latest/sharing.html), just run:

    nextflow run eipm/hello-mess-nf

**Note**: The pipeline will run but won't publish any message. For that, you need to start an instance of
Kafka-Dispatcher and configure the related endpoint in `nextflow.config`.