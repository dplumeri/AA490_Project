label LG10_Population_in_thousands = 'Transformed Population_in_thousands';
length LG10_Population_in_thousands 8;
if Population_in_thousands eq . then LG10_Population_in_thousands = .;
else do;
if Population_in_thousands + 1 > 0 then LG10_Population_in_thousands = log10(Population_in_thousands + 1);
else LG10_Population_in_thousands = .;
end;