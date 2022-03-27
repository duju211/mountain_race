save_anim <- function(gg_anim, output_path) {
  anim_save(output_path, gg_anim)
  return(output_path)
}