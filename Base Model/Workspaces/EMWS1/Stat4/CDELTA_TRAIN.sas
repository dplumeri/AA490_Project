if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'OG_CASES_IN_THOUSANDS'
'PROJECTED_SUM_POP'
) then ROLE='INPUT';
else delete;
end;
