print('While 1')
x <- 0

while (x < 1000) {
  x <- x + 179
}

print(x)

print('While 2')
x <- 500

while (x > -1) {
  print(x)
  x <- x - 20
}

print('For 1')
for (i in 1:10) {
  answer <- i * 137
  print(answer)
}

print('For 2')
words <- c('Farewell', 'cruel', 'world!')
for (w in words) {
  nLetters <- nchar(w)
  blockWord <- toupper(w)
  cat(blockWord, "has", nLetters, "letters\n")
}




print('For 3')

x <- 500
c <- 0
numIterations <- (x / 20) + 1

for (i in 1:numIterations) {
  print(x)
  x <- x - 20
  c <- c + 1
}

cat('For 3 listed', c, 'numbers\n')


print('For 4')

name <- c('Alison', 'Derek', 'Tash', 'Jaci')
age <- c(44, 42, 13, 10)
df = data.frame(name, age)

# if you call your vector 'names' you need to do this:
#df$names <- as.character(df$names) # explicitly treat values as strings

n <- nrow(df)
for (r in 1:n) {
  #cat(df$names[r], 'is', df$age[r], '\n')
  print(paste0(df$name[r], ' is ', df$age[r]))
}

oldest <- df[ df$age == max(df$age), "name"]
cat('Oldest is:', oldest, '\n')

youngest <- df[ df$age == min(df$age), "name"]
cat('Youngest is:', youngest, '\n')




