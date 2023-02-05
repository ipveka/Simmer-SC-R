
# 2 - Simulate

# Create Simulation Environment

env <- simmer()

# Create Resources (Inventory)

env %>% add_resource("R Stock", R_Initial)
env %>% add_resource("W Stock", W_Initial)
env %>% add_resource("D Stock", D_Initial)
env %>% add_resource("F Stock", F_Initial)

# Create Inventory Position (IP) Parameters 

env %>% add_global("IPR", R_Initial)
env %>% add_global("IPW", W_Initial)
env %>% add_global("IPD", D_Initial)
env %>% add_global("IPF", F_Initial)

# Set Trajectory - Customers

t_Cust <- trajectory() %>%
  set_global("IPR", -1, mod = "+")  %>%
  seize("R Stock", 1) %>%
  timeout(0) %>%
  release("R Stock",1) %>%
  set_capacity("R Stock", -1, mod = "+") 

# Stock Replenishment at Retail  

t_W2R <- Replenish("W Stock","R Stock","IPW","IPR",
                   R_ROP, R_ROQ, W2R) 

# Stock Replenishment at Wholesaler

t_D2W <- Replenish("D Stock","W Stock","IPD","IPW",
                   W_ROP, W_ROQ, D2W)

# Stock Replenishment at Factory

t_F2D <- Replenish("F Stock","D Stock","IPF","IPD",
                   D_ROP, D_ROQ, F2D,1) 

# Add Arrivals

env %>% 
  add_generator("Cust ", t_Cust, Demand) %>% 
  add_generator("RScan", t_W2R,  function() {1}) %>% 
  add_generator("WScan", t_D2W,  function() {1}) %>%   
  add_generator("DScan", t_F2D,  function() {1}) 

# Run Simulation

env %>% run(until = SimTime)

# Store Results

arr = get_mon_arrivals(env)
res = get_mon_resources(env)
par = get_mon_attributes(env)

#---
