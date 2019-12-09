label OPT_Population_in_thousands = 'Transformed Population_in_thousands';
length OPT_Population_in_thousands $36;
if (Population_in_thousands eq .) then OPT_Population_in_thousands="04:35431.169-high, MISSING";
else
if (Population_in_thousands < 16090.6415) then
OPT_Population_in_thousands = "01:low-16090.642";
else
if (Population_in_thousands >= 16090.6415 and Population_in_thousands < 28948.373) then
OPT_Population_in_thousands = "02:16090.642-28948.373";
else
if (Population_in_thousands >= 28948.373 and Population_in_thousands < 35431.169) then
OPT_Population_in_thousands = "03:28948.373-35431.169";
else
if (Population_in_thousands >= 35431.169) then
OPT_Population_in_thousands = "04:35431.169-high, MISSING";
