# F-distribution এর জন্য Density গণনা 
df1 <- 10 # Numerator degrees of freedom 
df2 <- 20 # Denominator degrees of freedom 
value <- 1.2 
 
density <- df(value, df1 = df1, df2 = df2) 
print(paste("Density for value", value, ":", density)) 
 
# একটি নির্দিষ্ট ইন্টারভালে F-distribution এর নিচের এলাকা গণনা 
x <- 1.5 
v1 <- 10 
v2 <- 20 
 
# [0, 1.5] ইন্টারভালে এলাকা 
probability_interval <- pf(x, df = v1, df2 = v2, lower.tail = TRUE) 
print(paste("Probability for interval [0, 1.5]:", probability_interval)) 
 
# [1.5, +∞) ইন্টারভালে এলাকা 
probability_upper_tail <- pf(x, df = v1, df2 = v2, lower.tail = FALSE) 
print(paste("Probability for interval [1.5, +∞):", probability_upper_tail)) 
 
# এলাকা যোগফল যাচাই 
total_area <- probability_interval + probability_upper_tail 
print(paste("Sum of intervals equals 1:", total_area == 1)) 
 
# F-distribution এর জন্য বিভিন্ন কিউয়ান্টাইল গণনা 
q <- c(0.25, 0.5, 0.75, 0.999) 
quantiles <- sapply(q, function(prob) qf(prob, df1 = v1, df2 = v2, lower.tail = TRUE)) 
print("Quantiles for probabilities:") 
print(quantiles) 
 
# F-distribution থেকে random values তৈরি করা 
x_random <- rf(100000, df1 = v1, df2 = v2) 
 
# Histogram তৈরি এবং Probability Density Function যোগ করা 
hist(x_random, 
    breaks = "Scott", 
    freq = FALSE, 
    xlim = c(0, 3), 
    ylim = c(0, 1), 
    xlab = "", 
    main = "Histogram for F-distribution with df1 = 10 and df2 = 20" 
) 
 
curve(df(x, df1 = v1, df2 = v2), from = 0, to = 4, n = 5000, col = "pink", lwd = 2, add = TRUE)