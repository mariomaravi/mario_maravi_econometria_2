assign("x", 1)
x

assign("x", c(1,2,3,4,5,6,7,8,9,10))
x

assign("y", 1:30)
y

w <- 1:20
w

1:10 -> z
z

a<- 2
class(a)
a
is.numeric(a)
is.integer(a)

 b<- as.integer(a)
 b
 class(b)
 a
 
 a<- 3.99
 a<- as.integer(a)
 a
 
 
 c<-"colocar texto" 
c 
class(c)

a<- c("categoria 1", "categoria 1", "categoria 2", "categoria 1", "categoria 2", "categoria 2")
a<- factor(a)
a

table(a)

mes<- factor(c(1, 1, 2, 3, 4, 4, 4, 5, 6, 7, 7, 8, 9, 10, 11, 12), ordered = TRUE)
mes

levels(mes) <- c("enero",
                 "febrero",
                 "marzo",
                 "abril",
                 "mayo",
                 "junio",
                 "julio",
                 "agosto",
                 "septiembre",
                 "octubre",
                 "noviembre",
                 "diciembre")
table(mes)

logica<- c(TRUE, FALSE,TRUE,TRUE)
logica
table(logica)






