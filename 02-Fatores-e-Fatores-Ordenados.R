# Fatores

# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/3.Linguagem-R- Fatores-Estruturas-de-Controle-e-Funcoes")
getwd()

vec1 <- c('Macho', 'Femea', 'Femea', 'Macho', 'Macho')
vec1

fac_vec1 <- factor(vec1)
fac_vec1

class(vec1)
class(fac_vec1)


# Variáveis categóricas nominais
# Não existe ordem implícita

animais <- c('Zebra', 'Pantera', 'Rinoceronte', 'Macaco', 'Tigre')
animais
class(animais)

fac_animais <- factor(animais)
fac_animais

class(fac_animais)
levels(fac_animais)


# Variáveis categóricas ordinais
# Possuem uma ordem natural

grad <- c('Mestrado', 'Doutorado', 'Bacharelado', 'Mestrado', 'Mestrado')
grad

fac_grad <- factor(grad, order = TRUE, levels = c('Doutorado', 'Mestrado', 'Bacharelado'))
fac_grad

levels(fac_grad)

# Sumarizar os dados fornece uma visão geral sobre o conteúdo das variáveis
summary(fac_grad)
summary(grad)


vec2 <- c('M', 'F', 'F', 'M', 'M', 'M', 'F', 'F', 'M', 'M', 'M', 'F', 'F', 'M', 'M')
vec2

fac_vec2 <- factor(vec2)
fac_vec2

levels(fac_vec2) <- c('Femea', 'Macho')
fac_vec2

summary(fac_vec2)
summary(vec2)


# Mais exemplos (categorizando valores numéricos)

data = c(1,2,2,3,1,2,3,3,1,2,3,3,1)
data

fac_data = factor(data)
fac_data

rdata = factor(data, labels = c('I', 'II', 'III'))
rdata


# Fatores Não-Ordenados

set1 <- c('AA', 'B', 'BA', 'CC', 'CA', 'AA', 'BA', 'CC', 'CC')
set1

# Transformando os dados
# R apenas criou os níveis, o que não significa que exista uma hierarquia.

fac_set1 <- factor(set1)
fac_set1

class(fac_set1)
is.ordered(fac_set1)

# Ordenando o fator (Fatores Ordenados)

ord_set1 <- factor(set1,
                   levels = c('CA', 'BA', 'AA', 'CC', 'B'),
                   ordered = TRUE)
ord_set1
is.ordered(ord_set1)

as.numeric(ord_set1)
table(ord_set1)



# Fatores e Dataframes

df <- read.csv2('etnias.csv', sep = ',')
View(df)


# Tipos das variáveis no dataframe

str(df)


# Variável original (antes da transformação)
levels(df$Etnia)
summary(df$Etnia)


# Níveis de fatores
# Internamente, o R armazena valores inteiros e faz um mapeamento para as strings (ordem alfabética)
# e agrupa as estatísticas por níveis. Sendo assim agora ao fazer a sumarização de estatítiscas, é possível
# ver a contabilização para cada categoria

df$Etnia <- as.factor(df$Etnia)
levels(df$Etnia)
summary(df$Etnia)

# boxplot (gráfico de caixa)
# Neste exemplo mostrará a relação da variável idade com a variável etnia
# Agora se fizermos um plot, temos um boxplot para estas variáveis categóricas

boxplot(df$Idade ~ df$Etnia, xlab = 'Etnia', ylab = 'Idade', main = 'Idade por Etnia')


# Modelo de regressão lienar

summary(lm(Idade ~ Etnia, data = df))


# Convertendo uma coluna em variável categórica. Isso criará um fator não-ordenado
# Vamos converter uma variável para o tipo fator especificando quais são as categorias/fatores

df

str(df) # aqui variável Estado_Civil está como inteiro

df$Estado_Civil.cat <- factor(df$Estado_Civil, labels = c('Solteiro', 'Casado', 'Divorciado'))

df

str(df)
