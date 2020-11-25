[![License (3-Clause BSD)](https://img.shields.io/badge/license-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

# gatk-tool-wdls

Autogenerated WDLs for GATK Tools

This repository contains auto-generated WDL wrappers for individual tools in the [Genome Analysis Toolkit (GATK)](https://github.com/broadinstitute/gatk).
The intention is that these WDLs can be imported as tasks into larger workflows consisting of multiple tools run as a pipeline.

Each set of WDLs published here is tagged with the GATK release version that they were generated from. You should match the version
of the WDLs with the version of GATK that you are running.

A `.dockstore.yml` file is also provided for integration with [Dockstore](dockstore.org)

**Note:** Only those GATK tools that have been annotated for WDL generation will have WDLs in this repository. Over time, we will annotate
additional GATK tools for WDL generation, and they will show up here with each new GATK release.
