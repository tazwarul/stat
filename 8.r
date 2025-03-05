# Parameters
set.seed(123)
mu <- 5
sigma <- 2
n <- 30
N_sim <- 1000

# Simulation
sample_vars <- replicate(N_sim, var(rnorm(n, mu, sigma)))  # Unbiased variance
biased_vars <- replicate(N_sim, sum((rnorm(n, mu, sigma) - mean(rnorm(n, mu, sigma)))^2) / n)  # Biased variance

# Graphical Output
par(mfrow = c(1, 2))
hist(sample_vars, breaks = 30, col = "lightblue", main = "Unbiased Sample Variance", xlab = "Variance", border = "white")
abline(v = sigma^2, col = "red", lwd = 2)
hist(biased_vars, breaks = 30, col = "lightgreen", main = "Biased Sample Variance", xlab = "Variance", border = "white")
abline(v = sigma^2, col = "red", lwd = 2)

# Summary Statistics
cat("Mean of Unbiased Variances:", mean(sample_vars), "\n")
cat("Mean of Biased Variances:", mean(biased_vars), "\n")
cat("True Population Variance:", sigma^2, "\n")