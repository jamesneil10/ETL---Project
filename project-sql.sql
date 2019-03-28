CREATE DATABASE call_center_db

USE call_center_db;

CREATE table call_center(
Time_ varchar(100),	
Department_Name varchar(100),
Service_Name VARCHAR(100),
Zip_Code VARChar(30)
);


CREATE table census(
Total_Population varchar(30),	
Median_Age varchar(10),
Total_Males VARCHAR(30),
Total_Females VARCHAR(30),
Total_Household VARCHAR(100),
Average_Household_Size varchar(100),
Zip_Code VARChar(45)
);


SELECT call_center.Department_Name, call_center.Service_Name, call_center.Zip_Code, census.Median_Age, census.Total_Males, census.Total_Females
FROM call_center
JOIN census
ON call_center.Zip_Code = census.Zip_Code;

select * from call_center;
select * from census;