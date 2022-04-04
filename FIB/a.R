# n <- 5
# k <- 3
inp <- as.double(read.table("~/rosalind/FIB/rosalind_fib.txt"))

n <- inp[1]
k <- inp[2]

out <- rep(0, n)
out[1:2] <- c(1, 1)

for (i in 3:n){
  out[i] <- out[i-1] + k * out[i-2]
}
print(out[length(out)])