library(dplyr)
library(readr)
library(lubridate)

sleep <- read_csv("/Users/eringoodling/Documents/Wellness_Technology_Analysis/data/minuteSleep_merged.csv")

sleep <- sleep %>%
  mutate(date = mdy_hms(date),
    sleep_date = as_date(date))

sleep_summary <- sleep %>%
  filter(value == 1) %>%
  group_by(Id, sleep_date) %>%
  summarise(minutes_asleep = n(), .groups = "drop")

write_csv(sleep_summary, "/Users/eringoodling/Documents/Wellness_Technology_Analysis/data/cleanedData/sleep_summary.csv")
