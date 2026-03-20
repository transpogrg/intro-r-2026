library(dplyr)
library(ggplot2)


figure_function_1 <- function(stid, measure){
  sta_x <- stations_df  |>
    filter(stationid == stid) |>
    right_join(starttime_seq, by = "starttime") |> 
    ggplot(aes(x = starttime, y = {{measure}})) +
    geom_line(color = "skyblue") +
    geom_point(color = "darkblue") +
    scale_x_datetime(
      date_breaks = "1 day",
      date_labels = "%Y-%m-%d",
      guide = guide_axis(angle = 45)
    ) +
    xlab(NULL) +
    theme_bw() +
    geom_hline(yintercept = mean(stations_df$tot_volume),
               color = "pink")
  
  sta_x  
  
}

