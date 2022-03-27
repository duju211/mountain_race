lochen <- function(df_lochen_raw) {
  df_lochen_raw |>
    group_by(id) |>
    mutate(
      time_delta = time - lag(time),
      start_date = as_date(start_date)) |>
    replace_na(list(time_delta = 0)) |>
    filter(moving) |>
    mutate(time = cumsum(time_delta)) |>
    select(-time_delta)
}