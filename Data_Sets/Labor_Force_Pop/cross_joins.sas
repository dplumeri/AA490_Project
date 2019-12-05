options user = Labor;
proc sql;
create table Industry_List as 
	select distinct Industry from Labor_force_final;
quit;
data work.temp1 (drop = gender);
set labor_projected_final;
if gender = "male" then delete;
if gender = "female" then delete;
run;
proc sql;
create table Labor_Future_Join as
	select a.*, b.* from Industry_List a cross join work.temp1 b;
quit; 

