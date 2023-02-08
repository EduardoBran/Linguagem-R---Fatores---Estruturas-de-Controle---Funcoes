# Funcoes

# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/3.Linguagem-R- Fatores-Estruturas-de-Controle-e-Funcoes")
getwd()


# Help

?sample # mostra na documentacao o que faz a funcao sample

# funcao args mostra os parâmetros que uma funcao precisa

args(sample) 
args(mean)
args(sd)



# Funcoes Built-in

abs(20)
sum(c(1:5)) # calcula soma
mean(c(1:5)) # calcula média
round(c(1.1:5.8)) # arredonda 
rev(c(1:5)) # inverte
seq(1:5)
sort(rev(c(1:5))) # ordenar
append(c(1:5),6) # add ao vetor

vec1 <- c(1.5, 2.5, 8.4, 3.7, 6.3)
vec2 <- rev(vec1)
vec2
sort(vec1)


# Funcoes dentro de funcoes

plot(rnorm(10))
mean(c(abs(vec1), abs(vec2)))


# Criando funcoes

myfunc <- function(x) {
  x + x
}

myfunc(10)
class(myfunc)


myfunc2 <- function(a, b) {
  valor = a ^ b                 # a elevado a b
  print(valor)
}

myfunc2(3, 2)


jogando_dados <- function() {
  num <- sample(1:6, size = 1) # Local
  num
}

jogando_dados()

# Escopo
print(num)
num <- c(1:6)
num # Global



# Funcoes sem número definido de argumentos

vec1 <- c(10:13)
vec2 <- c('a', 'b', 'c', 'd')
vec3 <- c(6.5, 9.2, 11.9, 5.1)

myfunc3 <- function(...) {
  df = data.frame(cbind(...))
  print(df)
}

myfunc3(vec1)

myfunc3(vec2, vec3)

myfunc3(vec1, vec2, vec3)



# Funcoes Built-in - Nao tentar recriar a roda
# Comparação de eficiência entre funcao vetorizada e funcao 'vetorizada eno R'

x <- 1:10000000

# Funcao que calcula a raiz quadrada de cada elemento de um vetor de numeros
# recebe numeros e faz a logica necessaria para raiz quadrada

meu_sqrt <- function(numeros) {
  resp <- numeric(length(numeros))
  for(i in seq_along(numeros)){
    resp[i] <- sqrt(numeros[i])
  }
  return(resp)
}

# atribui o tempo gasto para x2a x2b

system.time(x2a <- meu_sqrt(x))

system.time(x2b <- sqrt(x))

# sua máquina pode apresentar resultado diferente por conta da precisao do calculo
# do processador

identical(x2a, x2b)
