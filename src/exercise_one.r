#install ape, if not installed
install.packages("ape")

#load ape
library(ape)

# write tree in newick
tree <-
  "((human:0.1, chimpanzee:0.15)0.99:0.5, (dog:0.4, cat:0.3)0.80:0.3)0.87;"

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