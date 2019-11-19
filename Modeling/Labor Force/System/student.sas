options user = Labor;
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
	order by Year, Industry, Age_Groupoptions user = Labor;
proc sql;
create table OG_Labor_AND_Historic as
select b.Date as Date, a.Industry, b.Gender, b.Age_Group, sum(a.Sum_Labor_Force_Pop) as OG_Pop_Sum, sum(b.Population_in_thousands) as Historic_Pop_Sum from Labor_force_grouped a 
join labor_historic_final b on a.Age_Group = b.Age_Group
group by Date, Industry, Gender, b.Age_Group
order by Date, Industry, Gender, b.Age_Group;
data labor_projected_final_2;
set labor_projected_final;
if Age_Group = "25 to 44 years" then Age_Group = "25 to 44";
run;
proc sql;
create table OG_Labor_AND_Projected as
select b.Date as Date, a.Industry, b.Gender, b.Age_Group, sum(a.Sum_Labor_Force_Pop) as OG_Pop_Sum, sum(b.Population_in_thousands) as Projected_Pop_Sum from Labor_force_grouped a 
join labor_Projected_final_2 b on a.Age_Group = b.Age_Group
group by Date, Industry, Gender, b.Age_Group
order by Date, Industry, Gender, b.Age_Group;
