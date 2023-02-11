# Funcoes Especiais - unlist() , do.call() e strsplit()

# Configurando Diretorio de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/3.Linguagem-R- Fatores-Estruturas-de-Controle-e-Funcoes")
getwd()



# unlist() - produz um vetor com os elementos da lista

?unlist

lista1 <- list(6, 'b', 15)
lista1
class(lista1)

unlist(lista1)

vec1 <- unlist(lista1)
class(vec1)
vec1
