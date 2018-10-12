function eg = expGauss(x, lambda, mu, sigma)

eg = (lambda/2) * exp((lambda/2) * (2*mu + lambda * sigma^2 - 2*x)) .* ...
     erfc((mu + lambda * sigma^2 - x)/(sigma*sqrt(2)));