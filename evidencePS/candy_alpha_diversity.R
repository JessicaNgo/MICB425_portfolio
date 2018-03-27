# Load packages
library(tidyverse)

# Load data
## Data cleaning outside R
### 1. Remove rows with ambiguous bag numbers
### 2. Change all bag numbers to simply a single number
### 3. Remove rows and columns with no data
### 4. Change column names to be single variables

alpha = read.table("~/Desktop/MICB425_2018_candy_diversity.txt", sep="\t", header=TRUE)

# Varition in diversity values within groups
alpha %>% 
  ggplot() +
  geom_boxplot(aes(x=as.factor(Bag_number), y=sample_Simpson))

# Variation in diversity between groups
## Spoilers! Everyone's candy community was the same*
## *except #4... sorry!
alpha %>% 
  ggplot() +
  geom_boxplot(aes(x=as.factor(Bag_number), y=orig_Simpson))