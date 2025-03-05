set.seed(123)
mu <- 5
sigma <- 2
sample_sizes <- c(10, 30, 100, 500, 1000)
N_sim <- 1000

means <- sapply(sample_sizes, function(n) mean(replicate(N_sim, mean(rnorm(n, mu, sigma)))))
vars <- sapply(sample_sizes, function(n) var(replicate(N_sim, mean(rnorm(n, mu, sigma)))))


par(mfrow = c(1, 2))
plot(sample_sizes, means, type = "b", col = "blue", main = "Convergence of Mean", xlab = "Sample Size", ylab = "Sample Mean")
abline(h = mu, col = "red", lwd = 2)

plot(sample_sizes, vars, type = "b", col = "green", main = "Convergence of Variance", xlab = "Sample Size", ylab = "Sample Variance")
abline(h = sigma^2, col = "red", lwd = 2)
