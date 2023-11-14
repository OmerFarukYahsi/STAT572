library(readxl)
library(tidyverse)
library(writexl)

students <- read_excel("students.xlsx")
students

read_excel(
  "students.xlsx",
  col_names = c("student_id", "full_name", "favourite_food", "meal_plan", "age")
)

read_excel(
  "students.xlsx",
  col_names = c("student_id", "full_name", "favourite_food", "meal_plan", "age"),
  skip = 1
)


read_excel(
  "students.xlsx",
  col_names = c("student_id", "full_name", "favourite_food", "meal_plan", "age"),
  skip = 1,
  na = c("", "N/A")
)

read_excel(
  "students.xlsx",
  col_names = c("student_id", "full_name", "favourite_food", "meal_plan", "age"),
  skip = 1,
  na = c("", "N/A"),
  col_types = c("numeric", "text", "text", "text", "numeric")
)

students <- read_excel(
  "students.xlsx",
  col_names = c("student_id", "full_name", "favourite_food", "meal_plan", "age"),
  skip = 1,
  na = c("", "N/A"),
  col_types = c("numeric", "text", "text", "text", "text")
)

students <- students |>
  mutate(
    age = if_else(age == "five", "5", age),
    age = parse_number(age)
  )

students

read_excel("penguins.xlsx", sheet = "Torgersen Island")

penguins_torgersen <- read_excel("penguins.xlsx", sheet = "Torgersen Island", na = "NA")

penguins_torgersen

excel_sheets("penguins.xlsx")

penguins_biscoe <- read_excel("penguins.xlsx", sheet = "Biscoe Island", na = "NA")
penguins_dream  <- read_excel("penguins.xlsx", sheet = "Dream Island", na = "NA")

dim(penguins_torgersen)
dim(penguins_biscoe)
dim(penguins_dream)

penguins <- bind_rows(penguins_torgersen, penguins_biscoe, penguins_dream)
penguins

deaths_path <- readxl_example("deaths.xlsx")
deaths <- read_excel(deaths_path)
deaths

read_excel(deaths_path, range = "A5:F15")
