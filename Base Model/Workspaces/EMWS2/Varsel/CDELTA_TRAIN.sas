if upcase(name) = 'AGE_GROUP' then role = 'REJECTED';
else
if upcase(name) = 'DISEASE' then role = 'REJECTED';
if upcase(strip(name)) = "G_AGE_GROUP" then level = "NOMINAL";
if upcase(strip(name)) = "G_DISEASE" then level = "NOMINAL";
