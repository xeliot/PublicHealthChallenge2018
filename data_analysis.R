library(dplyr)
library(ggplot2)

opioid_data <- read.csv("CDCOpioidData.csv", header=TRUE)
opioid_data <- transform(opioid_data, normalized_deaths=(Deaths/as.integer(Population)))


opioid_death_count_by_state <- aggregate(opioid_data$Deaths, by=list(Category=opioid_data$State), FUN=sum)
opioid_death_count_by_state_normalized <- aggregate(opioid_data$normalized_deaths, by=list(Category=opioid_data$State), FUN=sum)
opioid_death_count_by_race <- aggregate(opioid_data$Deaths, by=list(Category=opioid_data$Race), FUN=sum)
opioid_death_count_by_age <- aggregate(opioid_data$Deaths, by=list(Category=opioid_data$Five.Year.Age.Groups.Code), FUN=sum)

x <- opioid_death_count_by_state$x
labels <- opioid_death_count_by_state$Category
pie(x, labels)

barplot(opioid_death_count_by_state$x, names.arg=opioid_death_count_by_state$Category, las=3, ylab="number of deaths")
barplot(opioid_death_count_by_state_normalized$x, names.arg=opioid_death_count_by_state_normalized$Category, las=3, ylab="number of deaths normalized by population")

barplot(opioid_death_count_by_age$x, names.arg=opioid_death_count_by_age$Category, las=3, yalb="number of deaths")

a<-barplot(opioid_death_count_by_race$x, names.arg=opioid_death_count_by_race$Category, xaxt="n", ylab="number of deaths")
text(a[,1], -3.7, srt = 25, adj= 1.2, xpd = TRUE, labels = opioid_death_count_by_race$Category , cex=0.7)

population_by_state <- aggregate(opioid_data$Population, by=list(Category=opioid_data$State), FUN=sum)
population_by_state <- aggregate(opioid_data$Population, by=list(Category=opioid_data$State), FUN=sum)

opioid_death_count_by_state_normalized <- aggregate(opioid_data$Deaths/opioid_data$Population, by=list(Category=opioid_data$State), FUN=sum)
barplot(opioid_death_count_by_state_normalized$x, names.arg=opioid_death_count_by_state_normalized$Category, las=3, ylab="number of deaths normalized")
