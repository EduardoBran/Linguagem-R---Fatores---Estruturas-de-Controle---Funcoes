# Familia Apply - Uma Forma Elegante de Fazer Loops

# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/3.Linguagem-R- Fatores-Estruturas-de-Controle-e-Funcoes")
getwd()


# Family Apply é um conjunto de funcoes para realizar loops de uma forma mais performatica

# Funcoes da Family Apply

#  apply() - arrays , matrizes, dataframe
# tapply() - os vetores podem ser divididos em diferentes subsets
# lapply() - vetores e listas
# sapply() - versao amigavel da lapply
# vapply() - similar a sapply(), com valor de retorno modificado
# rapply() - similar a lapply()
# eapply() - gera uma lista
# mapply() - similar a sapply(), multivariada
# by()     - forma de fazder agregacao com os dados com os quais vc quer fazer um tipo de loop


# Se você estiver trabalhando com os objetos:

# list, numeric, character (list/vecor)       -> sapply() lapply()
# matrix, data.frame (agragacao por coluna)   -> by() / tapply()
# operacoe por linha ou operacoes especificas -> apply()


# Usando um Loop

lista1 <- list(a = (1:20), b = (35:67))
lista1

valor_a = 0
valor_b = 0

# calculando a soma de todos os elementos lista1 com loop for

for(i in lista1$a){
  valor_a = valor_a + i
}

for(j in lista1$b){
  valor_b = valor_b + j
}

print(valor_a)
print(valor_b)

# sapply()
# calculando a soma de todos os elementos lista1 com sapply()

sapply(lista1, sum)

# calculando a media de todos os elementos de lista1

sapply(lista1, mean)


# apply()

x <- matrix(c(20, 13, 65, 32, 45, 12, 76, 49, 82), nr = 3, byrow = T)
x

apply(x, mean) # ocorrera um erro

apply(x, 1, mean) # calcular a media para cada linha
apply(x, 2, mean) # calcular a media para cada coluna

apply(x, 1, plot)

resultapply <- apply(x, 1, mean)
resultapply


# Aplicando apply() a um Dataframe

escola <- data.frame(Aluno = c('Bob', 'Tereza', 'Marta', 'Felipe', 'Zacarias', 'Elton'),
                     Fisica = c(91, 82, 75, 97, 62, 74),
                     Matematica = c(99, 100, 86, 92, 91, 87),
                     Quimica = c(56, 72, 49, 68, 59, 77))

escola
View(escola)
escola$Matematica

# Calculando a media por aluno

escola$Media = NA # add coluna Media
escola

escola$Media = apply(escola[, c(2,3,4)], 1, mean) #,] antes da virgula vazio indica usar as linhas e depois um vetor escolhendo quais colunas usar
escola

escola$Media = round(escola$Media)
escola

# Calculando a media e soma dos gols

gols <- data.frame(Jogadores = c('Messi', 'CR7', 'Lewa', 'Neymar', 'Ibra'),
                   Ano2019 = c(60, 55, 51, 35, 42),
                   Ano2020 = c(57, 56, 54, 29, 25),
                   Ano2021 = c(50, 45, 50, 25, 20),
                   Ano2022 = c(45, 28, 49, 30, 22))

gols

gols$Media = apply(gols[, c(2,3,4,5)], 1, mean)
gols$Media = round(gols$Media)
gols

# gols$Total = apply(gols[2, c(2,3,4,5)], 1, sum) usa só a linha 2
gols$Total = apply(gols[, c(2,3,4,5)], 1, sum)
gols



# tapply()

?gl # gera níveis de fator

tabela_basquete <- data.frame(equipe = gl(5, 5, labels = paste("Equipe", LETTERS[1:5])),
                              jogador = sample(letters, 25),
                              num_cestas = floor(runif(25, min=0, max=50)))

View(tabela_basquete) # dataframe gerado com 5 equipes (a, b, c, d, e) onde cada equipe tem 5 jogadores nomeados aleatoriamente por letras
summary(tabela_basquete)

# Como calcular o total de cestas por equipe ?

# tapply() vs sqldf

install.packages('sqldf')
library(sqldf)


