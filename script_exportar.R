library(MLDataR)

tir <- MLDataR::thyroid_disease

write.csv(tir, file = "dataset_tiroides.csv")

#al terminar los comandos de nuestros trabajos, ponemos: sessionInfo()

sessionInfo()

#ORDER
head(tir)
sort(tir$patient_age)
tir2 <- tir[order(tir$patient_age),]
View(tir2)
tir_completo <- tir[complete.cases(tir),] #quita todos los pacientes que tienen un NA 

#AGGREGATE
#Nos permite agrupar por grupos y hacer un calculo estadistico. 
#por ejemplo si queremos saber la media de la edad de los pacientes que tienen 
#tiroides o no. 
#Aggregate necesita 3 paramentros: 
# - los valores que queremos calcular (edad)
# - le dices por que (por cual) queremoa agregar (tir)
# - mean 
aggregate(tir_completo$patient_age, list(tir_completo$ThryroidClass), mean)
#list convierte el vector en una lista, lo pones con el parametro con el que vayas a 
#crear el grupo 

aggregate(tir_completo$patient_age, list(tir_completo$ThryroidClass, tir_completo$patient_gender), mean)
#nos hace la edad por clase y por genero. En el primer grupo es si tienen tiroides o no
#en el segundo grupo el genero y en el tercero el mean de la combinacion de grupos. 

edad_tyr <- aggregate(tir_completo$patient_age, list(tir_completo$ThryroidClass), mean)
names(edad_tyr) <- c("Tiroides", "Media")
#para ponerle el nombre a las columnas de tyr, se pone el nombre de las columnas en orden 

edad_genero <- aggregate(tir_completo$patient_age, list(tir_completo$ThryroidClass, tir_completo$patient_gender), median)
names(edad_genero) <- c("Tiroides", "Genero", "Median")

                      