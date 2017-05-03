library(AER)
library(knitr)
library(tidyverse)
library(broom)
library(quantreg)

data("CPS1985", package = "AER")
cps<- CPS1985

ecuacion<- y ~ x1 + x2
class(ecuacion)

objeto_con_resultados <- lm(formula = y ~ x, data = foo)

reg.lineal <- lm(log(wage) ~ experience + I(experience^2) + education, data = cps)
summary(reg.lineal)

tidy(reg.lineal)

head(augment(reg.lineal))

  glance(reg.lineal)

reg.quintil <- rq(log(wage) ~ experience + I(experience^2) + education, 
                  data = cps, tau = seq(0.2,0.8, by=0.15))
reg.quintil

cps2 <- data.frame(education = mean(cps$education),
                   experience = min(cps$experience):max(cps$experience))
cps2 <- cbind(cps2, predict(reg.lineal, newdata = cps2, interval = "prediction"))
cps2 <- cbind(cps2, predict(reg.quintil, newdata = cps2, type = ""))
plot(log(wage) ~ experience, data = cps)
for(i in 6:10) lines(cps2[,i] ~ experience, data = cps2, col = "red")
