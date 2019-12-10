options user = Disease;
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
create table Disease_Future_Join_1 as
	select a.*, b.* from Disease_List a cross join work.temp1 b;
quit; 

