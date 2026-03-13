Create Database Strava_Fitness;
Use Strava_Fitness;

# CREATING TABLES

-- 1. dailyActivity 

CREATE TABLE dailyActivity (
Id BIGINT,
ActivityDate VARCHAR(50),
TotalSteps INT,
TotalDistance FLOAT,
TrackerDistance FLOAT,
LoggedActivitiesDistance FLOAT,
VeryActiveDistance FLOAT,
ModeratelyActiveDistance FLOAT,
LightActiveDistance FLOAT,
SedentaryActiveDistance FLOAT,
VeryActiveMinutes INT,
FairlyActiveMinutes INT,
LightlyActiveMinutes INT,
SedentaryMinutes INT,
Calories INT
);  

-- Imported the csv  dailyActivity_merged.csv

--  Number of rows in daily Activity 
SELECT COUNT(*)  as TotalRows
FROM dailyActivity;

# Converting ActivityDate into Date
UPDATE dailyActivity
SET ActivityDate = STR_TO_DATE(ActivityDate,'%m/%d/%Y'); 

# Changing  ActivityDate column type
ALTER TABLE dailyActivity
MODIFY ActivityDate DATE;

# Display in d/mm/yyyy format 
SELECT 
DATE_FORMAT(ActivityDate,'%e/%m/%Y') AS ActivityDate
FROM dailyActivity;

-- Checking nulls
SELECT *
FROM dailyActivity
WHERE Id IS NULL
OR ActivityDate IS NULL
OR TotalSteps IS NULL
OR Calories IS NULL;

-- Checking for duplicates
SELECT Id, ActivityDate, COUNT(*) AS duplicate_count
FROM dailyActivity
GROUP BY Id, ActivityDate
HAVING COUNT(*) > 1;

-- Checking DataTypes
DESCRIBE dailyActivity; 

-- 2. dailyCalories
CREATE TABLE dailyCalories (
Id BIGINT,
ActivityDay VARCHAR(50),
Calories INT
);

-- Imported the csv dailyCalories_merged.csv

# Number of rows
SELECT COUNT(*)  as TotalRows
FROM dailyCalories;

# Checking Nulls
SELECT *
FROM dailyCalories
WHERE Id IS NULL
OR ActivityDay IS NULL
OR Calories IS NULL;

# Checking Duplicates
SELECT Id, ActivityDay, COUNT(*)
FROM dailyCalories
GROUP BY Id, ActivityDay
HAVING COUNT(*) > 1;

# Converting ActivityDay into date format
UPDATE dailyCalories
SET ActivityDay = STR_TO_DATE(ActivityDay,'%m/%d/%Y');

# Changing Datatype
ALTER TABLE dailyCalories
MODIFY ActivityDay DATE;

# Displaying ActivityDay column in d/mm/yyyy
SELECT 
Id,
DATE_FORMAT(ActivityDay,'%e/%m/%Y') AS ActivityDay,
Calories
FROM dailyCalories;

-- 3. dailyIntencities
CREATE TABLE dailyIntensities (
Id BIGINT,
ActivityDay VARCHAR(50),
SedentaryMinutes INT,
LightlyActiveMinutes INT,
FairlyActiveMinutes INT,
VeryActiveMinutes INT,
SedentaryActiveDistance FLOAT,
LightActiveDistance FLOAT,
ModeratelyActiveDistance FLOAT,
VeryActiveDistance FLOAT
); 

-- Imported the csv dailyIntencities_merged.csv

# Row count 
SELECT COUNT(*) AS total_rows
FROM dailyIntensities;

# Checking null values
SELECT *
FROM dailyIntensities
WHERE Id IS NULL
OR ActivityDay IS NULL;

# Check Duplicate Records
SELECT Id, ActivityDay, COUNT(*) AS duplicate_count
FROM dailyIntensities
GROUP BY Id, ActivityDay
HAVING COUNT(*) > 1;

# Convert ActivityDay column with /
UPDATE dailyIntensities
SET ActivityDay = STR_TO_DATE(ActivityDay,'%m/%d/%Y')
WHERE ActivityDay LIKE '%/%';

UPDATE dailyIntensities
SET ActivityDay = STR_TO_DATE(ActivityDay,'%m-%d-%Y')
WHERE ActivityDay REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$';

# Change column type
ALTER TABLE dailyIntensities
MODIFY ActivityDay DATE;

# Verify ActivityDay column
SELECT 
DATE_FORMAT(ActivityDay,'%e/%m/%Y') AS ActivityDay
FROM dailyIntensities;

# Total Rows
SELECT COUNT(*) total_rows
 FROM dailyIntensities;
 
 -- 4. dailySteps
 CREATE TABLE dailySteps (
Id BIGINT,
ActivityDay VARCHAR(50),
StepTotal INT
);

-- Imported the csv dailySteps_merged.csv

# Total rows
SELECT COUNT(*) AS total_rows
FROM dailySteps;

# Check null values
SELECT *
FROM dailySteps
WHERE Id IS NULL
OR ActivityDay IS NULL
OR StepTotal IS NULL;

# Check duplicates
SELECT Id, ActivityDay, COUNT(*)
FROM dailySteps
GROUP BY Id, ActivityDay
HAVING COUNT(*) > 1;

# Retriving ActivityDay column 
Select ActivityDay
from dailySteps;

# Change ActivityDate (/) format
UPDATE dailySteps
SET ActivityDay = STR_TO_DATE(ActivityDay,'%m/%d/%Y')
WHERE ActivityDay LIKE '%/%';

# Change ActivityDate (-) format
UPDATE dailySteps
SET ActivityDay = STR_TO_DATE(ActivityDay,'%m/%d/%Y')
WHERE ActivityDay LIKE '%/%';

# Change column type
ALTER TABLE dailySteps
MODIFY ActivityDay DATE;

# Display dailySteps with clean date format
SELECT 
Id,
DATE_FORMAT(ActivityDay,'%e/%m/%Y') AS ActivityDay,
StepTotal
FROM dailySteps;

-- 5. hourlySteps
CREATE TABLE hourlySteps (
Id BIGINT,
ActivityHour VARCHAR(50),
StepTotal INT
); 

-- -- Imported the csv  horlySteps_merges.csv

# Total rows
SELECT COUNT(*) AS total_rows
FROM hourlySteps;

# Check nulls
SELECT *
FROM hourlySteps
WHERE Id IS NULL
OR ActivityHour IS NULL
OR StepTotal IS NULL;

# Check duplicates
SELECT Id, ActivityHour, COUNT(*)
FROM hourlySteps
GROUP BY Id, ActivityHour
HAVING COUNT(*) > 1;

# Datatypes
Describe hourlySteps;

# Convert ActivityHour into (/) format
UPDATE hourlySteps
SET ActivityHour = STR_TO_DATE(ActivityHour,'%m/%d/%Y %h:%i:%s %p')
WHERE ActivityHour LIKE '%/%';

# Convert ActivityHour into (-) format
UPDATE hourlySteps
SET ActivityHour = STR_TO_DATE(ActivityHour,'%m-%d-%Y %h:%i:%s %p')
WHERE ActivityHour REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}';

# Change column type
ALTER TABLE hourlySteps
MODIFY ActivityHour DATETIME;

# Display the ActivityHour after changing the format
SELECT 
Id,
DATE_FORMAT(ActivityHour,'%e/%m/%Y %H:%i') AS ActivityHour,
StepTotal
FROM hourlySteps
LIMIT 10;

-- 6. sleepDay
CREATE TABLE sleepDay (
Id BIGINT,
SleepDay VARCHAR(50),
TotalSleepRecords INT,
TotalMinutesAsleep INT,
TotalTimeInBed INT
);

-- Imported csv sleepDay_merged.csv

# Number of rows
SELECT COUNT(*) AS total_rows
FROM sleepDay; 

# Datatypes
Describe sleepDay;

# Checking nulls
SELECT *
FROM sleepDay
WHERE Id IS NULL
OR SleepDay IS NULL;

# Checking Duplicate records
SELECT Id, SleepDay, COUNT(*)
FROM sleepDay
GROUP BY Id, SleepDay
HAVING COUNT(*) > 1;

# removing duplicates
DELETE t1
FROM sleepDay t1
JOIN sleepDay t2
ON t1.Id = t2.Id
AND t1.SleepDay = t2.SleepDay
AND t1.TotalSleepRecords = t2.TotalSleepRecords
AND t1.TotalMinutesAsleep = t2.TotalMinutesAsleep
AND t1.TotalTimeInBed = t2.TotalTimeInBed
AND t1.Id > t2.Id;

# Verifying if duplicates gone
SELECT Id, SleepDay, COUNT(*)
FROM sleepDay
GROUP BY Id, SleepDay
HAVING COUNT(*) > 1;

-- Duplicates not removed

-- Add a temporary row id column 
ALTER TABLE sleepDay
ADD COLUMN row_id INT AUTO_INCREMENT PRIMARY KEY;

# Delete Duplicates
DELETE t1
FROM sleepDay t1
JOIN sleepDay t2
ON t1.Id = t2.Id
AND t1.SleepDay = t2.SleepDay
AND t1.row_id > t2.row_id;

# verifying
SELECT Id, SleepDay, COUNT(*)
FROM sleepDay
GROUP BY Id, SleepDay
HAVING COUNT(*) > 1; 

# Rows
SELECT COUNT(*) FROM sleepDay; 

# Convert SleepDay into / format
UPDATE sleepDay
SET SleepDay = STR_TO_DATE(SleepDay,'%m/%d/%Y %h:%i:%s %p')
WHERE SleepDay LIKE '%/%';

# Change column type
ALTER TABLE sleepDay
MODIFY SleepDay DATETIME;

# Change - format
UPDATE sleepDay
SET SleepDay = STR_TO_DATE(SleepDay,'%m-%d-%Y %h:%i:%s %p')
WHERE SleepDay REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}';

# Change column type
ALTER TABLE sleepDay
MODIFY SleepDay DATETIME;

# Displaying SleepDay after changing 
SELECT 
Id,
DATE_FORMAT(SleepDay,'%e/%m/%Y %H:%i') AS SleepDay
FROM sleepDay
LIMIT 10;

-- 7. weightLogInfo.

CREATE TABLE weightLogInfo (
  Id VARCHAR(50),
  Date VARCHAR(50),
  WeightKg VARCHAR(20),
  WeightPounds VARCHAR(20),
  Fat VARCHAR(20),
  BMI VARCHAR(20),
  IsManualReport VARCHAR(10),
  LogId VARCHAR(50)
);

# Secure File Path
SHOW VARIABLES LIKE 'secure_file_priv';

-- load csv
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/weightLogInfo_merged.csv'
INTO TABLE weightLogInfo
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

# Total rows
SELECT COUNT(*) AS total_rows
FROM weightLogInfo;

-- Check data 
SELECT * 
FROM weightLogInfo
LIMIT 10;

-- Datatypes
Describe weightloginfo;

-- Replace Invalid Values
UPDATE weightLogInfo
SET WeightKg = NULL
WHERE WeightKg = '' OR WeightKg = 'NA';

UPDATE weightLogInfo
SET WeightPounds = NULL
WHERE WeightPounds = '' OR WeightPounds = 'NA';

UPDATE weightLogInfo
SET Fat = NULL
WHERE Fat = '' OR Fat = 'NA';

UPDATE weightLogInfo
SET BMI = NULL
WHERE BMI = '' OR BMI = 'NA'; 

-- Convert Columns to float
ALTER TABLE weightLogInfo
MODIFY WeightKg FLOAT,
MODIFY WeightPounds FLOAT,
MODIFY Fat FLOAT,
MODIFY BMI FLOAT; 

-- Check data values
SELECT Date
FROM weightLogInfo
LIMIT 10;

-- Converting date column values into actual date formats
UPDATE weightLogInfo
SET Date = CASE
    WHEN Date REGEXP '^[0-9]+(\\.[0-9]+)?$'
    THEN DATE_ADD('1899-12-30', INTERVAL FLOOR(CAST(Date AS DECIMAL(10,5))) DAY)
    ELSE Date
END;

-- Verify date column
SELECT Date
FROM weightLogInfo
LIMIT 10; 

-- Remove Time from Text Dates
UPDATE weightLogInfo
SET Date = SUBSTRING_INDEX(Date,' ',1)
WHERE Date LIKE '%:%'; 
 
-- Convert Date Column-- 
ALTER TABLE weightLogInfo
MODIFY Date DATETIME; 

-- Convert All Dates to Same / Format
UPDATE weightLogInfo
SET Date = DATE_FORMAT(STR_TO_DATE(Date,'%m/%d/%Y'),'%m/%d/%Y')
WHERE Date LIKE '%/%';

-- Convert Previously Converted Dates (YYYY-MM-DD) to / format
UPDATE weightLogInfo
SET Date = DATE_FORMAT(Date,'%m/%d/%Y')
WHERE Date LIKE '%-%';

-- Verify 
SELECT Date
FROM weightLogInfo
LIMIT 20;   

SELECT COUNT(*) AS final_rows
FROM weightLogInfo;

--  **Merge Activity + Sleep (Analysis Query)**
SELECT 
a.Id,
a.ActivityDate,
a.TotalSteps,
a.Calories,
s.TotalMinutesAsleep
FROM dailyActivity a
LEFT JOIN sleepDay s
ON a.Id = s.Id
AND a.ActivityDate = s.SleepDay;

# 1. Activity + Sleep Dataset 

SELECT 
a.Id,
a.ActivityDate,
a.TotalSteps,
a.Calories,
s.TotalMinutesAsleep,
s.TotalTimeInBed
FROM dailyActivity a
LEFT JOIN sleepDay s
ON a.Id = s.Id
AND a.ActivityDate = s.SleepDay;

# 2. Activity + Weight Dataset
SELECT 
a.Id,
a.ActivityDate,
a.TotalSteps,
a.Calories,
w.WeightKg,
w.BMI
FROM dailyActivity a
LEFT JOIN weightLogInfo w
ON a.Id = w.Id
AND a.ActivityDate = w.Date;

# 3. Steps + Calories Dataset
SELECT 
s.Id,
s.ActivityDay,
s.StepTotal,
c.Calories
FROM dailySteps s
LEFT JOIN dailyCalories c
ON s.Id = c.Id
AND s.ActivityDay = c.ActivityDay;

# 4. Activity + Sleep + Weight dataset
SELECT 
a.Id,
a.ActivityDate,
a.TotalSteps,
a.Calories,
s.TotalMinutesAsleep,
w.WeightKg,
w.BMI
FROM dailyActivity a
LEFT JOIN sleepDay s
ON a.Id = s.Id
AND a.ActivityDate = s.SleepDay
LEFT JOIN weightLogInfo w
ON a.Id = w.Id
AND a.ActivityDate = w.Date;

# **EDA Analysis**

# Dataset 1: Activity + Sleep Analysis

SELECT 
a.Id,
a.ActivityDate,
a.TotalSteps,
a.Calories,
s.TotalMinutesAsleep,
s.TotalTimeInBed
FROM dailyActivity a
LEFT JOIN sleepDay s
ON a.Id = s.Id
AND a.ActivityDate = s.SleepDay;

# This dataset helps answer:

-- Does sleep affect physical activity?
-- Do people who sleep more walk more?
-- Does sleep influence calories burned?

# EDA / Insight Questions

-- 1. Average Steps vs Average Sleep 

SELECT 
AVG(a.TotalSteps) AS avg_steps,
AVG(s.TotalMinutesAsleep) AS avg_sleep_minutes
FROM dailyActivity a
JOIN sleepDay s
ON a.Id = s.Id
AND a.ActivityDate = s.SleepDay;

-- Insight - Users sleep around 8514.9098 minutes on average and walk 419.1732 steps daily.

-- 2️. Users With Highest Average Sleep

SELECT 
Id,
AVG(TotalMinutesAsleep) AS avg_sleep
FROM sleepDay
GROUP BY Id
ORDER BY avg_sleep DESC
LIMIT 10;

-- Insight - Some users sleep significantly more than others, showing different sleep habits among fitness app users. 

-- 3. Users With Highest Steps
SELECT 
Id,
AVG(TotalSteps) AS avg_steps
FROM dailyActivity
GROUP BY Id
ORDER BY avg_steps DESC
LIMIT 10;

-- Insight - Top active users average significantly higher daily step counts compared to others.

-- 4. Sleep vs Steps Relationship

SELECT 
ROUND(AVG(TotalMinutesAsleep),2) AS avg_sleep,
ROUND(AVG(TotalSteps),2) AS avg_steps
FROM dailyActivity a
JOIN sleepDay s
ON a.Id = s.Id
AND a.ActivityDate = s.SleepDay;

-- Insight - There is a positive relationship between sleep duration and physical activity levels.    

-- 5. Sleep vs Calories Burned
SELECT 
ROUND(AVG(s.TotalMinutesAsleep),2) AS avg_sleep,
ROUND(AVG(a.Calories),2) AS avg_calories
FROM dailyActivity a
JOIN sleepDay s
ON a.Id = s.Id
AND a.ActivityDate = s.SleepDay;

-- Insight - Users who maintain healthy sleep durations tend to burn more calories due to higher activity levels. 


# ** Business Insights **

-- Users who sleep around 7–8 hours tend to record higher daily step counts, indicating that adequate sleep may support higher physical activity. 
-- Some users consistently sleep longer than others, which suggests different lifestyle patterns among fitness app users.
-- A small portion of users contributes to the highest step counts, indicating strong engagement with physical activities like walking or running.
-- There appears to be a positive relationship between adequate sleep and higher daily steps, suggesting that well-rested individuals may be more active.
-- Users who maintain healthy sleep durations tend to burn more calories, which likely results from increased physical activity levels.

# Dataset 2 - Activity + Weight Dataset

# This dataset helps top answer:

-- Does higher activity reduce weight or BMI?
-- Are more active users healthier?
-- Relationship between steps, calories, and BMI   

# Average Weight and BMI of Users

SELECT 
ROUND(AVG(WeightKg),2) AS avg_weight,
ROUND(AVG(BMI),2) AS avg_bmi
FROM weightLogInfo;

-- The dataset shows the average weight and BMI of users using the fitness tracking app.

# Users With Highest BMI
SELECT 
Id,
MAX(BMI) AS highest_bmi
FROM weightLogInfo
GROUP BY Id
ORDER BY highest_bmi DESC
LIMIT 10;

-- Some users have significantly higher BMI values, indicating potential health risks or lower physical activity levels.

# Users With Highest Average Steps
SELECT 
Id,
AVG(TotalSteps) AS avg_steps
FROM dailyActivity
GROUP BY Id
ORDER BY avg_steps DESC
LIMIT 10;  

-- Highly active users record the highest average daily steps, indicating strong engagement with the fitness app.

# Activity vs BMI Relationship 
SELECT 
ROUND(AVG(a.TotalSteps),0) AS avg_steps,
ROUND(AVG(w.BMI),2) AS avg_bmi
FROM dailyActivity a
JOIN weightLogInfo w
ON a.Id = w.Id;

-- Higher step counts may be associated with healthier BMI levels.

# Calories Burned vs Weight
SELECT 
ROUND(AVG(a.Calories),0) AS avg_calories,
ROUND(AVG(w.WeightKg),2) AS avg_weight
FROM dailyActivity a
JOIN weightLogInfo w
ON a.Id = w.Id;

-- Users burning more calories tend to maintain a relatively stable body weight.

# ** Business Insights **

-- The average BMI of users falls within a moderate range, suggesting that most users maintain a relatively balanced weight and health condition.
-- These users may require higher levels of physical activity or lifestyle changes to improve their health indicators.
-- Users with higher step counts demonstrate greater engagement with physical activities such as walking, running, or workouts.
-- Users who maintain higher activity levels generally tend to have healthier BMI values, suggesting that regular movement contributes to better fitness outcomes.
-- Users who burn more calories through daily activities are likely maintaining better weight management and overall fitness levels.

# Dataset 3: Steps + Calories Analysis

   # This dataset helps answer:
	-- Do more steps burn more calories?
	-- How strong is the relationship between physical activity and energy expenditure?
	-- Which users are the most active?   
    
# Average Steps and Calories

SELECT 
ROUND(AVG(StepTotal),0) AS avg_steps,
ROUND(AVG(Calories),0) AS avg_calories
FROM dailySteps s
JOIN dailyCalories c
ON s.Id = c.Id
AND s.ActivityDay = c.ActivityDay;

# Top 10 Most Active Users (Steps)
SELECT 
Id,
SUM(StepTotal) AS total_steps
FROM dailySteps
GROUP BY Id
ORDER BY total_steps DESC
LIMIT 10;

# Top 10 Highest Calories Burned
SELECT 
Id,
SUM(Calories) AS total_calories
FROM dailyCalories
GROUP BY Id
ORDER BY total_calories DESC
LIMIT 10;

# Daily Steps vs Calories Relationship
SELECT 
ROUND(AVG(StepTotal),0) AS avg_steps,
ROUND(AVG(Calories),0) AS avg_calories
FROM dailySteps s
JOIN dailyCalories c
ON s.Id = c.Id
AND s.ActivityDay = c.ActivityDay;

# Highest Single-Day Activity
SELECT 
Id,
MAX(StepTotal) AS max_steps
FROM dailySteps
GROUP BY Id
ORDER BY max_steps DESC
LIMIT 10;

# ** Business Insights**

-- Users who maintain a moderate level of daily steps tend to burn a consistent amount of calories, indicating that daily walking and movement contribute significantly to overall energy expenditure. 
-- The users represent the most physically active individuals on the platform and likely engage in regular fitness activities such as walking, running, or workouts.
-- Higher calorie burn is generally associated with higher levels of physical activity, suggesting that step count plays a major role in overall calorie expenditure.
-- There is a positive relationship between the number of steps taken and calories burned, indicating that increased physical activity leads to greater energy expenditure.
-- Certain users shows exceptionally high daily activity levels, which may correspond to intense physical activities such as long-distance walking, running, or fitness challenges.
 