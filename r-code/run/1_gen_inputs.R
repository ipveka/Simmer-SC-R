
# 1 - Generate inputs

# Generate variables

# Parameters Required For Simulation

set.seed(3141)

# Simulation Duration

SimTime <- 120

# Reorder Point, Reorder Quantity, Stock Level for Retail

R_ROP <- 260; R_ROQ <- 600; R_Initial <- 700

# Reorder Point, Reorder Quantity, Stock Level for Wholesale

W_ROP <- 650; W_ROQ <- 1920; W_Initial <- 2040

# Reorder Point, Reorder Quantity, Stock Level for Distributor

D_ROP <- 2000; D_ROQ <- 3800; D_Initial <- 4096

# Stock Level for Factory

F_Initial <- 50000

# Customer Orders (Demand)

Demand = function() {return(1/rpois(1,100))}

# Replenishment Time In Days

W2R <- function() {return(rbinom(1,2,0.8))} # Wholesale to Retail
D2W <- function() {return(rbinom(1,5,0.8))} # Distributor to Wholesale
F2D <- function() {return(rbinom(1,10,0.8))} # Factory to Distributor

#---
