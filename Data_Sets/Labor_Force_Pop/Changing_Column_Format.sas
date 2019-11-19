options user = labor;
data labor_force_final;
set labor_force_grouped;
Year_char = put(Year, $4.);
drop Year;
run;
