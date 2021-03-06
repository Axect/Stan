library(rstan)

options(mc.cores = parallel::detectCores())
d <- read.csv(file='data.csv')
data <- list(N=nrow(d), X=d$X, Y=d$Y)
fit <- stan(file='model4-5.stan', data=data, seed=1234)

save.image(file='result-model4-5.RData')
