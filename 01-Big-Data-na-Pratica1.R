# Big Data na Pratica 1 - Analisando a Temperatura Media nas Cidades Brasileiras

# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/3.Linguagem-R- Fatores-Estruturas-de-Controle-e-Funcoes")
getwd()


# Dataset:
# Berkeley Earth
# http://berkeleyearth.org/data
# TemperaturasGlobais.csv ~ 78 MB (zip) ~ 530 MB (unzip)
# Faca o donwload do arquivo zip do link abaixo e descompacte na mesma pasta do script
# https://drive.google.com/open?id=1nSwP3Y0V7gncbnG_DccNhrTRxmUNqMqa


# Instalando e Carregando Pacotes

install.packages('readr')
install.packages('data.table')
install.packages('dplyr')
install.packages('ggplot2')

library(readr)
library(dplyr)
library(ggplot2)
library(scales)
library(data.table)


# Carregando os dados (usaremos um timer para comprar o tempo de carregamento com diferentes funções)

# Usando read.csv2()
system.time(df_teste1 <- read.csv2("TemperaturasGlobais/TemperaturasGlobais.csv"))

# Usando read.table()
system.time(df_teste2 <- read.table("TemperaturasGlobais/TemperaturasGlobais.csv"))

# Usando fread()
?fread
system.time(df <- fread("TemperaturasGlobais/TemperaturasGlobais.csv"))



# Criando subsets dos dados carregados

cidadesBrasil <- subset(df, Country == 'Brazil')

cidadesBrasil <- na.omit(cidadesBrasil) # omitindo qualquer valor NA

head(cidadesBrasil)
View(cidadesBrasil)

nrow(df)
nrow(cidadesBrasil)

dim(cidadesBrasil) # dimensões . nº linhas x nº colunas



# Preparação e Organização


# Convertendo as Datas (adicionando colunas com Mês e Ano)

cidadesBrasil$dt <- as.POSIXct(cidadesBrasil$dt, format='%d-%m-%Y')
cidadesBrasil$Month <- month(cidadesBrasil$dt)
cidadesBrasil$Year <- year(cidadesBrasil$dt)
View(cidadesBrasil)


# Carregando os subsets


# Palmas (carregando subset apenas da cidade Palmas, e depois carregando apenas nos anos escolhidos)

plm <- subset(cidadesBrasil, City == 'Palmas')
plm <- subset(plm, Year %in% c(1796,1846,1946,1996,2012))
View(plm)

# Curitiba

crt <- subset(cidadesBrasil, City == 'Curitiba')
crt <- subset(crt, Year %in% c(1796,1846,1946,1996,2012))
View(crt)


# Recife

recf <- subset(cidadesBrasil, City == 'Recife')
recf <- subset(recf, Year %in% c(1796,1846,1946,1996,2012))
View(recf)


# Construindo os plots (gravando os gráficos dentro de variáveis)

p_plm <- ggplot(plm, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, size = 2) +
  theme_light(base_size = 20) +
  xlab("Mês") +
  ylab("Temperatura Média") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média ao logo dos anos em Palmas") +
  theme(plot.title = element_text(size= 18))

p_crt <- ggplot(crt, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, size = 2) +
  theme_light(base_size = 20) +
  xlab("Mês") +
  ylab("Temperatura Média") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média ao logo dos anos em Curitiba") +
  theme(plot.title = element_text(size= 18))

p_recf <- ggplot(recf, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, size = 2) +
  theme_light(base_size = 20) +
  xlab("Mês") +
  ylab("Temperatura Média") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média ao logo dos anos em Recife") +
  theme(plot.title = element_text(size= 18))


# Plotando (visualizando)

p_plm
p_crt
p_recf
