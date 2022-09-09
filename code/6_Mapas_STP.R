
# Mapas
# Dia 08 de setembro de 2022
# By Vitor Pereira

rm(list=ls())

pacman:: p_load(dplyr, tidylog, ggplot2, sf)

# Paths
root     <- "C:/Users/vitor/Dropbox (Personal)/Sao Tome e Principe/2022/R_STP/"
input    <- paste0(root, "input/")
output   <- paste0(root, "output/")
tmp      <- paste0(root, "tmp/")
code     <- paste0(root, "code/")
alunos   <- paste0(root, "alunos/")
setwd(root)

# Le todas as colunas e decide quais sao numericas
col_types <- readr::cols(.default = readr::col_character())

# Acerta a hora de STP
Sys.setenv(TZ="UCT")
#########################################

# Abre as bases

base_alunos <- readRDS(paste0(tmp,"alunos_todos.RData"))

mapa_dist_STP <- st_read(paste0(input,"shapes/stp_admbnda_adm2_gadm_2020.shp"))


