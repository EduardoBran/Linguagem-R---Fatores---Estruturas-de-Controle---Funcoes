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
data_de_hoje - my_time          # aqui ocorrera um erro pois sao tipos de dados diferentes




# Convertendo Data em formato especifico

# O vetor de numeros pode representar o numero de dias, horas ou minutos (de acordo com o q vc quer converter)
# A Linguagem R considera o ponto de inicia a data 01 de Janeiro de 1970 e contabiliza o total
# de horas, minutos ou segundos, aquilo que o vetor numerico representar

dts = c(1127056501,1104295502,1129233601,1113547501,1119826801,1132519502,1125298801,1113289201)
myDates = dts
myDates

# POSIXct, armazena os segundos desde uma data especifica convertendo os valores numericos
# Esses valores numericos podem representar horas, minutos ou segundos desde 01 de Janeiro de 1970
# POSIXt é a classe principal e POSIXct e POSIXlt sap subclasses
# Poderiamos usar aqui apenas POSIXct, que é a subclasse (mas nao podemos usar apenas a classe principal)

class(myDates) = c('POSIXt','POSIXct')
myDates
class(myDates)

myDates = structure(dts, class = c('POSIXt', 'POSIXct'))
myDates


# Funcao ISODate

b1 = ISOdate(2011,3,23)
b1
b2 = ISOdate(2012,9,19)
b2

b2 - b1

difftime(b2, b1, units = 'weeks')



# Pacote lubridate

install.packages('lubridate')
require(lubridate)

?lubridate

ymd('20180604')
mdy('06-04-2018')
dmy('04/06/2018')


chegada <- ymd_hms('2016-06-04 12:00:00', tz = 'Pacific/Auckland')
partida <- ymd_hms('2011-06-04 14:00:00', tz = 'Pacific/Auckland')

chegada
partida

second(chegada)
second(chegada) <- 23

chegada

wday(chegada)
wday(chegada, label = TRUE)
class(chegada)


# Cria um objeto que especifica a data de inicia e data de fim
interval(chegada, partida)

tm1.lub <- ymd_hms('2020-05-24 23:55:26')
tm1.lub

tm2.lub <- mdy_hm('05/25/20 08:32')
tm2.lub

year(tm1.lub)
week(tm1.lub)


tm1.dechr <- hour(tm1.lub) + minute(tm1.lub)/60 + second(tm1.lub)/3600
tm1.dechr
force_tz(tm1.lub, 'Pacific/Auckland')



# Gerando um Dataframe de datas 

sono <- data.frame(bed.time = ymd_hms('2013-09-01 23:05:24', '2013-09-02 22:51:09',
                                      '2013-09-04 00:09:16', '2013-09-04 23:43:31', '2013-09-06 00:17:41', '2013-09-06 22:42:27',
                                      '2013-09-08 00:22:27'), rise.time = ymd_hms('2013-09-02 08:03:29', '2013-09-03 07:34:21',
                                                                                  '2013-09-04 07:45:06', '2013-09-05 07:07:17', '2013-09-06 08:17:13', '2013-09-07 06:52:11',
                                                                                  '2013-09-08 07:15:19'), sleep.time = dhours(c(6.74, 7.92, 7.01, 6.23, 6.34, 7.42, 6.45)))
                                      


View(sono)

sono
sono$eficiencia <- round(sono$sleep.time/(sono$rise.time - sono$bed.time) * 100, 1) # formula da eficiencia do sono
sono



# Gerando um plot sobre a Eficiencia do Sono a partir de datas do dataframe acima

par(mar = c(5, 4, 4, 4))
plot(round_date(sono$rise.time, 'day'), sono$eficiencia, type = 'o', col = 'blue', xlab = 'Manhã', ylab = NA)
par(new = TRUE)
plot(round_date(sono$rise.time, 'day'), sono$sleep.time/3600, type = 'o', col = 'red', axes = FALSE, ylab = NA, xlab = NA)
axis(side = 4)
mtext(side = 4,line = 2.5, col = 'red', 'Duração do Sono')
mtext(side = 2,line = 2.5, col = 'blue', 'Eficiência do Sono')












