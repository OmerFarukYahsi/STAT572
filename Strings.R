
#Strings
library(tidyverse)

string1 <- "This is a string"
string2 <- 'If want to include "quote" inside a string'

double_quote <- "\"" #or '"'
single_quote <- '\'' #or "'"

backslash <- "\\"

x <- c(single_quote, double_quote, backslash)
x
str_view(x)

#tricky <- "double_qoute <- \"\\\"\" # or '\"'
#single_quote <- '\\'' # or \"'\""

#str_view(tricky)

#r"()
#r"---()---"



x <- c("one\ntwo", "one\ttwo", "\u00b5", "\U0001f604")
x
str_view(x)

string3 <- "He said \"That\'s amazing!\""
str_view(string3)

a2 <- "\\a\\b\\c\\d\\"
str_view(a2)

#str_c()

str_c("x", "y")
str_c("x", "y", "pizza")
str_c("Hello", c("Kemal","Maya"))

df <- tibble(name = c("Flora", "David", "Terra", NA))
df |> mutate(greeting = str_c("Hi ", name, "!"))


df |> 
  mutate(
    greeting1 = str_c("Hi ", coalesce(name, "you"), "!"),
    greeting2 = coalesce(str_c("Hi ", name, "!"), "Hi!")
  )

# str_glue

df |> 
  mutate(greeting = str_glue("Hi {name}!"))

df |> 
  mutate(greeting = str_glue("{{Hi {name}!}}"))


# str_flatten

str_flatten(c("x", "y", "z"), ",", last= ", and ")

library(tibble)

df <- tribble(
  ~name, ~fruit,
  "Carmen", "banana",
  "Carmen", "apple",
  "Marvin", "nectarine",
  "Terence", "cantaloupe",
  "Terence", "papaya",
  "Terence", "mandarin"
)

df |> 
  group_by(name) |> 
  summarize(fruits = str_c("likes ", str_flatten(fruit, ",")))

#Exercise
# Compare and contrast the results of paste0() with str_c()
# for the following inputs:

str_c("hi ", NA)
str_c(letters[1:2], letters[1:3])

paste0("hi ", NA)
str_c("hi ", NA)

paste0(letters[1:2], letters[1:3])
str_c(letters[1:2], letters[1:3])

