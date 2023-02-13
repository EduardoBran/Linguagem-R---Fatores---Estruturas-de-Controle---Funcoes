# Datas e Hora

# Configurando Diretorio de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/3.Linguagem-R- Fatores-Estruturas-de-Controle-e-Funcoes")
getwd()


# Hora e Data do sistema

hoje <- Sys.Date()
hoje
class(hoje)

data_e_hora <- Sys.time()
data_e_hora

timezone <- Sys.timezone()
timezone


# Data - representada por Date
# Armazenados como numero de dias desde 1 de janeiro de 1970

# Time - representado por POSIXct
# Armazenados como numero de segundos desde 1 de janeiro de 1970


# Formatando Datas

# %d: dia do mes em 2 digitos (12) 
# %m: mes em 2 digitos (01) 
# %y: ano em 2 digitos (88)
# %Y: ano em 4 digitos (1988)
# %A: dia da semana (Friday)
# %a: dia da semana abreviado (Fri)
# %B: nome do mes (July)
# %b: nome do mes abreviado (Jul)


# Formatando hora

# %H: hora (00-23) 
# %M: minuto
# %S: segundo
# %T: formato reduzido para %H:%M:%S


?strptime # realiza conversoes entre tipos de data


# Formatando a saida - as.Date()

as.Date("2018-06-28")
as.Date('Jun-28-18', format = '%b-%d-%y')
as.Date("28 Junho, 2018", format = "%d %B, %Y")


# Funcao format()

Sys.Date()
format(Sys.Date(), format = '%d de %B, %Y')
format(Sys.Date(), format = 'Hoje é %A!')


# Convertendo Datas - as.POSIXct

date1 <- "Jun 13, '96 hours:23 minutes:01 seconds:45"
date1
date1_convert <- as.POSIXct(date1, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
date1_convert

date1 <- "Jun 13, '96 horas:23 minutos:01 segundos:45"
date1
date1_convert <- as.POSIXct(date1, format = "%B %d, '%y horas:%H minutos:%M segundos:%S")
date1_convert


# Operacoes com Datas

data_de_hoje <- as.Date("2016-06-25", format = "%Y-%m-%d")
data_de_hoje
data_de_hoje + 1 # add 1 dia

my_time <- as.POSIXct("2016-05-14 11:24:134")
my_time
my_time + 1 # add 1 segundo

# importante saber se esta trabalhando com data do tipo Date ou POSIXct para poder fazer operacoes entra elas

data_de_hoje - as.Date(my_time) # aqui conseguimos fazer a operacao pois convertemos my_time para tipo date

data_de_hoje - my_time # aqui ocorrera um erro pois sao tipos de dados diferentes


