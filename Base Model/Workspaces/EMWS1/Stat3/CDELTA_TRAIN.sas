if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'AGE_GROUP'
'GENDER'
'PROJECTED_SUM_POP'
'YEAR'
) then ROLE='INPUT';
else delete;
end;
