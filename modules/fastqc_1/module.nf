process fastqc_1 {

    input:
        path fastq
        
    output:
        path "*.html", emit: output1
        
    script:
    """
#!/usr/bin/env bash

fastq='$fastq'

fastqc --extract --nogroup --format fastq $fastq

    """

}