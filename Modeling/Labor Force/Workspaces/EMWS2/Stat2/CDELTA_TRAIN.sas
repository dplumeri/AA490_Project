if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'AGE'
'CASES_IN_1000S'
'DISEASE'
'GENDER'
'YEAR'
) then ROLE='INPUT';
else delete;
end;
