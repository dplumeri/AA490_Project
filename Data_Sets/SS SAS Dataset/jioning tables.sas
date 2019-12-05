options user = labor;
PROC SQL;
   CREATE TABLE occupation_and_pay_2 AS 
   SELECT Industry, 
          'Occupation title'n AS Occupation_title, 
          'Percent Employment'n AS Percent_Employment, 
          'Annual mean wage'n AS Annual_mean_wage
      FROM occupation_and_pay;
QUIT;

proc sql;
create table work.temp2 as
 select a.*, b.* from occupation_and_pay_2 a 
	join labor_force_final b on a.industry = b.industry;
quit;
data work.temp3 (drop = year);
set SS_DAT.socialsecurity_data_final;
newyear = put (year, $4.);
run;
proc sql;
create table work.temp4 as 
	select a.*, b.employee_SS_rate, b.employer_SS_rate from work.temp2 a 
		join work.temp3 b on a.year_char = b.newyear;
quit;
proc sql;
create table SS_DAT.SS_Pay_Past as
	select a.*, b.SS_wage_limit from work.temp4 a
		join ss_dat.wagelimit b on a.year_char = b.year;
quit;
