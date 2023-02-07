# Fatores e Dataframes - Compreendendo a ordem dos Fatores

# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/3.Linguagem-R- Fatores-Estruturas-de-Controle-e-Funcoes")
getwd()


# Níveis dos fatores
# Internamente, o R armazena valores inteiros e faz um mapeamento para as strings (em ordem)
# e agrupa as estatísticas por níveis.

# Criando vetores

vec1 <- c(1001, 1002, 1003, 1004, 1005)
vec2 <- c(0, 1, 1, 0, 2)
vec3 <- c('Verde', 'Laranja', 'Azul', 'Laranja', 'Verde')

# Unindo os vetores em um dataframe

df <- data.frame(vec1, vec2, vec3)
df

# Verificando que o R NÃO categorizou a última coluna como factor

str(df)

# Convertendo a última coluna para factor

df$vec3 <- factor(df$vec3, labels = c('Azul', 'Laranja', 'Verde'))

str(df)

# Verificando os níveis do fator, Perceba que os níveis estão categorizados

levels(df$vec3)


# Criando uma nova coluna a atrabuindo os labels

df$cat1 <- factor(df$vec3, labels = c('cor2', 'cor1', 'cor3'))
df


# Internamente, os fatores são registrados como inteiros, mas a ordenação é alfabética das strings

str(df)


# Veja como foi feita a atribuição
# Azul    - cor2
# Laranja - cor1
# verde   - cor3
# Ou seja, os vetores com os labels, seguiram a ordem alfabética dos níveis de classificação pelo R



# Criando uma outra coluna e atribuindo labels
# Ao aplicarmos a funcao factor() a coluna vec2, internamente o R classificou em ordem alfabética
# e quando atribuirmos os labels, foi feita a associação

df$cat2 <- factor(df$vec2, labels = c('Divorciado', 'Casado', 'Solteiro'))
df
str(df)
levels(df$cat2)
summary(df$cat2)

View(df)


























