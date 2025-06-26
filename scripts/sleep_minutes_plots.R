library(ggplot2)
library(readr)

data <- read_csv("/Users/eringoodling/Documents/Wellness_Technology_Analysis/data/cleanedData/sleep_activity_combined_clean.csv")

ggplot(data, aes(x = minutes_asleep, y = calories)) +
  geom_point(color = "steelblue", size = 3, alpha = 0.7) +
    labs(
    title = "Sleep Minutes vs Calories Burned",
    x = "Minutes Asleep",
    y = "Calories Burned"
  ) +
  theme_minimal()

ggplot(data, aes(x = minutes_asleep, y = total_steps)) +
  geom_point(color = "seagreen", size = 3, alpha = 0.7) +
    labs(
    title = "Sleep Minutes vs Total Steps",
    x = "Minutes Asleep",
    y = "Total Steps"
  ) +
  theme_minimal()

ggplot(data, aes(x = calories, y = total_steps)) +
  geom_point(color = "purple", size = 3, alpha = 0.7) +
    labs(
    title = "Calories Burned vs Total Steps",
    x = "Calories Burned",
    y = "Total Steps"
  ) +
  theme_minimal()
