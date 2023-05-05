#!/usr/bin/env nextflow
import edu.cornell.eipm.messaging.zeromess.messages.*
import edu.cornell.eipm.messaging.zeromess.ZeroMessInitializer

include { SAYHELLOINITALIAN; SAYHELLOINFRENCH; SAYHELLOINSPANISH; SAYHELLOINENGLISH } from './modules/sayHelloLibrary.nf'

/*
========================================================================================
                         Hello Mess Pipeline
========================================================================================
 eipm/hello-mess-nf

 @Homepage / Documentation
 https://github.com/eipm/hello-mess-nf
----------------------------------------------------------------------------------------
*/


log.info """\

    =======================================
      HELLO-MESS-NF   P I P E L I N E
    =======================================

    """.stripIndent()

//initialize the API
ZeroMessInitializer.init(params.pipelineName,
        params.dispatcherURL,
        workflow.sessionId,
        params.pipelineMessagingEnabled)

log.info "Pipeline has started"

workflow SAYHELLOINSEVERALLANGUAGES {
    take:
        welcome
        dispatcherURL
    main:
        SAYHELLOINITALIAN(welcome, dispatcherURL)
        SAYHELLOINFRENCH(SAYHELLOINITALIAN.out.italian_file, dispatcherURL)
        SAYHELLOINSPANISH(SAYHELLOINFRENCH.out.french_file, dispatcherURL)
        SAYHELLOINENGLISH(SAYHELLOINSPANISH.out.spanish_file, dispatcherURL)
    emit:
        SAYHELLOINENGLISH.out.english_file
}

workflow {
 PipelineMessage.started(workflow).forTopic("pipeline_hello_mess_nf")
        .data('message', 'Hope it works').send()
 SAYHELLOINSEVERALLANGUAGES(Channel.fromPath('welcome.txt'), Channel.value(params.dispatcherURL))
 SAYHELLOINSEVERALLANGUAGES.out | splitText | view
 PipelineMessage.completed(workflow).forTopic("pipeline_hello_mess_nf")
         .data('message', 'it worked!').send()
}

