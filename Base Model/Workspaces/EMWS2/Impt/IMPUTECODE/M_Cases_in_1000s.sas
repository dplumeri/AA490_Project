label M_Cases_in_1000s = "Imputation Indicator for Cases_in_1000s";
if missing(Cases_in_1000s) then M_Cases_in_1000s = 1;
else M_Cases_in_1000s= 0;
