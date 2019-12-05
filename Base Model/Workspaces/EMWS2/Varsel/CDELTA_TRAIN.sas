if upcase(name) = 'AGE_GROUP' then role = 'REJECTED';
else
if upcase(name) = 'DATE' then role = 'REJECTED';
else
if upcase(name) = 'DISEASE' then role = 'REJECTED';
else
if upcase(name) = 'GENDER' then role = 'REJECTED';
else
if upcase(name) = 'OPT_POPULATION_IN_THOUSANDS' then role = 'REJECTED';
if upcase(strip(name)) = "G_OPT_POPULATION_IN_THOUSANDS" then level = "NOMINAL";
if upcase(strip(name)) = "G_DISEASE" then level = "NOMINAL";
if upcase(strip(name)) = "G_AGE_GROUP" then level = "NOMINAL";
if upcase(strip(name)) = "G_GENDER" then level = "NOMINAL";
if upcase(strip(name)) = "G_DATE" then level = "NOMINAL";
