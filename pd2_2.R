#===========================================================================================
#                                         Pr?ctica Dirigia 2
#===========================================================================================


#___________________________________________________________________________________________
#                                    Parte 2: utilizando datos reales
#___________________________________________________________________________________________

# limpiar todo el "global enviroment" para trabajar desde cero
rm(list = ls())

# decir a R que no muestre valores cientificos
options(scipen=999)
# fijar la carpeta

setwd("C:\\Users\\User\\Desktop\\prueba")

# llamamos a los paquetes que necesitaremos
library(foreign)
library(lattice)

# leemos la data
enaho <- read.dta("sumaria-2015.dta") 

# limpiamos un poco la data
# Primero filtraremos para que el trabajo sea solo con lima metropolitana
base_lima <- subset(enaho,dominio=="lima metropolitana")
names(base_lima)

# luego filtraremos para quedarnos solo con dos variables: gasto e ingreso
variables <- c("gashog1d","inghog1d")
base <- base_lima[variables]


# ahora escribiremos la ecuaci?n que nos interesa
modelo <- gashog1d ~ inghog1d

# graficamos para tener una idea 
dev.new()
xyplot(modelo, data = base)


# Hacemos la regresi?n
reg1 = lm(gashog1d ~ inghog1d , data = base)
# observamos los resultados
summary(reg1)

# Vemos en acci?n nuestro modelo de regresi?n
dev.new()
xyplot( modelo, data = base,
       type=c("p","r"))

# vemos los diagn?sticos de los residuos
dev.new()
par(mfrow=c(2,2))
plot(reg1)


# veamos otras cosas interesantes
reg2 = lm(inghog1d ~  mieperho, data = base_lima)
# observamos los resultados
summary(reg2)
dev.new()
xyplot( inghog1d ~  mieperho, data = base_lima,
        type=c("p","r"))

reg3 = lm(ga03hd ~ mieperho, data = base_lima)
# observamos los resultados
summary(reg3)
dev.new()
xyplot( ga03hd ~ mieperho, data = base_lima,
        type=c("p","r"))
