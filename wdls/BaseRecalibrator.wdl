version 1.0

# Run BaseRecalibrator (WDL auto generated from GATK Version 4.2.0.0-SNAPSHOT)
#
# Generates recalibration table for Base Quality Score Recalibration (BQSR)
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
#    known_sites                                        One or more databases of known polymorphic sites used to exclude regions around 
#    output_arg                                         The output recalibration table file to create               
#    reference                                          Reference sequence file                                     
#    referenceIndex                                     Companion resource for reference                            
#    referenceDictionary                                Companion resource for reference                            
#

workflow BaseRecalibrator {

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
    Array[File] known_sites
    String output_arg
    File reference
    File referenceIndex
    File referenceDictionary

  }

  call BaseRecalibrator {

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
        known_sites                                        = known_sites,
        output_arg                                         = output_arg,
        reference                                          = reference,
        referenceIndex                                     = referenceIndex,
        referenceDictionary                                = referenceDictionary,

  }

  output {
    # Workflow Outputs                                  
    File BaseRecalibratoroutput_arg = BaseRecalibrator.BaseRecalibrator_output_arg
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
    known_sites: { description: "One or more databases of known polymorphic sites used to exclude regions around " }
    output_arg: { description: "The output recalibration table file to create" }
    reference: { description: "Reference sequence file" }
    referenceIndex: { description: "Companion resource for reference" }
    referenceDictionary: { description: "Companion resource for reference" }
  }
}

task BaseRecalibrator {

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
    Array[File] known_sites
    String output_arg
    File reference
    File referenceIndex
    File referenceDictionary

  }

  command <<<
    ~{gatk} BaseRecalibrator \
    --input ~{sep=' --input ' input_arg} \
    --known-sites ~{sep=' --known-sites ' known_sites} \
    --output ~{sep=' --output ' output_arg} \
    --reference ~{sep=' --reference ' reference} \

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
    File BaseRecalibrator_output_arg = output_arg
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
    known_sites: { description: "One or more databases of known polymorphic sites used to exclude regions around " }
    output_arg: { description: "The output recalibration table file to create" }
    reference: { description: "Reference sequence file" }
    referenceIndex: { description: "Companion resource for reference" }
    referenceDictionary: { description: "Companion resource for reference" }
  }
}

