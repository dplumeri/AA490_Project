if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'AGE_GROUP'
'DATE'
'GENDER'
'HISTORIC_POP_SUM'
'OG_POP_SUM'
) then ROLE='INPUT';
else delete;
end;
