Libname Step_1 "C:\Users\student\OneDrive - Bryant University\College\Senior\Semester I\AA490\Final Project\Git_Repository\AA490_Project\Data_Sets\_Final_Data_Package";
options user = Step_1;

/* Historic recode step 1*/
/*Recoding Historical Data to Fit Buckets*/
data PopRecode;
set census_population;

	if age_group = "18_to_24_years" then 
	age_group = "16 to 24";

	if age_group = "25_to_29_years" then
	age_group = "25 to 44";
	if age_group = "30_to_34_years" then
	age_group = "25 to 44";
	if age_group = "35_to_39_years" then
	age_group = "25 to 44";
	if age_group = "40_to_44_years" then
	age_group = "25 to 44";
	
	

	if age_group = "45_to_49_years" then
	age_group = "45 to 64";
	if age_group = "50_to_54_years" then
	age_group = "45 to 64";
	if age_group = "55_to_59_years" then 
	age_group = "45 to 64";
	if age_group = "60_to_64_years" then
	age_group = "45 to 64";
	
	if age_group = "65_years_and_over" then
	age_group = "65+";

	output; 
	run;
	

data LaborForceHistoricRecode;
set PopRecode;
	if age_group in ("Population_all_ages", "85_years_and_over", "5_to_13_years", "00_to_04_years",
					 "05_to_09_years", "15_to_44_years", "10_to_14_years", "15_to_19_years", 
					 "20_to_24_years", "65_to_69_years", "70_to_74_years", "75_to_79_years", 
					 "80_to_84_years", "85_to_89_years", "90_to_94_years", "95_to_99_years", 
				     "Over_99_years", "16_years_and_over", "18_years_and_over", "14_to_17_years") 
		or missing (age_group) then
		delete;
		run;
data PopAgeRecode_AllGender;
	set PopAgeRecode;
		if Gender = "both sexes" then output;
run;

/*Recoding future data to fit buckets*/
data LaborForceProjectedRecode;
set Projected_Population;
	if age_group = "18 to 24 years" then
	age_group = "16 to 24";
	if age_group = "65 years and over" then
	age_group = "65+";
	if age_group in ("population all ages", "00 to 04 years", "05 to 13 years", "15 to 44 years", "16 years and over",
					 "18 to 64 years", "18 years and over", "85 years and over", "Over 99 years", "Under 18 years", "14 to 17 years") then 
					 delete; 
					 run;

/* Creating table with age_group (16-17 records) for Historic Labor Force Population */ 

data His_16_to_17_Step_one;
set census_population;
if Age_group not in("16_years_and_over","18_years_and_over") then 
delete;
run;
proc sort data=His_16_to_17_Step_One out=His_16_to_17_Step_Two;

by Date  Gender ;
run;
proc sql;
create table His_16_to_17_Step_Three as
select * from His_16_to_17_Step_Two
order by Date, Gender, Age_group desc;
data His_16_to_17_Step_Four;
set His_16_to_17_Step_Three;
Lag_Population = lag(Population_in_thousands);
_16_17_ = Population_in_thousands - Lag_Population;
run;
data His_16_to_17_Step_Five;
set His_16_to_17_Step_Four;
if Age_group = "16_years_and_over" then Population_in_thousands = _16_17_;
if Age_group = "16_years_and_over" then Age_group = "16 to 17";
if Age_group not in("16 to 17") then delete;
drop Lag_population _16_17_;
run;

/* Now doing the same for projected labor force popuation */

data Proj_16_to_17_Step_one;
set projected_population;
if Age_group not in("16 years and over","18 years and over") then 
delete;
run;
proc sort data=Proj_16_to_17_Step_One out=Proj_16_to_17_Step_Two;

by Date  Gender ;
run;
proc sql;
create table Proj_16_to_17_Step_Three as
select * from Proj_16_to_17_Step_Two
order by Date, Gender, Age_group desc;
data Proj_16_to_17_Step_Four;
set Proj_16_to_17_Step_Three;
Lag_Population = lag(Population_in_thousands);
_16_17_ = Population_in_thousands - Lag_Population;
run;
data Proj_16_to_17_Step_Five;
set Proj_16_to_17_Step_Four;
if Age_group = "16 years and over" then Population_in_thousands = _16_17_;
if Age_group = "16 years and over" then Age_group = "16 to 17";
if Age_group not in("16 to 17") then delete;
drop Lag_population _16_17_;
run;
	
/* Appending 16-17 bucket back into historic/projected tables, followed by
	sorting to aggregate population totals */

data laborforcehistoricrecode_2;
set laborforcehistoricrecode;
run;
proc append base = laborforcehistoricrecode_2 data = his_16_to_17_step_five;
run;
data laborforcehistoricrecode_2;
set laborforcehistoricrecode_2;
if Age_Group = '16 to 17' then Age_Group = '16 to 24';
run;
proc freq data = laborforcehistoricrecode_2;
table Age_Group /nocum nofreq;
run;
proc sql;
create table labor_historic_FINAL as 
select Date, gender, Age_Group, sum(population_in_thousands) as Population_in_thousands from laborforcehistoricrecode_2
group by Date, Age_Group, Gender
order by Date, Age_Group, Gender;

data labor_projected_final;
set labor_projected_final;
if Age_group = "45 to 64 years" then Age_group = "45 to 64";
if Age_group = "25 to 44 years" then Age_group = "25 to 44";
run;

/*projected*/
data laborforceprojectedrecode_2;
set laborforceprojectedrecode;
if Age_Group = '16 to 17' then Age_Group = '16 to 24';
if Age_group = '25 to 44 years' then Age_group = "25 to 44";
if Age_group = '45 to 64 years' then Age_group = '45 to 64'; 
run;
/*proc freq data = laborforceprojectedrecode_2;
table Age_Group /nocum nofreq;
run;*/
proc sql;
create table labor_projected_FINAL as 
select Date, gender, Age_Group, sum(population_in_thousands) as Population_in_thousands from laborforceprojectedrecode_2
group by Date, Age_Group, Gender
order by Date, Age_Group, Gender;

/* Recoding Labor_Force_Population age buckets to match his/proj population */
	
data labor_force_population_recode_1;
set labor_force_population;
	if age_group in ("16-19years", "20-24years") then
	age_group = "16 to 24";
	if age_group in ("25-34years", "35-44years") then
	age_group = "25 to 44";
	if age_group in ("45-54years", "55-64years") then
	age_group = "45 to 64";
	if age_group = "65years and over" then
	age_group = "65+";
	output;
	run;
	
/* Using proc sql to aggregate population by year and age_group */
proc sql;
create table labor_force_population_FINAL as 
select Industry, Year, Age_Group, sum(Labor_force_pop) as labor_force_pop
from labor_force_population_recode_1
group by Industry, Year, Age_Group
order by Industry, Year, Age_Group;

/* Joining labor_historic_final to labor_force_population_final to create final table for modeling future laborforce */
data labor_force_population_formated;
	set labor_force_population;
	if Age_Group = "16-19years" then Age_Group = "16 to 24";
	if Age_Group = "20-24years" then Age_Group = "16 to 24";
	if Age_Group = "25-34years" then Age_Group = "25 to 44";
	if Age_Group = "35-44years" then Age_Group = "25 to 44";
	if Age_Group = "45-54years" then Age_Group = "45 to 64";
	if Age_Group = "55-64years" then Age_Group = "55 to 64";
	if Age_Group = "65years and over" then Age_Group = "65+";
run;
proc sql;
create table labor_force_grouped as
	select Industry, Year, Age_Group, sum(Labor_Force_Pop) as Sum_Labor_Force_Pop from labor_force_population_formated
	group by Year, Industry, Age_Group
	order by Year, Industry, Age_Group;
data labor_force_final;
set labor_force_grouped;
Year_char = put(Year, $4.);
drop Year;
run;
PROC SQL;
   CREATE TABLE QUERY_FOR_LABOR_PROJECTED_FINAL AS 
   SELECT t1.Date, 
          t1.Age_group, 
          t1.Gender, 
          t1.Population_in_thousands, 
          t2.Sum_Labor_Force_Pop
      FROM labor_force_final t2
           RIGHT JOIN labor_projected_final t1 ON (t2.Age_Group = t1.Age_group) AND (t1.Date = t2.Year_char);
QUIT;
	
