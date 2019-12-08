options user = SSdata;
libname SSData "C:\Users\student\Desktop\AA Capstone\Project\GitRepository\aa490_project\Data_Sets\SS SAS Dataset\Historic SS";
/* Creating an "active_contributors" column (percent employment * segment population) */
data work.temp1;
set ssdata.ss_pay_past;
active_contributors = (percent_employment * sum_labor_force_pop);
run;

/* Calculating total_taxable income for the year 2000 */ 
data work.temp2;
set work.temp1;
if year_char = 2000
	and (annual_mean_wage lt 76201) 
	then total_taxable_income = (active_contributors * annual_mean_wage);
if year_char = 2000 
	and (annual_mean_wage gt 76200)
	then total_taxable_income = (active_contributors * 76200);
run;

/* Calculating "total taxable_income" for the year 2001 */

data work.temp3;
set work.temp2;
if year_char = 2001
	and (annual_mean_wage lt 80401) 
	then total_taxable_income = (active_contributors * annual_mean_wage);
if year_char = 2001 
	and (annual_mean_wage gt 80400)
	then total_taxable_income = (active_contributors * 80400);
run;

/* Calculating total taxable income for the year 2002 */

data work.temp4;
set work.temp3;
if year_char = 2002
	and (annual_mean_wage lt 84901) 
	then total_taxable_income = (active_contributors * annual_mean_wage);
if year_char = 2002
	and (annual_mean_wage gt 84900)
	then total_taxable_income = (active_contributors * 84900);
run;

/* Calculating total taxable income for the year 2003-2004 */

data work.temp5;
set work.temp4;
if year_char = 2003 or year_char = 2004
	and (annual_mean_wage lt 87901) 
	then total_taxable_income = (active_contributors * annual_mean_wage);
if year_char = 2003 or year_char = 2004
	and (annual_mean_wage gt 87900)
	then total_taxable_income = (active_contributors * 87900);
run;

/* Calculating total taxable income for the year 2005 */

data work.temp6;
set work.temp5;
if year_char = 2005 
	and (annual_mean_wage lt 90001) 
	then total_taxable_income = (active_contributors * annual_mean_wage);
if year_char = 2005
	and (annual_mean_wage gt 90000)
	then total_taxable_income = (active_contributors * 90000);
run;

/* Calculating total taxable income for the year 2006 */
data work.temp7;
set work.temp6;
if year_char = 2006 
	and (annual_mean_wage lt 94201) 
	then total_taxable_income = (active_contributors * annual_mean_wage);
if year_char = 2006
	and (annual_mean_wage gt 94200)
	then total_taxable_income = (active_contributors * 94200);
run;

/* Calculating total taxable income for the year 2007 */

data work.temp8;
set work.temp7;
if year_char = 2007 
	and (annual_mean_wage lt 97501) 
	then total_taxable_income = (active_contributors * annual_mean_wage);
if year_char = 2007
	and (annual_mean_wage gt 97500)
	then total_taxable_income = (active_contributors * 97500);
run;

/* Calculating total taxable income for the year 2008 */

data work.temp9;
set work.temp8;
if year_char = 2008 
	and (annual_mean_wage lt 102001) 
	then total_taxable_income = (active_contributors * annual_mean_wage);
if year_char = 2008
	and (annual_mean_wage gt 102000)
	then total_taxable_income = (active_contributors * 102000);
run;

/* Calculating total taxable income for the year 2009-2011 */

data work.temp10;
set work.temp9;
if year_char = 2009 or year_char = 2010 or year_char = 2011 
	and (annual_mean_wage lt 106801) 
	then total_taxable_income = (active_contributors * annual_mean_wage);
if year_char = 2009 or year_char = 2010 or year_char = 2011
	and (annual_mean_wage gt 106800)
	then total_taxable_income = (active_contributors * 106800);
run;

/* Calculating total taxable income for the year 2012 */

data work.temp11;
set work.temp10;
if year_char = 2012
	and (annual_mean_wage lt 110101) 
	then total_taxable_income = (active_contributors * annual_mean_wage);
if year_char = 2012
and (annual_mean_wage gt 110100)
	then total_taxable_income = (active_contributors * 110100);
run;

/* FINALLY calculating total taxable income for the year 2013 */

data work.temp12;
set work.temp11;
if year_char = 2013
	and (annual_mean_wage lt 113701)
	then total_taxable_income = (active_contributors * annual_mean_wage);
if year_char = 2013
and (annual_mean_wage gt 113700)
	then total_taxable_income = (active_contributors * 113700);
run;

/* Dividing employee_ss_rate & employer_ss_rate by 100 to get correct percent value */

data work.temp13;
set work.temp12;
new_employee_ss_rate = (employee_ss_rate / 100);
new_employer_ss_rate = (employer_ss_rate / 100);
run;

/* Computing "Employee_Contribution", "Employeer_Contribution", and "Combined_Contributions" columns */

data work.temp14;
set work.temp13;
employee_contribution = (total_taxable_income * new_employee_ss_rate);
employer_contribution = (total_taxable_income * new_employer_ss_rate);
combined_contribution = (employer_contribution + employer_contribution);
run;


/* Dropping uneeded columns */

data ssdata.historic_ss_data_final;
set work.temp14;
(drop employee_ss_rate employer_ss_rate active_contributors);
