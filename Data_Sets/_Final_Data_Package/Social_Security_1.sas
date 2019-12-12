Libname SS_Calc "C:\Users\student\OneDrive - Bryant University\College\Senior\Semester I\AA490\Final Project\Git_Repository\AA490_Project\Data_Sets\_Final_Data_Package\Social Security";
options user = Work;
DATA Wage_Limits;
    LENGTH
        Year               8
        SS_Wage_Limit      8 ;
    FORMAT
        Year             BEST12.
        SS_Wage_Limit    BEST12. ;
    INFORMAT
        Year             BEST12.
        SS_Wage_Limit    BEST12. ;
    INFILE DATALINES4
        DLM='7F'x
        MISSOVER
        DSD ;
    INPUT
        Year             : BEST32.
        SS_Wage_Limit    : BEST32. ;
DATALINES4;
19729000
197310800
197413200
197514100
197615300
197716500
197817700
197922900
198025900
198129700
198232400
198335700
198437800
198539600
198642000
198743800
198845000
198948000
199051300
199153400
199255500
199357600
199460600
199561200
199662700
199765400
199868400
199972600
200076200
200180400
200284900
200387000
200487900
200590000
200694200
200797500
2008102000
2009106800
2010106800
2011106800
2012110100
2013113700
2014117000
;;;;



DATA SocialSecurity_data_STEP1;
    LENGTH
        Year               7
        Employee_SS_Rate   8
        Employer_SS_Rate   8
        Total_SSTax_Per_Income   8 ;
    FORMAT
        Year            7.
        Employee_SS_Rate BEST12.
        Employer_SS_Rate BEST12.
        Total_SSTax_Per_Income BEST12. ;
    INFORMAT
        Year            7.
        Employee_SS_Rate BEST12.
        Employer_SS_Rate BEST12.
        Total_SSTax_Per_Income BEST12. ;
    INFILE DATALINES4
        DLM='7F'x
        MISSOVER
        DSD ;
    INPUT
        Year             : 7.
        Employee_SS_Rate : BEST32.
        Employer_SS_Rate : BEST32.
        Total_SSTax_Per_Income : BEST32. ;
DATALINES4;
1937-49112
19501.51.53
1951-531.51.53
1954-56224
1957-582.252.254.5
19592.52.55
1960-61336
19623.1253.1256.25
1963-653.6253.6257.25
19663.853.857.7
19673.93.97.8
19683.83.87.6
19694.24.28.4
19704.24.28.4
1971-724.64.69.2
19734.854.859.7
1974-774.954.959.9
19785.055.0510.1
19795.085.0810.16
19805.085.0810.16
19815.355.3510.7
19825.45.410.8
19835.45.410.8
1984-875.75.711.4
1988-896.066.0612.12
1990-936.26.212.4
1994-966.26.212.4
1997-996.26.212.4
2000-156.26.212.4
;;;;

data socialsecurity_data_STEP2;
set socialsecurity_data_STEP1;
if Year = 1950 then do 
	Year = 1937 to 1949;
	Employee_SS_Rate = 1;
	Employer_SS_Rate = 1;
	Total_SSTax_Per_Income = 2;
output;
end;
if Year > 1950 then do 
	Year = 1951 to 1953;
	Employee_SS_Rate = 1.5;
	Employer_SS_Rate = 1.5;
	Total_SSTax_Per_Income = 3;
output;
end;
if Year >1953 then do
	Year = 1954 to 1956;
	Employee_SS_Rate = 2;
	Employer_SS_Rate = 2;
	Total_SSTax_Per_Income = 4;
output;
end;
if Year >1956 then do
	Year = 1957 to 1958;
	Employee_SS_Rate = 2.25;
	Employer_SS_Rate = 2.25;
	Total_SSTax_Per_Income = 4.5;
output;
end;
if Year >1958 then do 
	Year = 1960 to 1961;
	Employee_SS_Rate = 3;
	Employer_SS_Rate = 3;
	Total_SSTax_Per_Income = 6;
output;
end;
if Year > 1961 then do
	Year = 1963 to 1965;
	Employee_SS_Rate = 3.625;
	Employer_SS_Rate = 3.625;
	Total_SSTax_Per_Income = 7.25;
output;
end;
if Year > 1965 then do
	Year = 1971 to 1972;
	Employee_SS_Rate = 4.6;
	Employer_SS_Rate = 4.6;
	Total_SSTax_Per_Income = 9.2;
output;
end;
if Year > 1972 then do
	Year = 1974 to 1977;
	Employee_SS_Rate = 4.95;
	Employer_SS_Rate = 4.95;
	Total_SSTax_Per_Income = 9.9;
output;
end;
if Year > 1977 then do
	Year = 1984 to 1987;
	Employee_SS_Rate = 5.7;
	Employer_SS_Rate = 5.7;
	Total_SSTax_Per_Income = 11.4;
output;
end;
if Year > 1987 then do
	Year = 1988 to 1989;
	Employee_SS_Rate = 6.06;
	Employer_SS_Rate = 6.06;
	Total_SSTax_Per_Income = 12.12;
output;
end;
if Year > 1989 then do
	Year = 1990 to 2015;
	Employee_SS_Rate = 6.2;
	Employer_SS_Rate = 6.2;
	Total_SSTax_Per_Income = 12.4;
output;
end;
run;
proc sort data = socialsecurity_data_STEP2 nodup out = socialsecurity_data_STEP3;
	by Year;
run;
proc append base = Socialsecurity_data_Step1 data = socialsecurity_data_step3;
run;
data Socialsecurity_data_step4;
set Socialsecurity_data_step1;
if missing(Year)then delete;
run;
proc sql;
create table socialsecurity_data_final as 
select * from socialsecurity_data_step4 
order by Year;
PROC SQL;
   CREATE TABLE occupation_and_pay_2 AS 
   SELECT Industry, 
          'Occupation title'n AS Occupation_title, 
          'Percent Employment'n AS Percent_Employment, 
          'Annual mean wage'n AS Annual_mean_wage
      FROM ss_calc.occupation_and_pay;
QUIT;

proc sql;
create table work.temp2 as
 select a.*, b.* from occupation_and_pay_2 a 
	join labor_force_final b on a.industry = b.industry;
quit;
data work.temp3 (drop = year);
set socialsecurity_data_final;
newyear = put (year, $4.);
run;
proc sql;
create table work.temp4 as 
	select a.*, b.employee_SS_rate, b.employer_SS_rate from work.temp2 a 
		join work.temp3 b on a.year_char = b.newyear;
quit;
proc sql;
create table SS_Pay_Past as
	select a.*, b.SS_Wage_Limit from work.temp4 a
		join wage_limits b on a.Year_char = b.year_char;
quit;

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
      FROM ss_calc.occupation_and_pay;
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
		join work.temp3 b on a.newyear = b.newyear;
quit;
data wage_limits(drop = year);
set wage_limits;
year_char = put (year, $4.);
run;
proc sql;
create table SS_Pay_Past as
	select a.*, b.SS_wage_limit from work.temp4 a
		join wage_limits b on a.year_char = b.year_char;
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

/* beginning projected SS calculation */

DATA Scored_Labor_Data_1;
    LENGTH
        Industry         $ 111
        Date               8
        Age_group        $ 19
        Population         8
        Warnings         $ 4
        'Predicted_Sum_Labor_Force_Pop'n   8
        b_Sum_Labor_Force_   8
        Segment            8
        'Prediction_for_Sum_Labor_Force_P'n   8 ;
    LABEL
        'Prediction_for_Sum_Labor_Force_P'n = "Prediction_for_Sum_Labor_Force_Pop" ;
    FORMAT
        Industry         $CHAR111.
        Date             BEST12.
        Age_group        $CHAR19.
        Population       F12.2
        Warnings         $CHAR4.
        'Predicted_Sum_Labor_Force_Pop'n F12.2
        b_Sum_Labor_Force_ BEST12.
        Segment          BEST12.
        'Prediction_for_Sum_Labor_Force_P'n F12.2 ;
    INFORMAT
        Industry         $CHAR111.
        Date             BEST12.
        Age_group        $CHAR19.
        Population       BEST12.
        Warnings         $CHAR4.
        'Predicted_Sum_Labor_Force_Pop'n BEST12.
        b_Sum_Labor_Force_ BEST12.
        Segment          BEST12.
        'Prediction_for_Sum_Labor_Force_P'n BEST12. ;
    INFILE DATALINES4
        DLM='7F'x
        MISSOVER
        DSD ;
    INPUT
        Industry         : $CHAR111.
        Date             : BEST32.
        Age_group        : $CHAR19.
        Population       : BEST32.
        Warnings         : $CHAR4.
        'Predicted_Sum_Labor_Force_Pop'n : BEST32.
        b_Sum_Labor_Force_ : BEST32.
        Segment          : BEST32.
        'Prediction_for_Sum_Labor_Force_P'n : BEST32. ;
DATALINES4;
Management, professional, and related occupations                                                              201516 to 24           30983000    3121972.2717167113133121972.27171671
Management, professional, and related occupations                                                              201525 to 44           84327000    24745416.94741111124745416.9474111
Management, professional, and related occupations                                                              201545 to 64           83839000    22595586.50753171122595586.5075317
Management, professional, and related occupations                                                              201565+                47695000    2281040.3768742914142281040.37687429
Management, professional, and related occupations                                                              202016 to 24           30028000    3138105.963305813133138105.9633058
Management, professional, and related occupations                                                              202025 to 44           88501000    25567268.8092391125567268.809239
Management, professional, and related occupations                                                              202045 to 64           83238000    22480321.71538191122480321.7153819
Management, professional, and related occupations                                                              202065+                55969000    2523109.1397161414142523109.13971614
Management, professional, and related occupations                                                              202516 to 24           30180000    3135538.0877858613133135538.08778586
Management, professional, and related occupations                                                              202525 to 44           91833000    26223332.63377431126223332.6337743
Management, professional, and related occupations                                                              202545 to 64           81152000    22080251.2388021122080251.238802
Management, professional, and related occupations                                                              202565+                65052000    2788846.4581706414142788846.45817064
Management, professional, and related occupations                                                              203016 to 24           30605000    3128358.1726807713133128358.17268077
Management, professional, and related occupations                                                              203025 to 44           93878000    26625988.85261421126625988.8526142
Management, professional, and related occupations                                                              203045 to 64           80865000    22025207.98531281122025207.9853128
Management, professional, and related occupations                                                              203065+                72774000    3014765.6008664113133014765.60086641
Management, professional, and related occupations                                                              203516 to 24           32125000    3102679.4174813713133102679.41748137
Management, professional, and related occupations                                                              203525 to 44           95013000    26849467.97651811126849467.9765181
Management, professional, and related occupations                                                              203545 to 64           83700000    22568927.92831571122568927.9283157
Management, professional, and related occupations                                                              203565+                77315000    3147619.6318145413133147619.63181454
Management, professional, and related occupations                                                              204016 to 24           33199000    3084535.3496628513133084535.34966285
Management, professional, and related occupations                                                              204025 to 44           96078000    27059164.24696531127059164.2469653
Management, professional, and related occupations                                                              204045 to 64           88398000    23469949.54814911123469949.5481491
Management, professional, and related occupations                                                              204065+                79719000    3217952.3978130713133217952.39781307
Management, professional, and related occupations                                                              204516 to 24           33680000    3076409.3751556713133076409.37515567
Management, professional, and related occupations                                                              204525 to 44           98725000    27580353.00553221127580353.0055322
Management, professional, and related occupations                                                              204545 to 64           92157000    24190881.91701961124190881.9170196
Management, professional, and related occupations                                                              204565+                81288000    3263855.9376848113133263855.93768481
Management, professional, and related occupations                                                              205016 to 24           33967000    3071560.8207213133071560.82072
Management, professional, and related occupations                                                              205025 to 44           101609000    28148206.56794511128148206.5679451
Management, professional, and related occupations                                                              205045 to 64           94570000    24653667.1806761124653667.180676
Management, professional, and related occupations                                                              205065+                83739000    3335563.7619204213133335563.76192042
Management, professional, and related occupations                                                              205516 to 24           34469000    3063080.0739370413133063080.07393704
Management, professional, and related occupations                                                              205525 to 44           104331000    28684162.66950121128684162.6695012
Management, professional, and related occupations                                                              205545 to 64           96020000    24931760.27321721124931760.2732172
Management, professional, and related occupations                                                              205565+                87309000    3440009.6748217313133440009.67482173
Management, professional, and related occupations                                                              206016 to 24           35239000    3050071.757158413133050071.7571584
Management, professional, and related occupations                                                              206025 to 44           106303000    29072445.3411651129072445.341165
Management, professional, and related occupations                                                              206045 to 64           97404000    25197195.33533921125197195.3353392
Management, professional, and related occupations                                                              206065+                92033000    3578217.6559269813133578217.65592698
Natural resources, construction, and maintenance occupations                                                   201516 to 24           30983000    1119707.8307352118181119707.83073521
Natural resources, construction, and maintenance occupations                                                   201525 to 44           84327000    6771570.31986129886771570.31986129
Natural resources, construction, and maintenance occupations                                                   201545 to 64           83839000    5318677.5323927512125318677.53239275
Natural resources, construction, and maintenance occupations                                                   201565+                47695000    1592446.3097042617171592446.30970426
Natural resources, construction, and maintenance occupations                                                   202016 to 24           30028000    998169.1520373321818998169.152037332
Natural resources, construction, and maintenance occupations                                                   202025 to 44           88501000    7023945.82770549887023945.82770549
Natural resources, construction, and maintenance occupations                                                   202045 to 64           83238000    5280890.9743151412125280890.97431514
Natural resources, construction, and maintenance occupations                                                   202065+                55969000    2837242.6353212114142837242.63532121
Natural resources, construction, and maintenance occupations                                                   202516 to 24           30180000    1017513.5281232718181017513.52812327
Natural resources, construction, and maintenance occupations                                                   202525 to 44           91833000    7225410.89529938777225410.89529938
Natural resources, construction, and maintenance occupations                                                   202545 to 64           81152000    5149738.2951971912125149738.29519719
Natural resources, construction, and maintenance occupations                                                   202565+                65052000    4203750.3734863912124203750.37348639
Natural resources, construction, and maintenance occupations                                                   203016 to 24           30605000    1071601.4217846318181071601.42178463
Natural resources, construction, and maintenance occupations                                                   203025 to 44           93878000    7349059.17357954777349059.17357954
Natural resources, construction, and maintenance occupations                                                   203045 to 64           80865000    5131693.7990769312125131693.79907693
Natural resources, construction, and maintenance occupations                                                   203065+                72774000    5365500.098699611115365500.0986996
Natural resources, construction, and maintenance occupations                                                   203516 to 24           32125000    1265045.1826440918181265045.18264409
Natural resources, construction, and maintenance occupations                                                   203525 to 44           95013000    7417685.47961767777417685.47961767
Natural resources, construction, and maintenance occupations                                                   203545 to 64           83700000    5309938.2119721412125309938.21197214
Natural resources, construction, and maintenance occupations                                                   203565+                77315000    6048678.7444122610106048678.74441226
Natural resources, construction, and maintenance occupations                                                   204016 to 24           33199000    1401728.4715671617171401728.47156716
Natural resources, construction, and maintenance occupations                                                   204025 to 44           96078000    7482079.32625257777482079.32625257
Natural resources, construction, and maintenance occupations                                                   204045 to 64           88398000    5605314.6676270711115605314.66762707
Natural resources, construction, and maintenance occupations                                                   204065+                79719000    6410352.70704015996410352.70704015
Natural resources, construction, and maintenance occupations                                                   204516 to 24           33680000    1462943.240628617171462943.2406286
Natural resources, construction, and maintenance occupations                                                   204525 to 44           98725000    7642126.75540054777642126.75540054
Natural resources, construction, and maintenance occupations                                                   204545 to 64           92157000    5841653.5558362711115841653.55583627
Natural resources, construction, and maintenance occupations                                                   204565+                81288000    6646403.64188339996646403.64188339
Natural resources, construction, and maintenance occupations                                                   205016 to 24           33967000    1499468.4770540417171499468.47705404
Natural resources, construction, and maintenance occupations                                                   205025 to 44           101609000    7816504.08281373667816504.08281373
Natural resources, construction, and maintenance occupations                                                   205045 to 64           94570000    5993365.6434257410105993365.64342574
Natural resources, construction, and maintenance occupations                                                   205065+                83739000    7015148.60128478887015148.60128478
Natural resources, construction, and maintenance occupations                                                   205516 to 24           34469000    1563355.8243905217171563355.82439052
Natural resources, construction, and maintenance occupations                                                   205525 to 44           104331000    7981086.28989373557981086.28989373
Natural resources, construction, and maintenance occupations                                                   205545 to 64           96020000    6084531.2161587410106084531.21615874
Natural resources, construction, and maintenance occupations                                                   205565+                87309000    7552243.46259159777552243.46259159
Natural resources, construction, and maintenance occupations                                                   206016 to 24           35239000    1661350.3611416917171661350.36114169
Natural resources, construction, and maintenance occupations                                                   206025 to 44           106303000    8100320.71765338558100320.71765338
Natural resources, construction, and maintenance occupations                                                   206045 to 64           97404000    6171547.1835121710106171547.18351217
Natural resources, construction, and maintenance occupations                                                   206065+                92033000    8262953.86169897558262953.86169897
Production, transportation, and material moving occupations                                                    201516 to 24           30983000    1435372.2662064617171435372.26620646
Production, transportation, and material moving occupations                                                    201525 to 44           84327000    8049755.41837212558049755.41837212
Production, transportation, and material moving occupations                                                    201545 to 64           83839000    7348721.26022222777348721.26022222
Production, transportation, and material moving occupations                                                    201565+                47695000    2037152.7352910715152037152.73529107
Production, transportation, and material moving occupations                                                    202016 to 24           30028000    1327666.217517418181327666.2175174
Production, transportation, and material moving occupations                                                    202025 to 44           88501000    8327560.39465606558327560.39465606
Production, transportation, and material moving occupations                                                    202045 to 64           83238000    7301862.18769071777301862.18769071
Production, transportation, and material moving occupations                                                    202065+                55969000    3226483.3215404613133226483.32154046
Production, transportation, and material moving occupations                                                    202516 to 24           30180000    1344808.9603453918181344808.96034539
Production, transportation, and material moving occupations                                                    202525 to 44           91833000    8549325.17208252558549325.17208252
Production, transportation, and material moving occupations                                                    202545 to 64           81152000    7139219.88269782777139219.88269782
Production, transportation, and material moving occupations                                                    202565+                65052000    4532102.092981512124532102.0929815
Production, transportation, and material moving occupations                                                    203016 to 24           30605000    1392740.971542117171392740.9715421
Production, transportation, and material moving occupations                                                    203025 to 44           93878000    8685432.30588718558685432.30588718
Production, transportation, and material moving occupations                                                    203045 to 64           80865000    7116842.92127263777116842.92127263
Production, transportation, and material moving occupations                                                    203065+                72774000    5642086.4762323811115642086.47623238
Production, transportation, and material moving occupations                                                    203516 to 24           32125000    1564168.3998220717171564168.39982207
Production, transportation, and material moving occupations                                                    203525 to 44           95013000    8760973.42905016558760973.42905016
Production, transportation, and material moving occupations                                                    203545 to 64           83700000    7337883.63778981777337883.63778981
Production, transportation, and material moving occupations                                                    203565+                77315000    6294823.9903922110106294823.99039221
Production, transportation, and material moving occupations                                                    204016 to 24           33199000    1685295.411646217171685295.4116462
Production, transportation, and material moving occupations                                                    204025 to 44           96078000    8831855.62831762558831855.62831762
Production, transportation, and material moving occupations                                                    204045 to 64           88398000    7704179.68230399667704179.68230399
Production, transportation, and material moving occupations                                                    204065+                79719000    6640382.45417557996640382.45417557
Production, transportation, and material moving occupations                                                    204516 to 24           33680000    1739543.1702005916161739543.17020059
Production, transportation, and material moving occupations                                                    204525 to 44           98725000    9008029.5076237559008029.5076237
Production, transportation, and material moving occupations                                                    204545 to 64           92157000    7997263.29901936557997263.29901936
Production, transportation, and material moving occupations                                                    204565+                81288000    6865915.41161155886865915.41161155
Production, transportation, and material moving occupations                                                    205016 to 24           33967000    1771911.3754087116161771911.37540871
Production, transportation, and material moving occupations                                                    205025 to 44           101609000    9199977.17211888559199977.17211888
Production, transportation, and material moving occupations                                                    205045 to 64           94570000    8185401.30570577558185401.30570577
Production, transportation, and material moving occupations                                                    205065+                83739000    7218229.80209949777218229.80209949
Production, transportation, and material moving occupations                                                    205516 to 24           34469000    1828527.5392222316161828527.53922223
Production, transportation, and material moving occupations                                                    205525 to 44           104331000    9381142.75559872559381142.75559872
Production, transportation, and material moving occupations                                                    205545 to 64           96020000    8298455.64043237558298455.64043237
Production, transportation, and material moving occupations                                                    205565+                87309000    7731392.74540506667731392.74540506
Production, transportation, and material moving occupations                                                    206016 to 24           35239000    1915369.0653903716161915369.06539037
Production, transportation, and material moving occupations                                                    206025 to 44           106303000    9512391.29734092559512391.29734092
Production, transportation, and material moving occupations                                                    206045 to 64           97404000    8406364.05371624558406364.05371624
Production, transportation, and material moving occupations                                                    206065+                92033000    8410435.25077636558410435.25077636
Sales and office occupations                                                                                   201516 to 24           30983000    5308028.4755596512125308028.47555965
Sales and office occupations                                                                                   201525 to 44           84327000    15105124.24569772215105124.2456977
Sales and office occupations                                                                                   201545 to 64           83839000    13305849.2429712213305849.242971
Sales and office occupations                                                                                   201565+                47695000    2227232.8352533814142227232.83525338
Sales and office occupations                                                                                   202016 to 24           30028000    5194477.9061039112125194477.90610391
Sales and office occupations                                                                                   202025 to 44           88501000    15549851.90101612215549851.9010161
Sales and office occupations                                                                                   202045 to 64           83238000    13242688.38746422213242688.3874642
Sales and office occupations                                                                                   202065+                55969000    2810613.666918814142810613.6669188
Sales and office occupations                                                                                   202516 to 24           30180000    5212550.8763209512125212550.87632095
Sales and office occupations                                                                                   202525 to 44           91833000    15904866.88604742215904866.8860474
Sales and office occupations                                                                                   202545 to 64           81152000    13023464.51959873313023464.5195987
Sales and office occupations                                                                                   202565+                65052000    3451035.2397997713133451035.23979977
Sales and office occupations                                                                                   203016 to 24           30605000    5263083.8522567512125263083.85225675
Sales and office occupations                                                                                   203025 to 44           93878000    16122755.73490372216122755.7349037
Sales and office occupations                                                                                   203045 to 64           80865000    12993302.84650313312993302.8465031
Sales and office occupations                                                                                   203065+                72774000    3995495.8129349413133995495.81293494
Sales and office occupations                                                                                   203516 to 24           32125000    5443813.5544271511115443813.55442715
Sales and office occupations                                                                                   203525 to 44           95013000    16243686.70969682216243686.7096968
Sales and office occupations                                                                                   203545 to 64           83700000    13291241.32464242213291241.3246424
Sales and office occupations                                                                                   203565+                77315000    4315671.3455180612124315671.34551806
Sales and office occupations                                                                                   204016 to 24           33199000    5571513.3571449311115571513.35714493
Sales and office occupations                                                                                   204025 to 44           96078000    16357159.3864852216357159.386485
Sales and office occupations                                                                                   204045 to 64           88398000    13784967.9455592213784967.945559
Sales and office occupations                                                                                   204065+                79719000    4485171.8917259112124485171.89172591
Sales and office occupations                                                                                   204516 to 24           33680000    5628704.7957922711115628704.79579227
Sales and office occupations                                                                                   204525 to 44           98725000    16639189.5981832216639189.598183
Sales and office occupations                                                                                   204545 to 64           92157000    14180012.29805482214180012.2980548
Sales and office occupations                                                                                   204565+                81288000    4595798.4961352712124595798.49613527
Sales and office occupations                                                                                   205016 to 24           33967000    5662829.4171889211115662829.41718892
Sales and office occupations                                                                                   205025 to 44           101609000    16946471.47598332216946471.4759833
Sales and office occupations                                                                                   205045 to 64           94570000    14433601.55652042214433601.5565204
Sales and office occupations                                                                                   205065+                83739000    4768612.9049353612124768612.90493536
Sales and office occupations                                                                                   205516 to 24           34469000    5722517.7793530911115722517.77935309
Sales and office occupations                                                                                   205525 to 44           104331000    17236492.7212581117236492.721258
Sales and office occupations                                                                                   205545 to 64           96020000    14585986.31606262214585986.3160626
Sales and office occupations                                                                                   205565+                87309000    5020325.4465168912125020325.44651689
Sales and office occupations                                                                                   206016 to 24           35239000    5814071.6416367811115814071.64163678
Sales and office occupations                                                                                   206025 to 44           106303000    17446603.63076631117446603.6307663
Sales and office occupations                                                                                   206045 to 64           97404000    14731434.94172212214731434.9417221
Sales and office occupations                                                                                   206065+                92033000    5353403.8908953611115353403.89089536
Service occupations                                                                                            201516 to 24           30983000    4444436.972153712124444436.9721537
Service occupations                                                                                            201525 to 44           84327000    9980643.91101659449980643.91101659
Service occupations                                                                                            201545 to 64           83839000    7712220.04230937667712220.04230937
Service occupations                                                                                            201565+                47695000    1870818.3091753216161870818.30917532
Service occupations                                                                                            202016 to 24           30028000    4292346.4690905312124292346.46909053
Service occupations                                                                                            202025 to 44           88501000    10276356.47530684410276356.4753068
Service occupations                                                                                            202045 to 64           83238000    7674003.34455584667674003.34455584
Service occupations                                                                                            202065+                55969000    2759089.9119252314142759089.91192523
Service occupations                                                                                            202516 to 24           30180000    4316553.5439236212124316553.54392362
Service occupations                                                                                            202525 to 44           91833000    10512416.43319264410512416.4331926
Service occupations                                                                                            202545 to 64           81152000    7541357.70143792777541357.70143792
Service occupations                                                                                            202565+                65052000    3734213.306628813133734213.3066288
Service occupations                                                                                            203016 to 24           30605000    4384237.7992135112124384237.79921351
Service occupations                                                                                            203025 to 44           93878000    10657297.16965014410657297.1696501
Service occupations                                                                                            203045 to 64           80865000    7523107.79751902777523107.79751902
Service occupations                                                                                            203065+                72774000    4563223.8597391212124563223.85973912
Service occupations                                                                                            203516 to 24           32125000    4626308.5475444312124626308.54754443
Service occupations                                                                                            203525 to 44           95013000    10737707.74954224410737707.7495422
Service occupations                                                                                            203545 to 64           83700000    7703381.2386692667703381.2386692
Service occupations                                                                                            203565+                77315000    5050731.8786039212125050731.87860392
Service occupations                                                                                            204016 to 24           33199000    4797350.6420887712124797350.64208877
Service occupations                                                                                            204025 to 44           96078000    10813159.08662154410813159.0866215
Service occupations                                                                                            204045 to 64           88398000    8002120.08400379558002120.08400379
Service occupations                                                                                            204065+                79719000    5308818.0440632812125308818.04406328
Service occupations                                                                                            204516 to 24           33680000    4873953.2933698112124873953.29336981
Service occupations                                                                                            204525 to 44           98725000    11000689.31126844411000689.3112684
Service occupations                                                                                            204545 to 64           92157000    8241149.3133807558241149.3133807
Service occupations                                                                                            204565+                81288000    5477261.1362453711115477261.13624537
Service occupations                                                                                            205016 to 24           33967000    4919660.0728243912124919660.07282439
Service occupations                                                                                            205025 to 44           101609000    11205010.11515284411205010.1151528
Service occupations                                                                                            205045 to 64           94570000    8394588.40103339558394588.40103339
Service occupations                                                                                            205065+                83739000    5740393.0794820111115740393.07948201
Service occupations                                                                                            205516 to 24           34469000    4999607.1226021112124999607.12260211
Service occupations                                                                                            205525 to 44           104331000    11397853.81424194411397853.8142419
Service occupations                                                                                            205545 to 64           96020000    8486791.74835888558486791.74835888
Service occupations                                                                                            205565+                87309000    6123657.4766076110106123657.47660761
Service occupations                                                                                            206016 to 24           35239000    5122235.0674802712125122235.06748027
Service occupations                                                                                            206025 to 44           106303000    11537562.7689094411537562.768909
Service occupations                                                                                            206045 to 64           97404000    8574798.25366818558574798.25366818
Service occupations                                                                                            206065+                92033000    6630811.82171161996630811.82171161
;;;;

proc sql;
create table projected_labor_FINAL as
select a.*, b.*
from scored_labor_data_1 a join occupation_and_pay_2 b on a.industry = b.industry;
quit;

data projected_ss_step_1 (drop = warnings b_Sum_Labor_Force_ Segment Prediction_for_Sum_Labor_Force_P);
set projected_labor_final;
ss_employee_rate = (0.062);
ss_employer_rate = (0.062);
combined_ss_rate = (0.124);
wage_cap = (117000);
active_contributors = (percent_employment * predicted_sum_labor_force_pop);
run;


data projected_ss_step_2;
set projected_ss_step_1;
if (annual_mean_wage lt wage_cap) then
combined_ss_contribution = (annual_mean_wage * combined_ss_rate);
if (annual_mean_wage gt wage_cap) then 
combined_ss_contribution = (wage_cap * combined_ss_rate);
total_contributions = (combined_ss_contribution * active_contributors);
run;

proc sql;
create table projected_total_contributions as
select date, sum(total_contributions) as total_contributions
from projected_ss_step_2
group by date;
quit;

data projected_ss_step_3;
set ss_calc.projected_population;
if age_group = "65 years and over" and gender = "both sexes" then
output;

data projected_ss_payout (drop = gender age_group population_in_thousands population);
set projected_ss_step_3;
Population = (population_in_thousands * 1000);
ss_payout = (population * 1503 * 12);

data projected_total_contributions_1(drop = date);
set projected_total_contributions;
char_date = put (date, $4.);
run;

proc sql;
create table ss_calc.projected_ss_final as
select a.char_date, a.total_contributions, b.ss_payout
from projected_total_contributions_1 a join projected_ss_payout b on a.char_date = b.date;
quit;


