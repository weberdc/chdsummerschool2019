library(jaysire)

# set directory (deletes any existing old experiment builds in it)
my_directory <- file.path("adv_exp")
# create the empty folder if necessary
if(dir.exists(my_directory)) {
  unlink(my_directory, recursive = TRUE)
}

# ----------- insert your stimuli here -----------

# DCW
equations <- c(
  "13 + 23 = 36",
  "17 - 9 = 6",
  "5^22 = 3",
  "1 / 0 = 2",
  "2 + 2 = 5",
  "snork + blurgh = meow"
)

statements <- c(
  "I is working hard",
  "Working hard I am",
  "I'm working hard",
  "Hard working is I"
)


# ----------- instructions -----------
instructions <- trial_instructions(
  pages = c(
    "Welcome! Use the arrow buttons to browse these instructions",
#    "Your task is to decide if an equation like '2 + 2 = 4' is true or false",
    "Your task is to decide if a sentence is grammatically acceptable",
#  "You will respond by clicking a button",
    "You will respond by moving a slider",
    "Press the 'Next' button to begin!"
  ),
  show_clickable_nav = TRUE,
  post_trial_gap = 200
)

# ----------- insert your trial template here -----------

# added by DCW
#trial_template <- trial_html_button_response(
#  stimulus = insert_variable(name = "my_stimulus"),
#  choices = c("true", "false"),
#  post_trial_gap = 1000
#)
trial_template <- trial_html_slider_response(
#  prompt = "How grammatically acceptable is these sentence? ",
  stimulus = insert_variable(name = "my_stimulus"),
  min = 1, max = 7, start = 4,
  labels = 1:7, # %>% as.character(), #c("1", "2", "3", "4", "5", "6", "7"),
  post_trial_gap = 1000
)


# ----------- insert your timeline here -----------

# DCW
trials <- build_timeline(trial_template) %>%
#  tl_add_variables(my_stimulus = equations) %>%
  tl_add_variables(my_stimulus = statements) %>%
  tl_add_parameters(randomize_order = TRUE)


# ----------- final trial -----------
finish <- trial_html_keyboard_response(
  stimulus = "All done! Press any key to finish",
  choices = respond_any_key()
)

# ----------- build the experiment -----------
build_experiment(

    # put your modified timeline here
  timeline = build_timeline(instructions, trials, finish),

  path = my_directory,
  on_finish = fn_save_locally()
)
