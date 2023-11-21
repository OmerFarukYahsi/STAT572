library(tidyverse)
library(nycflights13)
library(lubridate)

h_age <- today() - ymd("1979-10-14")

h_age

as.duration(h_age)

dseconds(15)

dminutes(10)

dhours(c(12,24))

ddays(0:5)

dweeks(3)

dyears(1)


2*dyears(1)

dyears(1)+ dweeks(12) + dhours(15)

tomorrow <- today() + ddays(1)

tomorrow

last_year <- today() - dyears(1)

last_year

one_am <- ymd_hms("2026-03-08 01:00:00", tz= "America/New_york")

one_am

one_am + ddays(1)

# periods

one_am

one_am +days(1)

hours(c(12,24))

days(7)

months(1:6)

10*(months(6) + days(1))

days(50) + hours(25) + minutes(2)

ymd("24-01-01") + dyears(1)

ymd("2024-01-01") + years(1)

one_am +days(1)

one_am + ddays(1)

make_datetime_100 <- function(year, month, day, time) {
  make_datetime(year, month, day, time %% 100, time %% 100)
}


library(nycflights13)

flights_dt <- flights |> 
  filter(!is.na(dep_time), !is.na(arr_time)) |> 
  mutate (
    dep_time = make_datetime_100(year, month, day, dep_time),
    arr_time = make_datetime_100(year, month, day, arr_time),
    sched_dep_time = make_datetime_100(year, month, day, sched_dep_time),
    sched_arr_time = make_datetime_100(year, month, day, sched_arr_time)
  ) |> 
  select(origin, dest, ends_with("delay"), ends_with("time"))

flights_dt

filtered_flights <- flights_dt |>
  filter(arr_time < dep_time)

view(filtered_flights)

flights_dt <- flights_dt |> 
  mutate(
    overnight = arr_time < dep_time,
    arr_time = arr_time + days(overnight),
    sched_arr_time = sched_arr_time + days(overnight)
  )

flights_dt |>
  filter(arr_time < dep_time)

#Calculating Elapsed Time between Two Specific Dates:

start_date <- ymd("1994-12-21")

end_date <- ymd("2023-11-21")

elapsed_time <- end_date - start_date

elapsed_time #difftime class obejct

cat("Elapsed time:", as.duration(elapsed_time), "\n")

# Convert difftime to period

elapsed_period <- as.period(elapsed_time)

# Extracting components of the period

days <- day(elapsed_period)

cat("Elapsed time:", days, "days\n")


#Adding and subtracting months from a date:

future_date <- ymd("2023-05-17")

future_date_plus_3_months <- future_date + months(3)

future_date_plus_3_months

future_date_minus_2_months <- future_date - months(2)

future_date_minus_2_months

#Extracting Components of a Date and Formatting a Date:

sample_date <- ymd_hms("2023-03-15 12:30:45")

formatted_date <- format(sample_date, "%A, %B %d, %Y %I:%M %p")

formatted_date

#Adding weekly periods to vector of days:

date_vector <- c(today(), today() + days(5), today() - weeks(2))

three_weeks = weeks(3)

future_dates <- date_vector + three_weeks

future_dates

#Filtering dates based on a period condition :

date_vector <- c(today(), today() + days(5), today() - weeks(2))

filtered_dates <- date_vector[date_vector + days(3) < today()]

filtered_dates
