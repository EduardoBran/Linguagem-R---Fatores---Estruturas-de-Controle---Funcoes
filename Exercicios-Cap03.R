# Lista de Exercicios - Capitulo 3

# Configurando Diretorio de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/3.Linguagem-R- Fatores-Estruturas-de-Controle-e-Funcoes")
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
