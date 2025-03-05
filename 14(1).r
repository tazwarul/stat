# Hypothesis Testing in R (Simplified)
set.seed(123)
n <- 30; mu0 <- 5; mu1 <- 6; sigma <- 2; alpha <- 0.05

# Generate sample data
sample_data <- rnorm(n, mean = mu1, sd = sigma)

# Perform t-test
t_stat <- (mean(sample_data) - mu0) / (sd(sample_data) / sqrt(n))
critical_value <- qt(1 - alpha, df = n-1)
p_value <- pt(t_stat, df = n-1, lower.tail = FALSE)

# Decision
decision <- ifelse(t_stat > critical_value, "Reject H0", "Fail to reject H0")

# Output results
cat("t-statistic:", t_stat, "\nCritical Value:", critical_value, "\nP-value:", p_value, "\nDecision:", decision)

# Visualization
hist(sample_data, breaks = 30, col = "lightblue", main = "Sample Data")
abline(v = c(mu0, mean(sample_data)), col = c("red", "blue"), lwd = 2)
