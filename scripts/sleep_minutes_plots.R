library(ggplot2)
library(readr)

data <- read_csv("/Users/eringoodling/Documents/Wellness_Technology_Analysis/data/cleanedData/sleep_activity_combined_clean.csv")

ggplot(data, aes(x = minutes_asleep, y = calories)) +
  geom_point(color = "steelblue", size = 3, alpha = 0.7) +
    labs(
    title = "Sleep Minutes vs Calories Burnt",
    x = "Minutes Asleep",
    y = "Calories Burnt"
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
    title = "Calories Burnt vs Total Steps",
    x = "Calories Burnt",
    y = "Total Steps"
  ) +
  theme_minimal()
