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

lista2 <- list(v1 = 6, v2 = list(381, 2190), v3 = c(30, 217))
lista2

unlist(lista2)

mean(unlist(lista2))
round(mean(unlist(lista2)))


# do.call()

# Executa uma funcao em um objeto

# *** ATENCAO ***
# As funcoes da familia apply aplicam uma funcao a cada elemento de um objeto (substitui um loop)
# A funcao do.call aplica uma funcao ao objeto inteiro e nao a cada elemento individualmente

?do.call

data <- list()
N <- 100

for (n in 1:N) {
  data[[n]] = data.frame(index = n,
                         char = sample(letters, 1),
                         z = rnorm(1)
                         )
}

head(data)

do.call(rbind, data) # pegou o conjunto de dados completos e atraves do rbind considerou cada vetor de maneira individual a uniu todos eles
class(do.call(rbind, data))



# Para ficar mais claro a diferença da familia apply

# lapply() x do.call()

y <- list(1:3, 4:6, 7:9)
y

lapply(y, sum)  # somou valor total de cada dimensao da lista
do.call(sum, y) # somou valor total de todos os valores de todas as dimensoes



# O resultado da funcao lapply() pode ser obtido de outras formas

# Pacote plyr

install.packages('plyr')
library(plyr)

y <- list(1:3, 4:6, 7:9)
y

ldply(y, sum) # mesmo resultado com lapply() porém com uma pequena melhor de performance



# strsplit()
# Divide uma string ou vetor de caracteres


texto <- 'Data Science Academy'
texto
strsplit(texto, ' ') # Divde o texto por espaço (vetor de palavras)

texto <- 'Data Science Academy'
texto
strsplit(texto, '') # Divde o texto por caractere (vetor de caracteres)


dates <- c('1998-05-23', '2008-12-30', '2009-11-29')
dates

temp <- strsplit(dates, '-') # separa qdo encontra o '-' eassim separamos por mes, dia e ano
temp
class(temp) # lista


# Transforma a lista em matriz, fazendo antes um unlist()

temp_matriz <- matrix(unlist(temp))
temp_matriz
temp_matriz <- matrix(unlist(temp), ncol = 3, byrow = TRUE)
temp_matriz


# Outro exemplo

names <- c('Brian, Sergey', 'Page, Larry',
           'Dorsey, Jack', 'Glass, Noah',
           'Williams, Evan', 'Stone, Biz')
names

temp <- strsplit(names, ', ')
temp


# Outro exemplo

frase <- 'Muitas vezes temos que repetir algo diversas vezes e essas diversas vezes parecem algo estranho'
frase

palavras <- strsplit(frase, ' ')
palavras <- strsplit(frase, ' ')[[1]]
palavras

unique(tolower(palavras)) # deixando tudo minusculo e retirando palavras repetidas


# Outro exemplo

antes = data.frame(attr = c(1,30,4,6), tipo = c('pao_e_agua', 'pao_e_agua_2'))
antes

strsplit(as.character(antes$tipo), '_e_') # convertendo variavel tipo do data.frame em caracter e depois fazendo a separacao das strings atraves do '_e_'

# repetindo o exemplo acima atraves da funcao str_split_fixed() do pacote stringr

library(stringr)

str_split_fixed(antes$tipo, '_e_', 2) # retorna uma matrix ao invés de lista



# Usando do.call()

antes = data.frame(attr = c(1,30,4,6), tipo = c('pao_e_agua', 'pao_e_agua_2'))
antes

depois <- strsplit(as.character(antes$tipo), '_e_')
depois # lista

do.call(rbind, depois) # trasforma a lista em vetor



# Usando dplyr e tidyr

install.packages('dplyr')
install.packages('tidyr')

library(dplyr)
library(tidyr)

antes <- data.frame(
  attr = c(1, 30, 4, 6),
  tipo = c('pao_e_agua', 'pao_e_agua_2')
)
antes

antes %>%
  separate(tipo, c('pao', 'agua'), '_e_') # diz qual coluna quer separar, diz quais palavras quero separar e qual critério
