# inp <- "GATGGAACTTGACTACGTAAATT"
inp <- read.table("~/rosalind/Case/RNA/rosalind_rna.txt")
inp2 <- as.character(inp)
print(gsub("T", "U", inp2))