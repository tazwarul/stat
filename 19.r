# Generate sample data
set.seed(123)
group1 <- rnorm(20, mean = 5, sd = 2)
group2 <- rnorm(20, mean = 7, sd = 2)

# Perform Wilcoxon rank-sum test
wilcox_test_result <- wilcox.test(group1, group2)

# Output test result
print(wilcox_test_result)

# Graphical Output
par(mfrow = c(1, 2)) # Set plotting area to 1 row, 2 columns

# Boxplot of groups
boxplot(list(group1, group2), col = c("lightblue", "lightgreen"), 
        main = "Boxplot of Groups", xlab = "Group", ylab = "Value")

# Density plots of groups
plot(density(group1), col = "blue", lwd = 2, main = "Density Plots", 
     xlab = "Value", ylim = c(0, 0.25))
lines(density(group2), col = "green", lwd = 2)
legend("topright", legend = c("Group 1", "Group 2"), col = c("blue", "green"), lwd = 2)
