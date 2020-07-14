#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool


baseCommand: ["samtools", "sort"]

inputs:
  input_bam:
    type: File
    inputBinding:
      position: 1

outputs:
  output_sorted_bam:
    type: stdout
