if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'AGE_GROUP'
) then ROLE='INPUT';
else do;
ROLE='REJECTED';
COMMENT = "Reg3: Rejected using forward selection";
end;
end;
