#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
  - class: SubworkflowFeatureRequirement

inputs:
  in_file: File

outputs:
  output_bam:
   type: File
   outputSource: get_my_pipe_plumber/output_sorted_bam

steps:
  get_my_pipe_plumber:
    run: ./packed_pipe.cwl
    in:
      main/in_file: in_file
    out: [ output_sorted_bam ]
