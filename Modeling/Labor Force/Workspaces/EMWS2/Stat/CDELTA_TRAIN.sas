if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'AGE_GROUP'
'GENDER'
'POPULATION_IN_THOUSANDS'
'YEAR'
) then ROLE='INPUT';
else delete;
end;
