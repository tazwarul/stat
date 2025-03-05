# Parameters
set.seed(123)
mu <- 0; sigma <- 1; n <- 20; N_sim <- 1000

# Generate samples and compute medians & ranges
medians <- replicate(N_sim, median(rnorm(n, mu, sigma)))
ranges <- replicate(N_sim, diff(range(rnorm(n, mu, sigma))))


median_of_medians <- median(medians)
cat("Median of Medians:", median_of_medians, "\n")

# Graphical Output
par(mfrow = c(2, 2))

# Histogram of medians with normal curve
hist(medians, breaks = 30, col = "lightblue", probability = TRUE, main = "Distribution of Medians", xlab = "Median", border = "white")
curve(dnorm(x, mu, sigma / sqrt(n)), add = TRUE, col = "red", lwd = 2)

# Histogram of ranges with density curve
hist(ranges, breaks = 30, col = "lightgreen", probability = TRUE, main = "Distribution of Ranges", xlab = "Range", border = "white")
lines(density(ranges), col = "red", lwd = 2)  # Added density curve for ranges

# Density plot of medians
plot(density(medians), col = "blue", lwd = 2, main = "Density Plot of Medians", xlab = "Median")
curve(dnorm(x, mu, sigma / sqrt(n)), add = TRUE, col = "red", lwd = 2)

# Boxplot of medians and ranges
boxplot(medians, ranges, names = c("Medians", "Ranges"), col = c("lightblue", "lightgreen"), main = "Boxplot of Medians and Ranges", ylab = "Value")
