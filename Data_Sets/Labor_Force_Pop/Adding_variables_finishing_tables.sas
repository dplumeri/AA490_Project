options user = labor;
data laborforcehistoricrecode_2;
set laborforcehistoricrecode;
run;
proc append base = laborforcehistoricrecode_2 data = his_16_to_17_step_five;
run;
data laborforcehistoricrecode_2;
set laborforcehistoricrecode_2;
if Age_Group = '16 to 17' then Age_Group = '16 to 24';
run;
proc freq data = laborforcehistoricrecode_2;
table Age_Group /nocum nofreq;
run;
proc sql;
create table labor_historic_FINAL as 
select Date, gender, Age_Group, sum(population_in_thousands) as Population_in_thousands from laborforcehistoricrecode_2
group by Date, Age_Group, Gender
order by Date, Age_Group, Gender;
/*projected*/
data laborforceprojectedrecode_2;
set laborforceprojectedrecode;
if Age_Group = '16 to 17' then Age_Group = '16 to 24';
run;
proc freq data = laborforceprojectedrecode_2;
table Age_Group /nocum nofreq;
run;
proc sql;
create table labor_projected_FINAL as 
select Date, gender, Age_Group, sum(population_in_thousands) as Population_in_thousands from laborforceprojectedrecode_2
group by Date, Age_Group, Gender
order by Date, Age_Group, Gender;
