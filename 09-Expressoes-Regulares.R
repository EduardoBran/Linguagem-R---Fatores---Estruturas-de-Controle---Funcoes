# Expressoes Regulares

# Configurando Diretorio de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/3.Linguagem-R- Fatores-Estruturas-de-Controle-e-Funcoes")
getwd()

#     grep(pattern, x, ignore.case = FALSE, perl = FALSE, value = FALSE, fixed = FALSE, useBytes = FALSE, invert = FALSE)
#    grepl(pattern, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
#      sub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
#     gsub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
#  regexpr(pattern, text, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# gregexpr(pattern, text, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)


str <- c('Expressões', 'regulares', 'em linguagem R',
         'permitem a busca de padrões', 'e exploração de textos',
         'podemos buscar padrões em dígitos',
         'como por exemplo',
         '10992451280')

length(str)
str

# grep()

?grep

# procurando o padrao 'ex' no string criado acima e exbindo o numero do vetor aonde foi encontrado
grep('ex', str, value = F)
# procurando o padrao 'ex' no string criado acima e exbindo em quais palavras foram encontrado
grep('ex', str, value = T)

# procurando o padrão pelo código '\\d' que o mesmo que buscar por digitos (0,1,2...9)

grep('\\d', str, value = F) # mostra a posicao onde foi encontrado o(s) digito(s)
grep('\\d', str, value = T) # mostra o conteudo do(s) digito(s) encontrado(s)


# grepl()
# a diferença do grepl() para o grep() é que o grepl() retorna TRUE ou FALSE

?grepl

grepl('\\d', str)
grepl('\\D', str)



# gsub()
# se quisermos encontrar um padrao e depois substituirmos ele, usaremos gsub()

# vamos buscar pelo padrão 'em' e se encontrado sera substuido por '***'

gsub('em', '***', str)
gsub('ex', 'EX', str, ignore.case = T) # ignore.case ignora o case sensitive


# sub()
# substituir

sub('em', 'EM', str)



# regexpr()

frase <- 'Isso é uma string.'
regexpr(pattern = 'u', frase) # encontrou a primeira letra u na oitava posicao


# gregexpr()

frase2 <- 'Isso é uma string com uva.'

gregexpr(pattern = 'u', frase2) # agora aponta aonde estao todas as letras 'u'



# Um ultimo exemplo onde vamos 'limpando' a string criada

str2 <- c('2678 é maior que 45 - @????!$#',
          'Vamos escrever 14 scripts em R')
str2

# gsub()

gsub('\\d', '', str2)         # removendo os digitos
gsub('\\D', '', str2)         # removendo os nao digitos
gsub('\\s', '', str2)         # removendo os espacos
gsub('[iot]', '', str2)       # removendo as letras 'i', 'o' e 't'
gsub('[[:punct:]]', '', str2) # removendo caracteres especiais









#    \\d     -   Digitos, 0,1,2 ... 9
#    \\D     -   Nao digito
#    \\s     -   Espaco
#    \\S     -   Nao Espaco
#    \\w     -   Palavra
#    \\W     -   Nao Palavra
#    \\t     -   Tab
#    \\n     -   Nova Linha
#      ^     -   Começo da String
#      $     -   Fim da String
#      \     -   Caracteres especiais, e.g. \\ is "\", \+ is "+"
##     |     -   Alternation match. e.g. /(e|d)n/ matches "en" and "dn"
#      •     -   Any character, except \n or line terminator
#    [ab]    -   a or b
#   [^ab]    -   Any character except a and b
#   [0-9]    -   All Digit
#   [A-Z]    -   All uppercase A to Z letters
#   [a-z]    -   All lowercase a to z letters
#   [A-z]    -   All Uppercase and lowercase a to z letters
#      i+    -   i at least one time
#      i*    -   i zero or more times
#      i?    -   i zero or 1 time
#     i{n}   -   i occurs n times in sequence
# i{n1,n2}   -   i occurs n1 - n2 times in sequence
# i{n1,n2}?  -   non greedy match, see above example
#   i{n,}    -   i occures >= n times
# [:alnum:]  -   Alphanumeric characters: [:alpha:] and [:digit:]
# [:alpha:]  -   Alphabetic characters: [:lower:] and [:upper:]
# [:blank:]  -   Espacos em branco: e.g. space, tab
# [:cntrl:]  -   Control characters
# [:digit:]  -   Digitos: 0 1 2 3 4 5 6 7 8 9
# [:graph:]  -   Graphical characters: [:alnum:] and [:punct:]
# [:lower:]  -   Lower-case letters in the current locale
# [:print:]  -   Printable characters: [:alnum:], [:punct:] and space
# [:punct:]  -   Punctuation character: ! " # $ % & ' ( ) * + , - . / : ; < = > ? @[ \ ] ^ _ ` { | } ~
# [:space:]  -   Space characters: tab, newline, vertical tab, formfeed, carriagereturn, space
# [:upper:]  -   Upper-case letters in the current locale
# [:xdigit:] -   Hexadecimal digits: 0 1 2 3 4 5 6 7 8 9 A B C D E F a b c d ef