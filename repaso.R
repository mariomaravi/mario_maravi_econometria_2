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
