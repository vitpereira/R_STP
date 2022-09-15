
# Puxa as bases do TEACH no kobo para fazer o monitoramento de campo
# Vitor Pereira
# 16 de fevereiro de 2022

######################################
# Referências:
# https://humanitarian-user-group.github.io/post/kobo_restapi/
# https://github.com/ppsapkota/
# https://support.kobotoolbox.org/api.html

######################################

rm(list=ls()) # Remove tudo

# Pacote novo
#install.packages("pacman")
library(pacman)
install.packages("xlsx")
pacman::p_load(devtools, httr, jsonlite, readr, openxlsx, curl, devtools, readxl)

Sys.setenv(TZ="UCT")
install.packages("glue")
#install.packages("devtools")
devtools::source_url("https://raw.githubusercontent.com/ppsapkota/kobohr_apitoolbox/master/R/r_func_ps_kobo_utils.R")

# Pacotes e livrarias
#install.packages("xlsx")
#library(xlsx)
#library(httr)     # HTTP requests 
#library(jsonlite) # for reading and writing data
#library(readr)    # to read CSV data
#library(openxlsx) # to write to excel file
#library(curl)
#library(devtools)
#library(readxl)


##### Paths #####
root    <- "C:/Users/Utilizador/Desktop/R_STP/" 
input   <- paste0(root, "input/")
output  <- paste0(root, "output/")
tmp     <- paste0(root, "tmp/")
code    <- paste0(root, "code/")

######################################

# Global values- Não altere
kobo_server_url   <-"https://kobo.humanitarianresponse.info/"
kc_server_url     <-"https://kc.humanitarianresponse.info/"

# Coloque o seu nome de usuário
kobo_user         <- "vitpereira_human"

# Coloque sua palavra passe do Kobo
kobo_pw           <- "BeAna02032112"

# Vá no Kobo, configurações da conta e busque a chave API 
apiKey            <- "cd88fdee78c5db41e0e15d93cd7dd324bb50b599"

# Rode essas duas linhas para descobrir a senha do projeto
d_formlist_csv <- kobohr_getforms_csv (url,kobo_user, kobo_pw)
d_formlist_csv <- as.data.frame(d_formlist_csv)

# Coloque aqui a senha do projeto
form_matricula_key    <-"1172066"
#teach_angola_key  <- "990872" # obtida no kobohr_getforms_csv
#form_sel_turm_key <- "987127" # obtida no kobohr_getforms_csv

url               <-"https://kc.humanitarianresponse.info/api/v1/data.csv"
#url_teach_angola  <-paste0(kc_server_url,"api/v1/data/",teach_angola_key,".csv")
#url_selecao       <-paste0(kc_server_url,"api/v1/data/",form_sel_turm_key,".csv")

# De um nome para o url do seu projeto e substitua o nome da chave (key)
url_matricula      <-paste0(kc_server_url,"api/v1/data/",form_matricula_key,".csv")

#########################

# Precisamos do código de cada formulário
# codidos_formulários <- as.data.frame(kobohr_getforms_csv (url,kobo_user, kobo_pw)) # A base mostra os codigos

######################################

# Baixa os dados
# Teach Angola e selecao das turmas

# De um nome para a base e substitua na linha a url da base
matricula_alunos_crua <- as.data.frame(kobohr_getdata_csv(url_matricula,kobo_user,kobo_pw))

#teach_angola_raw <- as.data.frame(kobohr_getdata_csv(url_teach_angola,kobo_user,kobo_pw))
#selecao_raw      <- as.data.frame(kobohr_getdata_csv(url_selecao,kobo_user,kobo_pw))

##### Base de escolas com quant de turmas ####
#base_teach_orig <- as.data.frame(read_excel(paste0(input,"Base_escolas_campo_v12 - 22-12-2021_VP.xlsx")))

##### Salva os dados ####

# Para salvar em excel, de um nome ao ficheiro, à folha e substitua o nome da base e o caminho
write.xlsx(matricula_alunos_crua, file = paste0(input, "MATRICULA.xlsx"),
           sheetName = "ALUNOS", append = FALSE)


#write.xlsx(selecao_raw, file = paste0(root, "TEACH_ANGOLA_SORTEIO.xlsx"),
#           sheetName = "SORTEIO_TURMAS", append = FALSE)

#write.xlsx(teach_angola_raw, file = paste0(root, "TEACH_ANGOLA_FORMS.xlsx"), 
#           sheetName="FORM_TEACH", append=FALSE)

# Para salvar em R, substitua o nome da base que queres salvar
saveRDS(matricula_alunos_crua, file = paste0(input,"matricula.Rds"))

#saveRDS(teach_angola_raw, file = paste0(tmp,"teach_angola_raw.Rds"))
#saveRDS(selecao_raw, file = paste0(tmp,"selecao_raw.Rds"))
#saveRDS(base_teach_orig, file = paste0(tmp, "base_teach_orig.Rds"))
#save.image(file = paste0( tmp, "image_puxa_teach.RData"))

