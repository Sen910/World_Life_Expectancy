SELECT * 
FROM us_project.us_household_income;
 
SELECT * 
From us_project.us_householdincome_statistics;

ALTER TABLE us_project.us_householdincome_statistics 
RENAME COLUMN `ï»¿id`to`id`
;


SELECT COUNT(id)
FROM us_project.us_household_income;

Select COUNT(id)
From us_project.us_householdincome_statistics;	

Select id,Count(id)
FROM us_project.us_household_income
GROUP BY id
having Count(id)>1;

Delete from us_household_income
where row_id IN (
	  Select row_id
      From (
           Select row_id,
           id,
           ROW_NUMBER() OVER (PARTITION BY id order by id) row_num
           FROM us_project.us_household_income) duplicates	
where row_num > 1);

Select DISTINCT State_Name
FROM us_project.us_householdincome_statistics
GROUP BY 1;


UPDATE us_project.us_household_income
SET State_Name='Georgia'
WHERE State_Name ='georia' ;


UPDATE us_project.us_household_income
SET State_Name='Alabama'
WHERE State_Name ='alabama' ;


Select DISTINCT State_ab
FROM us_project.us_household_income
ORDER BY 1;



SELECT *
FROM us_project.us_household_income
WHERE County = 'Autauga County'
ORDER BY 1
;

UPDATE us_household_income
SET Place='Autaugaville'
WHERE County='Autauga County'
AND City='Vinemont';



SELECT Type,count(Type)
FROM us_project.us_household_income
group by Type;
#ORDER BY 1 

UPDATE us_household_income
Set Type='Borough'
Where Type='Boroughs';


Select ALand, AWater
From us_household_income
WHERE (ALand=0 OR ALand='' OR ALand IS NULL );