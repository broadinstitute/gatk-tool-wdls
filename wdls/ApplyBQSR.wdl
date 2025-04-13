version 1.0

# Run ApplyBQSR (WDL auto generated from GATK Version 4.6.2.0-SNAPSHOT)
#
# Apply base quality score recalibration
#
#  General Workflow (non-tool) Arguments
#    dockerImage                                        Docker image for this workflow
#    gatk                                               Location of gatk to run for this workflow
#    memoryRequirements                                 Runtime memory requirements for this workflow
#    diskRequirements                                   Runtime disk requirements for this workflow
#    cpuRequirements                                    Runtime CPU count for this workflow
#    preemptibleRequirements                            Runtime preemptible count for this workflow
#    bootdisksizegbRequirements                         Runtime boot disk size for this workflow
#
#  Required Tool Arguments
#    bqsr_recal_file                                    Input recalibration table for BQSR                          
#    input_arg                                          BAM/SAM/CRAM file containing reads                          
#    inputIndex                                         Optional Companion resource for input_arg                            
#    output_arg                                         Write output to this file                                   
#    outputIndex                                        Optional Companion resource for output_arg                           
#

workflow ApplyBQSR {

  input {
    #Docker to use
    String dockerImage
    #App location
    String gatk
    #Memory to use
    String memoryRequirements
    #Disk requirements for this workflow
    String diskRequirements
    #CPU requirements for this workflow
    String cpuRequirements
    #Preemptible requirements for this workflow
    String preemptibleRequirements
    #Boot disk size requirements for this workflow
    String bootdisksizegbRequirements

    # Required Arguments
    File bqsr_recal_file
    Array[File] input_arg
    Array[File]? inputIndex
    String output_arg
    String? outputIndex

  }

  call ApplyBQSR {

    input:

        #Docker
        dockerImage                                        = dockerImage,
        #App location
        gatk                                               = gatk,
        #Memory to use
        memoryRequirements                                 = memoryRequirements,
        #Disk requirements for this workflow
        diskRequirements                                   = diskRequirements,
        #CPU requirements for this workflow
        cpuRequirements                                    = cpuRequirements,
        #Preemptible requirements for this workflow
        preemptibleRequirements                            = preemptibleRequirements,
        #Boot disk size requirements for this workflow
        bootdisksizegbRequirements                         = bootdisksizegbRequirements,


        # Required Arguments
        bqsr_recal_file                                    = bqsr_recal_file,
        input_arg                                          = input_arg,
        inputIndex                                         = inputIndex,
        output_arg                                         = output_arg,
        outputIndex                                        = outputIndex,

  }

  output {
    # Workflow Outputs                                  
    File ApplyBQSRoutput_arg = ApplyBQSR.ApplyBQSR_output_arg
    File? ApplyBQSRoutputIndex = ApplyBQSR.ApplyBQSR_outputIndex
  }

  parameter_meta {
    dockerImage: { description: "Docker image for this task" }
    gatk: { description: "Location of gatk to run for this task" }
    memoryRequirements: { description: "Runtime memory requirements for this task" }
    diskRequirements: { description: "Runtime disk requirements for this task" }
    cpuRequirements: { description: "Runtime CPU count for this task" }
    preemptibleRequirements: { description: "Runtime preemptible count for this task" }
    bootdisksizegbRequirements: { description: "Runtime boot disk size for this task" }

    # Required Arguments
    bqsr_recal_file: { description: "Input recalibration table for BQSR" }
    input_arg: { description: "BAM/SAM/CRAM file containing reads" }
    inputIndex: { description: "Companion resource for input_arg" }
    output_arg: { description: "Write output to this file" }
    outputIndex: { description: "Companion resource for output_arg" }
  }
}

task ApplyBQSR {

  input {
    String dockerImage
    String gatk
    String memoryRequirements
    String diskRequirements
    String cpuRequirements
    String preemptibleRequirements
    String bootdisksizegbRequirements
    File bqsr_recal_file
    Array[File] input_arg
    Array[File]? inputIndex
    String output_arg
    String? outputIndex

  }

  command <<<
    ~{gatk} ApplyBQSR \
    --bqsr-recal-file ~{sep=' --bqsr-recal-file ' bqsr_recal_file} \
    --input ~{sep=' --input ' input_arg} \
    --output ~{sep=' --output ' output_arg} \

  >>>

  runtime {
      docker: dockerImage
      memory: memoryRequirements
      disks: diskRequirements
      cpu: cpuRequirements
      preemptible: preemptibleRequirements
      bootDiskSizeGb: bootdisksizegbRequirements
  }

  output {
    # Task Outputs                                      
    File ApplyBQSR_output_arg = output_arg
    File? ApplyBQSR_outputIndex = outputIndex
  }

  parameter_meta {
    dockerImage: { description: "Docker image for this task" }
    gatk: { description: "Location of gatk to run for this task" }
    memoryRequirements: { description: "Runtime memory requirements for this task" }
    diskRequirements: { description: "Runtime disk requirements for this task" }
    cpuRequirements: { description: "Runtime CPU count for this task" }
    preemptibleRequirements: { description: "Runtime preemptible count for this task" }
    bootdisksizegbRequirements: { description: "Runtime boot disk size for this task" }

    # Required Arguments
    bqsr_recal_file: { description: "Input recalibration table for BQSR" }
    input_arg: { description: "BAM/SAM/CRAM file containing reads" }
    inputIndex: { description: "Companion resource for input_arg" }
    output_arg: { description: "Write output to this file" }
    outputIndex: { description: "Companion resource for output_arg" }
  }
}

