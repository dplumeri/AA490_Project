
if NAME="LG10_Cases_in_1000s" then do;
   COMMENT = "log10(Cases_in_1000s  + 1) ";
ROLE ="TARGET";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="Cases_in_1000s" then delete;

if NAME="LG10_Population_in_thousands" then do;
   COMMENT = "log10(Population_in_thousands  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="Population_in_thousands" then delete;
