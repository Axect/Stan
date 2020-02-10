# Data generation
epsilon <- rnorm(30, mean=0, sd=200)
X <- seq(24, 53, 1)
Y <- -1197 + 219 * X + epsilon

df <- data.frame(X, Y)
write.csv(df, "data.csv", row.names=FALSE)

# Plot
library("ggplot2")

# lm
res_lm <- lm(Y ~ X)
print(res_lm)

X_new <- data.frame(X=24:53)
conf_95 <- predict(res_lm, X_new, interval='confidence', level=0.95)
pred_95 <- predict(res_lm, X_new, interval='prediction', level=0.95)

df <- cbind(df, pred_95)

p <- ggplot(df, aes(X, Y)) + geom_point() + stat_smooth(method = lm)

p <- p + geom_line(aes(y = lwr), color="red", linetype = "dashed") +
    geom_line(aes(y = upr), color="red", linetype = "dashed")

ggsave("test.png", p)
