# inp <- "AAAACCCGGT"
inp <- as.character(read.table("~/rosalind/Case/REVC/rosalind_revc.txt"))
inp2 <- strsplit(inp, "")[[1]]
inp3 <- inp2
inp3[grep("A", inp2)] <- "T"
inp3[grep("T", inp2)] <- "A"
inp3[grep("C", inp2)] <- "G"
inp3[grep("G", inp2)] <- "C"
inp4 <- rev(inp3)
print(paste(inp4, collapse = ""))