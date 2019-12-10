Libname Step_2 "C:\Users\student\OneDrive - Bryant University\College\Senior\Semester I\AA490\Final Project\Git_Repository\AA490_Project\Data_Sets\_Final_Data_Package\Disease";
options user = Work;


data PopRecodeFINAL;
	set Step_2.Census_population;
	if age_group = "00_to_04_years" then age_group = "0-17";
	if age_group = "05_to_09_years" then age_group = "0-17";
	if age_group = "10_to_14_years" then age_group = "0-17";
	if age_group = "14_to_17_years" then age_group = "0-17";

	if age_group = "18_to_24_years" then age_group = "18-24";

	if age_group = "25_to_29_years" then age_group = "25-44";
	if age_group = "30_to_34_years" then age_group = "25-44";
	if age_group = "35_to_39_years" then age_group = "25-44";
	if age_group = "40_to_44_years" then age_group = "25-44";

	if age_group = "45_to_49_years" then age_group = "45-64";
	if age_group = "50_to_54_years" then age_group = "45-64";

	if age_group= "55_to_59_years" then age_group = "45-64";
	if age_group = "60_to_64_years" then age_group = "45-64";

	if age_group = "55_to_59_years" then age_group = "45-64";
	if age_group = "60_to_64_years" then age_group = "45-64";

	if age_group = "65_to_69_years" then age_group = "65-84";
	if age_group = "70_to_74_years" then age_group = "65-84";

	if age_group = "75_to_79_years" then age_group = "65-84";
	if age_group = "80_to_84_years" then age_group = "65-84";

	if age_group = "85_to_89_years" then age_group = "85+";
	if age_group = "90_to_94_years" then age_group = "85+";
	if age_group = "95_to_99_years" then age_group = "85+";
	if age_group = "Over_99_years" then age_group = "85+";
	output;
	run;

	data PopRecFINAL;
	set PopRecodeFINAL;
	if age_group in ("Population_all_ages", "16_years_and_over", "18_years_and_over",
					 "65_years_and_over", "85_years_and_over", "5_to_13_years", "15_to_19_years"
					 "15_to_44_years", "20_to_24_years", "25_to_29_years", "30_to_34_years", "35_to_39_years", "40_to_44_years") 
		or missing (age_group) then
		delete;
		run;


data ProjPropRecodeFINAL;
	set Step_2.projected_population;
	if age_group = "00 to 04 years" then age_group = "0-17";
	if age_group = "05 to 13 years" then age_group = "0-17";
	if age_group = "14 to 17 years" then age_group = "0-17";

	if age_group = "18 to 24 years" then age_group = "18-24";

	if age_group = "25 to 44 years" then age_group = "25-44";

	if age_group = "45 to 64 years" then age_group = "45-64";

	if age_group = "85 years and over" then age_group = "85+";
	output;
	run;

	data PPopFINAL;
	set ProjPropRecodeFINAL;
	if age_group in ("15 to 44 years", "18 to 64 years", "population all ages", "65 years and over", "85 years and over", "Under 18 years", "16 years and over", "18 years and over", "Over 99 years") 
		or missing (age_group) then
		delete;
		run;
proc sql;
create table Proj_Pop_Final_No_Dupe as
select Date, Gender, Age_Group, sum(Population_in_thousands) as Population_in_thousands from Ppopfinal
group by Date, Age_Group, Gender
order by Date, Age_Group, Gender;

data Proj_Pop_Final_No_Dupe;
set Proj_Pop_Final_No_Dupe;
if Gender = "both sexes" then Gender = "All";
run;
data projected_drop_step_1;
set Step_2.projected_population;
if Age_group not in('65 years and over',"85 years and over") then delete;
run;
proc sort data=projected_drop_step_1 out=projected_drop_step_2;

by Date  Gender ;
run;
proc sql;
create table projected_drop_step_3 as
select * from projected_drop_step_2
order by Date, Gender, Age_group desc;
data projected_drop_step_4;
set projected_drop_step_3;
Lag_Population = lag(Population_in_thousands);
_65_84_ = Population_in_thousands - Lag_Population;
run;
data projected_drop_step_5;
set projected_drop_step_4;
if Age_group = "65 years and over" then Population_in_thousands = _65_84_;
if Age_group = "65 years and over" then Age_group = "65-84";
if Age_group not in("65-84") then delete;
drop Lag_population _65_84_;
run;
data proj_pop_final_no_dupe_2;
set proj_pop_final_no_dupe;
run;
proc append base = proj_pop_final_no_dupe_2 data = projected_drop_step_5;
run;
proc freq data = proj_pop_final_no_dupe_2;
table Age_Group /nocum nofreq;
run;
proc sql;
create table proj_disease_FINAL as 
select Date, gender, Age_Group, sum(population_in_thousands) as Population_in_thousands from proj_pop_final_no_dupe_2
group by Date, Age_Group, Gender
order by Date, Age_Group, Gender;
proc freq data = poprecfinal;
tables age_group /nocum nopercent;
run;
data disease_cases_formated;
set Step_2.disease_cases;
if Age = "65-74" then Age = "65-84";
if Age = "75-84" then Age = "65-84";
run;
proc sql;
create table disease_cases_grouped as
select Year, Gender, Age, Disease, sum(Cases_in_1000s) as Cases_in_1000s 
from disease_cases_formated
group by Year, Age, Gender, Disease
order by Year, Age;
data disease_projected_final;
set proj_pop_final_no_dupe_2;
run;
data disease_historic_final;
set disease_historic_final;
if Age_group = "65-74" then Age_group = "65-84";
if Age_group = "75-84" then Age_group = "65-84";
run;
proc sql;
create table disease_historic_final as
select Date, Gender, Age_group, sum(Population_in_thousands) as Population_in_thousands 
from disease_historic_final
group by Date, Age_Group, Gender
order by Date, Age_Group, Gender;
proc sql;
create table disease_historic_final as
	select Date, Gender, Age_Group, sum(Population_in_thousands) as Population_in_thousands from Poprecfinal
	group by Date, Gender, Age_Group
	order by Date, Age_Group, Gender;
data disease_historic_final;
set disease_historic_final;
	if Gender = "both sexes" then Gender = "All";
	if Gender = "female" then Gender = "Female";
	if Gender = "male" then Gender = "Male";
run;
data disease_projected_final;
set disease_projected_final;
	if Gender = "female" then Gender = "Female";
	if Gender = "male" then Gender = "Male";
run;
proc sql;
create table OG_Disease_and_historic as 
	select a.Year, a.Disease, a.Gender, b.Age_Group, sum(a.Cases_in_1000s) as OG_Cases_in_Thousands, sum(b.Population_in_thousands) as Historic_Sum_Pop
	from Disease_cases_grouped a join Disease_historic_final b on a.Age = b.Age_Group
	group by Year, Disease, Age_Group, a.Gender
	order by Year, Disease, Age_Group, a.Gender;
proc sql;
create table OG_Disease_and_projected as 
	select a.Year, a.Disease, a.Gender, b.Age_Group, sum(a.Cases_in_1000s) as OG_Cases_in_Thousands, sum(b.Population_in_thousands) as Projected_Sum_Pop
	from Disease_cases_grouped a join Disease_projected_final b on a.Age = b.Age_Group
	group by Year, Disease, Age_Group, a.Gender
	order by Year, Disease, Age_Group, a.Gender;

/* The following code assumes you have minimally fixed the labels in a file

called DiseaseLabelsFixed. In this case, we want to transform the table so

that Gender becomes a column header for the Cases_in_1000s values. To do

this,we need to sort by the other three columns: Year, Age, and Disease.

This will leave the Gender column with sets of All, Female, Male repeating

rows before we apply the transformation. */

proc sort data=disease_cases_grouped out=diseaseCasesSorted;

by Year Age Disease;

run;

/* This code will transform the Gender column into three separate columns: All,

Female, Male (the same order the rows appeared in in the sorted table from

above) and leave the Year, Age, and Disease as columns (see the result). */

proc transpose data = diseaseCasesSorted /* result of sort above */

out = diseaseSortedTP /* resulting trnasformed table */

(rename = (col1=All col2=Female col3=Male) DROP=_NAME_);

by Year Age Disease;

run;

data diseaseSortedTPFixed;

set diseaseSortedTP;

/* YOUR CODE GOES HERE to fix missing All, Female, Male counts where possible */
if missing(All) then All = Female + Male;
if missing(Male) then Male = All - Female;
if missing(Female) then Female = All - Male;
if missing(All) and missing(Female) and missing(Male) then All = 0 and Female = 0 and Male = 0;
if All = 0 and missing(Female) and missing(Male) then Female = 0 and Male = 0;
if All = 0 and Female = 0 and missing(Male) then Male = 0;
if not missing(Male) and missing(Female) and missing(All) then Female = 0 and All = 0;
if not missing(Male) and Female = 0 and missing(All) then All = 0;
/*just took even All values and divided by 2, may not be the best way to find these values
if missing(Male) and missing(Female) and not missing(All) and mod(All,2) = 0 then Male = All/2 and Female = All/2;
if not missing(Male) and not missing(All) and missing(Female) and mod(All,2) = 0 then Female = All/2;*/

run;
data _null_;
	set diseaseSortedTPFixed;
	file print;
	if missing(All) then put _N_ " is missing ALL";
run;
proc freq data = diseaseSortedTPFixed;
	tables All Female Male /nocum nopercent;
	run;

run;

/* Once we have corrected the missing values above, we have to restore the table

to it's original format with another transpose statement. */

proc transpose data = diseaseSortedTPFixed /* File with corrected missing values */

out = diseaseCasesFixed /* Name of table after transpose */

(rename = (col1=Cases_in_1000s _NAME_=Gender));

var Male Female All; /* which columns are converted back to multiple rows */

by Year Age Disease; /* Same "by statement" as first transpose */

/* Need the following to avoid label NAME OF FORMER VARIABLE for Gender, try

taking it out, you'll see what I mean! */

label Gender="Gender";

run;

data disease_case_final;
set diseasecasesfixed;
Year_char = put(Year, $4.);
drop Year;
run;
data temp1;
set disease_case_final;
if Age = "45-54" or Age = "55-64" then Age = "45-64";
run;
proc sql;
create table temp2 as
	select Year_char, Disease, Age, gender, Sum(Cases_in_1000s) as Cases_in_1000s from temp1 
	group by Year_char, Disease, Gender, Age
	order by Year_char, Disease, Age;
quit;
data disease_case_final;
set temp2;
run;


data PopRecodeFINAL;
	set Step_2.Census_population;
	if age_group = "00_to_04_years" then age_group = "0-17";
	if age_group = "05_to_09_years" then age_group = "0-17";
	if age_group = "10_to_14_years" then age_group = "0-17";
	if age_group = "14_to_17_years" then age_group = "0-17";

	if age_group = "18_to_24_years" then age_group = "18-24";

	if age_group = "25_to_44_years" then age_group = "25-44";

	if age_group = "45_to_49_years" then age_group = "45-64";
	if age_group = "50_to_54_years" then age_group = "45-64";

	if age_group= "55_to_59_years" then age_group = "45-64";
	if age_group = "60_to_64_years" then age_group = "45-64";

	if age_group = "55_to_59_years" then age_group = "45-64";
	if age_group = "60_to_64_years" then age_group = "45-64";

	if age_group = "65_to_69_years" then age_group = "65-74";
	if age_group = "70_to_74_years" then age_group = "65-74";

	if age_group = "75_to_79_years" then age_group = "75-84";
	if age_group = "80_to_84_years" then age_group = "75-84";

	if age_group = "85_to_89_years" then age_group = "85+";
	if age_group = "90_to_94_years" then age_group = "85+";
	if age_group = "95_to_99_years" then age_group = "85+";
	if age_group = "Over_99_years" then age_group = "85+";
	output;
	run;

	data PopRecFINAL;
	set PopRecodeFINAL;
	if age_group in ("Population_all_ages", "16_years_and_over", "18_years_and_over",
					 "65_years_and_over", "85_years_and_over", "5_to_13_years", "15_to_19_years"
					 "15_to_44_years", "20_to_24_years", "25_to_29_years", "30_to_34_years", "35_to_39_years", "40_to_44_years") 
		or missing (age_group) then
		delete;
		run;


data ProjPropRecodeFINAL;
	set Step_2.projected_population;
	if age_group = "00 to 04 years" then age_group = "0-17";
	if age_group = "05 to 13 years" then age_group = "0-17";
	if age_group = "14 to 17 years" then age_group = "0-17";

	if age_group = "18 to 24 years" then age_group = "18-24";

	if age_group = "25 to 44 years" then age_group = "25-44";

	if age_group = "45 to 64 years" then age_group = "45-64";

	if age_group = "85 years and over" then age_group = "85+";
	output;
	run;

	data PPopFINAL;
	set ProjPropRecodeFINAL;
	if age_group in ("15 to 44 years", "18 to 64 years", "population all ages", "65 years and over", "85 years and over", "Under 18 years", "16 years and over", "18 years and over", "Over 99 years") 
		or missing (age_group) then
		delete;
		run;
proc sql;
create table Proj_Pop_Final_No_Dupe as
select Date, Gender, Age_Group, sum(Population_in_thousands) as Population_in_thousands from Ppopfinal
group by Date, Age_Group, Gender
order by Date, Age_Group, Gender;

data Proj_Pop_Final_No_Dupe;
set Proj_Pop_Final_No_Dupe;
if Gender = "both sexes" then Gender = "All";
run;
data projected_drop_step_1;
set Step_2.projected_population;
if Age_group not in('65 years and over',"85 years and over") then delete;
run;
proc sort data=projected_drop_step_1 out=projected_drop_step_2;

by Date  Gender ;
run;
proc sql;
create table projected_drop_step_3 as
select * from projected_drop_step_2
order by Date, Gender, Age_group desc;
data projected_drop_step_4;
set projected_drop_step_3;
Lag_Population = lag(Population_in_thousands);
_65_84_ = Population_in_thousands - Lag_Population;
run;
data projected_drop_step_5;
set projected_drop_step_4;
if Age_group = "65 years and over" then Population_in_thousands = _65_84_;
if Age_group = "65 years and over" then Age_group = "65-84";
if Age_group not in("65-84") then delete;
drop Lag_population _65_84_;
run;
data proj_pop_final_no_dupe_2;
set proj_pop_final_no_dupe;
run;
proc append base = proj_pop_final_no_dupe_2 data = projected_drop_step_5;
run;
proc freq data = proj_pop_final_no_dupe_2;
table Age_Group /nocum nofreq;
run;
proc sql;
create table proj_disease_FINAL as 
select Date, gender, Age_Group, sum(population_in_thousands) as Population_in_thousands from proj_pop_final_no_dupe_2
group by Date, Age_Group, Gender
order by Date, Age_Group, Gender;
proc freq data = poprecfinal;
tables age_group /nocum nopercent;
run;

proc sql;
create table Disease_List as 
	select distinct Disease from Disease_Case_final;
quit;
data work.temp1;
set proj_disease_final;

if gender = "All" then delete;
if gender = "both sexes" then delete;
run;
proc sql;
create table Step_2.Disease_Future_Join_1 as
	select a.*, b.* from Disease_List a cross join work.temp1 b;
quit; 

options user = disease;
PROC SQL;
   CREATE TABLE Disease_Historic_Join_1 AS 
   SELECT t1.Date, 
          t1.Gender, 
          t1.Age_group, 
          t1.Population_in_thousands, 
          t2.Disease, 
          t2.Cases_in_1000s
      FROM disease_historic_final t1, disease_case_final t2
      WHERE (t1.Date = t2.Year_char AND t1.Age_group = t2.Age AND t1.Gender = t2.Gender);
QUIT;
PROC SQL;
   CREATE TABLE Step_2.Disease_Historic_Join_1 AS 
   SELECT t1.Date, 
          t1.Gender, 
          t1.Age_group, 
          t1.Population_in_thousands, 
          t1.Disease, 
          t1.Cases_in_1000s
      FROM Disease_Historic_Join_1 t1
      WHERE t1.Gender NOT = 'All'
      ORDER BY t1.Date,
               t1.Disease,
               t1.Age_group;
QUIT;
