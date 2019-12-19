library(jaysire)

exp_dir = file.path("starting_exp")

# pre-cleanup
if (dir.exists(exp_dir)) { 
  # recursively remove the exp dir if it's there already
  unlink(exp_dir, recursive = TRUE)
}

# get instructions
instructions <- trial_instructions(
  pages = c(
    "Welcome! Use the arrow buttons to browse these instructions.",
    "In this experiment you will solve some equations.<br><br>It is <i>very important</i> that you do your best.",
    "Press the 'Forward' button to begin!"
  ),
  show_clickable_nav = TRUE,
  post_trial_gap = 1000,
  button_label_previous = "Backward (b)", 
  button_label_next = "Forward (n)",
  key_forward = keycode('n'),
  key_backward = keycode('b'),
)

# add the first trial
trial1 <- trial_html_button_response(
  stimulus = "13 + 14 = 26",
  choices = c("true", "false"),
  post_trial_gap = 500
)

# build the experiment
build_experiment(
  timeline = build_timeline(instructions, trial1),
  path = exp_dir,
#  on_finish = fn_save_datastore()#fn_save_locally()
  on_finish = fn_save_locally()
)

# run the experiment - do this in the shell
# run_locally(exp_dir)