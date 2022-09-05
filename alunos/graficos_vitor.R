
# Exercicios para criar graficos

rm(list=ls()) # apaga tudo no ambiente

pacman:: p_load(ggplot2, magrittr, dplyr, vctrs, readr,
                janitor, readxl, gt, epiDisplay,
                data.table, formattable, tidyr, crosstable)

# Paths
root     <- "C:/Users/Utilizador/(Desktop/R_STP/"
input    <- paste0(root, "input/")
output   <- paste0(root, "output/")
tmp      <- paste0(root, "tmp/")
code     <- paste0(root, "code/")
alunos   <- paste0(root, "alunos/")
setwd(root)

Sys.setenv(TZ="UCT")

#########################################

# Abre a base dos alunos
load (paste0(tmp,"alunos_todos.RData"))



######################################

