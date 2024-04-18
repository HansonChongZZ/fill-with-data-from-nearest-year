# Preliminaries

library(tidyverse)
data <- tibble(
  country = c("Malaysia"),
  year = c(seq(2000,2020)),
  VARIABLE = NA
) %>% 
  mutate(VARIABLE = if_else(year == 2005,0.46,VARIABLE)) %>% 
  mutate(VARIABLE = if_else(year == 2012,0.50,VARIABLE)) %>%
  mutate(VARIABLE = if_else(year == 2015,0.54,VARIABLE)) 

# TASK: Fill in data for the rest of the years that are missing using data from the nearest year for which data is available

fill_missing_values <- function(data, haves_condition, have_nots_condition, variable){

  get_nearest_neighbour <- function(c, y, variable){
      nn <- data[haves_condition, ] %>% 
        filter(country == c) %>%
        slice(
          which.min(abs(data[haves_condition, ] %>% filter(country == c) %>% pull(year) - y))
          ) %>% 
        pull(variable)
      return(nn[1])
    }

  data <- full_join(
    data[haves_condition, ],
    data[have_nots_condition, ] %>%
      mutate(filled_values = mapply(get_nearest_neighbour, country, year, variable)) %>% 
      arrange(year)
    ) 

  na_indices <- is.na(data[[variable]])
  data[[variable]][na_indices] <- data[["filled_values"]][na_indices]

  return(data %>% select(-filled_values))
}

# Trying out the function! 
fill_missing_values(YOUR_DATA, 
                    is.na(YOUR_DATA$YOUR_VARIABLE) == F,
                    is.na(YOUR_DATA$YOUR_VARIABLE), 
                    "YOUR_VARIABLE"
                    )
