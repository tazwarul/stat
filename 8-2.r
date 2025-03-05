# Parameters
mu <- 5
sigma <- 2
n <- 30
N_sim <- 1000

# Initialize vectors
sample_vars <- numeric(N_sim)
biased_vars <- numeric(N_sim)

# Simulation
set.seed(123)
for (i in 1:N_sim) {
  data <- rnorm(n, mean = mu, sd = sigma)
  sample_vars[i] <- var(data)  # Unbiased estimator (n-1 in denominator)
  biased_vars[i] <- sum((data - mean(data))^2) / n  # Biased estimator (n in denominator)
}

# Graphical Output
par(mfrow = c(1, 2))

# Histogram of unbiased variances
hist(sample_vars, breaks = 30, col = "lightblue", main = "Unbiased Sample Variance", xlab = "Variance", border = "white")
abline(v = sigma^2, col = "red", lwd = 2)

# Histogram of biased variances
hist(biased_vars, breaks = 30, col = "lightgreen", main = "Biased Sample Variance", xlab = "Variance", border = "white")
abline(v = sigma^2, col = "red", lwd = 2)

# Summary Statistics
cat("Mean of Unbiased Variances:", mean(sample_vars), "\n")
cat("Mean of Biased Variances:", mean(biased_vars), "\n")
cat("True Population Variance:", sigma^2, "\n")

# If you want to perform a z-test, you need to define group1 and group2
# Example:
# group1 <- rnorm(30, mean = 5, sd = 2)
# group2 <- rnorm(30, mean = 5, sd = 2)
# z_test_result <- z.test(group1, group2, sigma.x = sd(group1), sigma.y = sd(group2))
# print(z_test_result)