options user = Disease;
data disease_cases_formated;
set disease_cases;
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
