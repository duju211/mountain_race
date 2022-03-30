wrong_direction <- function(df_lochen) {
  df_lat_lng_start <- df_lochen |>
    group_by(id) |>
    summarise(
      start_lat = lat[time == min(time)], start_lng = lng[time == min(time)])
  
  midway <- min(df_lochen$lat) + (max(df_lochen$lat) - min(df_lochen$lat)) / 2
  
  df_lat_lng_start |>
    filter(start_lat < midway)
}