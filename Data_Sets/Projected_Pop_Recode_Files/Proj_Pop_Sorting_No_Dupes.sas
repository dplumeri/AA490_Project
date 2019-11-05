options user = ppoptest;

proc sql;
create table Proj_Pop_Final_No_Dupe as
select Date, Gender, Age_Group, sum(Population_in_thousands) as Population_in_thousands from Ppopfinal
group by Date, Age_Group, Gender
order by Date, Age_Group, Gender;

data Proj_Pop_Final_No_Dupe;
set Proj_Pop_Final_No_Dupe;
if Gender = "both sexes" then Gender = "All";
run;
