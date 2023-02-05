
# Functions

# Replenish function for Simmer
# Replenishment From 1 (Source) to 2 (Destination)
# R1, R2   - Stock Level Names of 1 and 2
# IP1, IP2 - Inventory Position Names of 1 and 2
# ROP, ROQ - Reorder Point & Quantity for 2
# RT - Replenishment Time between 1 and 2
# S - If 1, then Infinite Source

Replenish <- function(R1,R2,IP1,IP2,ROP,ROQ,RT,S=0) {
  t <- trajectory() %>%
    branch(function() {
      check = ifelse(get_global(env,IP2) > ROP,0,1)
      if(S > 0 & check == 1) check = 2 
      return(check)
    }, continue = c(TRUE,TRUE),
    # When Inv Position <= ROP  & S = 0
    trajectory() %>%
      set_global(IP1,-ROQ, mod = "+") %>%
      set_global(IP2, ROQ, mod = "+") %>%
      seize(R1, ROQ) %>%
      timeout(RT) %>%
      release(R1, ROQ) %>%
      set_capacity(R1,-ROQ, mod = "+") %>%
      set_capacity(R2, ROQ, mod = "+"),
    # When Inv Position <= ROP  & S > 0
    trajectory() %>%
      set_global(IP2, ROQ, mod = "+") %>%
      timeout(RT) %>%
      set_capacity(R2, ROQ, mod = "+") 
    ) %>%
    timeout(0) 
  return(t)
}

#---