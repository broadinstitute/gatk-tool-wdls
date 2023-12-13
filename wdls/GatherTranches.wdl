version 1.0

# Run GatherTranches (**BETA**) (WDL auto generated from GATK Version 4.5.0.0-SNAPSHOT)
#
# Gathers scattered VQSLOD tranches into a single file
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
#    input_arg                                          List of scattered tranches files                            
#    mode                                               Recalibration mode to employ                                
#    output_arg                                         File to output the gathered tranches file to                
#

workflow GatherTranches {

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
    String mode
    String output_arg

  }

  call GatherTranches {

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
        mode                                               = mode,
        output_arg                                         = output_arg,

  }

  output {
    # Workflow Outputs                                  
    File GatherTranchesoutput_arg = GatherTranches.GatherTranches_output_arg
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
    input_arg: { description: "List of scattered tranches files" }
    mode: { description: "Recalibration mode to employ" }
    output_arg: { description: "File to output the gathered tranches file to" }
  }
}

task GatherTranches {

  input {
    String dockerImage
    String gatk
    String memoryRequirements
    String diskRequirements
    String cpuRequirements
    String preemptibleRequirements
    String bootdisksizegbRequirements
    Array[File] input_arg
    String mode
    String output_arg

  }

  command <<<
    ~{gatk} GatherTranches \
    --input ~{sep=' --input ' input_arg} \
    --mode ~{sep=' --mode ' mode} \
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
    File GatherTranches_output_arg = output_arg
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
    input_arg: { description: "List of scattered tranches files" }
    mode: { description: "Recalibration mode to employ" }
    output_arg: { description: "File to output the gathered tranches file to" }
  }
}

