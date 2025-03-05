# Parameters
set.seed(123)
mu0 <- 5; mu1 <- 6; sigma <- 2; n <- 30; alpha <- 0.05; N_sim <- 1000

# Simulation for Power Calculation
power_t_test <- mean(replicate(N_sim, t.test(rnorm(n, mu1, sigma), mu = mu0, alternative = "greater")$p.value < alpha))
power_z_test <- mean(replicate(N_sim, (mean(rnorm(n, mu1, sigma)) - mu0) / (sigma / sqrt(n)) > qnorm(1 - alpha)))

# Output
cat("Power of t-test:", power_t_test, "\nPower of z-test:", power_z_test, "\n")

# Graphical Output
par(mfrow = c(1, 2))
barplot(c(power_t_test, power_z_test), names.arg = c("t-test", "z-test"), col = c("lightblue", "lightgreen"), main = "Power Comparison", ylab = "Power")

sample_sizes <- seq(10, 100, by = 10)
power_t <- sapply(sample_sizes, function(n) mean(replicate(N_sim, t.test(rnorm(n, mu1, sigma), mu = mu0, alternative = "greater")$p.value < alpha)))
plot(sample_sizes, power_t, type = "b", col = "blue", main = "Power vs. Sample Size", xlab = "Sample Size", ylab = "Power")
