
Hello Mess Pipeline
====================
[![Nextflow](https://img.shields.io/badge/nextflow-%E2%89%A520.01.0-brightgreen.svg)](https://www.nextflow.io/)

# Description
4 processes, each of them appends a line (in a different language) to a file consumed by the next process.
At the end of the execution, the content of the final file is shown.

# Execution
Clone the project and run:

    nextflow run main.nf  

or with [pipeline sharing](https://www.nextflow.io/docs/latest/en/latest/sharing.html), just run:

    nextflow run eipm/hello-mess-nf
