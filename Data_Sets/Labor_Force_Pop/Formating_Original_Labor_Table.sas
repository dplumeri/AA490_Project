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
	order by Year, Industry, Age_Group;
