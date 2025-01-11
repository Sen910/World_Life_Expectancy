 # World Life Expectancy Project (Exploratory Data Analysis)
SELECT *
FROM world_life_expectancy;


SELECT Country, 
MIN(`Life expectancy`),
MAX(`Life expectancy`),
ROUND(MAX(`Life expectancy`)- MIN(`Life expectancy`),1) AS LIFE_INCREASE_15_YEARS
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(`Life expectancy`) <> 0
AND MAX(`Life expectancy`) <> 0
ORDER BY LIFE_INCREASE_15_YEARS ASC
;

SELECT Year,ROUND(AVG(`Life expectancy`),2)
from world_life_expectancy
WHERE`Life expectancy` <> 0
AND `Life expectancy` <> 0
GROUP BY Year 
ORDER BY Year;

SELECT Country,ROUND(AVG(`Life expectancy`),1) AS Life_Exp,ROUND(AVG(GDP),1) AS GDP
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp > 0
AND GDP > 0
ORDER BY GDP DESC
;






SELECT 
SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) HIGH_GDP_COUNT,
AVG(CASE WHEN GDP >= 1500 THEN `Life expectancy` ELSE NULL END) HIGH_GDP_Life_Expectancy,
SUM(CASE WHEN GDP <= 1500 THEN 1 ELSE 0 END) LOW_GDP_COUNT,
AVG(CASE WHEN GDP <= 1500 THEN `Life expectancy` ELSE NULL END) LOW_GDP_Life_Expectancy
FROM world_life_expectancy
;

SELECT Status,ROUND(AVG(`Life expectancy`),1)
FROM world_life_expectancy
where status <> ''
GROUP BY Status;



SELECT Status,COUNT(DISTINCT Country),ROUND(AVG(`Life expectancy`),1)  
FROM world_life_expectancy
where status <> ''
GROUP BY Status;


SELECT Country,ROUND(AVG(`Life expectancy`),1) AS Life_Exp,ROUND(AVG(BMI),1) AS BMI 
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp > 0
AND BMI > 0 
ORDER BY BMI ASC 
;


SELECT Country,
Year,
`life expectancy`,
`Adult Mortality`,
SUM(`Adult Mortality`)OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total 
FROM world_life_expectancy
WHERE Country like '%United%';