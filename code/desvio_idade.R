

# Exercicios para criar graficos

rm(list=ls()) # apaga tudo no ambiente

pacman:: p_load(ggplot2, dplyr, tidylog)

# Paths
root     <- "C:/Users/Utilizador/Desktop/R_STP/"
input    <- paste0(root, "input/")
output   <- paste0(root, "output/")
tmp      <- paste0(root, "tmp/")
code     <- paste0(root, "code/")
alunos   <- paste0(root, "alunos/")
setwd(root)

Sys.setenv(TZ="UCT")

#########################################

# Abre a base dos alunos
base_alunos <- readRDS(paste0(tmp,"alunos_todos.rData"))


base_graf1 <- base_alunos %>% 
  mutate(idade_ideal=classe+5) %>% 
  mutate(desvio_idade= idade-idade_ideal) %>% 
  group_by(classe, distrito) %>% 
  summarise(media_desvio_idade=mean(desvio_idade)) 

grafico1<- base_graf1 %>% 
  ggplot(aes(
    x=classe, 
    y=media_desvio_idade, 
    color=distrito)) +
  geom_line()+
  geom_point() +
 labs(title="Desvio da idade ideal por classe")+
 xlab("classe")


grafico1


