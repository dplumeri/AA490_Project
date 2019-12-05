options user = Labor;
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
select b.Date as Date, a.Industry, b.Gender, b.Age_Group, sum(a.Sum_Labor_Force_Pop) as OG_Pop_Sum, sum(b.Population_in_thousands)*1000 as Projected_Pop_Sum from Labor_force_grouped a 
join labor_Projected_final_2 b on a.Age_Group = b.Age_Group
group by Date, Industry, Gender, b.Age_Group
order by Date, Industry, Gender, b.Age_Group;
data og_labor_and_projected_1;
set og_labor_and_projected;
if Gender = "male" then delete;
if Gender = "female" then delete;
run;
