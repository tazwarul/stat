# Load necessary package
if (!require(BSDA)) install.packages("BSDA", dependencies = TRUE)
library(BSDA)

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
  sample_vars[i] <- var(data)  # Unbiased variance
  biased_vars[i] <- sum((data - mean(data))^2) / n  # Biased variance
}

# Graphical Output
par(mfrow = c(1, 2))

# Histogram of unbiased variances
hist(sample_vars, breaks = 30, col = "lightblue", main = "Unbiased Sample Variance", xlab = "Variance", border = "white")
abline(v = sigma^2, col = "red", lwd = 2)

# Histogram of biased variances
hist(biased_vars, breaks = 30, col = "lightgreen", main = "Biased Sample Variance", xlab = "Variance", border = "white")
abline(v = sigma^2, col = "red", lwd = 2)

# Optional: Z-test (Define group1 and group2 first)
set.seed(456)
group1 <- rnorm(n, mean = mu, sd = sigma)
group2 <- rnorm(n, mean = mu + 1, sd = sigma)  # Example of different means

z_test_result <- z.test(group1, group2, sigma.x = sd(group1), sigma.y = sd(group2))

# Output
print(z_test_result)

# Additional Graphical Output
par(mfrow = c(1, 2))
hist(group1, breaks = 30, col = "lightblue", main = "Histogram of Group 1", xlab = "Value", border = "white")
hist(group2, breaks = 30, col = "lightgreen", main = "Histogram of Group 2", xlab = "Value", border = "white")
