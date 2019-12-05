if upcase(NAME) = "AGE_GROUP" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "DATE" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "DISEASE" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "GENDER" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "Q_CASES_IN_1000S" then do;
ROLE = "ASSESS";
end;
