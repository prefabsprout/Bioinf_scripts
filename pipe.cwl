#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
inputs:
  in_file: File

outputs:
  output_sam:
   type: File
   outputSource: convert/output_bam

  output_bam:
   type: File
   outputSource: sort/output_sorted_bam

steps:
  convert:
    run: ./sam_to_bam.cwl
    in:
      input_sam: in_file
    out: [ output_bam ]

  sort:
    run: ./sort.cwl
    in:
      input_bam: convert/output_bam
    out: [ output_sorted_bam ]
