
# Packages

# Version: R version 4.2.2 (2022-10-31) -- "Innocent and Trusting"

if (!require("pacman")) install.packages("pacman")

# Install packages

# Utils for R

pacman::p_load(rstudioapi, devtools, utils, rJava)

# Data Wrangling

pacman::p_load(tidyverse, lubridate, janitor, tibble)

# Visualization

pacman::p_load(ggplot2, plotly)
pacman::p_load(shiny)

# Forecast / SC

pacman::p_load(forecast)

# Databases

pacman::p_load(RJDBC, DBI, RAthena)

# Other

pacman::p_load(purrr, yaml)

#---
