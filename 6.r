# Lab 6: Estimate Population Parameters (Mean, Variance) from Sample Data

# Parameters
mu <- 5       # True population mean
sigma <- 2    # True population standard deviation
n <- 30       # Sample size
N_sim <- 1000 # Number of simulations (not used in this script)

# Generate sample data
set.seed(123)  
sample_data <- rnorm(n, mean = mu, sd = sigma)

# Point estimates
sample_mean <- mean(sample_data)
sample_var <- var(sample_data)

# Confidence intervals
conf_int_mean <- t.test(sample_data)$conf.int  # 95% CI for mean

# 95% CI for variance using Chi-Square distribution
alpha <- 0.05
conf_int_var <- c((n-1)*sample_var / qchisq(1 - alpha/2, df = n-1),
 (n-1)*sample_var / qchisq(alpha/2, df = n-1))

# Output results
cat("Sample Mean:", sample_mean, "\n")
cat("Sample Variance:", sample_var, "\n")
cat("95% CI for Mean:", round(conf_int_mean, 3), "\n")
cat("95% CI for Variance:", round(conf_int_var, 3), "\n")

# Graphical Output
par(mfrow = c(1, 2))  # Arrange plots side by side

# Histogram with mean and confidence interval
hist(sample_data, breaks = 30, col = "lightblue", main = "Sample Data with Mean",
     xlab = "Value", border = "white", probability = TRUE)
abline(v = sample_mean, col = "red", lwd = 2, lty = 1)  # Mean
abline(v = conf_int_mean, col = "blue", lwd = 2, lty = 2)  # CI for mean

# Boxplot
boxplot(sample_data, col = "lightgreen", main = "Boxplot of Sample Data", ylab = "Value")
