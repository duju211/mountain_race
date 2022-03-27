wrong_direction <- function(df_lochen) {
  df_lochen |>
    group_by(id) |>
    summarise(start_lat = lat[time == min(time)], start_lng = lng[time == min(time)]) |>
    filter(start_lat == min(start_lat))
}