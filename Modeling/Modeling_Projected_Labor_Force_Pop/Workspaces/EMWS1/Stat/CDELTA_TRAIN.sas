if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'AGE_GROUP'
'DATE'
'GENDER'
'POPULATION_IN_THOUSANDS'
'SUM_LABOR_FORCE_POP'
) then ROLE='INPUT';
else delete;
end;
