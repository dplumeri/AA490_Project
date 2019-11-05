options user = ppoptest;
data projected_drop_step_1;
set projected_population;
if Age_group not in('65 years and over',"85 years and over") then delete;
run;
proc sort data=projected_drop_step_1 out=projected_drop_step_2;

by Date  Gender ;
run;
proc sql;
create table projected_drop_step_3 as
select * from projected_drop_step_2
order by Date, Gender, Age_group desc;
data projected_drop_step_4;
set projected_drop_step_3;
Lag_Population = lag(Population_in_thousands);
_65_84_ = Population_in_thousands - Lag_Population;
run;
data projected_drop_step_5;
set projected_drop_step_4;
if Age_group = "65 years and over" then Population_in_thousands = _65_84_;
if Age_group = "65 years and over" then Age_group = "65-84";
if Age_group not in("65-84") then delete;
drop Lag_population _65_84_;
run;
