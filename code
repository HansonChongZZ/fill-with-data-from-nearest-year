# 0. Preliminaries
library(tidyverse)
data <- tibble(
  country = c("Malaysia"),
  year = c(seq(2000,2020)),
  VARIABLE = NA
) %>% 
  mutate(VARIABLE = if_else(year == 2005,0.46,VARIABLE)) %>% 
  mutate(VARIABLE = if_else(year == 2012,0.50,VARIABLE)) %>%
  mutate(VARIABLE = if_else(year == 2015,0.54,VARIABLE)) 

# 1. TASK: Fill in data for the rest of the years that are missing using data from the nearest year for which data is available
have.nots <- data %>% filter(is.na(VARIABLE)) # subset of data that DOES NOT HAVE a value for the variable of interest
haves <- data %>% filter(is.na(VARIABLE) == F) # subset of data that DOES HAVE a value for the variable of interest

get_nearest_neighbour <- function(c, y){
  nn <- haves %>% 
    filter(country == c) %>%
    slice(
      which.min(abs(haves %>% filter(country == c) %>% pull(year) - y))
    ) %>% 
    pull(VARIABLE)
  return(nn[1])
}

have.nots <- have.nots %>% 
  mutate(VARIABLE = mapply(get_nearest_neighbour, country, year))

data <- full_join(haves, have.nots) %>% 
  arrange(year)
