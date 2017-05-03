rm(list = ls())
library(tidyverse)
library(foreign)
library(dplyr)
library(lattice)
options(scipen=999)
##Manejo R
##pregunta3
setwd("C:/Users/alumnos/Desktop/ENAHO")
enaho<- read.dta ("enaho01a-2015-500.dta")

##pregunta4
enaho<- as.tibble(enaho)
base_lima <- subset(enaho,dominio=="lima metropolitana")
names(base_lima)

##pregunta5
enaho_UR<- filter(enaho, estrato=="de 20,001 a 100,000 viviendas"
                    |estrato=="de 10,001 a 20,000 viviendas"
                    |estrato=="de 4,001 a 10,000 viviendas"
                    |estrato=="de 401 a 4,000 viviendas")
enaho_RU<- filter(enaho, estrato=="?rea de empadronamiento rural - aer compuesto"
                  |estrato=="?rea de empadronamiento rural - aer simple"
                  |estrato=="menos de 401 viviendas")
##pregunta6
enaho$p538a1
mean(enaho_RU$p538a1, na.rm= TRUE )
mean(enaho_UR$p538a1, na.rm = TRUE)                    
##mayor ingreso en el area urbana

##pregunta7
enaho12<- filter(enaho, ocupinf=="empleo formal")
enaho21<- filter(enaho, ocupinf=="empleo informal")

##pregunta8
enahoPEA<- filter(enaho, ocu500=="1"
                  |ocu500=="2"
                  |ocu500=="3")
enahoOCU<- filter(enaho, ocu500=="1")
enahoDOC<- filter(enaho, ocu500== "2" | ocu500=="3")
#proporcion ocupada
61498/63997
#porporcion desocupada
2499/63997

##pregunta9
enahoMUJ<- filter(enaho, p207=="mujer"
                  |ocu500=="1")

##Modelos de rregresion en R
#pregunta1
variables<- c("i538c1", "i518") 
trib<- enaho[variables]
modelo<- i538c1 ~ i518
reg = lm(i538c1 ~ i518, data = trib)
summary(reg)

#pregunta2

