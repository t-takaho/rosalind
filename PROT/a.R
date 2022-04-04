inp <- as.character(read.table("~/rosalind/PROT/rosalind_prot.txt"))
# inp <- "AUGGCCAUGGCGCCCAGAACUGAGAUCAAUAGUACCCGUAUUAACGGGUGA"

ct <- read.table("~/rosalind/PROT/codon_table.txt")
c1 <- append(append(append(ct[, 1], ct[, 3]), ct[, 5]), ct[, 7])
c2 <- append(append(append(ct[, 2], ct[, 4]), ct[, 6]), ct[, 8])
c3 <- data.frame(cbind(c1, c2))

inp2 <- strsplit(inp, "")[[1]]
cn <- length(inp2) / 3

ps <- c()
for (i in 1:cn) {
    si1 <- (i - 1) * 3 + 1
    si2 <- (i - 1) * 3 + 3
    tb <- paste(inp2[si1:si2], collapse = "")
    tb2 <- c3$c2[c3$c1 == tb]
    if (tb2 == "Stop") {
        break
    }
    ps <- append(ps, tb2)
}
ps2 <- paste(ps, collapse = "")
print(ps2)