# Multiple sequence alignments of mitochondrial genomes

[mafft](https://mafft.cbrc.jp/alignment/software/) is a powerful software for sequence alignment.

For practice, we can align the set of mitochondrial genomes from the publication on the phylogeny *Rattus* in Sundaland [link](https://www.ncbi.nlm.nih.gov/popset/1846421279).

```
mafft references/mitogenomes.fasta > intermediate/mitogenomes_aligned.fasta
```

## Visualization of multiple sequence alignments
Geneious, [Jalview](https://www.jalview.org/), [AliView](https://ormbunkar.se/aliview/).

### Formats

+ **phylip**
![example Rattus mitogenomes](/figs/phylip_msa.png "phylip format").

+ **nexus**
![example Rattus mitogenomes](/figs/nexus_msa.png "nexus format").

+ **fasta**
![example Rattus mitogenomes](/figs/fasta_msa.png "fasta format").


For conversion between formats there are multiple options. The easiest is to load the alignent in Geneious and export it in the desired format. Other tools are [readAL](http://trimal.cgenomics.org/use_of_the_readal_v1.2) and [AMAS](https://github.com/marekborowiec/AMAS).
