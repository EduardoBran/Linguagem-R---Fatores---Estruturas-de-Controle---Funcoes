# Diferenca entre Operadores de Atribuicao

# Configurando Diretorio de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/3.Linguagem-R- Fatores-Estruturas-de-Controle-e-Funcoes")
getwd()

vec1 = 1:4
vec2 <- 1:4

class(vec1)
class(vec2)

typeof(vec1)
typeof(vec2)

mean(x = 1:10)
x # ocorre erro, diz que 'x' nao existe

mean(y <- 1:10)
y # aqui NAO ocorre erro, o 'y' existe


# Os simbolos de atribuicao (' = ' e ' <- ') usados dentro de uma funcao se comportam de maneiras dierentes

# o simbolo de ' = ' ele atribui o valor para 'x' e depois descarta, ou seja essa atribuicao so existe em tempo de execucao

# o simbolo de ' <-  ' mantem
