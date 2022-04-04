# inp <- read.table("~/rosalind/SUBS/rosalind_subs_sample.txt")
inp <- read.table("~/rosalind/SUBS/rosalind_subs.txt")
t_1 <- inp[1, ]
m_1 <- inp[2, ]

t_2 <- strsplit(t_1, "")[[1]]
m_2 <- strsplit(m_1, "")[[1]]
m_3 <- m_2[1]
ml <- length(m_2)

p1 <- seq_len(length(t_2))[m_3 == t_2]

p1_ans <- c()
for (i in seq_len(length(p1))) {
    t_3 <- t_2[p1[i]:(p1[i] + ml - 1)]
    if (sum(t_3 == m_2) == length(m_2)){
        p1_ans <- append(p1_ans, p1[i])
    }
}

print(p1_ans, row.names = FALSE)