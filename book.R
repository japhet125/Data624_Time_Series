library(fpp3)
library(tidyverse)

global_economy |>
  filter(Country == "Chad") |>
  autoplot(GDP/Population) +
  labs(title = "GDB per capita", y = '$USD')

us_retail_employment <- us_employment |>
  filter(year(Month) >= 199, Title == "Retail Trade") |>
  select(-Series_ID)
us_retail_employment

us_retail_employment |>
  model(STL(Employed ~ trend(window = 7) + season(window = "periodic"),
            robust = TRUE)) |>
  components() |>
  autoplot() + labs(title =  "US Retail Employment")
          
          

