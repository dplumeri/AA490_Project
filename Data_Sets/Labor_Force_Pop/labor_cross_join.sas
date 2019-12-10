options user = Disease;
proc sql;
create table Industry_List as 
	select distinct Industry from Labor_foce_final;
quit;
data work.temp1;
set Labor_proj_final;

if gender = "female" then delete;
if gender = "male" then delete;
run;
proc sql;
create table cross_join_labor_2 as
	select a.*, b.* from Industry_list a cross join work.temp1 b;
quit; 

