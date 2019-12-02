option user = Labor;
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
data og_labor_join;
set og_labor_join_2;
label 	Population = "Overal_Population"
		Sum_Labor_Force_Pop = "Industry_Population";
run;
