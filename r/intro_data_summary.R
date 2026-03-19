#load libraries

library (dplyr)
library(tidyr)
library(ggplot2)
library(summarytools)

#packages can alsso be made into a list. dont do that though. call out each packaeg individually. easier for others


#load raw data

raw_15min <- read.csv("data/raw/agg_15min_data.csv", stringsAsFactors = FALSE)

#structre of data
str(raw_15min)

#preliminary data exploration
head(raw_min)
tail(raw_min)

summary(raw_15min)
glimpse(raw_15min)

dfSummary(raw_15min)


dfs_obj <- dfSummary(raw_15min)

#these are good at navigating lists of lists
raw_15min[2,]
raw_15min[,2]
raw_15min[2,3]

mean(raw_15min$speed)
mean(raw_15min$volume)
hist(raw_15min$volume)     
     
#crtl shift m makes the pipe
#tools global options code native pipe operator changes it
occ_20plus <- raw_15min |> 
  filter(occupancy > 20)

occ10_sp80 <-      raw_15min |> 
  filter(occupancy < 10 & speed > 80)

table(occ10_sp80$detector_id)


#working with NA's
blank_example <- raw_15min |> 
  filter(is.na(speed))

complete_df <- raw_15min |> 
  filter(!is.na(speed))

sub_det <- c(101185,101176,101179)

subset_010s80 <- occ10_sp80 |> 
  filter(detector_id %in% sub_det)

saveRDS(complete_df, "data/clean_data.rds")


