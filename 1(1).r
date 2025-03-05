# Lab 1: Verification of Fisher’s Lemma Using Simulated Data

# Parameters
mu <- 5; sigma <- 2; n <- 30; N_sim <- 1000

# Simulation
set.seed(123)
sample_means <- replicate(N_sim, mean(rnorm(n, mu, sigma)))
sample_vars <- replicate(N_sim, var(rnorm(n, mu, sigma)))

# Correlation between sample mean and variance
cat("Correlation:", cor(sample_means, sample_vars), "\n")

# Plots
par(mfrow = c(2, 2))

hist(sample_means, breaks = 30, col = "lightblue", main = "Sample Means", xlab = "Mean", probability = TRUE)
curve(dnorm(x, mu, sigma/sqrt(n)), add = TRUE, col = "red", lwd = 2)

hist(sample_vars, breaks = 30, col = "lightgreen", main = "Sample Variances", xlab = "Variance", probability = TRUE)

plot(sample_means, sample_vars, pch = 19, col = rgb(0, 0, 1, 0.5), main = "Mean vs. Variance", xlab = "Mean", ylab = "Variance")
# abline(h = sigma^2, col = "red", lwd = 2)

qqnorm(sample_means, main = "Q-Q Plot of Sample Means", col = "blue")
# qqline(sample_means, col = "red", lwd = 2)
