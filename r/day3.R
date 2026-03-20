#Load  librarie

library(
tidyr,
dplyr,
lubridate,
ggplot2
)


clean_df <- readRDS("../data/clean_data.rds")
raw_detectors <- read.csv("../data/raw/detectors.csv", stringsAsFactors = F)

#alot of graphics packages treat x axis as a character type

head(clean_df$starttime)


clean_df$starttime >ymd_hms(clean_df$starttime, tz = "US/Pacific")

#cod to pull up timezone list OlsonNames()
det_st_ids <- raw_detectors |> 
    select(
      detectorid,
      stationid
    ) |> 
  distinct() |> 
  as.data.frame


stations_df <- clean_df |> 
    left_join(det_st_ids, by = c("detector_id" = "detectorid")) |> 
                #quotes are needed in vectors. left joins are essentially elaborate INDEX/MATCH
  group_by(
    stationid,
    starttime
  ) |> 
  summarise(
    mean_speed = mean(speed),
    tot_volume = sum(volume),
    mean_occ = mean(occupancy)
  ) |> 
  as.data.frame()

sta_1059 <- stations_df  |>  
  filter(stationid == 1059) |> 
  ggplot(aes(x = starttime, y = tot_volume)) + 
  geom_line() +
  geom_point()

sta_1059
#OlsonNames()
