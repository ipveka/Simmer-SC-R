
# Auxiliar

# Read Secrets

yaml <- yaml::read_yaml("secrets/secrets.yaml")

endpoint <- yaml$endpoint
port <- yaml$port
user <- yaml$user
pw <- yaml$pw

#---