--Write the Query to explore the dataset and visualize on Tableau

SELECT
	ID,
	Name AS Competitor,
	CASE
		WHEN Sex = 'M' THEN 'Male'
		WHEN Sex = 'F' THEN 'Female'
	END AS Gender, -- Better name for filter and visualization
	CASE
		WHEN Age < 18 THEN 'Under 18'
		WHEN Age BETWEEN 18 AND 30 THEN '18-30'
		WHEN Age > 30 THEN 'Over 30'
	END AS AgeGroup, -- Divide age into age group
	NOC AS Country,
	LEFT(Games,CHARINDEX(' ',Games)-1) AS Year, --Split Column to isolate Year, base on space character
	RIGHT(Games,Len(games)-CHARINDEX(' ',Games)) AS Season, --Split Column to isolate Year, base on space character
	Sport,
	Medal
FROM [olympic_games].[dbo].[athletes_event_results]
WHERE RIGHT(Games,Len(games)-CHARINDEX(' ',Games)) = 'Summer' --Retrieve data from only Summer season
