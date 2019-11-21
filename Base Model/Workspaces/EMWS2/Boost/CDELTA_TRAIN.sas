if upcase(NAME) = "AGE_GROUP" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "DATE" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "Q_SUM_LABOR_FORCE_POP" then do;
ROLE = "ASSESS";
end;
