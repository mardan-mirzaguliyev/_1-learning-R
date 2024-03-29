# File:     04_01_Selecting.R
# Project:  LearningR

# INSTALL AND LOAD PACKAGES ################################

# pacman must already be installed; then load contributed
# packages (including pacman) with pacman
pacman::p_load(pacman, rio, tidyverse)

# LOAD AND PREPARE DATA ####################################

df <- import("StateData.xlsx") %>%
  as_tibble() %>%
  select(state_code, 
    region,
    psychRegions,
    instagram:modernDance) %>% 
  mutate(psychRegions = as.factor(psychRegions)) %>%
  # rename(y = psychRegions) %>%
  print()

# FLITER BY ONE VARIABLE ###################################

# "entrepreneur" is a quantitative variable
df %>%
  filter(entrepreneur > 1) %>%
  print()

# "region" is a character variable
df %>%
  filter(region == "South") %>%
  print()

# "psychRegions" is a factor
df %>%
  filter(psychRegions == "Relaxed and Creative") %>%
  print()

# FILTER BY MULTIPLE VARIABLES #############################

# "or" is the vertical pipe |
df %>%
  filter(region == "South" | 
      psychRegions == "Relaxed and Creative") %>%
  print()

# "and" is the ampersand &
df %>%
  filter(region == "South" & 
      psychRegions == "Relaxed and Creative") %>%
  print()

# "not" is the exclamation point !
df %>%
  filter(region == "South" & 
      !psychRegions == "Relaxed and Creative") %>%
  print()

# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear packages
p_unload(all)  # Remove all add-ons

# Clear console
cat("\014")  # ctrl+L

# Clear mind :)
