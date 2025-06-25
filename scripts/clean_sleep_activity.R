library(tidyverse)
library(janitor)

input_path <- "/Users/eringoodling/Documents/Wellness_Technology_Analysis/data/cleanedData/sleep_activity_combined.csv"

df <- read_csv(input_path) %>%
  clean_names()

df_clean <- df %>%
  drop_na()

output_path <- "/Users/eringoodling/Documents/Wellness_Technology_Analysis/data/cleanedData/sleep_activity_combined_clean.csv"

write_csv(df_clean, output_path)
