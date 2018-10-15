library(dplyr)

opioid_data <- read.csv("CDCOpioidData.csv", header=TRUE)
opioid_death_count_by_state <- aggregate(opioid_data$Deaths, by=list(Category=opioid_data$State), FUN=sum)

x <- opioid_death_count_by_state$x
labels <- opioid_death_count_by_state$Category
pie(x, labels)
