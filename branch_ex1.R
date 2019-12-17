# read in name from readline()
name <- readline(prompt='What\'s yer handle, dude? ')
nemesis <- 'King Arthur'

if (name == 'Derek') {
  # if it's me, tell me I'm awesome
  print('Man, you are deadset AWESOME!!!')
} else if (name == nemesis) {
  # if it's my nemesis, insult them
  print('Eww! Your father smelled of elderberries and your mother was a hamster!')
} else {
  # otherwise say hello
  print(paste0('Yo, ', name, ', wassup?'))
}

