# Degrees of freedom
df <- 9  # Degrees of freedom 9

# (a) Right tail shaded area = 0.05
t1_a <- qt(0.95, df)  # Cumulative area on the left = 0.95

# (b) Total shaded area = 0.05 (two tails, meaning 0.025 on each side)
t1_b_upper <- qt(0.975, df)  # Upper critical value
t1_b_lower <- qt(0.025, df)  # Lower critical value

# (c) Total unshaded area = 0.99 (shaded area = 0.01, two tails, meaning 0.005 on each side)
t1_c_upper <- qt(0.995, df)  # Upper critical value
t1_c_lower <- qt(0.005, df)  # Lower critical value

# (d) Left tail shaded area = 0.01
t1_d <- qt(0.01, df)  # Cumulative area on the left = 0.01

# (e) Left cumulative area = 0.90
t1_e <- qt(0.90, df)  # Cumulative area on the left = 0.90

# Plot the t-distribution
x_vals <- seq(-4, 4, length = 1000)
y_vals <- dt(x_vals, df)

# Plot the curve
plot(x_vals, y_vals, type = "l", col = "blue", lwd = 2, 
     main = "T-Distribution with df = 9", xlab = "t", ylab = "Density")

# Add shaded areas
polygon(c(x_vals[x_vals >= t1_a], t1_a), 
        c(y_vals[x_vals >= t1_a], 0), col = "gray", border = NA)  # (a)

polygon(c(x_vals[x_vals <= t1_b_lower], t1_b_lower), 
        c(y_vals[x_vals <= t1_b_lower], 0), col = "gray", border = NA)  # (b) lower

polygon(c(x_vals[x_vals >= t1_b_upper], t1_b_upper), 
        c(y_vals[x_vals >= t1_b_upper], 0), col = "gray", border = NA)  # (b) upper

polygon(c(x_vals[x_vals <= t1_c_lower], t1_c_lower), 
        c(y_vals[x_vals <= t1_c_lower], 0), col = "gray", border = NA)  # (c) lower

polygon(c(x_vals[x_vals >= t1_c_upper], t1_c_upper), 
        c(y_vals[x_vals >= t1_c_upper], 0), col = "gray", border = NA)  # (c) upper

polygon(c(x_vals[x_vals <= t1_d], t1_d), 
        c(y_vals[x_vals <= t1_d], 0), col = "gray", border = NA)  # (d)

polygon(c(x_vals[x_vals <= t1_e], t1_e), 
        c(y_vals[x_vals <= t1_e], 0), col = "gray", border = NA)  # (e)

# Add vertical lines for the critical values
abline(v = c(t1_a, t1_b_upper, t1_b_lower, t1_c_upper, t1_c_lower, t1_d, t1_e), 
       col = "red", lty = 2)

# Add legend
legend("topright", legend = c("(a) t1", "(b) Upper", "(b) Lower", "(c) Upper", "(c) Lower", "(d) t1", "(e) t1"),
       col = "red", lty = 2, cex = 0.8)
