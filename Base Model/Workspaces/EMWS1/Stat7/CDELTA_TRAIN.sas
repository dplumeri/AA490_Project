if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'AGE_GROUP'
'DATE'
'GENDER'
) then ROLE='INPUT';
else delete;
end;
