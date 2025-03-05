# Observed data matrix
data <- matrix(c(100, 70, 30,
                 140, 60, 20), 
               nrow = 2, byrow = TRUE)

# Chi-square test
result <- chisq.test(data)

# Print the result
print(result)