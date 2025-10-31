## Netflix Movies and TV Shows Analysis(SQL Project)

##Overview
This project performs a comprehensive analysis of Netflix's movies and TV shows dataset using SQL.
The goal is to extract meaningful business insights and understand the distribution, trends, and characteristics of Netflix’s content library.

#Objectives
Analyze the distribution of Movies vs. TV Shows
Identify the most common ratings
Examine content distribution across years and countries
Determine the longest movies and top-performing countries
Explore content trends, directors, and genres
Derive insights into keyword-based categorization

#Dataset
The dataset used in this analysis was sourced from Kaggle.
It contains detailed information about Netflix’s available titles.
Dataset Link: https://www.kaggle.com/datasets/shivamb/netflix-shows

#Schema
DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix (
    show_id      VARCHAR(10) PRIMARY KEY,
    type         VARCHAR(15),
    title        VARCHAR(115),
    director     VARCHAR(220),
    casting      VARCHAR(790),
    country      VARCHAR(140),
    date_added   VARCHAR(50),
    release_year INT,
    rating       VARCHAR(20),
    duration     VARCHAR(20),
    listed_in    VARCHAR(85),
    description  VARCHAR(300)
);

#Business Problems:
1.Count the Number of Movies vs TV Shows
→ Determine the distribution of content types on Netflix.

2.Find the Most Common Rating for Movies and TV Shows
→ Identify the most frequently occurring rating for each type of content.

3.List All Movies Released in a Specific Year (e.g., 2020)
→ Retrieve all movies released in a specific year.

4.Find the Top 5 Countries with the Most Content on Netflix
→ Identify the countries that contribute the most content on Netflix.

5.Identify the Longest Movie
→ Find the movie with the longest duration.

6.Find Content Added in the Last 5 Years
→ Retrieve all content added to Netflix within the last five years.

7.Find All Movies/TV Shows by Director 'Rajiv Chilaka'
→ List all content directed by Rajiv Chilaka.

8.List All TV Shows with More Than 5 Seasons
→ Identify TV shows that have more than five seasons.

9.Count the Number of Content Items in Each Genre
→ Calculate the number of content items for every genre category.

10.Find Each Year and the Average Number of Content Releases in India
→ Return the top 5 years with the highest average content release from India.

11.List All Movies that are Documentaries
→ Retrieve all movies categorized as documentaries.

12.Find All Content Without a Director
→ List all shows and movies that have no director listed.

13.Find How Many Movies Actor 'Salman Khan' Appeared in the Last 10 Years
→ Count the number of Salman Khan movies released in the last decade.

14.Find the Top 10 Actors Who Have Appeared in the Highest Number of Movies Produced in India
→ Identify the top 10 Indian actors with the most movie appearances.

15.Categorize Content Based on the Presence of 'Kill' and 'Violence' Keywords
→ Classify content as ‘Good’ or ‘Bad’ depending on the description keywords.

#Findings & Conclusion
Movies form the majority of Netflix’s content library.
The U.S. and India contribute the highest number of titles.
TV-MA and TV-14 are the most common ratings.
The dataset reveals trends in content type, genres, and global distribution.
