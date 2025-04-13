version 1.0

# Run GatherTranches (**BETA**) (WDL auto generated from GATK Version 4.6.2.0-SNAPSHOT)
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
#  Optional Tool Arguments
#    gcs_max_retries                                    If the GCS bucket channel errors out, how many times it will attempt to re-initi
#    gcs_project_for_requester_pays                     Project to bill when accessing requester pays buckets. If unset, these buckets c
#    truth_sensitivity_tranche                          The levels of truth sensitivity at which to slice the data. (in percent, that is
#
#  Optional Common Arguments
#    gatk_config_file                                   A configuration file to use with the GATK.                  
#    QUIET                                              Whether to suppress job-summary info on System.err.         
#    tmp_dir                                            Temp directory to use.                                      
#    use_jdk_deflater                                   Whether to use the JdkDeflater (as opposed to IntelDeflater)
#    use_jdk_inflater                                   Whether to use the JdkInflater (as opposed to IntelInflater)
#    verbosity                                          Control verbosity of logging.                               

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

    # Optional Tool Arguments
    Int? gcs_max_retries
    String? gcs_project_for_requester_pays
    Array[Float]? truth_sensitivity_tranche

    # Optional Common Arguments
    String? gatk_config_file
    Boolean? QUIET
    File? tmp_dir
    Boolean? use_jdk_deflater
    Boolean? use_jdk_inflater
    String? verbosity

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

        # Optional Tool Arguments
        gcs_max_retries                                    = gcs_max_retries,
        gcs_project_for_requester_pays                     = gcs_project_for_requester_pays,
        truth_sensitivity_tranche                          = truth_sensitivity_tranche,

        # Optional Common Arguments
        gatk_config_file                                   = gatk_config_file,
        QUIET                                              = QUIET,
        tmp_dir                                            = tmp_dir,
        use_jdk_deflater                                   = use_jdk_deflater,
        use_jdk_inflater                                   = use_jdk_inflater,
        verbosity                                          = verbosity,

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

    # Optional Tool Arguments
    gcs_max_retries: { description: "If the GCS bucket channel errors out, how many times it will attempt to re-initi" }
    gcs_project_for_requester_pays: { description: "Project to bill when accessing requester pays buckets. If unset, these buckets c" }
    truth_sensitivity_tranche: { description: "The levels of truth sensitivity at which to slice the data. (in percent, that is" }

    # Optional Common Arguments
    gatk_config_file: { description: "A configuration file to use with the GATK." }
    QUIET: { description: "Whether to suppress job-summary info on System.err." }
    tmp_dir: { description: "Temp directory to use." }
    use_jdk_deflater: { description: "Whether to use the JdkDeflater (as opposed to IntelDeflater)" }
    use_jdk_inflater: { description: "Whether to use the JdkInflater (as opposed to IntelInflater)" }
    verbosity: { description: "Control verbosity of logging." }
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
    Int? gcs_max_retries
    String? gcs_project_for_requester_pays
    Array[Float]? truth_sensitivity_tranche
    String? gatk_config_file
    Boolean? QUIET
    File? tmp_dir
    Boolean? use_jdk_deflater
    Boolean? use_jdk_inflater
    String? verbosity

  }

  command <<<
    ~{gatk} GatherTranches \
    --input ~{sep=' --input ' input_arg} \
    --mode ~{sep=' --mode ' mode} \
    --output ~{sep=' --output ' output_arg} \
    ~{true='--gcs-max-retries ' false='' defined(gcs_max_retries)}~{sep=' --gcs-max-retries ' gcs_max_retries} \
    ~{true='--gcs-project-for-requester-pays ' false='' defined(gcs_project_for_requester_pays)}~{sep=' --gcs-project-for-requester-pays ' gcs_project_for_requester_pays} \
    ~{true='--truth-sensitivity-tranche ' false='' defined(truth_sensitivity_tranche)}~{sep=' --truth-sensitivity-tranche ' truth_sensitivity_tranche} \
    ~{true='--gatk-config-file ' false='' defined(gatk_config_file)}~{sep=' --gatk-config-file ' gatk_config_file} \
    ~{true='--QUIET ' false='' defined(QUIET)}~{sep=' --QUIET ' QUIET} \
    ~{true='--tmp-dir ' false='' defined(tmp_dir)}~{sep=' --tmp-dir ' tmp_dir} \
    ~{true='--use-jdk-deflater ' false='' defined(use_jdk_deflater)}~{sep=' --use-jdk-deflater ' use_jdk_deflater} \
    ~{true='--use-jdk-inflater ' false='' defined(use_jdk_inflater)}~{sep=' --use-jdk-inflater ' use_jdk_inflater} \
    ~{true='--verbosity ' false='' defined(verbosity)}~{sep=' --verbosity ' verbosity} \

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

    # Optional Tool Arguments
    gcs_max_retries: { description: "If the GCS bucket channel errors out, how many times it will attempt to re-initi" }
    gcs_project_for_requester_pays: { description: "Project to bill when accessing requester pays buckets. If unset, these buckets c" }
    truth_sensitivity_tranche: { description: "The levels of truth sensitivity at which to slice the data. (in percent, that is" }

    # Optional Common Arguments
    gatk_config_file: { description: "A configuration file to use with the GATK." }
    QUIET: { description: "Whether to suppress job-summary info on System.err." }
    tmp_dir: { description: "Temp directory to use." }
    use_jdk_deflater: { description: "Whether to use the JdkDeflater (as opposed to IntelDeflater)" }
    use_jdk_inflater: { description: "Whether to use the JdkInflater (as opposed to IntelInflater)" }
    verbosity: { description: "Control verbosity of logging." }
  }
}

