###....................................................................
# Conservation Genetics in the Tropics
# (c) Miguel Camacho Sánchez
# miguelcamachosanchez@gmail.com
# October 2021
#GOAL: Exercise 2: build NJ trees in R
###....................................................................

library(ape)
library(ade4)

# read multiple sequence alignment
cytb <-
  ape::read.FASTA("intermediate/cytb_phylo_aligned.fasta")

# fast visualization
image(cytb)

# compute distance matrix
cytb_dist <- ape::dist.dna(cytb,
                      model = "K80")

# plot distance matrix
temp <- as.data.frame(as.matrix(cytb_dist))
ade4::table.paint(temp, cleg=0, clabel.row=.5, clabel.col=.5)

# nj tree
cytb_nj <- ape::nj(cytb_dist)

# plot unrooted tree
plot(tr1, type = "unrooted", show.tip = T,
     tip.color = c(rep("red", 4), rep("black", 41)),
     cex = 0.3)
title("Unrooted NJ Tree")

# root using pangolins
cytb_nj_rooted <- root(cytb_nj, outgroup = cytb_nj$tip.label[1:4])
# plot rooted tree
pdf("output/cytb_nj.pdf")
plot(cytb_nj_rooted, type = "phylogram", show.tip = T,
     tip.color = c(rep("red", 4), rep("black", 41)),
     cex = 0.5)
title("Rooted NJ Tree")

# compute bootstrap support
bt <- ape::boot.phylo(cytb_nj_rooted,
                      as.matrix(cytb),
                      function(x) nj(dist.dna(x, model = "K80")),
                      quiet = TRUE)

# add bootstrap support as nodelabels
nodelabels(bt,
           cex = .5, adj = c(1, 1), frame = "none", col = "blue")
dev.off()
