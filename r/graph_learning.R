#load libraries
library(dplyr)
library(ggplot2)
library(tidyr)
library(plotly)

#load clean dataset
clean_df <- readRDS("data/clean_data.rds")
  

speed_occ_fig <- clean_df |> 
  ggplot(aes(x = speed,y = occupancy, color = as.factor(detector_id))) +
  geom_point()

speed_occ_fig

#clean_df$detector_id <-as.factor(clean_df$detector_id)

speed_volume_fig2 <- clean_df |> 
  filter( detector_id < 101100) |> 
   filter(speed > 40) |>
  ggplot(aes(x = detector_id, y = volume)) +
  geom_line()

speed_volume_fig2
