
if NAME="OPT_Population_in_thousands" then do;
   COMMENT = "Optimal Binning(4) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="NOMINAL";
end;
if NAME="Population_in_thousands" then delete;
