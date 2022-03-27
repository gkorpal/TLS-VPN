#!/usr/bin/env Rscript


# variance mean for k=2

t11 = read.table("./c511_rel_freq.txt")
t12 = read.table("./c512_rel_freq.txt")

M1 = cbind(t11[,1],t12[,1])
A1 = round(var(M1[,1]),5)
B1 = round(var(M1[,2]),5)

N1 = round(mean(c(A1,B1)),5)

cat("Mean of the population variances for k=2 is", N1, "\n")


# variance mean for k=3

t21 = read.table("./c521_rel_freq.txt")
t22 = read.table("./c522_rel_freq.txt")
t23 = read.table("./c523_rel_freq.txt")

M2 = cbind(t11[,1],t12[,1], t23[,1])
A2 = round(var(M2[,1]),5)
B2 = round(var(M2[,2]),5)
C2 = round(var(M2[,3]),5)

N2 = round(mean(c(A2,B2,C2)),5)

cat("Mean of the population variances for k=3 is", N2, "\n")


# variance mean for k=4

t31 = read.table("./c531_rel_freq.txt")
t32 = read.table("./c532_rel_freq.txt")
t33 = read.table("./c533_rel_freq.txt")
t34 = read.table("./c534_rel_freq.txt")

M3 = cbind(t31[,1],t32[,1], t33[,1], t34[,1])
A3 = round(var(M3[,1]),5)
B3 = round(var(M3[,2]),5)
C3 = round(var(M3[,3]),5)
D3 = round(var(M3[,4]),5)

N3 = round(mean(c(A3,B3,C3,D3)),5)

cat("Mean of the population variances for k=4 is", N3, "\n")


# variance mean for k=5

t41 = read.table("./c541_rel_freq.txt")
t42 = read.table("./c542_rel_freq.txt")
t43 = read.table("./c543_rel_freq.txt")
t44 = read.table("./c543_rel_freq.txt")
t45 = read.table("./c545_rel_freq.txt")


M4 = cbind(t41[,1],t42[,1], t43[,1], t43[,1],t45[,1] )
A4 = round(var(M4[,1]),5)
B4 = round(var(M4[,2]),5)
C4 = round(var(M4[,3]),5)
D4 = round(var(M4[,4]),5)
E4 = round(var(M4[,5]),5)

N4 = round(mean(c(A4,B4,C4,D4,E4)),5)

cat("Mean of the population variances for k=5 is", N4, "\n")
