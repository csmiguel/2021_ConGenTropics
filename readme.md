# Conservation Genetics in the Tropics 2021
Material for the practical sessions from the course Conservation Genetics in the Tropics, 2021.
1. Assembly of mitochondrial genomes
2. Annotation of mitochondrial genomes.
3. Multiple sequence alignment.
4. Phylogenetic reconstructions.

Raw data is located in [RawSeqs](RawSeqs).
[intermediate](intermediate) contains intermediate files generated with the scripts.
[output](output) contains result files from the scripts that can be used for downstream evolutionary analysis.

The data for this practice comes from a phylogenetics study of rats from Sundaland ([publication](https://doi.org/10.1093/jhered/esaa014); [repository](https://github.com/csmiguel/rattus-highlands)).

## Prerequisites
MAC or LINUX users can install the required softwares following the links below. For Windows users it is recommended first to install Linux natively in their machines using [WSL](https://docs.microsoft.com/en-us/windows/wsl/install).
+ [samtools](http://www.htslib.org/download/).
+ [bwa](https://github.com/lh3/bwa).
+ [NOVOplaty](https://github.com/ndierckx/NOVOPlasty).
+ [Geneious](https://www.geneious.com/)


## instructions
1. download the repository
```
git clone  https://github.com/csmiguel/2021_ConGenTropics 
```
2. unzip and navigate to the folder `2021_ConGenTropics`
3. remove the content in the `intermediate` and `output` directories to fully reproduce the analysis from raw data.
```
rm -rf intermediate/*
rm -rf output/*
```
4. follow tutorials 1 to 4.
