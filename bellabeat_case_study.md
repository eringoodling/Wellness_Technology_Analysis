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

### **Calories Burned vs. Total Steps**

One of the visualizations created during the analysis was a scatter plot comparing total daily steps to total daily calories burned across users. The graph revealed a linear relationship between these two variables — as users took more steps, they generally burned more calories. This trend reinforces the intuitive connection between physical activity and energy expenditure.

The visualization was created using the `ggplot2` package in R with the following code:

```r
ggplot(data, aes(x = calories, y = total_steps)) +
  geom_point(color = "purple", size = 3, alpha = 0.7) +
  labs(
    title = "Calories Burned vs Total Steps",
    x = "Calories Burned",
    y = "Total Steps"
  ) +
  theme_minimal()
```

<p align="center">
  <img src="https://github.com/user-attachments/assets/31292eea-0421-4784-8623-147c9858c873" alt="calories vs steps" width="600"/>
</p>

This insight is valuable for Bellabeat because it confirms that tracking steps can effectively reflect overall physical engagement. It also supports designing step-based challenges, goal-setting features, or fitness rewards in the Bellabeat app to encourage activity and drive user engagement. 



### **Hourly Activity**

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

I then used this summary data to create a bar chart with `ggplot2`, which showed me that users burned the most calories during the 4 PM – 8 PM time block, suggesting this is when they are typically most active. This insight is important to the case study because it highlights the optimal time frame when users are naturally most active, helping Bellabeat tailor features like workout reminders, motivational content, or activity challenges to match peak engagement periods.

<p align="center">
  <img src="https://github.com/user-attachments/assets/a54dfdcb-babf-4fe3-8b55-0f488d3b658b" alt="total calories" width="600"/>
</p> 


### **Sleep Duration vs Physical Output**

To explore the relationship between sleep and wellness, I visualized sleep minutes compared to both steps taken and calories burnt. I combined data from the daily activity and minutes of sleep datasets in order to create scatterplots comparing steps vs sleep and calories vs sleep. 

<table>
  <tr>
    <td>
      <img src="https://github.com/user-attachments/assets/21205cef-545d-4fee-b2ea-5fd5e9d5bbb4" alt="Sleep vs Steps" width="500" height="350"/>
    </td>
    <td>
      <img src="https://github.com/user-attachments/assets/15ff021b-3b15-4a54-843c-4afaefaa01df" alt="Sleep vs Calories" width="500" height="350"/>
    </td>
  </tr>
</table>

These plots reveal that there is no strong linear correlation between sleep and either total steps or calories burned. However, many users tend to cluster around the 400–500 minutes asleep range. This insight is important for Bellabeat, as it indicates that while exercise and sleep are related, promoting better sleep may require more than just encouraging physical activity. Bellabeat could enhance its app experience by including features like mindfulness tools, wind-down routines, or personalized sleep tips. 

## Recommendations

Based on the analysis of Fitbit user data, here are several recommendations for Bellabeat:

### 1. **Leverage Peak Activity Times (4 PM – 8 PM)**
- **Insight:** Users burn the most calories in the late afternoon to early evening.
- **Recommendation:** Bellabeat should align its fitness reminders, in-app challenges, and motivational push notifications with this time block to reinforce and capitalize on users' natural peak activity periods.

### 2. **Promote Step-Based Challenges**
- **Insight:** A clear linear trend was found between steps taken and calories burned.
- **Recommendation:** Introduce step-count-based rewards, streaks, or community challenges in the app to motivate users toward daily movement goals. This gamification could improve both retention and daily engagement.

### 3. **Expand Wellness Features Beyond Exercise**
- **Insight:** No strong correlation was found between sleep and either steps taken or calories burned.
- **Recommendation:** Bellabeat should broaden its approach to sleep wellness by incorporating features such as:
  - Guided wind-down routines
  - Sleep hygiene education
  - Bedtime reminders
  - Integration of calming sounds or mindfulness practices

### 4. **Tailor Content to Sleep Patterns**
- **Insight:** Most users average around 6.5–8 hours (400–500 minutes) of sleep.
- **Recommendation:** Use this typical sleep range as a baseline to tailor personalized content or coaching. Users outside this range could receive supportive insights or targeted sleep improvement tips within the app.

### 5. **Use Data to Encourage Consistency**
- **Insight:** Inconsistencies in daily data suggest that users may not always wear their devices or stay engaged.
- **Recommendation:** Develop features that encourage routine use, such as:
  - Daily streak tracking
  - Gentle reminders if no data is recorded
  - Weekly progress reports with positive reinforcement
