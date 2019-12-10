if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'AGE_GROUP'
'INDUSTRY'
'POPULATION'
) then ROLE='INPUT';
else delete;
end;
