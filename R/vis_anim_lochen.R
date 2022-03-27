vis_anim_lochen <- function(gg_lochen) {
  gg_lochen +
    transition_reveal(along = time)
}