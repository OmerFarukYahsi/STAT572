
library(tidyverse)
library(babynames)
?babynames
head(babynames)

#sparating into rows

df1 <- tibble(x = c("a,b,c", "d,e", "f"))
df1

df1 |> 
  separate_longer_delim(x, delim = ",")

df2 <- tibble(x= c("1211", "131", "21"))
df2 |> 
  separate_longer_position(x, width = 1)

#separating into columns

df3 <- tibble(x = c("a10.1.2022", "b10.2.2011", "e15.1.2015"))
df3 |> 
  separate_wider_delim(
    x,
    delim = ".",
    names = c("code", "edition", "year")
  )

df3 |> 
  separate_wider_delim(
    x,
    delim = ".",
    names = c("code", NA, "year")
  )

df4 <- tibble(x = c("202215TX", "202122LA", "202325CA"))
df4 |> 
  separate_wider_position(
    x,
    widths = c(year=4, age=2, state=2)
   )


#Diagnosing widening problems


df <- tibble(x = c("1-1-1", "1-1-2", "1-3", "1-3-2", "1"))
df |> 
  separate_wider_delim(
    x,
    delim = "-",
    names = c("x", "y", "z")
  )

debug <- df |> 
  separate_wider_delim(
    x,
    delim = "-",
    names = c("x", "y", "z"),
    too_few = "debug"
  )

debug
debug |> filter(!x_ok)


df |> 
  separate_wider_delim(
    x,
    delim = "-",
    names = c("x", "y", "z"),
    too_few = "align_start"
  )


df <- tibble(x = c("1-1-1", "1-1-2", "1-3-5-6", "1-3-2", "1-3-5-7-9"))
df |> 
  separate_wider_delim(
    x,
    delim ="-",
    names = c("x", "y", "z")
  )

debug <- df |> 
  separate_wider_delim(
    x,
    delim ="-",
    names = c("x", "y", "z"),
    too_many = "debug"
  )

debug |> filter(!x_ok)

df |> 
  separate_wider_delim(
    x,
    delim ="-",
    names = c("x", "y", "z"),
    too_many = "merge"
  )

#Letters 

str_length(c("a", "R for data science", NA))

babynames |> 
  count(length = str_length(name), wt=n)

babynames |> 
  filter(str_length(name) == 15) |> 
  count(name, wt=n, sort=TRUE)

#subsetting

x <- c("Apple", "Banana", "Pear")
x

str_sub(x, 1,3)
str_sub(string, start, end)

str_sub(x, -3, -1)

str_sub("a", 1, 5)


#Use str_sub() and mutate() to find the first and last letter of each name: babynames

# Use mutate() and str_sub() to create new columns for the first and last letters
babynames <- babynames |> 
  mutate(
    first_letter = str_sub(name, 1, 1),
    last_letter = str_sub(name, -1, -1)
    )

babynames

babynames <- babynames |> 
  mutate(
    middle_letter = ifelse(str_length(name) %% 2 == 0,
                                str_sub(name, str_length(name) / 2, str_length(name) / 2 + 1),
                                str_sub(name, (str_length(name) + 1) / 2, (str_length(name) + 1) / 2))
    )

print(babynames)









