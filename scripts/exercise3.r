###....................................................................
# Conservation Genetics in the Tropics
# (c) Miguel Camacho Sánchez
# miguelcamachosanchez@gmail.com
# October 2021
#GOAL: Exercise 3: saturation plots by codon
###....................................................................
library(ape)

# read multiple sequence alignment
cytb <-
  ape::read.FASTA("intermediate/cytb_phylo_aligned.fasta")

# assert all sequences have the same length
# sapply(cytb, length) %>% 
#   unique %>%
#   {stopifnot(length(.) == 1)}
al_length <- length(cytb[[1]])

# partition data into codon positions 1,2 and 3.
cytb1 <-
  lapply(cytb, function(x) {
    subsetdna <- x[seq(1, al_length, 3)]
    class(subsetdna) <- "DNAbin"
    subsetdna
  })
class(cytb1) <- "DNAbin"

cytb2 <-
  lapply(cytb, function(x) {
    subsetdna <- x[seq(2, al_length, 3)]
    class(subsetdna) <- "DNAbin"
    subsetdna
  })
class(cytb2) <- "DNAbin"


cytb3 <-
  lapply(cytb, function(x) {
    subsetdna <- x[seq(3, al_length, 3)]
    class(subsetdna) <- "DNAbin"
    subsetdna
  })
class(cytb3) <- "DNAbin"

# for each codon position do saturation plots
#https://en.wikipedia.org/wiki/Models_of_DNA_evolution#TN93_model_(Tamura_and_Nei_1993)
# cytb1
pdf("output/saturation_plots.pdf")
dist_uncorrected <- dist.dna(cytb1, model = "raw")
dist_corrected <- dist.dna(cytb1, model = "TN93")
plot(dist_uncorrected ~ dist_corrected,
     pch=20,
     col = rgb(0, 0, 1, 0.1), #"blue"
     xlab = "TN93 model distance",
     ylab = "Uncorrected genetic distance",
     main = NULL,
     xlim = c(0, 1),
     ylim = c(0, 0.5),
     cex = 2)

# cytb2
dist_uncorrected <- dist.dna(cytb2, model = "raw")
dist_corrected <- dist.dna(cytb2, model = "TN93")
points(dist_corrected, dist_uncorrected,
       pch=20,
       col = rgb(0, 1, 0, 0.1),
       xlab = "TN93 model distance",
       ylab = "Uncorrected genetic distance",
       main = NULL)
# cytb3
dist_uncorrected <- dist.dna(cytb3, model = "raw")
dist_corrected <- dist.dna(cytb3, model = "TN93")
points(dist_corrected, dist_uncorrected,
       pch=20,
       col = rgb(1, 0, 0, 0.1),
       xlab = "TN93 model distance",
       ylab = "Uncorrected genetic distance",
       main = NULL)
legend("bottomright",
       legend = paste0("codon_", c(1:3)),
       fill = c("blue", "green", "red"), bty = "n")
dev.off()

# write fasta, concatenation of positions 1 and 2
write.FASTA(cbind(as.matrix(cytb1), as.matrix(cytb2)),
            file = "intermediate/cytb12.fasta")
write.FASTA(cytb3,
            file = "intermediate/cytb3.fasta")
