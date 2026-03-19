library(dplyr)
library(tidyr)
library(ggplot2)
library(viridis)
library(plotly)
clean_df <- readRDS("../data/clean_data.rds")
detectors <- read.csv("C:/Users/VielhabG/Desktop/gittest/intro-r-2026/data/raw/detectors.csv")

#stations_unique <- detectors |>
# distinct(stationid, .keep_all = TRUE) |>  #keep all is false by default
#select(detectorid, stationid)

det <- detectors |>
  filter(end_date == "") |>
  select(detectorid, stationid)

df_stids <- clean_df |>
  left_join(det, by = c("detector_id" = "detectorid"))


stations_df <- df_stids |>
  filter(stationid <3140) |> 
  group_by(stationid, starttime) |>
  summarize(
    mean_speed = mean(speed),
    tot_volume = sum(volume),
    mean_occ = mean(occupancy)
  )
st_speed_occ_fig <- stations_df |>
  ggplot(aes(x = mean_speed, y = mean_occ)) +
  geom_point(aes(color = factor(stationid))) +
  scale_color_viridis(discrete = TRUE) + theme_bw() + facet_grid(stationid ~ .)


st_speed_occ_fig