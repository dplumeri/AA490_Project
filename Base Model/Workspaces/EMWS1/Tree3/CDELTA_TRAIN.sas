if upcase(NAME) = "DATE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "GENDER" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "Q_SUM_LABOR_FORCE_POP" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "_NODE_" then do;
ROLE = "SEGMENT";
LEVEL = "NOMINAL";
end;
