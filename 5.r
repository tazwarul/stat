# Parameters
mu <- 0; sigma <- 1; n <- 20; N_sim <- 1000

# Simulation
set.seed(123)
medians <- replicate(N_sim, median(rnorm(n, mu, sigma)))
ranges <- replicate(N_sim, diff(range(rnorm(n, mu, sigma))))

# Plot
par(mfrow = c(2, 2))
hist(medians, breaks = 30, col = "lightblue", probability = TRUE, main = "Medians", xlab = "Value")
curve(dnorm(x, mu, sigma/sqrt(n)), add = TRUE, col = "red", lwd = 2)

hist(ranges, breaks = 30, col = "lightgreen", probability = TRUE, main = "Ranges", xlab = "Value")

plot(density(medians), col = "blue", lwd = 2, main = "Density of Medians", xlab = "Value")
curve(dnorm(x, mu, sigma/sqrt(n)), add = TRUE, col = "red", lwd = 2)

boxplot(medians, ranges, names = c("Medians", "Ranges"), col = c("lightblue", "lightgreen"), main = "Boxplot")
