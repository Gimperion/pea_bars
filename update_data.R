library(RODBC)
library(dplyr)

odbcConnect("fcc_auction") %>%
	sqlFetch("fcc_raw") %>%
	arrange(key) %>%
	subset(TRUE, c("key", "round", "price_mhz_pop", "net_surplus"))%>%
	write.csv("data.csv", row.names=FALSE)
