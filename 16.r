# Bartlett's Test for Equal Variances

# Step 1: Generate Sample Data for Three Groups
set.seed(123)  # Setting seed for reproducibility
group1 <- rnorm(30, mean = 5, sd = 2)   # Group 1 (SD = 2)
group2 <- rnorm(30, mean = 5, sd = 3)   # Group 2 (SD = 3)
group3 <- rnorm(30, mean = 5, sd = 4)   # Group 3 (SD = 4)

# Step 2: Combine data into a list
data_list <- list(group1, group2, group3)

# Step 3: Perform Bartlett's Test
bartlett_test_result <- bartlett.test(data_list)

# Step 4: Output the test result
print(bartlett_test_result)

# Step 5: Graphical Representation
par(mfrow = c(1, 2))  # Divide plotting area into 1 row, 2 columns

# Boxplot to visualize data distribution
boxplot(data_list, col = c("lightblue", "lightgreen", "lightcoral"),
        main = "Boxplot of Groups", xlab = "Group", ylab = "Value")

# Density Plot to compare distributions
plot(density(group1), col = "blue", lwd = 2, main = "Density Plots", 
     xlab = "Value", ylim = c(0, 0.25))
lines(density(group2), col = "green", lwd = 2)
lines(density(group3), col = "red", lwd = 2)
legend("topright", legend = c("Group 1", "Group 2", "Group 3"),
       col = c("blue", "green", "red"), lwd = 2)
