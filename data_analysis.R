library(dplyr)
library(ggplot2)

opioid_data <- read.csv("CDCOpioidData.csv", header=TRUE)
opioid_death_count_by_state <- aggregate(opioid_data$Deaths, by=list(Category=opioid_data$State), FUN=sum)

x <- opioid_death_count_by_state$x
labels <- opioid_death_count_by_state$Category
pie(x, labels)

ggplot(opioid_death_count_by_state, aes(x=Category, y=x))
barplot(opioid_death_count_by_state$x, names.arg=opioid_death_count_by_state$Category, las=3, ylab="number of deaths")


population_by_state <- aggregate(opioid_data$Population, by=list(Category=opioid_data$State), FUN=sum)
population_by_state <- aggregate(opioid_data$Population, by=list(Category=opioid_data$State), FUN=sum)

opioid_death_count_by_state_normalized <- aggregate(opioid_data$Deaths/opioid_data$Population, by=list(Category=opioid_data$State), FUN=sum)
barplot(opioid_death_count_by_state_normalized$x, names.arg=opioid_death_count_by_state_normalized$Category, las=3, ylab="number of deaths normalized")
