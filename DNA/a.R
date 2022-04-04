tmp <- read.table("~/rosalind/DNA/rosalind_dna.txt")
tmp2 <-  strsplit(as.character(tmp), "")
print(table(tmp2))