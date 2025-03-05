# Lab 6: Estimate Population Mean & Variance

# Set parameters
mu <- 5         # True population mean
sigma <- 2      # True population standard deviation
n <- 30         # Sample size
alpha <- 0.05   # Significance level for 95% confidence interval

# Generate random sample data
set.seed(123)  
sample_data <- rnorm(n, mean = mu, sd = sigma)

# Compute point estimates
sample_mean <- mean(sample_data)    # Sample mean
sample_var <- var(sample_data)      # Sample variance

# Compute 95% confidence interval for mean
conf_int_mean <- t.test(sample_data)$conf.int  

# Compute 95% confidence interval for variance (Chi-Square method)
conf_int_var <- c(
  (n-1) * sample_var / qchisq(1 - alpha/2, df = n-1),
  (n-1) * sample_var / qchisq(alpha/2, df = n-1)
)

# Print results in a clean format
cat("\n--- Sample Statistics ---\n")
cat("Sample Mean      :", sample_mean, "\n")
cat("Sample Variance  :", sample_var, "\n")
cat("95% CI for Mean  :", round(conf_int_mean, 3), "\n")
cat("95% CI for Variance :", round(conf_int_var, 3), "\n")

# Visualization
par(mfrow = c(1, 2))  # Split plotting area into 2 sections

# Histogram with Mean & Confidence Interval
hist(sample_data, breaks = 20, col = "lightblue", 
     main = "Sample Distribution", xlab = "Value", border = "white",probability=TRUE)
abline(v = sample_mean, col = "red", lwd = 2)  # Mean
abline(v = conf_int_mean, col = "blue", lwd = 2, lty = 2)  # CI for mean

# Boxplot
boxplot(sample_data, col = "lightgreen", main = "Boxplot of Sample", ylab = "Value")

