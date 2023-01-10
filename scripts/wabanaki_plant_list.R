# Script to clean the Wabanaki-used plant list

#------------------------------------------------#
####                Packages                  ####
#------------------------------------------------#
library(tidyverse)



#------------------------------------------------#
####             Read and Clean               ####
#------------------------------------------------#

## Read in and begin cleaning
first_step <- readxl::read_excel("data/inventory_wabanaki_plants.xlsx") %>% 
  mutate(extra1 = str_extract(common.name, "(^[^:]*:\\s\\w*\\s\\w*)"),
         extra2 = str_replace(common.name, "^[^:]*:\\s\\w*\\s\\w*", ""))

## Write out for manual changes
# write.csv(first_step, "data/first_step.csv", row.names = F)  


## Read the file back in and continue manipulating
second_step <- tibble(read.csv("data/first_step.csv")) %>% 
  mutate(extra2 = str_replace(extra2, "^\\s", ""),
         extra3 = str_extract(extra2, "(^[^:]*:\\s\\w*\\s\\w*)"),
         extra4 = str_replace(extra2, "^[^:]*:\\s\\w*\\s\\w*", ""))

## Write out for manual changes
# write.csv(second_step, "data/second_step.csv", row.names = F)  


## Read the file back in and continue manipulating
third_step <- tibble(read.csv("data/second_step.csv")) %>% 
  mutate(extra4 = str_replace(extra4, "^\\s", ""),
         extra5 = str_extract(extra4, "(^[^:]*:\\s\\w*\\s\\w*)"),
         extra6 = str_replace(extra4, "^[^:]*:\\s\\w*\\s\\w*", ""))

## Write out for manual changes
# write.csv(third_step, "data/third_step.csv", row.names = F)  


## Read the file back in and continue manipulating
fourth_step <- tibble(read.csv("data/third_step.csv")) %>% 
  mutate(extra6 = str_replace(extra6, "^\\s", ""),
         extra7 = str_extract(extra6, "(^[^:]*:\\s\\w*\\s\\w*)"),
         extra8 = str_replace(extra6, "^[^:]*:\\s\\w*\\s\\w*", ""))

## Write out for manual changes
# write.csv(fourth_step, "data/fourth_step.csv", row.names = F)  


## Read the file back in and continue manipulating
fifth_step <- tibble(read.csv("data/fourth_step.csv")) %>% 
  mutate(extra8 = str_replace(extra8, "^\\s", ""),
         extra9 = str_extract(extra8, "(^[^:]*:\\s\\w*\\s\\w*)"),
         extra10 = str_replace(extra8, "^[^:]*:\\s\\w*\\s\\w*", ""))

## Write out for manual changes
# write.csv(fifth_step, "data/fifth_step.csv", row.names = F)  


## Read the file back in and continue manipulating
sixth_step <- tibble(read.csv("data/fifth_step.csv")) %>% 
  mutate(extra10 = str_replace(extra10, "^\\s", ""),
         extra11 = str_extract(extra10, "(^[^:]*:\\s\\w*\\s\\w*)"),
         extra12 = str_replace(extra10, "^[^:]*:\\s\\w*\\s\\w*", "")) %>% 
  select(-extra10) %>% 
  mutate(extra12 = str_replace(extra12, "^\\s", ""),
         extra13 = str_extract(extra12, "(^[^:]*:\\s\\w*\\s\\w*)"),
         extra14 = str_replace(extra12, "^[^:]*:\\s\\w*\\s\\w*", "")) %>% 
  select(-extra12) %>% 
  mutate(extra14 = str_replace(extra14, "^\\s", ""),
         extra15 = str_extract(extra14, "(^[^:]*:\\s\\w*\\s\\w*)"),
         extra16 = str_replace(extra14, "^[^:]*:\\s\\w*\\s\\w*", "")) %>% 
  select(-extra14) %>% 
  mutate(extra16 = str_replace(extra16, "^\\s", ""),
         extra17 = str_extract(extra16, "(^[^:]*:\\s\\w*\\s\\w*)"),
         extra18 = str_replace(extra16, "^[^:]*:\\s\\w*\\s\\w*", "")) %>% 
  select(-extra16) %>% 
  mutate(extra18 = str_replace(extra18, "^\\s", ""),
         extra19 = str_extract(extra18, "(^[^:]*:\\s\\w*\\s\\w*)"),
         extra20 = str_replace(extra18, "^[^:]*:\\s\\w*\\s\\w*", "")) %>% 
  select(-extra18) %>% 
  mutate(extra20 = str_replace(extra20, "^\\s", ""),
         extra21 = str_extract(extra20, "(^[^:]*:\\s\\w*\\s\\w*)")) %>% 
  select(-extra20)

## Write out for manual changes
# write.csv(sixth_step, "data/sixth_step.csv", row.names = F) 


## Read the file back in and continue manipulating
final <- tibble(read.csv("data/sixth_step.csv")) %>% 
  filter(!is.na(extra1)) %>% 
  mutate(common.name = str_extract(extra1, "^[^:]*"),
         scientific.name = str_remove(extra1, "^[^:]*:\\s"),
         scientific.name = str_to_sentence(scientific.name)) %>% 
  select(-extra1)

## Write out the final data
write.csv(final, "outputs/wabanaki_plant_list.csv", row.names = F)






  