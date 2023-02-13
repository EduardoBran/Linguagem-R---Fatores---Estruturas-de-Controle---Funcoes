# Pacotes e Instalacao de Pacotes

# Configurando Diretorio de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/3.Linguagem-R- Fatores-Estruturas-de-Controle-e-Funcoes")
getwd()


# De onde vem as funcoes ? Vem dos Pacotes (que sao conjunto de funcoes)
# Quando voce inicia o RStudio, alguns pacotes sao carregados por padrao

# Busca de pacotes carregados

search()


# Instala e carrega os pacotes

install.packages(c('ggvis', 'tm', 'dplyr')) # instala varias pacotes

library(ggvis)
library(tm)
require(dplyr)  # o require tb carrega tal como o library

search()

# Retirando o pacote da memoria

detach(package:dplyr)

search()



# Lista o conteudo dos pacotes

?ls

ls(pos = 'package:tm') # lista todas as funcoes do pacote tm
ls(getNamespace('tm'), all.names = TRUE) # lista além das funcoes, atributos e metodos



# Lista a funcoes de um pacote

lsf.str('package:tm') # lista as funcoes e seus repesctivos conteudos/argumentos

lsf.str('package:ggplot2')

library(ggplot2)

lsf.str('package:ggplot2')



# R possui um conjunto de datasets pre-instalados

library(MASS)   # alguns pacotes que vem com o R nao precisa instalar, mas tem que carregar como o MASS

data()

?lynx     # dataset que vem com o R que é uma lista anual de armadilhas
head(lynx)

head(iris)

tail(lynx)
summary(lynx)

plot(lynx)
hist(lynx)

head(iris)
iris$Sepal.Length # imprime conteudo da coluna


sum(Sepal.Length) # aqui vai ocorrer um erro

# para evitar o erro acima e ajudar o interpretador chamamos a funcao attach()

?attach
attach(iris)
sum(Sepal.Length) # agora funciona


# Basta criar um dataset, mencionar o attach com o nome da coluna e depois usar como exemplo acima
     