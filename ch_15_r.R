library(tidyverse)
library(babynames)
library(ggplot2)
###### key functions

str_detect(c("a","b","c"), "[aeiou]")

babynames |> 
  filter(str_detect(name,"x")) |> 
  count(name,wt=n, sort = TRUE)

babynames |> 
  group_by(year) |>
  summarize(prop_x = mean(str_detect(name, "x"))) |> 
  ggplot(aes(x=year, y=prop_x)) +
  geom_line()

x <- c("apple", "banana", "pear")
str_count(x, "p")


str_count("abababa", "aba")
str_view("abababa", "aba")

babynames |> 
  count(name) |> 
  mutate(
    vowels = str_count(name, "[aeiou]"),
    consonants = str_count(name, "[^aeiou]")
  )

babynames |> 
  count(name) |> 
  mutate(
    name = str_to_lower(name),
    vowels = str_count(name, "[aeiou]"),
    consonants = str_count(name, "[^aeiou]")
  )
