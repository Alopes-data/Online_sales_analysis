library(dplyr)
library(readxl)
library(magrittr)
library(ggplot2)
library(corrplot)
library(tidyverse)
library(tidyr)
library(pwr)

ABC_dataset<-read_excel("ABC_Company.xlsx")
str(ABC_dataset)

#review the names of the columns
ABC_dataset
names(ABC_dataset)

#Graphical and nummerical summaries
range(regDataset$Score)
summary(regDataset$Score)
var(regDataset$Score)
sd(regDataset$Score)

#SUBJECT/variable = Shopper

#length of time on website
#ABC_dataset$`Time (min)`
summary(ABC_dataset$`Time (min)`) 
range(ABC_dataset$`Time (min)`)
sd(ABC_dataset$`Time (min)`)
var(ABC_dataset$`Time (min)`)

#number of pages viewed
#ABC_dataset$`Pages Viewed`
summary(ABC_dataset$`Pages Viewed`)
range(ABC_dataset$`Pages Viewed`)
sd(ABC_dataset$`Pages Viewed`)
var(ABC_dataset$`Pages Viewed`)

#mean amount spend per transaction
#ABC_dataset$`Amount Spent ($)`z
summary(ABC_dataset$`Amount Spent ($)`)
range(ABC_dataset$`Amount Spent ($)`)
sd(ABC_dataset$`Amount Spent ($)`)
var(ABC_dataset$`Amount Spent ($)`)

#GGPLOT
ABC_dataset %>% 
  ggplot(aes(x = `Amount Spent ($)`, y = `Day`)) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90))

#GGPLOT DAY OF THE WEEK 
#Descriptive analysis summarizing
#frequency
ABC_dataset %>%
  ggplot(aes(x = `Customer`, y = `Amount Spent ($)`)) +
  geom_point() +
  facet_wrap(~ Day)

aggregate(ABC_dataset$`Amount Spent ($)`, by=list(ABC_dataset$Day), FUN=mean)

split_ABC <- data.frame(ABC_dataset)%>%
  group_by(`Day`, `Amount Spent ($)`)%>%
  summarize(mean = mean(`Amount Spent ($)`)%>%
  ungroup()%>%
  mutate(Day = reorder(`Day`, `Amount Spent ($)`))
split_ABC
#total dollars spent
#mean amount per transaction 
#Scatter diagram/chart
#sample correlation coefficient
#TIME SPENT VS DOLLAR SPENT

#correlation coefficiant 
# Extract the numerical variables from regDataset
numericalVars <- select_if(ABC_dataset, is.numeric)
numericalVars

# Compute the correlation matrix for these variables
corrMat <- cor(numericalVars)
# Generate the correlation ellipse plot
corrplot(corrMat, method = "ellipse")

# Compute correlation
ABC_dataset %>%
  summarize(N = n(), r = cor(`Time (min)`, `Amount Spent ($)`) 

#time spent on website and dollar amount spent
 #Statistics on time spent on website
#LENGTH OF TIME x PAGES/AMOUNT SPENT PER TRANSACTION
ABC_dataset %>%
  ggplot(aes(x = `Time (min)`, y = `Amount Spent ($)`)) +
  geom_point() +
  facet_wrap(~ Day)

ABC_dataset %>%
  ggplot(aes(x = `Time (min)`, y = `Amount Spent ($)`)) +
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)

#Power ananlysis
abc_pwr <- pwr.r.test(n = , r = .5, sig.level = 0.01, power = )
plot(abc_pwr)
