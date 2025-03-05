# Parameters
mu <- 5
sigma <- 2
n <- 30
N_sim <- 1000

# Set seed for reproducibility
set.seed(123)

# Simulate data for means and medians
means <- replicate(N_sim, mean(rnorm(n, mu, sigma)))
medians <- replicate(N_sim, median(rnorm(n, mu, sigma)))

# Calculate Efficiency (ratio of variances)
efficiency <- var(medians) / var(means)
cat("Efficiency (Median/Mean):", efficiency, "\n")

# Graphical Output
par(mfrow = c(1, 2))
hist(means, breaks = 30, col = "lightblue", main = "Distribution of Sample Means", xlab = "Value")
hist(medians, breaks = 30, col = "lightgreen", main = "Distribution of Sample Medians", xlab = "Value")
