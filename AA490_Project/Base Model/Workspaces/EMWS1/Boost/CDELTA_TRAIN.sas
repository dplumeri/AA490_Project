if upcase(NAME) = "OG_CASES_IN_THOUSANDS" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "PROJECTED_SUM_POP" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "Q_AGE_GROUP0_17" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "Q_AGE_GROUP18_24" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "Q_AGE_GROUP25_44" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "Q_AGE_GROUP65_84" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "Q_AGE_GROUP85_" then do;
ROLE = "ASSESS";
end;
