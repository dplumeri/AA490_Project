*------------------------------------------------------------*;
* Computed Code;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TRANSFORM: Population_in_thousands , Optimal Binning(4);
*------------------------------------------------------------*;
label OPT_Population_in_thousands = 'Transformed Population_in_thousands';
length OPT_Population_in_thousands $36;
if (Population_in_thousands eq .) then OPT_Population_in_thousands="03:40523.919-high, MISSING";
else
if (Population_in_thousands < 27749.9125) then
OPT_Population_in_thousands = "01:low-27749.913";
else
if (Population_in_thousands >= 27749.9125 and Population_in_thousands < 40523.9185) then
OPT_Population_in_thousands = "02:27749.913-40523.919";
else
if (Population_in_thousands >= 40523.9185) then
OPT_Population_in_thousands = "03:40523.919-high, MISSING";
