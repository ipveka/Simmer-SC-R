
# Setup

# Packages: Packages for the project

source("r-code/auxiliar/packages.R")

# Auxiliar: Working directory and Secrets

source("r-code/auxiliar/auxiliar.R")

# Connections: To connect to dB

source("auxiliar/connections.R")

# Functions: Functions for the project

source("auxiliar/functions.R")

# Run

source("run/1_get_data.R")
source("run/2_calculate.R")
source("run/3_export.R")

#---
