mu=0
sigma=1
n=20
N_sim=1000

set.seed(123)
medians=replicate(N_sim,median(rnorm(n,mu,sigma)))
ranges=replicate(N_sim,diff(range(rnorm(n,mu,sigma))))

cor
par(mfrow=c(2,2))

# hist(medians,breaks=30,col="lightblue",main="Distribution of Meadian",xlab="Median",probability=TRUE)
hist(medians, breaks = 30, col = "lightblue", probability = TRUE, main = "Distribution of Medians", xlab = "Median", border = "white")
curve(dnorm(x, mu, sigma / sqrt(n)), add = TRUE, col = "red", lwd = 2)

