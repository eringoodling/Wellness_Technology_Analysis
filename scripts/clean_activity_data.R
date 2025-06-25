library(dplyr)
library(readr)
library(lubridate)

activity <- read_csv("/Users/eringoodling/Documents/Wellness_Technology_Analysis/data/dailyActivity_merged.csv")

activity <- activity %>% 
  mutate(ActivityDate = mdy(ActivityDate))

write_csv(activity, "/Users/eringoodling/Documents/Wellness_Technology_Analysis/data/cleanedData/clean_activity_data.csv")
