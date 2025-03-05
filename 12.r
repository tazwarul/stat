# Parameters
mu0 <- 5  # Null hypothesis mean
mu1 <- 6  # Alternative hypothesis mean
sigma <- 2  # Standard deviation
n <- 30  # Sample size
alpha <- 0.05  # Significance level

# Generate sample data
set.seed(123)
sample_H0 <- rnorm(n, mu0, sigma)
sample_H1 <- rnorm(n, mu1, sigma)

# Compute critical value
critical_value <- qnorm(1 - alpha, mu0, sigma / sqrt(n))

# Decision rule
decision_H0 <- mean(sample_H0) > critical_value
decision_H1 <- mean(sample_H1) > critical_value

# Output results
cat("Critical Value:", critical_value, "\n")
cat("Decision under H0:", decision_H0, "\n")
cat("Decision under H1:", decision_H1, "\n")

# Plot density curves
plot(density(sample_H0), col = "blue", lwd = 2, main = "Density under H0")
abline(v = critical_value, col = "red", lty = 2)

plot(density(sample_H1), col = "green", lwd = 2, main = "Density under H1")
abline(v = critical_value, col = "red", lty = 2)
