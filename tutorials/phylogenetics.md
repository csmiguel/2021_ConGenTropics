# Phylogenetics
We are going to see how to reconstruct phylogenetics trees using three different approaches:
+ 1. distance based methods: neighbour joining
+ 2. maximum likelihood: RAxML
+ 3. bayesian inference: Beast

## required software
+ [R](https://cran.r-project.org/): packages `ape` `phangorn`
+ [RAxML](https://cme.h-its.org/exelixis/web/software/raxml/)
+ [BEAST2](https://www.beast2.org/ )
+ [Tracer](https://github.com/beast-dev/tracer/releases/tag/v1.7.2)
+ [figtree](https://github.com/rambaut/figtree/releases)


## Other phylogenetic tools
+ packages for phylogenetics in R:
    + ggtree: tree visualization
    + phangorn: phylogenetics reconstruction and analysis. 
    + ade4
    + phytools
    + phylotools
+ filter non-homologous regions from DNA alignments
   + [gblocks](http://molevol.cmima.csic.es/castresana/Gblocks/Gblocks_documentation.html)
   + [divvier](https://github.com/simonwhelan/Divvier), [trimal](http://trimal.cgenomics.org/)
+ online tree viewer http://etetoolkit.org/treeview/

## Exercises
The R scripts for the exercises can be found under [`scripts`](scripts)

### dataset for exercises
PopSet [156751975](https://www.ncbi.nlm.nih.gov/popset/156751975) of [*cytochrome b*] from several species of carnivores [publication](https://doi.org/10.1007/s10592-007-9364-5). Available at [references/carnivores.fasta](references/carnivores.fasta).

As outgroups I will use several species of pangolins from PopSet [2096847361](https://www.ncbi.nlm.nih.gov/popset/2096847361). Available at [references/manidae.fasta](references/manidae.fasta)

Download fasta from the popsets to the `references` folder, and rename them as `references/carnivora.fasta` and `references/manidae.fasta`.

Clean names of fasta headers:
```
cat references/manidae.fasta references/carnivora.fasta | sed -e 's| isolate.*$||; s| cytochrome.*$||; s|\.1||; s| |_|g' > intermediate/cytb_phylo.fasta
```
Align the sequences with mafft. Since some of the sequences are in Reverse orientation, I use the `adjustdirection` flag, so that mafft automatically adjust the direction of all sequences according to the first one in the fasta file. Then, I remove `_R_` attached to the reversed sequences.
```
mafft --adjustdirection intermediate/cytb_phylo.fasta | sed 's|_R_||' >  intermediate/cytb_phylo_aligned.fasta
```

### Exercise 1. Write newick
The script below reproduces the phylogenetic tree from Exercise 1.
```r
#install ape, if not installed
install.packages("ape")

#load ape
library(ape)

# write tree in newick
tree <-
  "((human:0.1, chimpanzee:0.15)0.99:0.5,(dog:0.4, cat:0.3)0.80:0.3)0.87;"

# read as phylo
myTree <- ape::read.tree(text = tree)

# plot tree
plot(myTree,
     type = "phylogram",
     tip.color = "#447128",
     edge.color = "#0B5AB2",
     edge.width = 3,
     cex = 1,
     show.node.label = T)
# label edges
edgelabels(myTree$edge.length, bg="black", col="white", font=2)
```

### Exercise 2. Neighbour joining
Open in Rstudio [`scripts/exercise2.r`](scripts/exercise2.r).

### Exercise 3. Saturation plots
Open in Rstudio [`scripts/exercise3.r`](scripts/exercise3.r).

### Exercise 4. Maximum likelihood
Open in Rstudio [`scripts/exercise4.r`](scripts/exercise4.r).

### Exercise 5: Bayesian Inference in BEAST
Download Beast2 and related packages in http://www.beast2.org/.

**BEAUTi** is used to prepare the input file (an `.xml`) for BEAST (distributed with beast)

**Beast2** is used to run bayesian phylogenetic inference.(distributed with beast)
[**Tracer**](https://github.com/beast-dev/tracer/releases/tag/v1.7.2) is used to check the posterior probabilities in the chains.

**TreeAnnotator** is used to burn the initial part of the chains and merge the information to arrive to a consensus tree.(distributed with beast)
[**FigTree**](https://github.com/rambaut/figtree/releases) is used to visualize and manipuate phylogenetic trees in newick format.

BEAST2 and RAxML can also be run in [CIPRESS](https://www.phylo.org/portal2/login!input.action)

+ 1. Format xml in BEAUTi (the formatted file is in [etc/cytb12.xml](etc/cytb12.xml))
    + remove outgroups from the alignment
```r
# read cytb alignment
cytb <- ape::read.FASTA("intermediate/cytb12.fasta")

# remove outgroup sequences
cytb_beast <- cytb[grep("MT87", names(cytb), invert = T)]

# write fasta for beast
ape::write.FASTA(cytb_beast,
                 "intermediate/cytb_beast.fasta")
```
+ open BEAUTi an `load` `intermediate/cytb12.fasta`.
       + in `Partitions` you can set different tree/clock/site_models, in case there were multiple partitions. But as in our case, we have only one partition, we will leave it as it is.
    + `Site Model` is the model of molecular evolution: select HKY.
    + `Clock Model` is the 

+ 2. Partitions
+ 3