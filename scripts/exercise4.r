###....................................................................
# Conservation Genetics in the Tropics
# (c) Miguel Camacho Sánchez
# miguelcamachosanchez@gmail.com
# October 2021
#GOAL: Exercise 4: maximum likelihood inference
###....................................................................
library(ape)
library(phangorn)

# great tutorial at:
#https://rstudio-pubs-static.s3.amazonaws.com/135523_bb1c8592d00543629727a614cf3fb4be.html

# read DNA alignment for codon positions 1 and 2.
temp <- ape::read.dna("intermediate/cytb12.fasta", format = "fasta")
cytb <- phangorn::as.phyDat(temp) # convert to phangorn data structure

set.seed(12233)# set seed to ensure reproducibility

# create random starting tree object
starting_tree <- ape::rtree(n = length(cytb),
                            tip.label = names(cytb),
                            rooted = FALSE)

# create pml object with data and tree. It calculates the likelihood with default model parameters.
nonfit_tree <-
  phangorn::pml(tree = starting_tree,
                data = cytb)
print(nonfit_tree)

# in MEGA I found the best model of evolution is HKY
# fit the tree
fit_ml <-
  phangorn::optim.pml(nonfit_tree, # tree to fit
                      optNni = TRUE, # optimize topology
                      optEdge = TRUE, # optimize edge lengths
                      model = "HKY") # model of substitution
print(fit_ml)

# compute bootstrapped trees
bs <-
  phangorn::bootstrap.pml(fit_ml, # fitted tree
                          bs = 100, # no of bs
                          optNni = TRUE,
                          control = pml.control(trace = 0))

# root tree using pangolins as outgroup
fit_ml_rooted <-
  ape::root(fit_ml$tree, # tree
            outgroup = grep(pattern = "MT87", # grep pangolins
                            x = fit_ml$tree$tip.label))

#plot tree with bootstrap support
pdf("output/cytb_ml.pdf") # save as pdf
plotBS(fit_ml_rooted, # tree to plot
       bs, # bootstrapped trees
       type = "p", # phylogram
       p = 0, # threshold to plot BS values
       cex = 0.5, # size fonts
       bs.col = "red")  
dev.off()
