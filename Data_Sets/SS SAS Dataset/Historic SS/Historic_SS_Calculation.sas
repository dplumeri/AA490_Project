options user = SSdata;
libname SSData "C:\Users\student\Desktop\AA Capstone\Project\GitRepository\aa490_project\Data_Sets\SS SAS Dataset\Historic SS";

data ssdata.his_ss_step_1;
set ssdata.ss_pay_past;
active_contributors = (percent_employment * sum_labor_force_pop);
run;

data ssdata.his_ss_step_2(drop = employee_ss_rate employer_ss_rate);
set ssdata.his_ss_step_1;;
if (annual_mean_wage lt ss_wage_limit) then  
total_taxable_income = (active_contributors * annual_mean_wage);
else total_taxable_income = (active_contributors * ss_wage_limit);
new_employee_ss_rate = (employee_ss_rate/100);
new_employer_ss_rate = (employer_ss_rate/100);
total_ss_rate = (new_employer_ss_rate + new_employee_ss_rate);
run;

data ssdata.his_ss_step_3;
set ssdata.his_ss_step_2;
if (annual_mean_wage lt ss_wage_limit) then
combined_ss_contribution = (annual_mean_wage * total_ss_rate);
if (annual_mean_wage gt ss_wage_limit) then 
combined_ss_contribution = (ss_wage_limit * total_ss_rate);
total_ss_contribution = (active_contributors * combined_ss_contribution);
total_ss_contribution_2 = (total_taxable_income * total_ss_rate);
run;

proc sql;
create table total_contributions as
select year_char, sum(total_ss_contribution) as total_ss_contribution
from ssdata.his_ss_step_3
group by year_char;

data his_ss_step_4 (drop = year);
set ssdata.census_population;
if age_group = "65_years_and_over" and gender = "both sexes" then
output;

data his_ss_step_5;
set ssdata.his_ss_step_4;
if date in ("1990", "1991", "1992", "1993", "1994", "1995", "1996", 
			"1997", "1998", "1999") then 
delete;

data ss_payout (drop = gender age_group population_in_thousands population);
set ssdata.his_ss_step_5;
Population = (population_in_thousands * 1000);
ss_payout = (population * 1503 * 12);


proc sql;
create table historic_ss_final as
select a.date, b.total_ss_contribution, a.ss_payout
from ss_payout a join total_contributions b on a.date = b.year_char;
quit;
