Libname DataSet "C:\Users\student\Desktop\AA Capstone\Project\GitRepository\aa490_project\Data_Sets\Labor_Force_Pop";
options user = dataset;

/* Creating table with age_group (16-17 records) for Historic Labor Force Population */ 

data His_16_to_17_Step_one;
set dataset.census_population;
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
set dataset.projected_population;
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
