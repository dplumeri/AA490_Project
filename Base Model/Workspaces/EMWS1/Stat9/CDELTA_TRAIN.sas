if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'AGE_GROUP'
'YEAR_CHAR'
) then ROLE='INPUT';
else delete;
end;
