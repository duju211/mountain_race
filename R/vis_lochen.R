vis_lochen <- function(df_lochen) {
  df_lochen |>
    ggplot(
      aes(x = lng, y = lat, group = id)) +
    geom_path(alpha = 0.2) +
    theme(
      axis.ticks.x = element_blank(), legend.position = "bottom") +
    labs(x = element_blank(), y = element_blank(), color = "Activity Year")
}