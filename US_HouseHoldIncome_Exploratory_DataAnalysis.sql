#US_HouseHoldIncome_Exploratory_DataAnalysis


SELECT *
from us_project.us_household_income;

SELECT *
from us_project.us_householdincome_statistics;


SELECT State_Name,SUM(ALand),SUM(AWater)
from us_project.us_household_income
group by State_Name
order by 3 DESC
LIMIT 10;


SELECT *
from us_project.us_household_income u
INNER JOIN us_project.us_householdincome_statistics us
     on u.id=us.id
WHERE Mean <> 0;


SELECT u.State_Name,County,Type,`Primary`,Mean,Median
from us_project.us_household_income u
INNER JOIN us_project.us_householdincome_statistics us
     on u.id=us.id
WHERE Mean <> 0;

SELECT u.State_Name,ROUND(AVG(Mean),1),ROUND(AVG(Median),1)
from us_project.us_household_income u
INNER JOIN us_project.us_householdincome_statistics us
     on u.id=us.id
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 3 DESC
LIMIT 20;


SELECT Type,COUNT(TYPE),ROUND(AVG(Mean),1),ROUND(AVG(Median),1)
FROM us_project.us_household_income u
INNER JOIN us_project.us_householdincome_statistics us
     on u.id=us.id
WHERE Mean <> 0
GROUP BY 1
ORDER BY 2 DESC
LIMIT 20;

SELECT Type,COUNT(TYPE),ROUND(AVG(Mean),1),ROUND(AVG(Median),1)
FROM us_project.us_household_income u
INNER JOIN us_project.us_householdincome_statistics us
     on u.id=us.id
WHERE Mean <> 0
GROUP BY 1
HAVING COUNT(Type) > 100
ORDER BY 4 DESC
LIMIT 20;

SELECT * 
FROM us_household_income
WHERE Type='Community';


SELECT u.State_Name,City,ROUND(AVG(Mean),1),ROUND(AVG(Median),1)
from us_project.us_household_income u
INNER JOIN us_project.us_householdincome_statistics us
     on u.id=us.id
     group by u.State_Name,City
     ORDER BY ROUND(AVG(Mean),1) desc;
     
