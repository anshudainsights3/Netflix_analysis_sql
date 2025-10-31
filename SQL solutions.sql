-- Netflix Project --
DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix(
		show_id	VARCHAR(10) PRIMARY KEY,
		type	VARCHAR(15),
		title	VARCHAR(115),
		director VARCHAR(220),
		casting	VARCHAR(790),
		country	VARCHAR(140),
		date_added	VARCHAR(50),
		release_year INT,
		rating  VARCHAR(20),
		duration	VARCHAR(20),
		listed_in VARCHAR(85),
		description VARCHAR(300)
		);
  SELECT * FROM netflix;

-- Business Problems --
-- Q1.Count the Number of Movies vs TV Shows
SELECT 
    type,
	COUNT(*) AS total_content
	FROM netflix
	GROUP BY type;


-- Q2.Find the Most Common Rating for Movies and TV Shows--
SELECT 
		type,
		rating,
		COUNT (*) AS total_ratings
		FROM netflix
		GROUP BY 1,2
		ORDER BY 3 DESC;


-- Q3.List All Movies Released in a Specific Year (e.g., 2020) --
SELECT * FROM netflix
WHERE type='Movie' AND release_year=2020;


-- Q4.Find the Top 5 Countries with the Most Content on Netflix
SELECT 
    country,
    total_content,
    RANK() OVER (ORDER BY total_content DESC) AS rank
FROM (
    SELECT 
        country,
        COUNT(type) AS total_content
    FROM netflix
    GROUP BY country
) AS country_content
ORDER BY rank
LIMIT 5;

-- Q5.Identify the Longest Movie --
SELECT
	title,
	CAST(REPLACE(duration,'min','') AS INTEGER) AS duration_minutes
	FROM netflix
	WHERE
	  type='Movie'
	  AND duration IS NOT NULL
	ORDER BY 
		duration_minutes DESC
	LIMIT 1;


-- Q6.Find Content Added in the Last 5 Years --
SELECT 
 	title,
	type,
	date_added
FROM netflix
WHERE
	 date_added IS NOT NULL 
	 AND TO_DATE(date_added, 'Month DD,YYYY')>=(CURRENT_DATE-INTERVAL '5 years')
ORDER BY TO_DATE(date_added,'Month DD, YYYY') DESC;


-- Q7.Find All Movies/TV Shows by Director 'Rajiv Chilaka'--
SELECT * FROM netflix 
WHERE director='Rajiv Chilaka';


-- Q8.List All TV Shows with More Than 5 Seasons --
SELECT 
    title,
    director,
    type,
    CAST(
        TRIM(
            REPLACE(REPLACE(duration, 'Seasons', ''), 'Season', '')
        ) AS INTEGER
    ) AS duration_time
FROM netflix
WHERE type = 'TV Show'
  AND CAST(
        TRIM(
            REPLACE(REPLACE(duration, 'Seasons', ''), 'Season', '')
        ) AS INTEGER
    ) >= 5;


-- Q9.Count the Number of Content Items in Each Genre --
SELECT 
	  UNNEST(STRING_TO_ARRAY(listed_in,',')) AS genre,
	  COUNT(show_id)
	  FROM netflix
	  GROUP BY 1
	  ORDER BY count(show_id) DESC;


-- Q10.Find each year and the average numbers of content release in India on netflix. --
SELECT 
		EXTRACT(YEAR FROM TO_DATE(date_added,'Month DD,YYYY')) as release_date,
		COUNT(*) as yearly_content,
		ROUND(COUNT(*)::numeric/(SELECT COUNT(*) FROM netflix WHERE country='India')::numeric * 100,2) AS average_content
		FROM netflix
		WHERE country='India'
		GROUP BY release_date
		ORDER BY average_content DESC;


-- Q11.List All Movies that are Documentaries--
SELECT * FROM netflix
WHERE listed_in LIKE '%Documentaries';


-- Q12.Find All Content Without a Director--
SELECT * FROM netflix
WHERE director IS NULL;


-- Q13.Find How Many Movies Actor 'Salman Khan' Appeared in the Last 10 Years--
SELECT * FROM netflix
		 WHERE type='Movie'
		 AND casting LIKE '%Salman Khan%'
		 AND release_year> EXTRACT(YEAR FROM CURRENT_DATE)-10;


-- Q14.Find the Top 10 Actors Who Have Appeared in the Highest Number of Movies Produced in India--
SELECT 
	  UNNEST( STRING_TO_ARRAY(casting,',')) AS actors,
	  COUNT(*)
	  FROM netflix
	  WHERE country='India'
	  AND type='Movie'
	  GROUP BY actors
	  ORDER BY COUNT(*) DESC
	  LIMIT 10;
	  

-- Q15.Categorize Content Based on the Presence of 'Kill' and 'Violence' Keywords --
SELECT 
    category,
    COUNT(*) AS content_count
FROM (
    SELECT 
        CASE 
            WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad'
            ELSE 'Good'
        END AS category
    FROM netflix
) AS categorized_content
GROUP BY category;
	   
	   
	   
		

		
		
		
	
		





