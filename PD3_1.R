#===========================================================================================
#                                  Pr?ctica Dirigia 3  - parte 1
#===========================================================================================

#                                   Manipulaci?n usual de datos

rm(list = ls())
# Consideraciones generales

# 1) SELECCIONAR UNA LINEA
#    Presionar shift (tecla debajo de "bloq mayus") luego apretar flechas (arriba, abajo, izquiera derecha)


# 2) CORRER UNA LINEA
#    Luego de seleccionar una linea presionar Ctrl + R
#    Ejemplo: seleccionar las siguientes lineas y usar Ctrl + R para correrlas
     x <- (2^8)/4
     print(x)
     
     y <- ( (4*6)^(1/2) ) / (1/5)
     print(y)

          
# 3) BUSCAR AYUDA
#    Digitar help(nombre) donde nobmre es comando del cual queremos infomaci?n     
#    Ejemplo:
     help(seq)
     help(sqrt)
     help(lm)
     help(help)

          
# 4) Tipo de Elementos de R
#    En R se manejan los siguientes tipos de elementos:
     
#    i)   logic (valores l?gicos): contienen los elementos "T" o "TRUE", "F" O "FALSE"
     a <- 5 > 4
     b <- 5 > 6
     print(a)
     print(b)
     typeof(a)
     typeof(b)
     
#    ii)  integer (n?mero enteros): son valores enteros positivos o negativos 
     p <- as.integer(3.1)
     q <- as.integer(4.5)
     print(p)
     print(q)
     typeof(p)
     typeof(q)
     
#    iii) double (numeros reales): son valores pertenecientes al campo de los numeros reales
     x <- 0.4
     y <- 10e-9
     print(x)
     print(y)
     typeof(x)
     typeof(y)
     
#    iv)  character or string ( caracteres o texto): son elementos que contienen letras, palabras o caracteres
     r <- 'hola1'
     rr <- "hola2"
     print(r)
     print(rr)
     typeof(r)
     typeof(rr)
     

#    v) factores (factores): variables indicadoras de un contenido de variables
     h <- c("a","b","b","c","a")
     hh <- factor(h)
     class(hh)

hh     
# 5) Elementos especiales en R 
     
#    i)  NA (not available - no disponible): es el nombre de un missing value o elemento perdido
     d <- NA
     is.na(d) 
     
#    ii)  NULL (vacio): No hay un valor asignado
     e <- NULL
     is.null(e)    
     
#    iii)  INF (infinito): puede ser devisiones entre cero o valores grnades
     f <- 1/0
     is.infinite(f) 
     
#    iv)  NaN (not a number - no es un n?mero): operaciones mal digitadas
     g <- 1 + NaN
     is.nan(g)
     
     
     
# 6) Tranformaci?n entre tipo de datos
#    Existen funciones para transformar los diferentes tipos de elementos mencionados
#    i)   as.numeric: De caracteres a numeros
     as.numeric( c("1","2") )
     
#    ii)  as.numeric: De numeros a valores logicos
     as.logical( c(5,1,5,4,0) )
     
#    iii)  as.integer: De numeros en el plano de los reales al plano de los numeros enteros
     as.integer( c(4.5,9.999,-5.6) )
     
#    iv)   as.factor: De caracteres o valores a categorias    
     as.factor( c("r","t","t","r","r","t") )
     as.factor( c("1","2","2","3","1","1") )

#    v)   as.character: De valores a caracteres    
     as.character( c(1,64,-3) ) 
     
     
# 7) Operaciones elementales
#    Imaginar el siguiente conjunto de datos
     edad <- c(45,27,31,29,38,55)
     ingreso <- c(7000,2500,3000,NaN,NA,8000)
     A <- data.frame(edad,ingreso)

#    i) extraer el promedio del ingreso
     prome1 <- mean(ingreso, data=A)
     prome2 <- mean(ingreso, na.rm=TRUE, data=A)
prome2     
     sum <- summary(A)
     sum
#    ii) Cuantos missing values tenemos?
     l <- A[!complete.cases(A),]
     length(l)
     
#    iii) Limpiar la base
     A1 <- na.omit(A)
     print(A1)
     
     A2 = A[!is.na(A)]
     print(A2)

#    Creando variables dummy
     ingreso <- c(7000,2500,3000,4000,6000,8000)
     sexo <- c("M","F","M","F","M","M")
     d <- data.frame(ingreso,sexo)
     d1 <-data.frame( ingreso, sexo, dummy=factor( sexo , label=c(1,0)) )
     print(d1) 

#    Manipulando elementos de un base anonimamente: el operador $
#    sea la base:
     proporcion <- c(0.8,0.5,0.6,0.9,0.7,0.9)
     consumo <- ingreso*proporcion
     d <- data.frame(ingreso,sexo,consumo)
#    i) seleccionar la variable ingreso
     d$ingreso
#    ii) seleccionar la variable sexo
     d$sexo
#    iii) crear una variable que seala raiz cuadrada del ingreso y otra que sea consumo sobre ingreso
     R <- data.frame( qinc = (d$ingreso)^(1/2)  , prop = d$ingreso / d$consumo  )
R     
#    Imputador de funciones: operador "pipe" %>%
#    Obtener el promedio de los 10 primeros numeros
     mean(1:10)
     1:10 %>% mean
#    sacar raiz cuadrada de 9
     (1 + 8) %>% sqrt
     
     
     
     