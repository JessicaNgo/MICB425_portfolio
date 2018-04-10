
## @knitr setup
load("phyloseq_object.RData")
metadata <- read.table(file="Saanich.metadata.txt", header=TRUE, row.names=1, sep="\t")
otu <- read.table(file="Saanich.OTU.txt", header=TRUE, row.names=1, sep="\t", na.strings="NAN")
library(ggplot2)
library(dplyr)
library(phyloseq)
library(tidyr)

## @knitr exercise1
# exercise 1
ggplot(metadata, aes(x=PO4_uM, y=Depth_m, size=OxygenSBE_V)) +
  geom_point(color="purple", shape=24, fill="purple")
# ----

## @knitr exercise2
# exercise 2
metadata = metadata %>% 
  mutate(Temperature_F=(Temperature_C*9/5)+32)

ggplot(metadata, aes(x=Temperature_F, y=Depth_m)) + geom_point()
# ----

## @knitr exercise3
# exercise 3
physeq_percent = transform_sample_counts(physeq, function(x) 100 * x/sum(x))
plot_bar(physeq_percent, fill="Class") +
  geom_bar(aes(fill=Class), stat="identity") +
  labs(x="Sample depth", 
       y="Percent relative abundance",
       title="Classes from 10m to 200m in Saanich Inlet")
# ----

## @knitr exercise4
# exercise 4
metadata %>%   
  gather(Nutrient, uM, NH4_uM, NO2_uM, NO3_uM, O2_uM, PO4_uM, SiO2_uM) %>%   
  ggplot(aes(x=Depth_m, y=uM))+  
  geom_point() +  
  geom_line() +  
  facet_wrap(~Nutrient, scales="free_y") +  
  theme(legend.position="none")
# ----

