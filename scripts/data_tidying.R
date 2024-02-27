# clean environment ----
rm(list=ls())

# packages ----
library(tidyverse)
library(ggplot2)
library(janitor)

# read in data ----
frogs_messy <- read_csv("data/frogs_messy_data.csv")

#tidy data ----
head(frogs_messy)

#make column names in snake_case
frogs <- janitor::clean_names(frogs_messy)

#make column names easier to type
frogs <- rename(frogs,
                      "sample_id" = "frogspawn_sample_id",
                      "temp_13" = "temperature13",
                      "temp_18" = "temperature18",
                      "temp_25" = "temperature25")

#check new column names
colnames(frogs)

#check data format
glimpse(frogs)
#all in dbl format which is correct for numerical data

#check for duplicates
frogs %>% 
  duplicated() %>% 
  sum()
#no duplicates

#check for typos
frogs %>% 
  summarise(min=min(temp_13, na.rm=TRUE), 
            max=max(temp_13, na.rm=TRUE))

frogs %>% 
  summarise(min=min(temp_18, na.rm=TRUE), 
            max=max(temp_18, na.rm=TRUE))

frogs %>% 
  summarise(min=min(temp_25, na.rm=TRUE), 
            max=max(temp_25, na.rm=TRUE))
#nothing too outrageous 

#see how much missing data in the dataset
frogs %>% 
  is.na() %>% 
  sum()

#where are the NA's
summary(frogs)

#sample size
frogs %>% 
  summarise(n_distinct(sample_id))

#means for each temperature in a sample size of 60
frogs %>%
  summarise(n=n(),
            temp_13_mean = mean(temp_13, na.rm=TRUE),
            temp_18_mean = mean(temp_18, na.rm=TRUE),
            temp_25_mean = mean(temp_25, na.rm=TRUE))

