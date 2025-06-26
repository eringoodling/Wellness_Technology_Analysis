# Load necessary libraries
library(dplyr)
library(ggplot2)

# Load the dataset
df <- read.csv("/Users/eringoodling/Documents/Wellness_Technology_Analysis/data/hourlyCalories_merged.csv")

# Convert ActivityHour to datetime format
df$ActivityHour <- as.POSIXct(df$ActivityHour, format = "%m/%d/%Y %I:%M:%S %p")

# Extract the hour from the timestamp
df$Hour <- as.numeric(format(df$ActivityHour, "%H"))

# Create custom time blocks
df$TimeBlock <- cut(
  df$Hour,
  breaks = c(0, 4, 8, 12, 16, 20, 24),
  labels = c("12 AM - 4 AM", "4 AM - 8 AM", "8 AM - 12 PM",
             "12 PM - 4 PM", "4 PM - 8 PM", "8 PM - 12 AM"),
  include.lowest = TRUE,
  right = FALSE
)

# Group by TimeBlock and summarize total calories, removing NAs
timeblock_summary <- df %>%
  filter(!is.na(TimeBlock)) %>%
  group_by(TimeBlock) %>%
  summarise(TotalCalories = sum(Calories, na.rm = TRUE))

# Plot the bar chart
ggplot(timeblock_summary, aes(x = TimeBlock, y = TotalCalories)) +
  geom_bar(stat = "identity", fill = "purple") +
  labs(
    title = "Total Calories Burned by Time of Day (All Users, All Days)",
    x = "Time of Day",
    y = "Total Calories Burned"
  ) +
  theme_minimal()
