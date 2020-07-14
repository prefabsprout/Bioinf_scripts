#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool


baseCommand: ["samtools", "view", "-S", "-b"]

inputs:
  input_sam:
    type: File
    inputBinding:
      position: 1

outputs:
  output_bam:
    type: stdout
