---
title: "Working_Data.R"
author: "Jessica Ngo (31837131)"
date: "February 2, 2018"
output: html_document
---
  
#Comments

library(tidyverse)
setwd("C:/Users/jessicango/Documents/MICB425/MICB425_portfolio")

#Command enter to enter code from top to console
#Load packages every time using library(tidyverse)
#In terminal, copy data
# cp ~/Documents/MICB425_materials/Saanich.metadata.txt ~/Documents/MICB425_portfolio

#Load data (don't forget command enter)
read.table(file="Saanich.metadata.txt")
#Save data as object in environment
metadata <- read.table(file="Saanich.metadata.txt", header=TRUE, row.names=1, sep="\t", na.strings="NAN")
read.table(file="Saanich.OTU.txt")
otu <- read.table(file="Saanich.OTU.txt", header=TRUE, row.names=1, sep="\t", na.strings="NAN")

#DAY2
library(tidyverse)
#Always rerun every time we open R
#Pipes - ctrl+shift+m (takes output from one function and feeds it to 1st argument)
#data %>% function
#function(data)
  
#Looking at oxygen in water samples, name it oxygen = 
oxygen = metadata %>% 
  select(O2_uM) 


#select all variables (in columns) that contain "O2" or "oxygen", | means or
metadata %>% 
  select(matches("O2|oxygen"))


#Filter means selecting for rows (samples) where oxygen = 0
metadata %>% 
  filter(O2_uM == 0)

# Selecting rows where O2 concentration is 0 and from there which depths 
#(which depths have no oxygen)
metadata %>% 
  filter(O2_uM == 0) %>% 
  select(Depth_m)

# Using dplyr, find at what depth(s) methane (CH4) is above 100 nM while temperature is below 10 °C. Print out a table showing only the depth, methane, and temperature data.

metadata %>% select(matches("methane|CH4"))
metadata %>% select(matches("temp"))

metadata %>% 
  filter(CH4_nM<100) %>%
  filter(Temperature_C<10) %>%
  select(Depth_m, CH4_nM, Temperature_C)
# or use an &
metadata %>% 
  filter(CH4_nM<100 & Temperature_C<10) %>%
  select(Depth_m, CH4_nM, Temperature_C)

metadata %>% 
  mutate(n2o_um = N2O_nM/1000)

# Convert all variables that are in nM to ??M. Output a table showing only the original nM and converted ??M variables
metadata %>% 
  select(matches("nm")) 

