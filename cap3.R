### CAP 3 REGRESION LINEAL
rm(list=ls())
data("Journals")
journals<- Journals[, c("subs", "price")]
journals$citeprice <- Journals$price/Journals$citations
summary(journals)
plot(log(subs) ~ log(citeprice), data = journals)                   ### grafico que muestra relacion
jour_lm<- lm(log(subs)~log(citeprice), data= journals)      ### rregresion
abline(jour_lm)
class(jour_lm)
names(jour_lm)
jour_lm
summary(jour_lm)
jour_slm<- summary(jour_lm)
class(jour_slm)
coef(jour_lm)
jour_slm$coefficients
Anova(jour_lm)
confint(jour_lm, level = 0.95)  


##predict
predict(jour_lm, newdata = data.frame(citeprice=2.11),
        interval = "confidence")
predict(jour_lm, newdata = data.frame(citeprice=2.11),
        interval="prediction")
