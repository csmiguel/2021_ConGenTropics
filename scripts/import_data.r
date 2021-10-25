# steps required to reproduce analysis in repository on your own distribution of R.
# install packages
install.packages("ape")
install.packages("ade4")
install.packages("phangorn")

# create directories to avoid conflicts between relative paths
dir.create("output")
dir.create("intermediate")

# download scripts and data
download.file("https://raw.githubusercontent.com/csmiguel/2021_ConGenTropics/main/scripts/exercise1.r", "exercise1.r")
download.file("https://raw.githubusercontent.com/csmiguel/2021_ConGenTropics/main/scripts/exercise2.r", "exercise2.r")
download.file("https://raw.githubusercontent.com/csmiguel/2021_ConGenTropics/main/scripts/exercise3.r", "exercise3.r")
download.file("https://raw.githubusercontent.com/csmiguel/2021_ConGenTropics/main/scripts/exercise4.r", "exercise4.r")
download.file("https://raw.githubusercontent.com/csmiguel/2021_ConGenTropics/main/scripts/exercise5.r", "exercise5.r")
download.file("https://raw.githubusercontent.com/csmiguel/2021_ConGenTropics/main/intermediate/cytb_phylo_aligned.fasta", "intermediate/cytb_phylo_aligned.fasta")
download.file("https://raw.githubusercontent.com/csmiguel/2021_ConGenTropics/main/intermediate/cytb12.fasta", "intermediate/cytb12.fasta")
