version 1.0

# Run CombineGVCFs (WDL auto generated from GATK Version 4.2.0.0-SNAPSHOT)
#
# Merges one or more HaplotypeCaller GVCF files into a single GVCF with appropriate annotations
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
#    output_arg                                         The combined GVCF output file                               
#    outputIndex                                        Optional Companion resource for output_arg                           
#    reference                                          Reference sequence file                                     
#    referenceIndex                                     Companion resource for reference                            
#    referenceDictionary                                Companion resource for reference                            
#    variant                                            One or more VCF files containing variants                   
#

workflow CombineGVCFs {

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
    String output_arg
    String? outputIndex
    File reference
    File referenceIndex
    File referenceDictionary
    Array[File] variant

  }

  call CombineGVCFs {

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
        output_arg                                         = output_arg,
        outputIndex                                        = outputIndex,
        reference                                          = reference,
        referenceIndex                                     = referenceIndex,
        referenceDictionary                                = referenceDictionary,
        variant                                            = variant,

  }

  output {
    # Workflow Outputs                                  
    File CombineGVCFsoutput_arg = CombineGVCFs.CombineGVCFs_output_arg
    File? CombineGVCFsoutputIndex = CombineGVCFs.CombineGVCFs_outputIndex
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
    output_arg: { description: "The combined GVCF output file" }
    outputIndex: { description: "Companion resource for output_arg" }
    reference: { description: "Reference sequence file" }
    referenceIndex: { description: "Companion resource for reference" }
    referenceDictionary: { description: "Companion resource for reference" }
    variant: { description: "One or more VCF files containing variants" }
  }
}

task CombineGVCFs {

  input {
    String dockerImage
    String gatk
    String memoryRequirements
    String diskRequirements
    String cpuRequirements
    String preemptibleRequirements
    String bootdisksizegbRequirements
    String output_arg
    String? outputIndex
    File reference
    File referenceIndex
    File referenceDictionary
    Array[File] variant

  }

  command <<<
    ~{gatk} CombineGVCFs \
    --output ~{sep=' --output ' output_arg} \
    --reference ~{sep=' --reference ' reference} \
    --variant ~{sep=' --variant ' variant} \

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
    File CombineGVCFs_output_arg = output_arg
    File? CombineGVCFs_outputIndex = outputIndex
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
    output_arg: { description: "The combined GVCF output file" }
    outputIndex: { description: "Companion resource for output_arg" }
    reference: { description: "Reference sequence file" }
    referenceIndex: { description: "Companion resource for reference" }
    referenceDictionary: { description: "Companion resource for reference" }
    variant: { description: "One or more VCF files containing variants" }
  }
}

