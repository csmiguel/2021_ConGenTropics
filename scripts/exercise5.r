###....................................................................
# Conservation Genetics in the Tropics
# (c) Miguel Camacho Sánchez
# miguelcamachosanchez@gmail.com
# October 2021
#GOAL: Exercise 45: prepare data for beast. Remove outgroup and duplicated samples from the same species.
###....................................................................
# read cytb alignment
cytb <- ape::read.FASTA("intermediate/cytb12.fasta")

# remove outgroup sequences
cytb_beast <- cytb[grep("MT87", names(cytb), invert = T)]

# remove duplicated samples from the same species
#   vector with species names
temp_species <- gsub(pattern = "^.*[0-9]_",
                    x = names(cytb_beast),
                    replacement = "")
#   guess duplicated species
duplicated_sp <- duplicated(temp_species)
#   filter DNAbin
cytb_beast_nonDup <- cytb_beast[!duplicated_sp]

# write fasta for beast
ape::write.FASTA(cytb_beast_nonDup,
                 "intermediate/cytb_beast.fasta")
