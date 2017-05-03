#===========================================================================================
#                                         Pr?ctica Dirigia 2
#===========================================================================================

#___________________________________________________________________________________________
#                          Parte 1: Estudiando la regresi?n en el laboeratorio
#___________________________________________________________________________________________


# Limpiar todo
rm(list = ls())
# fijar semilla
set.seed(123)


#                                    Relaci?n lineal estandar

# relaci?n lineal normal
# generamos numeros aleatorios
x <- rnorm(50, mean=15, sd=3)

# valor te?rico del parametro
parametro1 <- 3.2

# valor del intercepto
intercepto <- 7.5

# generamos los residuos de la regresi?n y creamos la serie
errores <- rnorm(50, sd=10)

# regresi?n teorica lineal
y <- intercepto + parametro2 * x + errores

# regresi?n empirica lineal
reg <- lm(y~x)

# abrimos un ventana para poner el gr?fico ahi
dev.new()
plot(x,y,pch=16, las=1)

# agregamos la linea de regresi?n
abline(reg, lwd=2, col="blue")

# abrimos un ventana
dev.new()
# que sera de 2 x 2
par(mfrow=c(2,2))
# finalmente vemos el diagnostico de la regresi?n
plot(reg)


#                                    Relaci?n parabolica
# Parabola: Es lo mismo, solo que la ecuaci?n cambia
x <- rnorm(50, mean=15, sd=3)
parametro1 <- 0.5
parametro2 <- 3.2
intercepto <- 7.5
errores <- rnorm(50, sd=10)
# regresi?n teorica cuadratica
y <- intercept + parametro1*x*x + parametro2*x + errores

# regresi?n empirica lineal
reg <- lm(y~x)

dev.new()
plot(x,y,pch=16, las=1)
abline(reg, lwd=2, col="blue")
dev.new()
par(mfrow=c(2,2))
plot(reg)


#                                    Relaci?n con varianza creciente
# Varianza creciente
x <- rnorm(50, mean=15, sd=3)
parametro1 <- 3.2
intercepto <- 7.5
errores <- rnorm(50,sd=2)

# regresi?n teorica con autocorrelaci?n
y <-   intercepto + parametro1 * x + errores*((x-min(x))/2)

#regresi?n lineal empirica
reg <- lm(y~x)
dev.new()
plot(x,y,pch=16, las=1)
abline(reg, lwd=2, col="blue")
dev.new()
par(mfrow=c(2,2))
plot(reg)



#                                    Relaci?n con Outlier
# Outlier
x <- rnorm(50, mean=15, sd=3)
parametro1 <- 3.2
intercepto <- 7.5

# regresi?n teorica lineal
y <-  intercepto + parametro1 * x + + errores 

# agregar un outlier
x <- c(x,30)
y <- c(y,-10)

reg <- lm(y~x)
dev.new()
plot(x,y,pch=16, las=1)
abline(reg, lwd=2, col="blue")
dev.new()
par(mfrow=c(2,2))
plot(reg)


