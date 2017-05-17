## primer 
3*3
library(lattice)
r = sqrt (729);

b <- 1947.0;
b <- as.character(b);
print (b);

one_to_six <- c(1, 2, 3, 4, 5, 6);
class(one_to_six);

one_a <- c(1, "a", 2, "b");
class(one_a) ## caracter

presidentes <- c("toledo","alan","humala","belaunde","alan","ppk","fujimori")
print (presidentes);
length(presidentes);
presidentes[1:2];
presidentes[c(4,2,7,1,5,3,6)];
presidentes[c(6,3,5,1,7,2,4)];
sort(presidentes);
presidents[order(presidentes)];

out <- c(rep('a', 2), seq(1, 5), seq(7, 11, by =2)) 
print (out);

myVec <- c(1, 2, NA, 4)
print (myVec);
myVec[!is.(myVec)]

mySample <- sample(1:100, 50, replace=T)
print (mySample);

class (iris)  ## tipo
sapply (iris, class)  # tipo de variables en columnas
str (iris)  # estructura
summary (iris)  # resumen
head (iris)  # ver todo
rownames (iris)  # filas
colnames (iris)  # columnas
nrow (iris)  # numero de filas
ncol (iris) # numero columnas

numRows <- nrow(iris)
numCols <- ncol(iris)
iris[(numRows-1):numRows, (numCols-1):numCols]

alligator = data.frame(
  lnLength = c(3.87, 3.61, 4.33, 3.43, 3.81, 3.83, 3.46, 3.76,
               3.50, 3.58, 4.19, 3.78, 3.71, 3.73, 3.78),
  lnWeight = c(4.87, 3.93, 6.46, 3.33, 4.38, 4.70, 3.50, 4.50,
               3.58, 3.64, 5.90, 4.43, 4.38, 4.42, 4.25)
)
print (alligator);

dev.new()
xyplot(lnWeight ~ lnLength, data = alligator,
       xlab = "Snout vent length (inches) on log scale",
       ylab = "Weight (pounds) on log scale",
       main = "Alligators in Central Florida",
       type=c("p","r")
)

# modelo lineal
alli.mod1 = lm(lnWeight ~ lnLength, data = alligator)

summary(alli.mod1)
dev.new()
xyplot(resid(alli.mod1) ~ fitted(alli.mod1),
       xlab = "Fitted Values",
       ylab = "Residuals",
       main = "Residual Diagnostic Plot",
       panel = function(x, y, ...)
       {
         panel.grid(h = -1, v = -1)
         panel.abline(h = 0)
         panel.xyplot(x, y, ...)
       }
)
