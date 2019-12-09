label LG10_Cases_in_1000s = 'Transformed Cases_in_1000s';
length LG10_Cases_in_1000s 8;
if Cases_in_1000s eq . then LG10_Cases_in_1000s = .;
else do;
if Cases_in_1000s + 1 > 0 then LG10_Cases_in_1000s = log10(Cases_in_1000s + 1);
else LG10_Cases_in_1000s = .;
end;
