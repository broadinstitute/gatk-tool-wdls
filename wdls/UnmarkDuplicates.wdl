version 1.0

# Run UnmarkDuplicates (WDL auto generated from GATK Version 4.1.9.0-SNAPSHOT)
#
# Clears the 0x400 duplicate SAM flag
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
#    input_arg                                          BAM/SAM/CRAM file containing reads                          
#    inputIndex                                         Optional Companion resource for input_arg                            
#    output_arg                                         Write output to this file                                   
#    outputIndex                                        Optional Companion resource for output_arg                           
#

workflow UnmarkDuplicates {

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
    Array[File] input_arg
    Array[File]? inputIndex
    String output_arg
    String? outputIndex

  }

  call UnmarkDuplicates {

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
        input_arg                                          = input_arg,
        inputIndex                                         = inputIndex,
        output_arg                                         = output_arg,
        outputIndex                                        = outputIndex,

  }

  output {
    # Workflow Outputs                                  
    File UnmarkDuplicatesoutput_arg = UnmarkDuplicates.UnmarkDuplicates_output_arg
    File? UnmarkDuplicatesoutputIndex = UnmarkDuplicates.UnmarkDuplicates_outputIndex
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
    input_arg: { description: "BAM/SAM/CRAM file containing reads" }
    inputIndex: { description: "Companion resource for input_arg" }
    output_arg: { description: "Write output to this file" }
    outputIndex: { description: "Companion resource for output_arg" }
  }
}

task UnmarkDuplicates {

  input {
    String dockerImage
    String gatk
    String memoryRequirements
    String diskRequirements
    String cpuRequirements
    String preemptibleRequirements
    String bootdisksizegbRequirements
    Array[File] input_arg
    Array[File]? inputIndex
    String output_arg
    String? outputIndex

  }

  command <<<
    ~{gatk} UnmarkDuplicates \
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
    File UnmarkDuplicates_output_arg = output_arg
    File? UnmarkDuplicates_outputIndex = outputIndex
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
    input_arg: { description: "BAM/SAM/CRAM file containing reads" }
    inputIndex: { description: "Companion resource for input_arg" }
    output_arg: { description: "Write output to this file" }
    outputIndex: { description: "Companion resource for output_arg" }
  }
}
