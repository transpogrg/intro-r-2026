library(dplyr)
library(tidyr)
library(leaflet)
library(sf)
library(tigris)

getwd()

raw_stations <- read.csv("../data/raw/stations.csv", stringsAsFactors = F)

stations_2 <- raw_stations |> 
  filter(end_date == "") |> 
  select(
    stationid,
    locationtext,
    lon,
    lat,
    milepost,
    agency
    
  )

stations_map <- stations_2 |> 
#  filter(lat != -1) |> 
  leaflet() |> 
  addProviderTiles(providers$CartoDB.Positron) |> 
  addCircleMarkers(
    lng = stations_2$lon,
    lat = stations_2$lat,
    color = "purple",
    radius = 2,
    popup =  paste("Stationid: ", stations_2$stationid, "<br>", 
                   "Description: " , stations_2$locationtext, "<br>",
                   "Agency: ", stations_2$agency, "<br>",
                   "MP: ", stations_2$milepost
                   )
  )


stations_map


va_counties <- counties(state = "VA")

va_county_map <- va_counties |> 
  leaflet() |> 
  addPolygons(
  highlightOptions = highlightOptions(color = 'white', weight = 2, 
                                      bringToFront = T),
  popup = paste(
    "NAME: ", va_counties$NAME, "<br>"
    
  )
  )    
    va_county_map
  
    
    read_sf
    
