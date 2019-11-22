if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'AGE_GROUP'
'DATE'
'POPULATION_IN_THOUSANDS'
) then ROLE='INPUT';
else delete;
end;
