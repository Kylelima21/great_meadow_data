## General data cleaning for Kate Miller's veg, water, and soil MMI data
## Schoodic Institute at Acadia National Park

#------------------------------------------------#
####                Packages                  ####
#------------------------------------------------#
library(tidyverse)



#------------------------------------------------#
####             Read and Clean               ####
#------------------------------------------------#

## Soil MMI
tibble(read.csv("data/soilMMI_2011_and_2016.csv")) %>% 
  rename(site.name = site_name, local.id = local_id, smmi.rating = smmi_rating, notes = Notes) %>% 
  write.csv(., "outputs/soilMMI_2011_and_2016.csv", row.names = F)


## Water MMI
tibble(read.csv("data/waterMMI_2011_and_2016.csv")) %>% 
  rename(site.name = site_name, local.id = local_id, site.type = site_type, cond = COND, 
         wmmi.rating = wmmi_rating) %>% 
  write.csv(., "outputs/waterMMI_2011_and_2016.csv", row.names = F)


## Veg MMI
tibble(read.csv("data/vegMMI_2011-2023.csv")) %>% 
  rename(site.name = site_name, local.id = local_id, site.type = site_type, mean.coc = mean_C,
         inv.cov = inv_cov, bryo.cov = bryo_cov, strtol.cov = strtol_cov, vmmi.rating = vmmi_rating,
         notes = Notes) %>% 
  write.csv(., "outputs/vegMMI_2011_to_2023.csv", row.names = F)


## RAM species list
tibble(read.csv("data/RAM_spplist_2012_to_2022.csv")) %>% 
  rename(site.name = site_name, local.id = local_id, site.type = site_type, plant.code = PLANTS, 
         plot.freq = plot_freq, stress.tol = stress_tol, notes = Notes) %>% 
  write.csv(., "outputs/ram_spplist_2012_to_2022.csv", row.names = F)


## SEN and RAM species data
tibble(read.csv("data/sentinel_and_ram_species_data_2011_2022.csv")) %>% 
  rename_with(tolower) %>% 
  rename(species = latin_name, common.name = common, site.type = site_type, pct.freq = pctfreq, 
         avg.cov = ave_cov) %>% 
  write.csv(., "outputs/sen_ram_species_data_2011_2022.csv", row.names = F)


## RAM veg cover
tibble(read.csv("data/veg_cover_RAM_2012_to_2022.csv")) %>% 
  rename(site.name = site_name, local.id = local_id, site.type = site_type, plant.code = PLANTS, 
         avg.cov = avg_cov, stress.tol = stress_tol, notes = Notes) %>% 
  write.csv(., "outputs/ram_veg_cover_2012_to_2022.csv", row.names = F)


## SEN veg cover
tibble(read.csv("data/veg_cover_SEN_2011_2016_and_2021.csv")) %>% 
  rename(site.name = site_name, local.id = local_id, site.type = site_type, plant.code = PLANTS, 
         avg.cov = avg_cov, stress.tol = stress_tol, notes = Notes) %>% 
  write.csv(., "outputs/sen_veg_cover_2011_2016_2021.csv", row.names = F)




