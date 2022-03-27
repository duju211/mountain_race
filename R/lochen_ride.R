lochen_ride <- function(df_lochen, df_wrong_direction) {
  df_lochen |>
    filter(type == "Ride") |>
    anti_join(df_wrong_direction, by = "id")
}