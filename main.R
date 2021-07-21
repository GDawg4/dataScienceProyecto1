# Title     : TODO
# Objective : TODO
# Created by: Rodrigo Garoz
# Created on: 18/07/2021)
library(ggplot2)
library(reshape2)
library(dplyr)
library(tidyr)
library(readr)
library(purrr)
library(tibble)
library(stringr)
library(forcats)
library(data.table)

av_raw <- read.csv('sources/altaVerapaz.csv', sep=';', encoding = "UTF-8")
av_raw<-head(av_raw,-2)
av_raw <- av_raw[-c(1),]

bv_raw <- read.csv('sources/bajaVerapaz.csv', sep=';', encoding = "UTF-8")
bv_raw<-head(bv_raw,-2)
bv_raw <- bv_raw[-c(1),]

chimal_raw <- read.csv('sources/chimaltenango.csv', sep=';', encoding = "UTF-8")
bv_raw<-head(bv_raw,-2)
bv_raw <- bv_raw[-c(1),]

chiqui_raw <- read.csv('sources/chiquimula.csv', sep=';', encoding = "UTF-8")
chiqui_raw<-head(chiqui_raw,-2)
chiqui_raw <- chiqui_raw[-c(1),]

capital_raw <- read.csv('sources/ciudadCapital.csv', sep=';', encoding = "UTF-8")
capital_raw<-head(capital_raw,-2)
capital_raw <- capital_raw[-c(1),]

progreso_raw <- read.csv('sources/elProgreso.csv', sep=';', encoding = "UTF-8")
progreso_raw<-head(progreso_raw,-2)
progreso_raw <- progreso_raw[-c(1),]

escuintla_raw <- read.csv('sources/escuintla.csv', sep=';', encoding = "UTF-8")
escuintla_raw<-head(escuintla_raw,-2)
escuintla_raw <- escuintla_raw[-c(1),]

guatemala_raw <- read.csv('sources/guatemala.csv', sep=';', encoding = "UTF-8")
guatemala_raw<-head(guatemala_raw,-2)
guatemala_raw <- guatemala_raw[-c(1),]

huehue_raw <- read.csv('sources/huehuetenango.csv', sep=';', encoding = "UTF-8")
huehue_raw<-head(huehue_raw,-2)
huehue_raw <- huehue_raw[-c(1),]

izabal_raw <- read.csv('sources/izabal.csv', sep=';', encoding = "UTF-8")
izabal_raw<-head(izabal_raw,-2)
izabal_raw <- izabal_raw[-c(1),]

jalapa_raw <- read.csv('sources/jalapa.csv', sep=';', encoding = "UTF-8")
jalapa_raw<-head(jalapa_raw,-2)
jalapa_raw <- jalapa_raw[-c(1),]

jutiapa_raw <- read.csv('sources/jutiapa.csv', sep=';', encoding = "UTF-8")
jutiapa_raw<-head(jutiapa_raw,-2)
jutiapa_raw <- jutiapa_raw[-c(1),]

peten_raw <- read.csv('sources/peten.csv', sep=';', encoding = "UTF-8")
peten_raw<-head(peten_raw,-2)
peten_raw <- peten_raw[-c(1),]

quetzal_raw <- read.csv('sources/quetzaltenango.csv', sep=';', encoding = "UTF-8")
quetzal_raw<-head(quetzal_raw,-2)
quetzal_raw <- quetzal_raw[-c(1),]

quiche_raw <- read.csv('sources/quiche.csv', sep=';', encoding = "UTF-8")
quiche_raw<-head(quiche_raw,-2)
quiche_raw <- quiche_raw[-c(1),]

reu_raw <- read.csv('sources/retalhuleu.csv', sep=';', encoding = "UTF-8")
reu_raw<-head(reu_raw,-2)
reu_raw <- reu_raw[-c(1),]

sacatepequez_raw <- read.csv('sources/sacatepequez.csv', sep=';', encoding = "UTF-8")
sacatepequez_raw<-head(sacatepequez_raw,-2)
sacatepequez_raw <- sacatepequez_raw[-c(1),]

san_marcos_raw <- read.csv('sources/sanMarcos.csv', sep=';', encoding = "UTF-8")
san_marcos_raw<-head(san_marcos_raw,-2)
san_marcos_raw <- san_marcos_raw[-c(1),]

santa_rosa_raw <- read.csv('sources/santaRosa.csv', sep=';', encoding = "UTF-8")
santa_rosa_raw<-head(santa_rosa_raw,-2)
santa_rosa_raw <- santa_rosa_raw[-c(1),]

solola_raw <- read.csv('sources/solola.csv', sep=';', encoding = "UTF-8")
solola_raw<-head(solola_raw,-2)
solola_raw <- solola_raw[-c(1),]

suchi_raw <- read.csv('sources/suchitepequez.csv', sep=';', encoding = "UTF-8")
suchi_raw<-head(suchi_raw,-2)
suchi_raw <- suchi_raw[-c(1),]

toto_raw <- read.csv('sources/totonicapan.csv', sep=';', encoding = "UTF-8")
toto_raw<-head(toto_raw,-2)
toto_raw <- toto_raw[-c(1),]

zacapa_raw <- read.csv('sources/zacapa.csv', sep=';', encoding = "UTF-8")
zacapa_raw<-head(zacapa_raw,-2)
zacapa_raw <- zacapa_raw[-c(1),]

all_raw <- rbind(av_raw, bv_raw, chimal_raw, capital_raw, chiqui_raw, escuintla_raw, guatemala_raw, huehue_raw, izabal_raw, jalapa_raw, jutiapa_raw, peten_raw, progreso_raw, quetzal_raw, quiche_raw, reu_raw, sacatepequez_raw, san_marcos_raw, santa_rosa_raw, solola_raw, suchi_raw, toto_raw, zacapa_raw)
#all_raw <- rbind(av_raw, bv_raw)
colnames(all_raw) <- c('localCode', 'munCode', 'dep', 'mun','name', 'address', 'cellPhone', 'supervisor', 'headmaster', 'level', 'funding', 'type', 'status', 'language', 'time', 'frequency', 'dep2')
#colnames(all_raw) <- c('localCode')
all_raw$headmaster <- tolower(all_raw$headmaster)
all_raw$dep <- tolower(all_raw$dep)
all_raw$dep2 <- tolower(all_raw$dep2)
all_raw$name <- tolower(all_raw$name)
all_raw$address <- tolower(all_raw$address)
all_raw$supervisor <- tolower(all_raw$supervisor)
all_raw$level <- tolower(all_raw$level)
all_raw$funding <- tolower(all_raw$funding)
all_raw$type <- tolower(all_raw$type)
all_raw$status <- tolower(all_raw$status)
all_raw$language <- tolower(all_raw$language)
all_raw$time <- tolower(all_raw$time)
all_raw$mun <- tolower(all_raw$mun)
all_raw$frequency <- tolower(all_raw$frequency)

base_table <- setDT(all_raw)

head(base_table)
summary(base_table)
base_table <- base_table[!(mun=='municipio'),]
base_table[,c(1,2,3,4)]
unique(base_table$mun)
nrow(base_table[mun=='',])
base_tibble <- as_tibble(base_table)
head(base_tibble)
base_tibble$dep <- as.factor(base_tibble$dep)
base_tibble$mun <- as.factor(base_tibble$mun)
base_tibble$level <- as.factor(base_tibble$level)
base_tibble$funding <- as.factor(base_tibble$funding)
base_tibble$type <- as.factor(base_tibble$type)
base_tibble$status <- as.factor(base_tibble$status)
base_tibble$language <- as.factor(base_tibble$language)
base_tibble$time <- as.factor(base_tibble$time)
base_tibble$frequency <- as.factor(base_tibble$frequency)
base_tibble$dep2 <- as.factor(base_tibble$dep2)
ggplot(base_tibble, aes(dep)) + geom_bar()


base_tibble <- base_tibble %>% as.data.frame() %>% separate(localCode, into=c('depCode', 'munCode', 'extra1', 'extra2'), sep='-')
base_tibble <- base_tibble %>% as.data.frame() %>% separate(munCode, into=c('depCode2', 'distrCode'), sep='-')
base_tibble <- as_tibble(base_tibble)
summary(base_tibble)
base_tibble[base_tibble$name == 'LICEO SECRETARIAL BILINGÜE',]