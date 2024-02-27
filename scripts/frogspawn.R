#___________________________----

# SET UP ----
## An analysis of the development time of frogspawn in response to water temperature ----
#___________________________----

# PACKAGES ----
library(tidyverse)
library(performance)
#___________________________----

# IMPORT DATA ----
frogs <- read_csv("data/frogs_messy_data.csv")
#___________________________----

# TIDY DATA ----
frogs <- frogs %>% 
  rename("13" = Temperature13,
         "18" = Temperature18,
         "25" = Temperature25,
         frogspawn_id = `Frogspawn sample id`) %>% 
  pivot_longer(`13`:`25`, names_to="temperature", values_to="days") %>% 
  drop_na(days)
#___________________________----

# ANALYSIS ----
lsmodel_frogs1 <- lm(days ~ temperature, data = frogs)

summary(lsmodel_frogs1)

anova(lsmodel_frogs1)

broom::tidy(lsmodel_frogs1, conf.int = T)
#___________________________----

#check assumptions
performance::check_model(lsmodel_frogs1,
                         check = c("qq", "outliers", "homogeneity"))


