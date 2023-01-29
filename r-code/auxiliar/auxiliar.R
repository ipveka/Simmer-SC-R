
# Auxiliar

# Set WD

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Read Secrets

yaml <- read_yaml("../secrets/secrets.yaml")

endpoint <- yaml$endpoint
port <- yaml$port
user <- yaml$user
pw <- yaml$pw

#---