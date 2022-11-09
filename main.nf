nextflow.enable.dsl=2

include { download_reads_1 } from './modules/download_reads_1/module.nf'
include { fastqc_1 } from './modules/fastqc_1/module.nf'
include { test_python_1 } from './modules/test_python_1/module.nf'

workflow {
input1 = Channel.fromPath(params.download_reads_1.accessions).splitCsv()
input2 = Channel.fromPath(params.test_python_1.accessions).splitCsv()
download_reads_1(input1)
test_python_1(input2)
fastqc_1(download_reads_1.out.output1)
}
