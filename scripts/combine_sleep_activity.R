library(readr)
library(dplyr)

sleep_summary <- read_csv("/Users/eringoodling/Documents/Wellness_Technology_Analysis/data/cleanedData/sleep_summary.csv")
activity <- read_csv("/Users/eringoodling/Documents/Wellness_Technology_Analysis/data/cleanedData/clean_activity_data.csv")

combined_factors <- left_join(sleep_summary, activity,
                              by = c("Id" = "Id", "sleep_date" = "ActivityDate"))

write_csv(combined_factors, "/Users/eringoodling/Documents/Wellness_Technology_Analysis/data/cleanedData/sleep_activity_combined.csv")