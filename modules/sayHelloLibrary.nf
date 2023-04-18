import edu.cornell.eipm.messaging.zeromess.messages.*

process SAYHELLOINITALIAN {
    beforeScript ProcessMessage.started('Italian').forTopic('Italian_started').buildCommand()
    afterScript ProcessMessage.completed('Italian').forTopic('Italian_completed').buildCommand()
    container 'quay.io/nextflow/bash'

    input:
        path (previous_file)

    output:
        path('italian.txt'), emit: italian_file

    shell:
        template 'helloItalian.sh'
}

process SAYHELLOINFRENCH {
    beforeScript ProcessMessage.started('French').forTopic('French_started').buildCommand()
    afterScript ProcessMessage.completed('French').forTopic('French_completed').buildCommand()
    container 'quay.io/nextflow/bash'

    input:
        path (previous_file)

    output:
        path('french.txt'), emit: french_file

    shell:
        template 'helloFrench.sh'
}

process SAYHELLOINSPANISH {
    beforeScript ProcessMessage.started('Spanish').forTopic('Spanish_started').buildCommand()
    afterScript ProcessMessage.completed('Spanish').forTopic('Spanish_completed').buildCommand()
    container 'quay.io/nextflow/bash'

    input:
        path (previous_file)

    output:
        path('spanish.txt'), emit: spanish_file

    shell:
        template 'helloSpanish.sh'
}

process SAYHELLOINENGLISH {
    beforeScript ProcessMessage.started('English').forTopic('English_started').buildCommand()
    afterScript ProcessMessage.completed('English').forTopic('English_completed').buildCommand()
    container 'quay.io/nextflow/bash'

    input:
        path (previous_file)

    output:
        path('english.txt'), emit: english_file

    shell:
        template 'helloEnglish.sh'
}
