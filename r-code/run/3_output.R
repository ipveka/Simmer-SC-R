
# 3 - Outputs

# Plot Stock Levels

x1 = subset(res, resource == "R Stock")$time
y1 = subset(res, resource == "R Stock")$capacity
x2 = subset(res, resource == "W Stock")$time
y2 = subset(res, resource == "W Stock")$capacity
x3 = subset(res, resource == "D Stock")$time
y3 = subset(res, resource == "D Stock")$capacity

plot(c(0,x1), c(R_Initial,y1), type = "s", col = "blue", 
     ylim = c(min(y1,y2,y3),max(y1,y2,y3)),
     xlab = "time", ylab = "units", lwd = 2)
lines(c(0,x2), c(W_Initial,y2), type = "s", col = "firebrick2", lwd = 2)
lines(c(0,x3), c(D_Initial,y3), type = "s", col = "darkgreen", lwd = 2)

# Plot Flow Times

plot(arr, metric = "flow_time")
plot(subset(arr,substr(name,1,5) == "RScan"), metric = "flow_time")
plot(subset(arr,substr(name,1,5) == "WScan"), metric = "flow_time")
plot(subset(arr,substr(name,1,4) == "Cust"), metric = "flow_time")

# Plot Resource Utilisation

plot(res, metric = "utilization")

# Plot Resource Usage

plot(res, metric = "usage", "R Stock")
plot(res, metric = "usage", "W Stock", items = "server")
plot(res, metric = "usage", 
     c("R Stock","W Stock","D Stock"),
     items = "server", steps = TRUE)

# Plot Flow Times - for DScans

plot(subset(arr,substr(name,1,5) == "DScan"), metric = "flow_time")

#---
