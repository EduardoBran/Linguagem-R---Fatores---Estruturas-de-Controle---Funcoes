# Lista de Exercicios - Capitulo 3

# Configurando Diretorio de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/3.Linguagem-R-Fatores-Estruturas-de-Controle-e-Funcoes")
getwd()

# Exercicio 1 - Pesquise pela funcao que permite listar todos os arquivo no diretorio de trabalho

# Exercicio 2 - Crie um dataframe a partir de 3 vetores: um de caracteres, um logico e um de numeros

# Exercicio 3 - Considere o vetor abaixo. 
# Crie um loop que verifique se ha numeros maiores que 10 e imprima o numero e uma mensagem no console.

# Criando um Vetor
vec1 <- c(12, 3, 4, 19, 34)
vec1

# Exercicio 4 - Conisdere a lista abaixo. Crie um loop que imprima no console cada elemento da lista
lst2 <- list(2, 3, 5, 7, 11, 13)
lst2

# Exercicio 5 - Considere as duas matrizes abaixo. 
# Faca uma multiplicacao element-wise e multiplicacao normal entre as matrizes
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
mat2 <- t(mat1)
mat2

# Multiplicacao element-wise

# Multiplicacao de matrizes

# Exercicio 6 - Crie um vetor, matriz, lista e dataframe e faça a nomeação de cada um dos objetos

# Exercicio 7 - Considere a matriz abaixo. Atribua valores NA de forma aletoria para 50 elementos da matriz
# Dica: use a funcao sample()
mat2 <- matrix(1:90, 10)
mat2

# Exercicio 8 - Para a matriz abaixo, calcule a soma por linha e por coluna
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1

# Exercicio 9 - Para o vetor abaixo, ordene os valores em ordem crescente
a <- c(100, 10, 10000, 1000)
a

# # Exercicio 10 - Imprima no console todos os elementos da matriz abaixo que forem maiores que 15
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1







# ---------------------------------------------------------------------------------------------------------

# Exercicio 1 - Pesquise pela funcao que permite listar todos os arquivo no diretorio de trabalho

dir()


# ********** Gabarito ********** 

list.files()




# ---------------------------------------------------------------------------------------------------------

# Exercicio 2 - Crie um dataframe a partir de 3 vetores: um de caracteres, um logico e um de numeros

vet_car <- c('a', 'b', 'c', 'd')
vet_log <- c(TRUE, FALSE, TRUE, FALSE)
vet_num <- c(150, 270, 380, 490)

df_exe2 <- data.frame(vet_car, vet_log, vet_num)

str(df_exe2)  
names(df_exe2) = c('Caracteres', 'Logico', 'Numerico')

df_exe2
View(df_exe2)

subset(df_exe2, Numerico > 270) # exibindo somente as que tem numero > 270 na coluna Numerico


# ********** Gabarito ********** 

charc_vec <- c('A', 'B', 'C')
num_vec <- c(4.5, 3.9, 7.2)
logic_vec <- c(TRUE, TRUE, FALSE)

df1 <- data.frame(charc_vec, num_vec, logic_vec)
df1




# ---------------------------------------------------------------------------------------------------------

# Exercicio 3 - Considere o vetor abaixo. 

vec_exe3 <- c(12, 3, 4, 19, 34)
vec_exe3

# Agora crie um loop que verifique se ha numeros maiores que 10 e imprima o numero e uma mensagem no console.

qtd = 0

for(i in vec_exe3){
  if(i > 10){
    qtd = qtd + 1
    print(paste('O numero', i, '? maior que 10'))
  }
}

print(paste('Tem ', qtd, ' numeros maior que 10'))


# ********** Gabarito ********** 

for (i in 1:length(vec_exe3)){  # 1:ATÉ O COMPRIMENTO DO VALOR
  if(vec_exe3[i] > 10) {
    print(vec_exe3[i])
    print('Este elemento do vetor é maior que 10')
  }
  else {
    print(vec_exe3[i])
    print('Este elemento do vetor NAO é maior que 10')
  }
}



# ---------------------------------------------------------------------------------------------------------

# Exercicio 4 - Conisdere a lista abaixo. Crie um loop que imprima no console cada elemento da lista

lista_exe4 <- list(2, 3, 5, 7, 11, 13)
lista_exe4

for(i in lista_exe4) {
  print(i)
}


# ********** Gabarito ********** 

for (i in 1:length(lista_exe4)) {
  print(lista_exe4[[i]])             # usando 2 colchetes para olhar cada dimensao (fazemos isso qdo usarmos lista)
}



# ---------------------------------------------------------------------------------------------------------

# Exercicio 5 - Considere as duas matrizes abaixo. 
# Faca uma multiplicacao element-wise e multiplicacao normal entre as matrizes

mat1_exe5 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1_exe5
mat2_exe5 <- t(mat1_exe5)
mat2_exe5

# Multiplicacao element-wise

mat_element <- mat1_exe5 * mat2_exe5
mat_element

# Multiplicacao de matrizes

mat_normal <- mat1_exe5 %*% mat2_exe5
mat_normal


# exemplo 2

m <- matrix(c(3,4,5,1), nrow = 2, ncol = 2, byrow = T)
m

i <- matrix(c(1,1,1,1), nrow = 2, ncol = 2, byrow = T)
i

m_i_element <- m * i
m_i_element

m_i_normal <- m %*% i
m_i_normal


# ********** Gabarito ********** 

# Multiplicacao element-wise

mat_element <- mat1_exe5 * mat2_exe5
mat_element


# Multiplicacao de matrizes
# multiplica primeira linha da mat1_exe5 com a primeira coluna de mat2_exe5
# Item [1.1] ==> (1x1) + (2x2) + (3x3) + (4x4) + (5x5) = 55
# Item [2.1] ==> (6x1) + (7x2) + (8x3) + (9x4) + (10x5) = 130
# Item [3.1] ==> (11x1) + (12x2) + (13x3) + (14x4) + (15x5) = 205

mat_normal <- mat1_exe5 %*% mat2_exe5
mat_normal



# ---------------------------------------------------------------------------------------------------------

# Exercicio 6 - Crie um vetor, matriz, lista e dataframe e faca a nomeacao de cada um dos objetos

# Criando um vetor numerico com 5 elementos
vet_exe6 <- c(1, 2, 3, 4, 5)
vet_exe6

# Nomeando o vetor
names(vet_exe6) <- c("elem1", "elem2", "elem3", "elem4", "elem5")

vet_exe6


# Criando uma matriz 2x2
mat_exe6 <- matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2)
mat_exe6

# Nomeando as linhas e colunas
rownames(mat_exe6) <- c("linha1", "linha2")
colnames(mat_exe6) <- c("col1", "col2")

mat_exe6


# Criando uma lista com 3 elementos de diferentes tipos
lista_exe6 <- list(nome = 'Joao', idade = 30, altura = 1.77)
lista_exe6

# Nomeando os elementos da lista
names(lista_exe6) <- c('Nome', 'Idade', 'Altura')

lista_exe6


# Criando um dataframe com 3 colunas
df_exe6 <- data.frame(nome = c('Joao', 'Alice', 'Pedro'),
                      idade = c(39, 8, 22),
                      altura = c(1.92, 1.42, 1.71))
df_exe6

# Nomeando as colunas do dataframe
names(df_exe6) <- c('Nome', 'Idade', 'Altura')

df_exe6


# ********** Gabarito ********** 

v <- c(12, 3, 4, 19, 34)
names(v) <- c('Col1', 'Col2', 'Col3', 'Col4', 'Col5')
v

m <- matrix(c(1:25), nrow = 5, ncol = 5, byrow = T)
m
dimnames(m) <- list(c('Obs1', 'Obs2', 'Obs3', 'Obs4', 'Obs5'), c('Var1', 'Var2', 'Var3', 'Var4', 'Var5'))
m
dimnames(m)

m2 <- matrix(1:4, nrow = 2, ncol = 2, byrow = T)
m2
dimnames(m2) <- list(c('Linha 1', 'Linha 2'), c('Coluna 1', 'Coluna 2'))
dimnames(m2)

# quando chamar a dimnames, chamar a linha primeiro

l <- list(2, 3, c(1, 2, 3))
l
names(l) <- c('dim1', 'dim2', 'dim3')
l

df <- data.frame(c('A', 'B', 'C'), c(4.5, 3.9, 7.2), c(TRUE, FALSE, TRUE))
colnames(df) <- c('Caracteres', 'Float', 'Logico')
rownames(df) <- c('Obs1', 'Obs2', 'Obs3')
df




# ---------------------------------------------------------------------------------------------------------

# Exercicio 7 - Considere a matriz abaixo. Atribua valores NA de forma aletoria para 50 elementos da matriz
# Dica: use a funcao sample()

mat_exe7 <- matrix(1:90, 10)
mat_exe7

# seleciona os 50 numeros aleatoriamente

indices_na <- sample(length(mat_exe7), 50)

# atribuindo valores NA

mat_exe7[indices_na] <- NA

mat_exe7


# ********** Gabarito ********** 

mat_exe7_2 <- matrix(1:90, 10)
mat_exe7_2

mat_exe7_2[sample(1:50, 10)] = NA # atribui valores NA a apenas os 50 primeiros numeros
mat_exe7_2



# ---------------------------------------------------------------------------------------------------------

# Exercicio 8 - Para a matriz abaixo, calcule a soma por linha e por coluna

mat_exe8 <- matrix(c(1:50), nrow = 10, ncol = 5, byrow = T)
mat_exe8


soma_por_linha <- apply(mat_exe8, 1, sum)
soma_por_linha
soma_por_coluna <- apply(mat_exe8, 2, sum)
soma_por_coluna


# ********** Gabarito ********** 

rowSums(mat_exe8)
colSums(mat_exe8)



# ---------------------------------------------------------------------------------------------------------

# Exercicio 9 - Para o vetor abaixo, ordene os valores em ordem crescente

vet_exe9 <- c(100, 10, 10000, 1000)
vet_exe9

vet_exe9_ordernado <- sort(vet_exe9)
vet_exe9_ordernado


# ********** Gabarito ********** 

order(vet_exe9) # imprimiu 2 1 4 3 pois imprime a ordem dos indices

vet_exe9[order(vet_exe9)] # aqui mostra os valores ordenados




# ---------------------------------------------------------------------------------------------------------

# # Exercicio 10 - Imprima no console todos os elementos da matriz abaixo que forem maiores que 15

mat_exe10 <- matrix(c(1:50), nrow = 10, ncol = 5, byrow = T)
mat_exe10

for(i in mat_exe10){
  if(i > 15){
    print(i)
  }
}


# ********** Gabarito ********** 

# ficou igual a solucao encontrada


