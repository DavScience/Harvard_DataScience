#' Author: Ted Kwartler
#' Date: 6-30-2024
#' Purpose: Cereal EDA
#' 

# libs
library(radiant.data) #Beginners only
library(DataExplorer) #Beginners only

# Data look up on github
cereal <- read.csv('https://raw.githubusercontent.com/kwartler/teaching-datasets/main/Cereals.csv')

# What's the overall structure  & dimensions of the data?
str(cereal)
dim(cereal)

# Data set class
class(cereal)

# Classes for each column
sapply(cereal, class)

# Look at the top 6 rows
head(cereal,6)

# How many different brand names?
nlevels(as.factor(cereal$name))
# Or
length(unique(cereal$name))

# What are the column names?
names(cereal)

# Summary stats for each vector
summary(cereal)

# What's the relationship between protein and sugar?
cor(cereal$protein,cereal$sugars, use = 'complete.obs') # use='complete,obs' is necessary to avoid NAs in the original DF

# Who are the unique manufacturers?
unique(cereal$mfr)
table(cereal$mfr)
                            
# Avg calories?
mean(cereal$calories)
median(cereal$calories)

# Number missing values?
colSums(is.na(cereal))


# Sampling 5 row example (nonsense w/data this size but good to know how):
set.seed(123)
idx <- sample(1:nrow(cereal),  5 )
cereal[idx, ]

# Sample 10 rows
# What is the first name with seed 1234
set.seed(123)
idx <- sample(1:nrow(cereal),  10 )
cereal[idx, ]

# DataExplorer
plot_intro(cereal)
plot_missing(cereal)
plot_histogram(cereal$protein) 
plot_density(cereal$calories) 
plot_histogram(cereal)#time consuming for bigger data 
plot_density(cereal)#time consuming for bigger data 
plot_scatterplot(cereal, by='rating') #time consuming for bigger data 

# radiant.data
# example video: https://radiant-rstats.github.io/radiant.data/
radiant.data::radiant.data()

# End