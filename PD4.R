#===========================================================================================
#                                     Pr?ctica Dirigia 4
#===========================================================================================

#___________________________________________________________________________________________
#                         Manipulando ENAHO y analisis econometrico
#___________________________________________________________________________________________

# IMPORTACION DE DATOS

setwd("d:\\Users\\u_fgad\\Desktop\\498-Modulo05")

# Cargamos los paquetes con los que siempre trabajamos
library(tidyverse)
library(dplyr)

# Limpiamos todo
rm(list = ls())

# 1) empleando FOREIGN
library(foreign)
enaho1A <- read.dta("enaho01a-2015-500.dta")                             # POCO PR?CTICO
enaho1B <- read.dta("enaho01a-2015-500.dta", convert.factors = FALSE)    # M?S PR?CTICO

# 2) empleando HAVEN (YA TRANSFORMA LA BASE A TIBBLE)
library(haven)
enaho2 <- read_dta("enaho01a-2015-500.dta")                              # MEJOR OPCI?N

# DESDE AHORA EN ADELANTE TODO LO QUE TRABAJEMOS SER? CON HAVEN ######

# CONOCIENDO LA BASE
# 0) renombramos
enaho = enaho2

# 1) Que variables tiene?
names(enaho)

# 2) cual es el contenido de una variable?
list(enaho$estrato)

# 3) Que dimensi?n tiene nuestra base?
dim(enaho)


# FILTRANDO ALGUNAS COSAS

# 1) VER la variable estrato para determinar hogares rurales y urbanos
list(enaho$estrato)
# obtener todos los hogares URBANOS
A1 <- filter(enaho, (estrato==1)
                    | (estrato==2)
                    | (estrato==3)
                    | (estrato==4)
                    | (estrato==5) )
# obtener todos los hogares RURALES
A2 <- filter(enaho,   estrato==6
                    | estrato==7
                    | estrato==8 )

# 2) VER la variable dominio para extraer regiones geograficas
list(enaho$dominio)
# extraer lima metropolitana
B1 <- filter(enaho, dominio==8)
# extraer toda la costa
B2 <- filter(enaho,   dominio==1
                    | dominio==2
                    | dominio==3 )
# extraer toda la sierra
B3 <- filter(enaho,   dominio==4
                    | dominio==5
                    | dominio==6 )
# extraer toda la selva
B4 <- filter(enaho,   dominio==7 )


# 3) Trabajar con regiones
# vemos todas las regiones, provincias y distritos
region <- factor( substr( enaho$ubigeo, start=1, stop=2 )   );  print(region)
provincias <- factor( substr( enaho$ubigeo, start=1, stop=4 ) );  print(provincias)
distritos <- factor( substr( enaho$ubigeo, start=1, stop=6 ) );  print(distritos)

# generar una variable que indique a que region pertenece la observacion
C1 <- mutate(enaho, region )
C1 <- mutate(enaho, region = factor(  substr( enaho$ubigeo, start=1, stop=2 ) )  )
# vemos la variable
list(C1$region)
# Otra manera de ver
factor(C1$region)

# Filtrar por callao
C2 = filter(enaho,  region=="07"  )

# Filtrar por Cusco, madre de dios y apurimac
C3 = filter(enaho,  region=="03" | region=="08"  | region=="17" )

# Filtrar por las que son del a costa sur
C4 = filter(enaho, !region=="04" & !region=="11"  & !region=="18" & !region=="23" )


# 4) trabajar con filtros mas elaborados

#   comparar salariso de hombres y mujeres en regiones especificas

# seleccionar a todas las mujeres que viven en cusco o apurimac y que adem?s trabajan
D1 = filter(enaho, p207=="2" & region=="08" | region=="03" & ocu500=="1")
# seleccionar a todos los hombres que viven en cusco o apurimac y que adem?s trabajan
D2 = filter(enaho, p207=="1" & region=="08" | region=="03" & ocu500=="1")

# Cuanto es el promedio de ingreso en cada grupo?
mean(D1$p538a1, na.rm = TRUE)
mean(D2$p538a1, na.rm=TRUE)
m
#   comparar salario entre costa y sierra
# Sierra
E1 = filter(enaho, region=="08" | region=="19" | region=="21")
# Costa
E2 = filter(enaho, region=="15" | region=="23" | region=="18")

mean(E1$p538a1, na.rm = TRUE)
mean(E2$p538a1, na.rm = TRUE)

# Estimando modelos


# 1) estudiar el efecto de la evasi?n en las principales regiones del pa?s
# generar una dummy para las observaciones que habitan en la costa
# Para lima
base1A <- filter(enaho, !region=="15")
reg1A <- lm( base1A$i518  ~   base1A$i538c1  )
summary(reg1A)

# Para Arequipa
base1B <- filter(enaho, !region=="04")
reg1B <- lm( base1B$i518  ~   base1B$i538c1  )
summary(reg1B)

# Para Cusco
base1C <- filter(enaho, !region=="08")
reg1C <- lm( base1C$i518  ~   base1C$i538c1  )
summary(reg1C)


# 2) estudiar el diferencial de 
# generar una dummy para las observaciones que habitan en la costa

base2 <- filter(enaho, !dominio==8)

basreg <- transmute(base2,dominio,p538a1,dummy1 )

basreg <- basreg[complete.cases(basreg), ]

dummy2 <- rep(0,nrow(basreg))
dummy2[  (basreg$dominio==1  | basreg$dominio==2 | basreg$dominio==3 )   ] <- 1

reg2 <- lm( basreg$p538a1 ~  dummy1  )
summary(reg2)






