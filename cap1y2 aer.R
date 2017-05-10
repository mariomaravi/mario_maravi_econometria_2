 ## AER PARCIAL
 ##CAP 1 APPLIED ECONOMETRICS WITH R
rm(list=ls())
library(AER)

##ejemplo 1
R<- data("Journals", package = "AER")
R<- dim(Journals)
R<- names(Journals)
names(Journals)
dim(Journals)
R<- plot(log(subs) ~ log(price/citations), data = Journals)
j_lm<- lm(log(subs)~ log(price/citations), data = Journals)    ## lm sirve para regresion lineal
abline(j_lm)   #### nos muestra la regresion lineal
summary(j_lm)


##ejemplo 2
data("CPS1985", package = "AER")
cps<- CPS1985
dim(cps)
names(cps)
library(quantreg)
cps_lm<- lm(log(wage)~experience+I(experience^2)+education, data = cps)
  cps_rq<- rq(log(wage)~experience+I(experience^2)+education, data = cps, tau = seq(0.2,0.8, by=0.15))
plot(cps_lm)
summary(cps_lm)
summary(cps_rq)
cps2<- data.frame(education= mean(cps$education),
                  experience= min(cps$experience):max(cps$experience))
cps2<- cbind(cps2, predict(cps_lm, newdata= cps2,
                           interval= "prediction"))
cps2<- cbind(cps2, predict(cps_rq, newdata = cps2,
                           type = ""))
print(cps2)
plot(log(wage)~experience, data=cps)
for(i in 6:10) lines(cps2[,i]~experience,
                     data=cps2, col="red")
plot(summary(cps_rq))
objects()
search()
putas<- 5674
putas
objects()
remove(putas)
log(16:2)
log(x=16,2)
log(base=2,16)
?options
help("options")
example("lm")
example("options")


###cap2 R calculadora
1+5
5^3
exp(5)
log(81,3)
x<-c(1,8,5,4,6,5,4)
length(x)
2*x+3
log(x)
log(x,2)
x[c(1,4)]
x[c(3,7)]           ##seleccionar obs
x[-c(2,5,3)]        ##seleccionar obs - las asignadas
 
ones<- rep(1,10)
even<- seq(from=2,to=20,by=2)
ones
even
ele<- seq(2,6, by=0.5)
ele
remove(ele)
ele<- seq(5,15)
ele
trend<-1999:2017
trend
c(ones,even)
c
c(ones,trend,even)

##matrix
A<- matrix(1:6, nrow = 2)
A
B<- matrix(1:6, ncol=2)
B
dim(B)
nrow(A)
ncol(B)
A1<-A[1:2, 1]
A1
A
A2<-A[,3]
A2
C<-A[1:2, 1:2]
C
solve(C)           ##inversa
diag(4)     ##matriz identidad
diag(rep(c(1,2),
         c(10, 10)))
diag(1,3,3)
cbind(1,C)     ## COMBINAR agrega columna
rbind(C, diag(3,2))   ##combinar agrega filas
x
class(x)
x<5
names(x)
names(x)<-c("a","b","C","d","e","f","g")
x
x[c(1,3)]
x[x<5]

mylist<- list(sample= rnorm(5), family="distribucion normal", parameters= list(mean=0, sd=1))
mylist[[2]]
mylist$sample
x>2 & x<=5
x
which.min(x > 2 & x <= 5)
(56-3)==50
all(x<10)
any(x<1)
all.equal(1.9-0.9, 1)  
5+TRUE
1993*FALSE
is.numeric(x)
is.character(x)
as.character(x)
as.numeric(x)


set.seed(123)
rnorm(2)
rnorm(5)
sample(1:9)
sample(c(1:2), size=5, replace = TRUE, prob = c(0.2,0.8))
if(rnorm(1)>0) sum(x) else mean(x)
X <- matrix(1:20, ncol = 2)
cmeans(X)
cmeans <- function(X) {
   rval <- rep(0, ncol(X))
   for(j in 1:ncol(X)) {
   mysum <- 0
   for(i in 1:nrow(X)) mysum <- mysum + X[i,j]
   rval[j] <- mysum/nrow(X)
   }
   return(rval)
}



### formulas
f<- y~x
class(f)
x<- seq(0,10, by= 0.5)
y<- 2+3*x+ rnorm(21)
f
y
plot(y~x)
lm(y~x)

###manejo data
mydata<- data.frame(one= 1:10, two= 11:20, three= 21:30)
mydata 
mydata<- as.data.frame(matrix(1:30, ncol=3))
names(mydata)<-c("one","two","three")
mydata$two      ###seleccionar una columna como lista
mydata$one
mydata[,3]
mydata[5,]
attach(mydata)       ###adjuntar data para poder llamar a sus variables facilmente
mean(two)
sum(one)
detach(mydata)
with(mydata, mean(three))            ###variables=columnas  observaciones=filas
mydata.sub <- subset(mydata, two <= 16, select = -two)
mydata.sub



###import export
write.table(mydata, file = "mydata.txt", col.names = TRUE)     ###guardar data  como archivo de texto
newdata <- read.table("mydata.txt", header = TRUE)     ### importar tabla
save(mydata, file = "mydata.rda")
load("mydata.rda")
data("Journals", package = "AER")
library("foreign")
write.dta(mydata, file = "mydata.dta")              ### write.dta y read.table sirven para llamar data de stata
mydata
file.remove("mydata.dta")        ###borrar data del sistema


### factores
g<- rep(0:1, c(2,4))             ###codigo basico dummys
g<- factor(g, levels= 0:1, labels = c("male", "female"))
g
newdata <- read.table("mydata.txt", na.strings = "-999")


x <- c(1.8, 3.14, 4, 88.169, 13)
g<- factor(rep(c(0,1), c(2,4)), levels= 0:1, labels= c("male", "female"))
g
summary(x)
summary(g)
class(g)
class(x)
summary
normsample <- function(n, ...) {rval <- rnorm(n, ...). class(rval) <- "normsample" return(rval)}


### graficos
data("Journals")
Journals$citerprice <- Journals$price/Journals$citations
attach(Journals)
plot(log(subs), log(citerprice))
rug(log(subs))                 ### variable marginal
rug(log(citerprice), side = 2)
detach(Journals)
plot(log(subs)~log(citerprice), data = Journals)
?plot
?par
plot(log(subs) ~ log(citerprice), data = Journals, pch = 20,
      col = "blue", ylim = c(0, 8), xlim = c(-7, 4),
      main = "Library subscriptions")
pdf("myfile.pdf", height = 5, width = 6)
plot(1:20, pch = 1:20, col = 1:20, cex = 2)
dev.off()




##analisis data
data("CPS1985")
str(CPS1985)
head(CPS1985)
tail(CPS1985)
levels(CPS1985$occupation)[c(2, 6)] <- c("techn", "mgmt")
attach(CPS1985)
summary(wage)
mean(wage)
median(wage)
fivenum(wage)
max(wage)
var(wage)
sd(wage)

### visualizacion 
##una variable categoricas
hist(wage, freq = FALSE)
hist(log(wage), freq = FALSE)
lines(density(log(wage)), col = 4)
summary(occupation)
tab <- table(occupation)
prop.table(tab)
barplot(tab)
pie(tab)
##dos variables
xtabs(~gender+occupation, data = CPS1985)
plot(gender~occupation, data= CPS1985)

##dos variables numericas
cor(log(wage), education)
cor(log(wage), education, method = "spearman")
plot(log(wage) ~ education)

##variable numerica y categorica
tapply(log(wage), gender, mean)      ## primero num, luego cat y final operacion
boxplot(log(wage), education, data= CPS1985)
boxplot(log(wage), gender)
plot(log(wage)~gender)
