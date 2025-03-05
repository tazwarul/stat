# Parameters
mu0 <- 5  
mu1 <- 6  
sigma <- 2  
n <- 30  
alpha <- 0.05  

# Generate sample data
set.seed(123)
sample_data <- rnorm(n, mean = mu1, sd = sigma)

# Perform t-test
t_test <- t.test(sample_data, mu = mu0, alternative = "greater")

# Extract values
statistic <- t_test[["statistic"]]
p_value <- t_test[["p.value"]]

# Decision
decision <- ifelse(p_value < alpha, "Reject H0", "Fail to reject H0")

# Output using cat
cat("Test Statistic:", statistic, "\n")
cat("P-value:", p_value, "\n")
cat("Decision:", decision, "\n")

# Graph
hist(sample_data, col = "lightblue", main = "Sample Data", xlab = "Value", border = "white")
abline(v = mu0, col = "red", lwd = 2)  
