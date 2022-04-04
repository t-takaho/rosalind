inp <- as.double(read.table("~/rosalind/IPRB/rosalind_iprb.txt"))
# inp <- as.double(read.table("~/rosalind/IPRB/rosalind_iprb_sample.txt"))

k <- inp[1]
m <- inp[2]
n <- inp[3]
ps <- k + m + n

cb <- gtools::permutations(n = 3,r = 2, v = c("k","m","n"), repeats.allowed = TRUE)
cb2 <- cbind(cb, rep(0, nrow(cb)))
cb3 <- cbind(cb2, c(1, 1, 1, 1, 0.75, 0.5, 1, 0.5, 0))

for (i in 1:nrow(cb)) {

    if (cb[i, 1] == "k") {
        p1 <- k / ps
        if (cb[i, 2] == "k") {
            p2 <- (k - 1) / (ps - 1)
        } else if (cb[i, 2] == "m") {
            p2 <- m / (ps - 1)
        } else if (cb[i, 2] == "n") {
            p2 <- n / (ps - 1)
        }
    }

    if (cb[i, 1] == "m") {
        p1 <- m / ps
        if (cb[i, 2] == "k") {
            p2 <- k / (ps - 1)
        } else if (cb[i, 2] == "m") {
            p2 <- (m - 1) / (ps - 1)
        } else if (cb[i, 2] == "n") {
            p2 <- n / (ps - 1)
        }
    }

    if (cb[i, 1] == "n") {
        p1 <- n / ps
        if (cb[i, 2] == "k") {
            p2 <- k / (ps - 1)
        } else if (cb[i, 2] == "m") {
            p2 <- m / (ps - 1)
        } else if (cb[i, 2] == "n") {
            p2 <- (n - 1) / (ps - 1)
        }
    }

    cb3[i, 3] <- p1 * p2

}

g <- sum(as.double(cb3[, 3]) * as.double(cb3[, 4]))
if (g >= 0.5){
    print(g)
}