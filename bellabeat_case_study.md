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

![calories vs steps](https://github.com/user-attachments/assets/053af455-1387-4b69-9a5e-48795eb2ca92)


## Recommendations

1. **Target Early Risers:**  
   Promote features that align with morning wellness routines.

2. **Sleep-Linked Messaging:**  
   Highlight how Bellabeat devices support sleep tracking and stress reduction.

3. **Weekend Engagement Campaigns:**  
   Encourage weekend movement through gamified challenges.

4. **Cross-Product Promotion:**  
   Leverage synergies between Time, Leaf, and Spring by offering bundled usage tips in the app.

5. **Personalized Insights:**  
   Expand app features to highlight correlations between sleep, hydration, and activity for members.

---

## 🗂️ Deliverables Summary

- ✅ Clear business task summary
- ✅ Data source description and evaluation
- ✅ Cleaning and transformation documentation
- ✅ Summary of insights with visuals
- ✅ Marketing recommendations based on analysis

---

## 🌐 Portfolio Description (for Website)

> This case study explores smart device usage using public Fitbit data to help Bellabeat make strategic marketing decisions. I cleaned, analyzed, and visualized behavioral data using R and produced actionable recommendations for user engagement and product positioning.

---


