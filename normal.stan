data {
  int N;
  real Y[N];
}

parameters {
  real mu;
}

model {
  for (n in 1:N) {
    // likelihood
    Y[n] ~ normal(mu, 1);
  }
  // Prior (Not conjugate prior)
  mu ~ normal(0, 100);
}
