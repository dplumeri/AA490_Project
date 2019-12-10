Libname SS_Calc "C:\Users\student\Desktop\AA Capstone\Project\GitRepository\aa490_project\Data_Sets\_Final_Data_Package\Social Security\";
options user = Work;

/* Historic recode step 1*/
/*Recoding Historical Data to Fit Buckets*/
data PopRecode;
set SS_Calc.census_population;

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
data PopAgeRecode_Both_Gender;
	set laborforcehistoricrecode;
		if Gender = "both sexes" then output;
run;

/*Recoding future data to fit buckets*/
data LaborForceProjectedRecode;
set ss_calc.Projected_Population;
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
set ss_calc.census_population;
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
set ss_calc.projected_population;
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
set ss_calc.labor_force_population;
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
	set ss_calc.labor_force_population;
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
/* Joining Census Date and Labor Data */
PROC SQL;
   CREATE TABLE OG_Labor_Join AS 
   SELECT t1.Date, 
          t1.Gender, 
          t1.Age_group, 
          t1.Population_in_thousands, 
          t2.Industry, 
          t2.Sum_Labor_Force_Pop
      FROM labor_historic_final t1, labor_force_final t2
      WHERE (t1.Age_group = t2.Age_Group AND t1.Date = t2.Year_char);
QUIT;
proc sql;
create table OG_Labor_Join_1 as
select *, population_in_thousands * 1000 as Population from OG_Labor_Join;
data OG_Labor_Join;
set OG_Labor_Join_1;
drop Population_in_thousands;
run;
data OG_labor_Join_2;
set OG_labor_join;
if gender = "male" then delete;
if gender = "female" then delete;
run;
data og_labor_join (drop = Gender);
set og_labor_join_2;
label 	Population = "Overal_Population"
		Sum_Labor_Force_Pop = "Industry_Population";
run;
/* Creating the Scoring File */
proc sql;
create table Industry_List as 
	select distinct Industry from Labor_force_final;
quit;
data temp1;
set Labor_projected_final;

if gender = "female" then delete;
if gender = "male" then delete;
run;
proc sql;
create table cross_join_labor_2 as
	select a.*, b.* from Industry_list a cross join temp1 b;
quit; 
Proc sql;
create table cross_join_labor_2 as 
select Industry, Date, Age_Group, Population_in_thousands * 1000 as Population from cross_join_labor_2;
quit;

/* Beginning historic ss problem */ 

PROC SQL;
   CREATE TABLE occupation_and_pay_2 AS 
   SELECT Industry, 
          'Occupation title'n AS Occupation_title, 
          'Percent Employment'n AS Percent_Employment, 
          'Annual mean wage'n AS Annual_mean_wage
      FROM occupation_and_pay;
QUIT;

proc sql;
create table ss_join_1 as
 select a.*, b.* from occupation_and_pay_2 a 
	join labor_force_final b on a.industry = b.industry;
quit;
data ss_join_2 (drop = year);
set socialsecurity_data_final;
newyear = put (year, $4.);
run;

proc sql;
create table ss_join_3 as 
	select a.*, b.employee_SS_rate, b.employer_SS_rate from ss_join_2 a 
		join work.temp3 b on a.year_char = b.newyear;
quit;
proc sql;
create table SS_Pay_Past as
	select a.*, b.SS_wage_limit from work.temp4 a
		join ss_dat.wagelimit b on a.year_char = b.year;
quit;

data his_ss_step_1;
set ss_pay_past;
active_contributors = (percent_employment * sum_labor_force_pop);
run;

data his_ss_step_2(drop = employee_ss_rate employer_ss_rate);
set his_ss_step_1;
if (annual_mean_wage lt ss_wage_limit) then  
total_taxable_income = (active_contributors * annual_mean_wage);
else total_taxable_income = (active_contributors * ss_wage_limit);
new_employee_ss_rate = (employee_ss_rate/100);
new_employer_ss_rate = (employer_ss_rate/100);
total_ss_rate = (new_employer_ss_rate + new_employee_ss_rate);
run;

data his_ss_step_3;
set his_ss_step_2;
if (annual_mean_wage lt ss_wage_limit) then
combined_ss_contribution = (annual_mean_wage * total_ss_rate);
if (annual_mean_wage gt ss_wage_limit) then 
combined_ss_contribution = (ss_wage_limit * total_ss_rate);
total_ss_contribution = (active_contributors * combined_ss_contribution);
total_ss_contribution_2 = (total_taxable_income * total_ss_rate);
run;

proc sql;
create table total_contributions as
select year_char, sum(total_ss_contribution) as total_ss_contribution
from his_ss_step_3
group by year_char;

data his_ss_step_4 (drop = year);
set ss_calc.census_population;
if age_group = "65_years_and_over" and gender = "both sexes" then
output;

data his_ss_step_5;
set his_ss_step_4;
if date in ("1990", "1991", "1992", "1993", "1994", "1995", "1996", 
			"1997", "1998", "1999") then 
delete;

data ss_payout (drop = gender age_group population_in_thousands population);
set his_ss_step_5;
Population = (population_in_thousands * 1000);
ss_payout = (population * 1503 * 12);


proc sql;
create table ss_calc.historic_ss_final as
select a.date, b.total_ss_contribution, a.ss_payout
from ss_payout a join total_contributions b on a.date = b.year_char;
quit;
