import edu.cornell.eipm.messaging.zeromess.messages.*

process SAYHELLOINITALIAN {
    beforeScript ProcessMessage.started('SAYHELLOINITALIAN').forTopic('beforeProcess').buildCommand()
    afterScript ProcessMessage.completed('SAYHELLOINITALIAN').forTopic('afterProcess').buildCommand()
    container 'ubuntu:23.10'

    input:
        path (previous_file)
        val(dispatcherURL)

    output:
        path('italian.txt'), emit: italian_file

    shell:
        template 'helloItalian.sh'
}

process SAYHELLOINFRENCH {
    beforeScript ProcessMessage.started('SAYHELLOINFRENCH').forTopic('beforeProcess').buildCommand()
    afterScript ProcessMessage.completed('SAYHELLOINFRENCH').forTopic('afterProcess').buildCommand()
    container 'ubuntu:23.10'

    input:
        path (previous_file)
        val(dispatcherURL)

    output:
        path('french.txt'), emit: french_file

    shell:
        template 'helloFrench.sh'
}

process SAYHELLOINSPANISH {
    beforeScript ProcessMessage.started('SAYHELLOINSPANISH').forTopic('beforeProcess').buildCommand()
    afterScript ProcessMessage.completed('SAYHELLOINSPANISH').forTopic('afterProcess').buildCommand()
    container 'ubuntu:23.10'

    input:
        path (previous_file)
        val(dispatcherURL)

    output:
        path('spanish.txt'), emit: spanish_file

    shell:
        template 'helloSpanish.sh'
}

process SAYHELLOINENGLISH {
    beforeScript ProcessMessage.started('SAYHELLOINENGLISH').forTopic('beforeProcess').buildCommand()
    afterScript ProcessMessage.completed('SAYHELLOINENGLISH').forTopic('afterProcess').buildCommand()
    container 'ubuntu:23.10'

    input:
        path (previous_file)
        val(dispatcherURL)

    output:
        path('english.txt'), emit: english_file

    shell:
        template 'helloEnglish.sh'
}
