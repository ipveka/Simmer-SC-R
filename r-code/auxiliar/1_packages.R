
# Packages

if (!require("pacman")) install.packages("pacman")

# Install packages

# Utils for R

pacman::p_load(rstudioapi, devtools, utils, rJava)

# Data Wrangling

pacman::p_load(tidyverse, lubridate, janitor, tibble, data.table)

# Visualization

pacman::p_load(ggplot2, plotly)
pacman::p_load(shiny)

# Forecast / SC

pacman::p_load(forecast, simmer)

# Databases

pacman::p_load(RJDBC, DBI, RAthena)

# Other

pacman::p_load(purrr, yaml)

# Simmer

pacman::p_load(simmer, 
               simmer.plot, 
               simmer.bricks
)

#---
