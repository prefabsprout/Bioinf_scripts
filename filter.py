from Bio import SeqIO
import re

ids = []
with open('/home/stephen/Bioinformatics Institure/target_pind(3).txt', 'r') as ind:
    for line in ind:
        line = re.sub('> ', '', line)
        line = line.strip('\n')
        line = re.sub(' ', '', line)
        ids.append(line)
print(ids)

with open('/home/stephen/Bioinformatics Institure/Biopractice №4/augustus.whole.aa', 'r') as seqs, open(
        '/home/stephen/Bioinformatics Institure/Biopractice №4/result_targetp[5].fasta', 'w') as result:
    record_dict = SeqIO.to_dict(SeqIO.parse(seqs, 'fasta'))
    result_records = [record_dict[id_] for id_ in ids]
    SeqIO.write(result_records, result, "fasta")