import edu.cornell.eipm.messaging.zeromess.messages.*

process SAYHELLOINITALIAN {
    beforeScript ProcessMessage.started('SAYHELLOINITALIAN').forTopic('processEvents').buildCommand()
    afterScript ProcessMessage.completed('SAYHELLOINITALIAN').forTopic('processEvents').buildCommand()

    input:
        path (previous_file)

    output:
        path('italian.txt'), emit: italian_file

    shell:
        template 'helloItalian.sh'
}

process SAYHELLOINFRENCH {
    beforeScript ProcessMessage.started('SAYHELLOINFRENCH').forTopic('processEvents').buildCommand()
    afterScript ProcessMessage.completed('SAYHELLOINFRENCH').forTopic('processEvents').buildCommand()

    input:
        path (previous_file)

    output:
        path('french.txt'), emit: french_file

    shell:
        template 'helloFrench.sh'
}

process SAYHELLOINSPANISH {
    beforeScript ProcessMessage.started('SAYHELLOINSPANISH').forTopic('processEvents').buildCommand()
    afterScript ProcessMessage.completed('SAYHELLOINSPANISH').forTopic('processEvents').buildCommand()

    input:
        path (previous_file)

    output:
        path('spanish.txt'), emit: spanish_file

    shell:
        template 'helloSpanish.sh'
}

process SAYHELLOINENGLISH {
    beforeScript ProcessMessage.started('SAYHELLOINENGLISH').forTopic('processEvents').buildCommand()
    afterScript ProcessMessage.completed('SAYHELLOINENGLISH').forTopic('processEvents').buildCommand()

    input:
        path (previous_file)

    output:
        path('english.txt'), emit: english_file

    shell:
        template 'helloEnglish.sh'
}
