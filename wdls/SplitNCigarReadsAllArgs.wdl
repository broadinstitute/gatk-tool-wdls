version 1.0

# Run SplitNCigarReads (WDL auto generated from GATK Version 4.6.2.0-SNAPSHOT)
#
# Split Reads with N in Cigar
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
#    output_arg                                         Write output to this BAM filename                           
#    outputIndex                                        Optional Companion resource for output_arg                           
#    reference                                          Reference sequence file                                     
#    referenceIndex                                     Companion resource for reference                            
#    referenceDictionary                                Companion resource for reference                            
#
#  Optional Tool Arguments
#    cloud_index_prefetch_buffer                        Size of the cloud-only prefetch buffer (in MB; 0 to disable). Defaults to cloudP
#    cloud_prefetch_buffer                              Size of the cloud-only prefetch buffer (in MB; 0 to disable).
#    disable_bam_index_caching                          If true, dont cache bam indexes, this will reduce memory requirements but may ha
#    disable_sequence_dictionary_validation             If specified, do not check the sequence dictionaries from our inputs for compati
#    do_not_fix_overhangs                               do not have the walker soft-clip overhanging sections of the reads
#    gcs_max_retries                                    If the GCS bucket channel errors out, how many times it will attempt to re-initi
#    gcs_project_for_requester_pays                     Project to bill when accessing requester pays buckets. If unset, these buckets c
#    interval_merging_rule                              Interval merging rule for abutting intervals                
#    intervals                                          One or more genomic intervals over which to operate         
#    max_bases_in_overhang                              max number of bases allowed in the overhang                 
#    max_mismatches_in_overhang                         max number of mismatches allowed in the overhang            
#    process_secondary_alignments                       have the walker split secondary alignments (will still repair MC tag without it)
#    refactor_cigar_string                              refactor cigar string with NDN elements to one element      
#    sites_only_vcf_output                              If true, dont emit genotype fields when writing vcf file output.
#    skip_mapping_quality_transform                     skip the 255 -> 60 MQ read transform                        
#
#  Optional Common Arguments
#    add_output_sam_program_record                      If true, adds a PG tag to created SAM/BAM/CRAM files.       
#    add_output_vcf_command_line                        If true, adds a command line header line to created VCF files.
#    create_output_bam_index                            If true, create a BAM/CRAM index when writing a coordinate-sorted BAM/CRAM file.
#    create_output_bam_md5                              If true, create a MD5 digest for any BAM/SAM/CRAM file created
#    create_output_variant_index                        If true, create a VCF index when writing a coordinate-sorted VCF file.
#    create_output_variant_md5                          If true, create a a MD5 digest any VCF file created.        
#    disable_read_filter                                Read filters to be disabled before analysis                 
#    disable_tool_default_read_filters                  Disable all tool default read filters (WARNING: many tools will not function cor
#    exclude_intervals                                  One or more genomic intervals to exclude from processing    
#    gatk_config_file                                   A configuration file to use with the GATK.                  
#    interval_exclusion_padding                         Amount of padding (in bp) to add to each interval you are excluding.
#    interval_padding                                   Amount of padding (in bp) to add to each interval you are including.
#    interval_set_rule                                  Set merging approach to use for combining interval inputs   
#    inverted_read_filter                               Inverted (with flipped acceptance/failure conditions) read filters applied befor
#    lenient                                            Lenient processing of VCF files                             
#    max_variants_per_shard                             If non-zero, partitions VCF output into shards, each containing up to the given 
#    QUIET                                              Whether to suppress job-summary info on System.err.         
#    read_filter                                        Read filters to be applied before analysis                  
#    read_index                                         Indices to use for the read inputs. If specified, an index must be provided for 
#    read_validation_stringency                         Validation stringency for all SAM/BAM/CRAM/SRA files read by this program.  The 
#    seconds_between_progress_updates                   Output traversal statistics every time this many seconds elapse
#    sequence_dictionary                                Use the given sequence dictionary as the master/canonical sequence dictionary.  
#    tmp_dir                                            Temp directory to use.                                      
#    use_jdk_deflater                                   Whether to use the JdkDeflater (as opposed to IntelDeflater)
#    use_jdk_inflater                                   Whether to use the JdkInflater (as opposed to IntelInflater)
#    verbosity                                          Control verbosity of logging.                               

workflow SplitNCigarReads {

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
    File reference
    File referenceIndex
    File referenceDictionary

    # Optional Tool Arguments
    Int? cloud_index_prefetch_buffer
    Int? cloud_prefetch_buffer
    Boolean? disable_bam_index_caching
    Boolean? disable_sequence_dictionary_validation
    Boolean? do_not_fix_overhangs
    Int? gcs_max_retries
    String? gcs_project_for_requester_pays
    String? interval_merging_rule
    Array[String]? intervals
    Int? max_bases_in_overhang
    Int? max_mismatches_in_overhang
    Boolean? process_secondary_alignments
    Boolean? refactor_cigar_string
    Boolean? sites_only_vcf_output
    Boolean? skip_mapping_quality_transform

    # Optional Common Arguments
    Boolean? add_output_sam_program_record
    Boolean? add_output_vcf_command_line
    Boolean? create_output_bam_index
    Boolean? create_output_bam_md5
    Boolean? create_output_variant_index
    Boolean? create_output_variant_md5
    Array[String]? disable_read_filter
    Boolean? disable_tool_default_read_filters
    Array[String]? exclude_intervals
    String? gatk_config_file
    Int? interval_exclusion_padding
    Int? interval_padding
    String? interval_set_rule
    Array[String]? inverted_read_filter
    Boolean? lenient
    Int? max_variants_per_shard
    Boolean? QUIET
    Array[String]? read_filter
    Array[File]? read_index
    String? read_validation_stringency
    Float? seconds_between_progress_updates
    File? sequence_dictionary
    File? tmp_dir
    Boolean? use_jdk_deflater
    Boolean? use_jdk_inflater
    String? verbosity

  }

  call SplitNCigarReads {

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
        reference                                          = reference,
        referenceIndex                                     = referenceIndex,
        referenceDictionary                                = referenceDictionary,

        # Optional Tool Arguments
        cloud_index_prefetch_buffer                        = cloud_index_prefetch_buffer,
        cloud_prefetch_buffer                              = cloud_prefetch_buffer,
        disable_bam_index_caching                          = disable_bam_index_caching,
        disable_sequence_dictionary_validation             = disable_sequence_dictionary_validation,
        do_not_fix_overhangs                               = do_not_fix_overhangs,
        gcs_max_retries                                    = gcs_max_retries,
        gcs_project_for_requester_pays                     = gcs_project_for_requester_pays,
        interval_merging_rule                              = interval_merging_rule,
        intervals                                          = intervals,
        max_bases_in_overhang                              = max_bases_in_overhang,
        max_mismatches_in_overhang                         = max_mismatches_in_overhang,
        process_secondary_alignments                       = process_secondary_alignments,
        refactor_cigar_string                              = refactor_cigar_string,
        sites_only_vcf_output                              = sites_only_vcf_output,
        skip_mapping_quality_transform                     = skip_mapping_quality_transform,

        # Optional Common Arguments
        add_output_sam_program_record                      = add_output_sam_program_record,
        add_output_vcf_command_line                        = add_output_vcf_command_line,
        create_output_bam_index                            = create_output_bam_index,
        create_output_bam_md5                              = create_output_bam_md5,
        create_output_variant_index                        = create_output_variant_index,
        create_output_variant_md5                          = create_output_variant_md5,
        disable_read_filter                                = disable_read_filter,
        disable_tool_default_read_filters                  = disable_tool_default_read_filters,
        exclude_intervals                                  = exclude_intervals,
        gatk_config_file                                   = gatk_config_file,
        interval_exclusion_padding                         = interval_exclusion_padding,
        interval_padding                                   = interval_padding,
        interval_set_rule                                  = interval_set_rule,
        inverted_read_filter                               = inverted_read_filter,
        lenient                                            = lenient,
        max_variants_per_shard                             = max_variants_per_shard,
        QUIET                                              = QUIET,
        read_filter                                        = read_filter,
        read_index                                         = read_index,
        read_validation_stringency                         = read_validation_stringency,
        seconds_between_progress_updates                   = seconds_between_progress_updates,
        sequence_dictionary                                = sequence_dictionary,
        tmp_dir                                            = tmp_dir,
        use_jdk_deflater                                   = use_jdk_deflater,
        use_jdk_inflater                                   = use_jdk_inflater,
        verbosity                                          = verbosity,

  }

  output {
    # Workflow Outputs                                  
    File SplitNCigarReadsoutput_arg = SplitNCigarReads.SplitNCigarReads_output_arg
    File? SplitNCigarReadsoutputIndex = SplitNCigarReads.SplitNCigarReads_outputIndex
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
    output_arg: { description: "Write output to this BAM filename" }
    outputIndex: { description: "Companion resource for output_arg" }
    reference: { description: "Reference sequence file" }
    referenceIndex: { description: "Companion resource for reference" }
    referenceDictionary: { description: "Companion resource for reference" }

    # Optional Tool Arguments
    cloud_index_prefetch_buffer: { description: "Size of the cloud-only prefetch buffer (in MB; 0 to disable). Defaults to cloudP" }
    cloud_prefetch_buffer: { description: "Size of the cloud-only prefetch buffer (in MB; 0 to disable)." }
    disable_bam_index_caching: { description: "If true, dont cache bam indexes, this will reduce memory requirements but may ha" }
    disable_sequence_dictionary_validation: { description: "If specified, do not check the sequence dictionaries from our inputs for compati" }
    do_not_fix_overhangs: { description: "do not have the walker soft-clip overhanging sections of the reads" }
    gcs_max_retries: { description: "If the GCS bucket channel errors out, how many times it will attempt to re-initi" }
    gcs_project_for_requester_pays: { description: "Project to bill when accessing requester pays buckets. If unset, these buckets c" }
    interval_merging_rule: { description: "Interval merging rule for abutting intervals" }
    intervals: { description: "One or more genomic intervals over which to operate" }
    max_bases_in_overhang: { description: "max number of bases allowed in the overhang" }
    max_mismatches_in_overhang: { description: "max number of mismatches allowed in the overhang" }
    process_secondary_alignments: { description: "have the walker split secondary alignments (will still repair MC tag without it)" }
    refactor_cigar_string: { description: "refactor cigar string with NDN elements to one element" }
    sites_only_vcf_output: { description: "If true, dont emit genotype fields when writing vcf file output." }
    skip_mapping_quality_transform: { description: "skip the 255 -> 60 MQ read transform" }

    # Optional Common Arguments
    add_output_sam_program_record: { description: "If true, adds a PG tag to created SAM/BAM/CRAM files." }
    add_output_vcf_command_line: { description: "If true, adds a command line header line to created VCF files." }
    create_output_bam_index: { description: "If true, create a BAM/CRAM index when writing a coordinate-sorted BAM/CRAM file." }
    create_output_bam_md5: { description: "If true, create a MD5 digest for any BAM/SAM/CRAM file created" }
    create_output_variant_index: { description: "If true, create a VCF index when writing a coordinate-sorted VCF file." }
    create_output_variant_md5: { description: "If true, create a a MD5 digest any VCF file created." }
    disable_read_filter: { description: "Read filters to be disabled before analysis" }
    disable_tool_default_read_filters: { description: "Disable all tool default read filters (WARNING: many tools will not function cor" }
    exclude_intervals: { description: "One or more genomic intervals to exclude from processing" }
    gatk_config_file: { description: "A configuration file to use with the GATK." }
    interval_exclusion_padding: { description: "Amount of padding (in bp) to add to each interval you are excluding." }
    interval_padding: { description: "Amount of padding (in bp) to add to each interval you are including." }
    interval_set_rule: { description: "Set merging approach to use for combining interval inputs" }
    inverted_read_filter: { description: "Inverted (with flipped acceptance/failure conditions) read filters applied befor" }
    lenient: { description: "Lenient processing of VCF files" }
    max_variants_per_shard: { description: "If non-zero, partitions VCF output into shards, each containing up to the given " }
    QUIET: { description: "Whether to suppress job-summary info on System.err." }
    read_filter: { description: "Read filters to be applied before analysis" }
    read_index: { description: "Indices to use for the read inputs. If specified, an index must be provided for " }
    read_validation_stringency: { description: "Validation stringency for all SAM/BAM/CRAM/SRA files read by this program.  The " }
    seconds_between_progress_updates: { description: "Output traversal statistics every time this many seconds elapse" }
    sequence_dictionary: { description: "Use the given sequence dictionary as the master/canonical sequence dictionary.  " }
    tmp_dir: { description: "Temp directory to use." }
    use_jdk_deflater: { description: "Whether to use the JdkDeflater (as opposed to IntelDeflater)" }
    use_jdk_inflater: { description: "Whether to use the JdkInflater (as opposed to IntelInflater)" }
    verbosity: { description: "Control verbosity of logging." }
  }
}

task SplitNCigarReads {

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
    File reference
    File referenceIndex
    File referenceDictionary
    Int? cloud_index_prefetch_buffer
    Int? cloud_prefetch_buffer
    Boolean? disable_bam_index_caching
    Boolean? disable_sequence_dictionary_validation
    Boolean? do_not_fix_overhangs
    Int? gcs_max_retries
    String? gcs_project_for_requester_pays
    String? interval_merging_rule
    Array[String]? intervals
    Int? max_bases_in_overhang
    Int? max_mismatches_in_overhang
    Boolean? process_secondary_alignments
    Boolean? refactor_cigar_string
    Boolean? sites_only_vcf_output
    Boolean? skip_mapping_quality_transform
    Boolean? add_output_sam_program_record
    Boolean? add_output_vcf_command_line
    Boolean? create_output_bam_index
    Boolean? create_output_bam_md5
    Boolean? create_output_variant_index
    Boolean? create_output_variant_md5
    Array[String]? disable_read_filter
    Boolean? disable_tool_default_read_filters
    Array[String]? exclude_intervals
    String? gatk_config_file
    Int? interval_exclusion_padding
    Int? interval_padding
    String? interval_set_rule
    Array[String]? inverted_read_filter
    Boolean? lenient
    Int? max_variants_per_shard
    Boolean? QUIET
    Array[String]? read_filter
    Array[File]? read_index
    String? read_validation_stringency
    Float? seconds_between_progress_updates
    File? sequence_dictionary
    File? tmp_dir
    Boolean? use_jdk_deflater
    Boolean? use_jdk_inflater
    String? verbosity

  }

  command <<<
    ~{gatk} SplitNCigarReads \
    --input ~{sep=' --input ' input_arg} \
    --output ~{sep=' --output ' output_arg} \
    --reference ~{sep=' --reference ' reference} \
    ~{true='--cloud-index-prefetch-buffer ' false='' defined(cloud_index_prefetch_buffer)}~{sep=' --cloud-index-prefetch-buffer ' cloud_index_prefetch_buffer} \
    ~{true='--cloud-prefetch-buffer ' false='' defined(cloud_prefetch_buffer)}~{sep=' --cloud-prefetch-buffer ' cloud_prefetch_buffer} \
    ~{true='--disable-bam-index-caching ' false='' defined(disable_bam_index_caching)}~{sep=' --disable-bam-index-caching ' disable_bam_index_caching} \
    ~{true='--disable-sequence-dictionary-validation ' false='' defined(disable_sequence_dictionary_validation)}~{sep=' --disable-sequence-dictionary-validation ' disable_sequence_dictionary_validation} \
    ~{true='--do-not-fix-overhangs ' false='' defined(do_not_fix_overhangs)}~{sep=' --do-not-fix-overhangs ' do_not_fix_overhangs} \
    ~{true='--gcs-max-retries ' false='' defined(gcs_max_retries)}~{sep=' --gcs-max-retries ' gcs_max_retries} \
    ~{true='--gcs-project-for-requester-pays ' false='' defined(gcs_project_for_requester_pays)}~{sep=' --gcs-project-for-requester-pays ' gcs_project_for_requester_pays} \
    ~{true='--interval-merging-rule ' false='' defined(interval_merging_rule)}~{sep=' --interval-merging-rule ' interval_merging_rule} \
    ~{true='--intervals ' false='' defined(intervals)}~{sep=' --intervals ' intervals} \
    ~{true='--max-bases-in-overhang ' false='' defined(max_bases_in_overhang)}~{sep=' --max-bases-in-overhang ' max_bases_in_overhang} \
    ~{true='--max-mismatches-in-overhang ' false='' defined(max_mismatches_in_overhang)}~{sep=' --max-mismatches-in-overhang ' max_mismatches_in_overhang} \
    ~{true='--process-secondary-alignments ' false='' defined(process_secondary_alignments)}~{sep=' --process-secondary-alignments ' process_secondary_alignments} \
    ~{true='--refactor-cigar-string ' false='' defined(refactor_cigar_string)}~{sep=' --refactor-cigar-string ' refactor_cigar_string} \
    ~{true='--sites-only-vcf-output ' false='' defined(sites_only_vcf_output)}~{sep=' --sites-only-vcf-output ' sites_only_vcf_output} \
    ~{true='--skip-mapping-quality-transform ' false='' defined(skip_mapping_quality_transform)}~{sep=' --skip-mapping-quality-transform ' skip_mapping_quality_transform} \
    ~{true='--add-output-sam-program-record ' false='' defined(add_output_sam_program_record)}~{sep=' --add-output-sam-program-record ' add_output_sam_program_record} \
    ~{true='--add-output-vcf-command-line ' false='' defined(add_output_vcf_command_line)}~{sep=' --add-output-vcf-command-line ' add_output_vcf_command_line} \
    ~{true='--create-output-bam-index ' false='' defined(create_output_bam_index)}~{sep=' --create-output-bam-index ' create_output_bam_index} \
    ~{true='--create-output-bam-md5 ' false='' defined(create_output_bam_md5)}~{sep=' --create-output-bam-md5 ' create_output_bam_md5} \
    ~{true='--create-output-variant-index ' false='' defined(create_output_variant_index)}~{sep=' --create-output-variant-index ' create_output_variant_index} \
    ~{true='--create-output-variant-md5 ' false='' defined(create_output_variant_md5)}~{sep=' --create-output-variant-md5 ' create_output_variant_md5} \
    ~{true='--disable-read-filter ' false='' defined(disable_read_filter)}~{sep=' --disable-read-filter ' disable_read_filter} \
    ~{true='--disable-tool-default-read-filters ' false='' defined(disable_tool_default_read_filters)}~{sep=' --disable-tool-default-read-filters ' disable_tool_default_read_filters} \
    ~{true='--exclude-intervals ' false='' defined(exclude_intervals)}~{sep=' --exclude-intervals ' exclude_intervals} \
    ~{true='--gatk-config-file ' false='' defined(gatk_config_file)}~{sep=' --gatk-config-file ' gatk_config_file} \
    ~{true='--interval-exclusion-padding ' false='' defined(interval_exclusion_padding)}~{sep=' --interval-exclusion-padding ' interval_exclusion_padding} \
    ~{true='--interval-padding ' false='' defined(interval_padding)}~{sep=' --interval-padding ' interval_padding} \
    ~{true='--interval-set-rule ' false='' defined(interval_set_rule)}~{sep=' --interval-set-rule ' interval_set_rule} \
    ~{true='--inverted-read-filter ' false='' defined(inverted_read_filter)}~{sep=' --inverted-read-filter ' inverted_read_filter} \
    ~{true='--lenient ' false='' defined(lenient)}~{sep=' --lenient ' lenient} \
    ~{true='--max-variants-per-shard ' false='' defined(max_variants_per_shard)}~{sep=' --max-variants-per-shard ' max_variants_per_shard} \
    ~{true='--QUIET ' false='' defined(QUIET)}~{sep=' --QUIET ' QUIET} \
    ~{true='--read-filter ' false='' defined(read_filter)}~{sep=' --read-filter ' read_filter} \
    ~{true='--read-index ' false='' defined(read_index)}~{sep=' --read-index ' read_index} \
    ~{true='--read-validation-stringency ' false='' defined(read_validation_stringency)}~{sep=' --read-validation-stringency ' read_validation_stringency} \
    ~{true='--seconds-between-progress-updates ' false='' defined(seconds_between_progress_updates)}~{sep=' --seconds-between-progress-updates ' seconds_between_progress_updates} \
    ~{true='--sequence-dictionary ' false='' defined(sequence_dictionary)}~{sep=' --sequence-dictionary ' sequence_dictionary} \
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
    File SplitNCigarReads_output_arg = output_arg
    File? SplitNCigarReads_outputIndex = outputIndex
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
    output_arg: { description: "Write output to this BAM filename" }
    outputIndex: { description: "Companion resource for output_arg" }
    reference: { description: "Reference sequence file" }
    referenceIndex: { description: "Companion resource for reference" }
    referenceDictionary: { description: "Companion resource for reference" }

    # Optional Tool Arguments
    cloud_index_prefetch_buffer: { description: "Size of the cloud-only prefetch buffer (in MB; 0 to disable). Defaults to cloudP" }
    cloud_prefetch_buffer: { description: "Size of the cloud-only prefetch buffer (in MB; 0 to disable)." }
    disable_bam_index_caching: { description: "If true, dont cache bam indexes, this will reduce memory requirements but may ha" }
    disable_sequence_dictionary_validation: { description: "If specified, do not check the sequence dictionaries from our inputs for compati" }
    do_not_fix_overhangs: { description: "do not have the walker soft-clip overhanging sections of the reads" }
    gcs_max_retries: { description: "If the GCS bucket channel errors out, how many times it will attempt to re-initi" }
    gcs_project_for_requester_pays: { description: "Project to bill when accessing requester pays buckets. If unset, these buckets c" }
    interval_merging_rule: { description: "Interval merging rule for abutting intervals" }
    intervals: { description: "One or more genomic intervals over which to operate" }
    max_bases_in_overhang: { description: "max number of bases allowed in the overhang" }
    max_mismatches_in_overhang: { description: "max number of mismatches allowed in the overhang" }
    process_secondary_alignments: { description: "have the walker split secondary alignments (will still repair MC tag without it)" }
    refactor_cigar_string: { description: "refactor cigar string with NDN elements to one element" }
    sites_only_vcf_output: { description: "If true, dont emit genotype fields when writing vcf file output." }
    skip_mapping_quality_transform: { description: "skip the 255 -> 60 MQ read transform" }

    # Optional Common Arguments
    add_output_sam_program_record: { description: "If true, adds a PG tag to created SAM/BAM/CRAM files." }
    add_output_vcf_command_line: { description: "If true, adds a command line header line to created VCF files." }
    create_output_bam_index: { description: "If true, create a BAM/CRAM index when writing a coordinate-sorted BAM/CRAM file." }
    create_output_bam_md5: { description: "If true, create a MD5 digest for any BAM/SAM/CRAM file created" }
    create_output_variant_index: { description: "If true, create a VCF index when writing a coordinate-sorted VCF file." }
    create_output_variant_md5: { description: "If true, create a a MD5 digest any VCF file created." }
    disable_read_filter: { description: "Read filters to be disabled before analysis" }
    disable_tool_default_read_filters: { description: "Disable all tool default read filters (WARNING: many tools will not function cor" }
    exclude_intervals: { description: "One or more genomic intervals to exclude from processing" }
    gatk_config_file: { description: "A configuration file to use with the GATK." }
    interval_exclusion_padding: { description: "Amount of padding (in bp) to add to each interval you are excluding." }
    interval_padding: { description: "Amount of padding (in bp) to add to each interval you are including." }
    interval_set_rule: { description: "Set merging approach to use for combining interval inputs" }
    inverted_read_filter: { description: "Inverted (with flipped acceptance/failure conditions) read filters applied befor" }
    lenient: { description: "Lenient processing of VCF files" }
    max_variants_per_shard: { description: "If non-zero, partitions VCF output into shards, each containing up to the given " }
    QUIET: { description: "Whether to suppress job-summary info on System.err." }
    read_filter: { description: "Read filters to be applied before analysis" }
    read_index: { description: "Indices to use for the read inputs. If specified, an index must be provided for " }
    read_validation_stringency: { description: "Validation stringency for all SAM/BAM/CRAM/SRA files read by this program.  The " }
    seconds_between_progress_updates: { description: "Output traversal statistics every time this many seconds elapse" }
    sequence_dictionary: { description: "Use the given sequence dictionary as the master/canonical sequence dictionary.  " }
    tmp_dir: { description: "Temp directory to use." }
    use_jdk_deflater: { description: "Whether to use the JdkDeflater (as opposed to IntelDeflater)" }
    use_jdk_inflater: { description: "Whether to use the JdkInflater (as opposed to IntelInflater)" }
    verbosity: { description: "Control verbosity of logging." }
  }
}

