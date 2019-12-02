option user = Labor;
proc sql;
create table OG_Labor_Join_1 as
select *, population_in_thousands * 1000 as Population from OG_Labor_Join;
data OG_Labor_Join;
set OG_Labor_Join_1;
drop Population_in_thousands;
run;
