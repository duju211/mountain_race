vis_anim_lochen_final <- function(gg_lochen_ride) {
  gg_endpoints <- gg_lochen_ride +
    geom_point(shape = 4, aes(color = as_factor(year(start_date))))
  
  gg_anim_endpoints <- vis_anim_lochen(gg_endpoints)
  
  animate(gg_anim_endpoints, fps = 7)
}