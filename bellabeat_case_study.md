# Bellabeat Case Study: How Can a Wellness Technology Company Play It Smart?

## Overview

Bellabeat is a wellness-focused tech company that designs smart products for women. This case study analyzes public Fitbit data to identify user behavior trends and provide actionable marketing insights for Bellabeat’s product ecosystem.

**Business Task:**  
Analyze smart device usage to guide Bellabeat’s marketing strategy and unlock growth opportunities.

## Data Source

**Dataset:** Fitbit Fitness Tracker Data (CC0: Public Domain)

**Contents:**
- Daily steps
- Calories burned
- Sleep patterns
- Activity intensity levels
- Heart rate

**Limitations:**
- Small sample size (30 users)
- Self-selection bias
- Inconsistent device usage: Not all users wore their Fitbit devices every day, which may result in missing or incomplete data for certain dates or activity metrics. This can impact the accuracy of trend analysis and daily averages.

## Tools & Technologies Used

- R and RStudio
- tidyverse packages:`dplyr`, `ggplot2`, `lubridate`
- Data wrangling and transformation
- Data visualization
- Git & GitHub for version control

## Data Preparation & Cleaning

- Verified dataset structure (CSV files, wide format)
- Cleaned missing or inconsistent values
- Converted timestamps and dates
- Merged relevant data tables
- Filtered for active and complete user data

## Data Analysis & Visualizations

Key questions:
1. What are the main trends in smart device usage?
2. How can these trends apply to Bellabeat’s products and users?
3. How can these findings inform a marketing strategy?

**Calories Burned vs. Total Steps**

One of the visualizations created during the analysis was a scatter plot comparing total daily steps to total daily calories burned across users. The graph revealed a linear relationship between these two variables — as users took more steps, they generally burned more calories. This trend reinforces the intuitive connection between physical activity and energy expenditure.

The visualization was created using the `ggplot2` package in R with the following code:

```r
ggplot(data, aes(x = calories, y = total_steps)) +
  geom_point(color = "purple", size = 3, alpha = 0.7) +
  labs(
    title = "Calories Burnt vs Total Steps",
    x = "Calories Burnt",
    y = "Total Steps"
  ) +
  theme_minimal()
```

<img src="https://github.com/user-attachments/assets/053af455-1387-4b69-9a5e-48795eb2ca92" alt="calories vs steps" width="600"/>

This insight is valuable for Bellabeat because it confirms that tracking steps can effectively reflect overall physical engagement. It also supports designing step-based challenges, goal-setting features, or fitness rewards in the Bellabeat app to encourage activity and drive user engagement.

**Hourly Activity**

To understand when users are most physically active, I analyzed hourly calorie data from the 30 FitBit users. I grouped the day into six 4-hour time blocks to simplify patterns in activity. 

The data was transformed and summarized using the `dplyr` package in R with the following code:

```r
df$ActivityHour <- as.POSIXct(df$ActivityHour, format = "%m/%d/%Y %I:%M:%S %p")
df$Hour <- as.numeric(format(df$ActivityHour, "%H"))

df$TimeBlock <- cut(
  df$Hour,
  breaks = c(-1, 3, 7, 11, 15, 19, 23),
  labels = c("12AM–4AM", "4AM–8AM", "8AM–12PM", "12PM–4PM", "4PM–8PM", "8PM–12AM")
)

timeblock_summary <- df %>%
  filter(!is.na(TimeBlock)) %>%
  group_by(TimeBlock) %>%
  summarise(TotalCalories = sum(Calories, na.rm = TRUE))
```
I then used this summary data to create a bar chart with `ggplot2`, which showed me that users burned the most calories during the 4 PM – 8 PM time block, suggesting this is when they are typically most active.

<img src="https://github.com/user-attachments/assets/a54dfdcb-babf-4fe3-8b55-0f488d3b658b" alt="total calories" width="600"/>




## Recommendations

