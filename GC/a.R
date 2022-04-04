inp <- read.table("~/rosalind/GC/rosalind_gc.txt")[[1]]

s <- grep(">", inp)
s2 <- append(s, length(inp) + 1)

tb_r <- c()
for (i in 1:length(s)){
    d <- seq(from = s2[i]+1, to = s2[(i+1)]-1)
    tb <- paste(inp[d], collapse = "")
    tb_l <- nchar(tb)
    tb_c <- stringr::str_count(tb, "[GC]")
    tb_r <- append(tb_r, tb_c / tb_l * 100)
}

s_m <- which.max(tb_r)
t_i <- inp[s[s_m]]
print(stringr::str_split(t_i, ">")[[1]][2])
print(tb_r[s_m])