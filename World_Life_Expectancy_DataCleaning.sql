# World Life Expectancy Project(Data Cleaning )

SELECT * 
FROM world_life_expectancy.world_life_expectancy;


Select Country,Year,CONCAT(Country,Year),COUNT(CONCAT(Country,Year))
from world_life_expectancy
GROUP BY Country,Year,CONCAT(Country,Year)
HAVING COUNT(CONCAT(Country,Year)) > 1;

Select *
from(
Select Row_ID,
CONCAT(Country,Year),
ROW_NUMBER() OVER (PARTITION BY CONCAT(Country,Year) ORDER BY CONCAT(Country,Year)) as Row_Num 
from world_life_expectancy) as Row_Table
where Row_Num > 1  ;

Delete FROM world_life_expectancy
WHERE
Row_ID IN (
   Select Row_ID
from(
Select Row_ID,
CONCAT(Country,Year),
ROW_NUMBER() OVER (PARTITION BY CONCAT(Country,Year) ORDER BY CONCAT(Country,Year)) as Row_Num 
from world_life_expectancy) as Row_table
where Row_Num > 1 )
;	

Select * 
FROM world_life_expectancy
where Status = '';

Select DISTINCT(Status)
FROM world_life_expectancy
where status <> '';


SELECT DISTINCT(Country)
from world_life_expectancy
where status='Developing';


UPDATE world_life_expectancy
SET Status='Developing'
WHERE Country IN(SELECT DISTINCT(Country)
                 from world_life_expectancy
                 where status='Developing');
                 
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
ON t1.Country=t2.Country
SET t1.status='Developed'
WHERE t1.status=''
and t2.status <> ''
and t2.status ='Developed'  ;
                 
                 

Select Country,Year,`Life expectancy`
FROM world_life_expectancy;
 
Select Country,Year,`Life expectancy`
FROM world_life_expectancy
WHERE '';



Select t1.Country,t1.Year,t1.`Life expectancy`,
t2.Country,t2.Year,t2.`Life expectancy`,
t3.Country,t3.Year,t3.`Life expectancy`,
ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
FROM world_life_expectancy t1
join world_life_expectancy t2
       on t1.Country=t2.Country
       AND t1.Year=t2.Year - 1
join world_life_expectancy t3
       on t1.Country=t3.Country
       AND t1.Year=t3.Year + 1
       where t1.`Life expectancy`='';
 
 
 UPDATE world_life_expectancy t1
join world_life_expectancy t2
       on t1.Country=t2.Country
       AND t1.Year=t2.Year - 1
join world_life_expectancy t3
       on t1.Country=t3.Country
       AND t1.Year=t3.Year + 1
       SET t1.`Life expectancy` =ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
       where t1.`Life expectancy`=''