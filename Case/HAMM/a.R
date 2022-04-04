inp <- read.table("~/rosalind/Case/HAMM/rosalind_hamm.txt")[[1]]

s <- strsplit(inp[1], "")[[1]]
t <- strsplit(inp[2], "")[[1]]

sum(s != t)