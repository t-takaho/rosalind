inp <- read.table("~/rosalind/GRPH/rosalind_grph_sample.txt")[[1]]
# inp <- unlist(read.table("~/rosalind/GRPH/rosalind_grph.txt"))[[1]]

s1 <- grep(">", inp)
s2 <- append(s1, length(inp) + 1)
l <- sum(nchar(inp[(s1[1] + 1):(s1[2] - 1)]))

rn1 <- c("A", "C", "G", "T")
rn2 <- c("A:", "C:", "G:", "T:")
ans_mat <- matrix(0, nrow = length(rn1), ncol = l)
rownames(ans_mat) <- rn1

tb_r <- c()
for (i in seq_len(length(s1))) {
    d <- seq(from = s2[i] + 1, to = s2[(i + 1)] - 1)
    tb1 <- paste(inp[d], collapse = "")
    tb2 <- strsplit(tb1, "")[[1]]
    a_col <- seq_len(length(tb2))[tb2 %in% "A"]
    g_col <- seq_len(length(tb2))[tb2 %in% "G"]
    c_col <- seq_len(length(tb2))[tb2 %in% "C"]
    t_col <- seq_len(length(tb2))[tb2 %in% "T"]
    ans_mat["A", a_col] <- ans_mat["A", a_col] + 1
    ans_mat["C", c_col] <- ans_mat["C", c_col] + 1
    ans_mat["G", g_col] <- ans_mat["G", g_col] + 1
    ans_mat["T", t_col] <- ans_mat["T", t_col] + 1
}

cs1 <- c()
for (j in seq_len(ncol(ans_mat))) {
    cs1 <- append(cs1, which.max(ans_mat[, j]))
}
cs2 <- paste(names(cs1), collapse = "")
rownames(ans_mat) <- rn2

print(cs2)
print(ans_mat)

system("rm ~/rosalind/CONS/rosalind_cons_ans.txt")
write.table(cs2, "~/rosalind/CONS/rosalind_cons_ans.txt",
            append = TRUE, col.names = FALSE, row.names = FALSE, quote = FALSE)
write.table(ans_mat, "~/rosalind/CONS/rosalind_cons_ans.txt",
            append = TRUE, col.names = FALSE, quote = FALSE)