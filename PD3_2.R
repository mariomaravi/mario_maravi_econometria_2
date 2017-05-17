#===========================================================================================
#                                Pr?ctica Dirigia 3 - parte 2
#===========================================================================================
#                               Manipulaci?n usual de con dpylr


rm(list = ls())
#                                    El tidyverse
# Tidyverse es un conjunto de paquetes armonizados para trabajar de manera mas eficiente 
# con la manipulacion de datos

#    revisar si el paquete tidyverse est? instalado, en todo caso instalar
#    Est? instalado?
     library(tidyverse) # si carga los paquetes est? instalado, si no botara error
#    si no carga, instalar 
     install.packages("tidyverse")
#    Y cargar nuevamente
     library(tidyverse)
#    Ver que contiene el paquete tidyverse
     tidyverse_packages(TRUE)

#___________________________________________________________________________________________
#                                    El paquete dpylr

#    Este paquete es un conjunto de funciones para MODIFICAR bases de datos de manera simplificada
     library(dplyr)
#    Trabaja principalmente con tibbles que son parecidos a los data.frame

     
#    Tibbles VS Data Frames
#    i) Detalles y visualizaci?n
     x <- c(1:100)
     y <- c(1:100)*5
     z <- seq(0.01,1,0.01)
     p <- c("a")
     q <- c(TRUE)   
#    Este es un data.frame: muetra todo y no ofrece detalles
     dframe <- data.frame(x,y,z,p,q)
dframe
     #    Este es un tibble: m?s detallado y no muestra todo    
     dtibble <- tibble(x,y,z,p,q) 
dtibble
     #    esto lo vemos ordenando que se muestre las variables     
     print(dframe)     
     print(dtibble)
     
#    ii) Manipulaci?n
#    creamos un data.frame con 10 filas y lo vemos  
     dframe2 <- data.frame( dato = 1:10  , valor = rnorm(10), codigo="q" ,  inicial = sample(letters, 10)  )
     print(dframe2)
#    transformamos dicho data frame a una data tibble    
     dtibble2 <- as_tibble(dframe2)
     print(dtibble2)
#    Crearemos un nuevo elemento con la columna "valor" para cada tipo de data
     cvalor1 <- dframe2$v
     print(cvalor1)
     cvalor2 <- dtibble2$v
#    como puede verse el en el data.frame si se crea un valor y en tibble no

     
#    para proceder con las funciones, crearemos uan base de datos artificial   
     base <- tibble( observacion = (1:50),
                     codigo = c( rep("a",15), rep("b",15), rep("c",20) ),               # Codigo de hogar
                     localidad = sample(c( rep("111",4), rep("222",6), rep("121",5),    # Localidad: Distriro,provincia,region
                                           rep("123",4), rep("112",2), rep("213",4),    # Localidad: Distriro,provincia,region
                                           rep("211",4), rep("113",6), rep("221",5),    # Localidad: Distriro,provincia,region
                                           rep("322",4), rep("122",2), rep("212",4))),  # Localidad: Distriro,provincia,region
                     edad = sample( 30:60, 50, replace=TRUE ),                          # Edad
                     sexo = sample( c("M","F"), 50, replace=TRUE ),                     # Sexo
                     ingreso = sample( 850:5000, 50, replace=FALSE ),                   # Ingreso Total
                     propingreso = (ingreso * 0.75),                                    # Proporci?n primaria del ingreso
                     prosingreso = (ingreso * 0.25),                                    # Proporci?n secundaria de ingreso
                     ahorro = (ingreso * 0.1),                                          # Ahorro
                     consumo = (ingreso * 0.9),                                         # Consumo Total
                     consumoal = sample( 300:500, 50, replace=FALSE ),                  # Consumo Alimentos
                     consumoal1 = (consumoal * 0.4),                                    # Consumo Alimentos: carnes
                     consumoal2 = (consumoal * 0.5),                                    # Consumo Alimentos: Vegetales
                     consumoal3 = (consumoal * 0.1),                                    # Consumo Alimentos: frutas
                     consumotec = sample( 800:2000, 50, replace=FALSE ))                # Consumo tecnolog?a
#    Agregar missing values para hacer la data mas "parecida a la realidad"
     base[5, 2] = NA
     base[2, 5] = NA
     base[6, 7] = NA
     base[7, 5] = NA     
     base[3, 3] = NA
     print(base)
     
#    Aclaraci?n en LOCALIDAD
#    primer digito es distrito
#    segundo digito es provincia
#    tercer digito es regi?n
     
     
     
     
#    1) la funci?n FILTER: emplea condiciones para crear nuevas bases
#       a) seleccionar a todo aquellos con edad menor o igual a 40
        A1 <- filter(base, edad<=40);  print(A1)
#       b) seleccionar a todos los menores de 40 y sexo masculino
        A2 <- filter(base, edad>40 & sexo=="M");  print(A2)
        A3 <- filter(base, edad>40 , sexo=="M");  print(A3)
#       c) seleccionar aquellos cuyo codigo es diferente de a
        A4 <- filter(base, !(codigo=="a") );  print(A4)
#       d) seleccionar aquellos cuyo codigo es diferente de a y b        
        A5 <- filter(base, !( codigo=="a" ) & !(codigo=="b" ) );  print(A5)
#       e) generar una base con las siguientes carateristicas
#          - codigo diferente de c y b 
#          - edad entre 30 y 45 a?os 
#          - ingreso mayor 3000 
#          - sexo femenino
#          - ahorro menos de 300 o mas de 400
        A6 <- filter(base,
                     !( codigo=="c" ) & !( codigo=="b" )
                     & (( 30<edad )  &  ( edad<45 ))
                     & ( 3000<ingreso)
                     & ( sexo=="M" )
                     & ( (ahorro<300)  | (400<ahorro) ) )
        print(A6)
#       f) cuantas regiones tenemos? y seleccionar por la segunda de todas las regiones
        factor(   (  substr( base$localidad, start=3, stop=3 )  )   )
        A7 <-filter(base,  ( substr(base$localidad, start=3, stop=3) ) == 2   );  print(A7)
        
        
#    2) la funci?n ARRANGE: emplea las columnas para ordenarlas segun sus valores
#       a) ordenar por las observaciones que ganan menos
        B1 <- arrange(base, ingreso);  print(B1)
#       b) ordenar por las observaciones que ganan mas
        B2 <- arrange(base, desc(ingreso));  print(B2)
#       c) ordenar de modo que hombres y mujeres no esten intercalados. Primero, orden de I a D del abc
        B3 <- arrange( base, sexo );  print(B3)
#       d) ordenar de modo que hombres y mujeres no esten intercalados. Segundo, orden de D a I del abc
        B4 <- arrange( base, desc(sexo) );  print(B4)
        
        
#    3) la funci?n SELECT: crea nuevas bases con vectores especificados
#       a) crear una base solo para ingreso y sexo
        C1 <- select(base, ingreso, sexo);  print(C1)
#       b) crea una base de datos para edad y consumo, sin missing values
        C2 <- select(base, edad , consumo); print(C2)
        C2 <- na.omit(C2); print(C2)
#       c) crear un base de datos donde no este el sexo
        C3 <- select(base, -(sexo) ); print(C3)
#       d) crear un base de datos donde se encuentren solo las variables desde codigo hasta ahorro
        C4 <- select(base, (codigo:ahorro) ); print(C4)
#       e) crear un base de datos donde no se encuentren las variables desde codigo hasta consumoal
        C5 <- select(base, -(codigo:consumoal) ); print(C5)
#       f) crear un base de datos que solo considere variables asociadas al consumo
        names(base)
        C6 <- select(base, starts_with("consumo")) ; print(C6)
#       g) crear un base de datos que solo considere variables asociadas al ingreso
        names(base)
        C7 <- select(base, ends_with("ingreso")); print(C7)         
#       h) crear un base de datos que solo contenga las variables asociadas al consumo de alimentos
        names(base)
        C8 <- select(base,  num_range("consumoal",1:3)); print(C8)
        
        
#    4) la funci?n MUTATE y TRASNMUTE: la primera crea nuevos vectores en nuestra base de datos
#                                      la segunda hace que solo nos quedemos con las variable creadas
#       a) crear uan variable que sea la proporsi?n de ahorro respecto al ingreso
        D1 <- mutate(base,proDahorro = ahorro/ingreso); print(D1)
#       b) crea dos varaibles: proporcion de gasto en alimentos y tecnologia
        D2 <- mutate(base, proal = consumoal/ingreso , protec = consumotec/ingreso); print(D2)
#       c) eliminar todas las variables y retener el ratio de consumo sobre ingreso
        D3 <- transmute(base, ratiocs =  consumo/ingreso ); print(D3)
#       d) crear una variable dummy para sexo
        d1 <- rep(0,50)
        d1[base$sexo=="M"] <- 1
        D4 <- mutate(base,  d1  )
D4
#       e) Crear una variable dummy de intervalo de ingreso y pegarla en la anterior base: 
#          El intervalo sera: 1 para ingreso < 3000 y 0 para ingreso >=3000
        d2 <- rep(0,50)
        d2[ (base$ingreso<3000)  ] <- 1
        D5 <- mutate(D4,  d2  )
        print(D5)
        #       f) crear una dummy interactiva entre sexo e intervalo de ingreso
#       forma 1
           D6a <- mutate(base, dummyI = d1 * d2 )
#       forma 2
           d3 <- rep(0,50)
           d3[ ( base$sexo=="M" & base$ingreso<3000  )   ] <- 1
           d3 - (d1*d2)
           D6b <- mutate(base, dummyI = d3)
          
print(D6b)

