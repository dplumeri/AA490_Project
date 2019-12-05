label OPT_Population_in_thousands = 'Transformed Population_in_thousands';
length OPT_Population_in_thousands $36;
if (Population_in_thousands eq .) then OPT_Population_in_thousands="02:8773.6505-34177.5, MISSING";
else
if (Population_in_thousands < 8773.6505) then
OPT_Population_in_thousands = "01:low-8773.6505";
else
if (Population_in_thousands >= 8773.6505 and Population_in_thousands < 34177.5) then
OPT_Population_in_thousands = "02:8773.6505-34177.5, MISSING";
else
if (Population_in_thousands >= 34177.5 and Population_in_thousands < 72628.5) then
OPT_Population_in_thousands = "03:34177.5-72628.5";
else
if (Population_in_thousands >= 72628.5) then
OPT_Population_in_thousands = "04:72628.5-high";
