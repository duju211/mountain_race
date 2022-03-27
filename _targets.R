source("libraries.R")

walk(dir_ls("R"), source)

list(
  tar_target(
    lochen_path,
    "https://github.com/duju211/pin_strava/blob/master/lochen.rds?raw=true"),
  tar_target(df_lochen_raw, read_rds(lochen_path), cue = tar_cue("always")),
  tar_target(df_lochen, lochen(df_lochen_raw)),
  
  tar_target(gg_lochen, vis_lochen(df_lochen)),
  tar_target(gg_anim_lochen, vis_anim_lochen(gg_lochen)),
  tar_target(
    gif_anim_lochen,
    save_anim(gg_anim_lochen, "anim_lochen.gif"), format = "file"),
  tar_target(df_wrong_direction, wrong_direction(df_lochen)),
  tar_target(df_lochen_ride, lochen_ride(df_lochen, df_wrong_direction)),
  tar_target(gg_lochen_ride, vis_lochen(df_lochen_ride)),
  tar_target(gg_anim_lochen_ride, vis_anim_lochen(gg_lochen_ride)),
  tar_target(
    gif_anim_lochen_ride,
    save_anim(gg_anim_lochen_ride, "anim_lochen_ride.gif"),
    format = "file"),
  tar_target(gg_anim_lochen_ride_final, vis_anim_lochen_final(gg_lochen_ride)),
  tar_target(
    gif_anim_lochen_ride_final,
    save_anim(gg_anim_lochen_ride_final, "anim_lochen_ride_final.gif")),
  
  
  tar_render(mountain_race_report, "mountain_race.Rmd"),
  tar_render(
    mountain_race_post, "mountain_race.Rmd",
    output_format = distill::distill_article(),
    output_file = "mountain_race_post.html"),
  tar_render(
    mountain_race_readme, "mountain_race.Rmd",
    output_format = "md_document", output_file = "README.md")
)
