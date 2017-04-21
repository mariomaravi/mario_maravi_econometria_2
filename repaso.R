##repaso 1

rm(list= ls())
x<- 8/5
print(x)
y<- 6-5*4
y
print(y)


help(seq)
help(sqrt)
a<- 7>5
print(a)
typeof(a)
class(a)
b<- 5<9
b
typeof(b)

p<- as.integer(8.953)
q<-as.integer(4.0002)
print(p)
print(q)
typeof(p)
typeof(q)

x<- 0.4
y<- 10e-9
print(x)
print(y)
typeof(x)
typeof(y)

r<- "hola guacho"
rr<- "digame licenciado"
print(r)
print(rr)
typeof(r)
typeof(rr)

h<- c("a","b","c","d","e")
h
hh<- factor(h)
hh
class(h)

d<- NA
is.na(d)

e<- NULL
is.null(e)

f<- 5/0
is.infinite(f)

g<- 9- NaN
is.nan(g)

as.numeric(c("1","2","5"))
as.logical(c(5,1,0,3))
as.integer(c(1,0.555,6,-51,-56.24))
as.factor(c("r","t","r","r","t"))
as.factor(c("1","2","3","2","2"))
as.character(c(1,54,-56))

edad<- c(45,50,32,48,59)
ingreso<- c(5000,6000,NaN,6500,NA)
A<- data.frame(edad,ingreso)
A
prome1<- mean(ingreso, data=A)
prome1
prome2<- mean(ingreso,na.rm= TRUE, data=A)
prome2
sum<- summary(A)
sum

l<- A[!complete.cases(A),]
length(l)

A1<- na.omit(A)
print(A1)
A2<- A[!is.na(A)]
print(A2)

ingreso<- c(5000,65000,7000,5550)
sexo<- c("M","F","F","M")
d<-data.frame(ingreso,sexo)
print(d)
d1<- data.frame(ingreso,sexo, dummy=factor(sexo, labels = c(1,0)))
print(d1)

proporcion <- c(0.8,0.5,0.6,0.9)
consumo <- ingreso*proporcion
d <- data.frame(ingreso,sexo,consumo)
d$ingreso
d$sexo
R<- data.frame(qing = (d$ingreso)*(1/2), pprop = (d$ingreso)/(d$consumo))
print(R)

mean(1:10)
mean %>% 1:10
(1 + 8) %>% sqrt

##repaso 2
rm(list = ls())
library(tidyverse)
tidyverse_packages(TRUE)

library(dplyr)
x <- c(1:100)
y <- c(1:100)*5
z <- seq(0.01,1,0.01)
p <- c("a")
q <- c(TRUE)
dframe <- data.frame(x,y,z,p,q)
print(dframe)
dtibble <- tibble(x,y,z,p,q) 
print(dtibble)

dframe2 <- data.frame( dato = 1:10  , valor = rnorm(10), codigo="q" ,  inicial = sample(letters, 10)  )
print(dframe2)
dtibble2<- as_tibble(dframe2)
print(dtibble2)
cvalor1 <- dframe2$v
print(cvalor1)
cvalor2<- dtibble2$v
print(cvalor2)

base<- tibble(observacion= (1:50),
              codigo = c( rep("a",15), rep("b",15), rep("c",20) ),               
              localidad = sample(c( rep("111",4), rep("222",6), rep("121",5),    
                                    rep("123",4), rep("112",2), rep("213",4),    
                                    rep("211",4), rep("113",6), rep("221",5),    
                                    rep("322",4), rep("122",2), rep("212",4))),  
              edad = sample( 30:60, 50, replace=TRUE ),                          
              sexo = sample( c("M","F"), 50, replace=TRUE ),                     
              ingreso = sample( 850:5000, 50, replace=FALSE ),                   
              propingreso = (ingreso * 0.75),                                    
              prosingreso = (ingreso * 0.25),                                    
              ahorro = (ingreso * 0.1),                                          
              consumo = (ingreso * 0.9),                                         
              consumoal = sample( 300:500, 50, replace=FALSE ),                  
              consumoal1 = (consumoal * 0.4),                                   
              consumoal2 = (consumoal * 0.5),                                    
              consumoal3 = (consumoal * 0.1),                                    
              consumotec = sample( 800:2000, 50, replace=FALSE ))
print(base)
base[5, 2] = NA
base[2, 5] = NA
base[6, 7] = NA
base[7, 5] = NA     
base[3, 3] = NA
print(base)

A1 <- filter(base, edad<=40)
print(A1)
A2 <- filter(base, edad>40 & sexo=="M")
print(A2)
A3 <- filter(base, edad>40 , sexo=="M")
print(A3)
