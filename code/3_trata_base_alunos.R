
rm(list=ls())

pacman:: p_load(magrittr, dplyr, vctrs, readr,
                janitor, readxl, gt, epiDisplay, tidylog,
                data.table, formattable, tidyr, crosstable)

# Paths
root     <- "C:/Users/vitor/Dropbox (Personal)/Sao Tome e Principe/2022/Boletim_estatisco/"
input    <- paste0(root, "input/")
output   <- paste0(root, "output/")
tmp      <- paste0(root, "tmp/")
code     <- paste0(root, "code/")
alunos   <- paste0(root, "alunos/")
setwd(root)

# Le todas as colunas e decide quais sao numericas
col_types <- readr::cols(.default = readr::col_character())

#########################################

load (paste0(tmp,"alunos_todos.RData"))