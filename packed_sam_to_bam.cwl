{
    "class": "CommandLineTool",
    "baseCommand": [
        "samtools",
        "view",
        "-S",
        "-b"
    ],
    "inputs": [
        {
            "type": "File",
            "inputBinding": {
                "position": 1
            },
            "id": "#main/input_sam"
        }
    ],
    "outputs": [
        {
            "type": "File",
            "id": "#main/output_bam",
            "outputBinding": {
                "glob": "b8c0d79c902a1a892f4410af40d9000336026902"
            }
        }
    ],
    "id": "#main",
    "stdout": "b8c0d79c902a1a892f4410af40d9000336026902",
    "cwlVersion": "v1.0"
}