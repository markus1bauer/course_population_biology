# Course population biology
# Pulsatilla patens ####

# Markus Bauer
# 2023-10-09

### Packages ###
library(here)
library(tidyverse)
library(renv)
library(ggbeeswarm)

### Start ###
rm(list = ls())
renv::status()


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# A Load data ##################################################################
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



#Röder & Kiehl (2006) https://doi.org/10.1016/j.flora.2005.11.001

pulsatilla <- read_csv(
  here("data", "data_raw_pulsatilla_patens.csv"),
  col_names = TRUE,
  na = c("", "NA", "na"),
  col_types =
    cols(
      .default = "?"
    )
) %>%
  pivot_longer(
    seedlings | juveniles | adults | flowering,
    names_to = "stage",
    values_to = "n"
  ) %>%
  mutate(
    stage = factor(stage),
    stage = fct_relevel(stage, "seedlings", "juveniles", "adults", "flowering")
  )




#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# B Analyses ###################################################################
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



## 1 Data exploration ##########################################################


### a Graphs of raw data -------------------------------------------------------

pulsatilla %>%
  ggplot(aes(x = stage, y = n)) +
  geom_boxplot() +
  ggbeeswarm::geom_quasirandom()

m1 <- glm(n ~ stage, data = pulsatilla, family = poisson(link = "log"))



  
