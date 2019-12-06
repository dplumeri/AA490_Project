options user = Disease;
proc sql;
create table Disease_List as 
	select distinct Disease from Disease_Case_final;
quit;
data work.temp1 (drop = gender);
set proj_disease_final;
if gender = "male" then delete;
if gender = "female" then delete;
run;
proc sql;
create table Disease_Future_Join as
	select a.*, b.* from Disease_List a cross join work.temp1 b;
quit; 

