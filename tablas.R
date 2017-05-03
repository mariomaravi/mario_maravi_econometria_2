rm(list = ls())

library(tidyverse)
tidyverse_packages(TRUE)
knitr::opts_chunk$set(echo = TRUE)
tabla1  <- table1
tabla1
tabla2 <- table2
tabla2
table3
tabla3<- table3
tabla3
tabla4a<- table4a
tabla4a
tabla4b<- table4b
tabla4b
tabla5<- table5
tabla5
tabla1  <- rename(tabla1, país = country, año = year, casos = cases, población = population)
tabla2  <- rename(tabla2, país = country, año = year, tipo = type, cantidad = count)
tabla3  <- rename(tabla3, país = country, año = year, tasa = rate)
tabla4a <- rename(tabla4a, país = country)
tabla4b <- rename(tabla4b, país = country)
tabla5  <- rename(tabla5, país = country, siglo = century, año = year, tasa = rate)
tabla1[tabla1$país=="Afghanistan", ]$país <- "Afganistán"
tabla2[tabla2$país=="Afghanistan", ]$país <- "Afganistán"
tabla3[tabla3$país=="Afghanistan", ]$país <- "Afganistán"
tabla4a[tabla4a$país=="Afghanistan", ]$país <- "Afganistán"
tabla4b[tabla4b$país=="Afghanistan", ]$país <- "Afganistán"
tabla5[tabla5$país=="Afghanistan", ]$país <- "Afganistán"
tabla4b

##para agregar columnas
##gather
gather(tabla4b, 
       `1999`, `2000`, 
       key = "año", 
       value = "población"))
gather(tabla4b, 
       `1999`, `2000`, 
       key = "año", 
       value = "población")
tabla2
spread(tabla2, 
       key = tipo, 
       value = cantidad)

##separate

tabla3
separate(tabla3,
         tasa,
         into= c("casos", "población"))
separate(tabla3, 
         tasa, 
         into = c("casos", "población"), 
         sep = "/")
separate(tabla3, 
         tasa, 
         into = c("casos", "población"),
         convert = TRUE
)

##unite

tabla5
unite(tabla5,nueva_col, siglo, año)
unite(tabla5, nueva_col, siglo, año, sep = "")


ventas <- tibble(
  dia    = c("lunes", "lunes", 
             "martes", "martes", 
             "miércoles", 
             "jueves", "jueves", 
             "viernes", "viernes"),
  turno  = c("mañana", "tarde",
             "mañana", "tarde",
             "mañana",
             "mañana", "tarde",
             "mañana", "tarde"),
  ventas = c(12, 13,
             12, 12,
             14,
             NA, 12,
             13, 13)
)
ventas
ventas_ancho <- spread(ventas,
                       dia,
                       ventas)
ventas_ancho
gather(ventas_ancho,
       día,
       ventas,
       lunes, martes, miércoles, jueves, viernes,
       na.rm = TRUE)
complete(ventas, dia, turno)
pagos <- tribble(
  ~ empresa, ~ factura, ~pago,
  "Emp 1", 1, 100,
  NA,      2, 120,
  NA,      3, 110,
  "Emp 2", 1, 150
)

pagos
fill(pagos, empresa)
