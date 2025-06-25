library(tidyverse)

df <- read_csv("/Users/eringoodling/Documents/Wellness_Technology_Analysis/data/cleanedData/sleep_activity_combined.csv")

plot_steps <- ggplot(df, aes(x = minutes_asleep, y = TotalSteps)) +
  geom_point(color = "steelblue", alpha = 0.6) +
  geom_smooth(method = "lm", color = "darkred", se = FALSE) +
  labs(title = "Minutes Asleep vs. Total Steps",
       x = "Minutes Asleep",
       y = "Total Steps") +
  theme_minimal()

ggsave("sleep_vs_steps.png", plot = plot_steps, width = 7, height = 5)

plot_calories <- ggplot(df, aes(x = minutes_asleep, y = Calories)) +
  geom_point(color = "forestgreen", alpha = 0.6) +
  geom_smooth(method = "lm", color = "orange", se = FALSE) +
  labs(title = "Minutes Asleep vs. Calories Burned",
       x = "Minutes Asleep",
       y = "Calories Burned") +
  theme_minimal()

ggsave("sleep_vs_calories.png", plot = plot_calories, width = 7, height = 5)
