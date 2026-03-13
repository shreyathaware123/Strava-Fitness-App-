# ➡️ Strava Fitness Data Analysis Project

## Overview

This project analyzes user fitness and activity data inspired by the Strava fitness app. The goal is to understand user behavior, activity patterns, sleep habits, and overall health indicators using data analytics tools.

The project follows a complete data analytics workflow including data cleaning, transformation, analysis, and dashboard creation.

Tools used:

* Python (Data Cleaning & Preprocessing)
* SQL (Data Analysis)
* Power BI (Dashboard & Visualization)

---

## Project Objectives

* Analyze user activity trends such as steps, calories burned, and activity intensity.
* Study sleep patterns and recovery behavior.
* Identify relationships between activity levels, calories burned, BMI, and sleep.
* Generate business insights that can help improve engagement in fitness applications.

---

## Dataset

The dataset contains multiple activity tracking tables including:

* dailyActivity_merged.csv
* dailyCalories_merged.csv
* dailySteps_merged.csv
* dailyIntensities_merged.csv
* hourlySteps_merged.csv
* sleepDay_merged.csv
* weightLogInfo_merged.csv

Key fields:

* Id (User ID)
* ActivityDate
* TotalSteps
* Calories
* VeryActiveMinutes
* FairlyActiveMinutes
* LightlyActiveMinutes
* SedentaryMinutes
* TotalMinutesAsleep
* TotalTimeInBed
* WeightKg
* BMI

---

## Project Workflow

### 1. Data Cleaning (Python)

* Removed duplicate records
* Handled missing values
* Converted date formats
* Prepared datasets for analysis

### 2. Data Analysis (SQL)

* Created relational tables
* Joined datasets using User ID
* Calculated activity metrics
* Generated aggregated statistics

### 3. Data Visualization (Power BI)

A three-page interactive dashboard was created to present insights.

---

## Dashboard Pages

### 1. User Activity Insights

Focuses on overall activity behavior.

KPIs:

* Average Steps
* Average Sleep Minutes
* Average Calories Burned
* Average BMI
* Average Weight

Visuals:

* Daily Steps Trend
* Top Active Users
* Steps vs Calories Relationship
* Activity Intensity Distribution

---

### 2. Sleep & Recovery Insights

Analyzes sleep quality and recovery patterns.

KPIs:

* Average Sleep Minutes
* Average Time in Bed
* Sleep Efficiency
* Average BMI

Visuals:

* Sleep vs Time in Bed Comparison
* Sleep Duration vs BMI
* Calories Burned vs Sleep Duration
* Sleep Duration Trend

---

### 3. Activity Intensity Analysis

Examines activity levels across intensity categories.

KPIs:

* Avg Light Activity Minutes
* Avg Moderate Activity Minutes
* Avg Sedentary Minutes
* Avg Very Active Minutes

Visuals:

* High vs Light Activity
* Moderate vs Sedentary Activity
* Activity Distribution by Intensity
* Daily Activity Trends
* Total Steps by Day

---

## Key Business Insights

* Users average around 7–8k daily steps, slightly below the recommended 10k steps.
* Sedentary time is significantly higher than active minutes.
* Light activity contributes the majority of daily movement.
* Higher step counts are associated with higher calories burned.
* Sleep efficiency among users is generally high (~90%).
* Many users fall within the borderline overweight BMI category.
* A small percentage of users contribute to the highest activity levels.
* Sleep duration varies across users but remains close to the 7‑hour mark.

---

## Skills Demonstrated

* Data Cleaning
* Exploratory Data Analysis
* SQL Querying
* Data Modeling
* Data Visualization
* Business Insight Generation
* Dashboard Design

---

## Project Structure

```
Strava-Fitness-Analysis

│
├── Data
│   ├── dailyActivity_merged.csv
│   ├── dailyCalories_merged.csv
│   ├── dailySteps_merged.csv
│   ├── sleepDay_merged.csv
│
├── Python
│   └── data_cleaning.ipynb
│
├── SQL
│   └── analysis_queries.sql
│
├── PowerBI
│   └── fitness_dashboard.pbix
│
└── README.md
```

---

## Conclusion

This project demonstrates how fitness tracking data can be transformed into actionable insights using modern data analytics tools. The dashboard highlights key patterns in activity, sleep, and health metrics that could help fitness platforms improve user engagement and wellness outcomes.

---

## Author

Shreya Thaware

Data Analytics Project Portfolio

📧 shreyathaware9@gmail.com
🔗 [LinkedIn Profile](https://www.linkedin.com/in/shreya-thaware/) 
🌐 [Portfolio ](https://www.datascienceportfol.io/shreyathaware9)

### Below is the actual drive link of this project where you can access all the files and Dashboards I created.
#### Click on the link below, if not work then paste it into your favourite browser then good to go!
##### https://drive.google.com/drive/folders/10KlRBLM7AGprIIW2M5EN2ZFLIxybgWIG?usp=sharing

