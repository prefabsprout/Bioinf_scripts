{
    "$graph": [
        {
            "class": "Workflow",
            "inputs": [
                {
                    "type": "File",
                    "id": "#main/in_file"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputSource": "#main/sort/output_sorted_bam",
                    "id": "#main/output_bam"
                },
                {
                    "type": "File",
                    "outputSource": "#main/convert/output_bam",
                    "id": "#main/output_sam"
                }
            ],
            "steps": [
                {
                    "run": "#sam_to_bam.cwl",
                    "in": [
                        {
                            "source": "#main/in_file",
                            "id": "#main/convert/input_sam"
                        }
                    ],
                    "out": [
                        "#main/convert/output_bam"
                    ],
                    "id": "#main/convert"
                },
                {
                    "run": "#sort.cwl",
                    "in": [
                        {
                            "source": "#main/convert/output_bam",
                            "id": "#main/sort/input_bam"
                        }
                    ],
                    "out": [
                        "#main/sort/output_sorted_bam"
                    ],
                    "id": "#main/sort"
                }
            ],
            "id": "#main"
        },
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
                    "id": "#sam_to_bam.cwl/input_sam"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "id": "#sam_to_bam.cwl/output_bam",
                    "outputBinding": {
                        "glob": "b8c0d79c902a1a892f4410af40d9000336026902"
                    }
                }
            ],
            "id": "#sam_to_bam.cwl",
            "stdout": "b8c0d79c902a1a892f4410af40d9000336026902"
        },
        {
            "class": "CommandLineTool",
            "baseCommand": [
                "samtools",
                "sort"
            ],
            "inputs": [
                {
                    "type": "File",
                    "inputBinding": {
                        "position": 1
                    },
                    "id": "#sort.cwl/input_bam"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "id": "#sort.cwl/output_sorted_bam",
                    "outputBinding": {
                        "glob": "37f4fbbeaba75f741633b2109b7175ec0998b917"
                    }
                }
            ],
            "id": "#sort.cwl",
            "stdout": "37f4fbbeaba75f741633b2109b7175ec0998b917"
        }
    ],
    "cwlVersion": "v1.0"
}