drop _temp_;
if (P_Cases_in_1000s ge 92.944444444444) then do;
b_Cases_in_1000s = 1;
end;
else
if (P_Cases_in_1000s ge 69.8125) then do;
b_Cases_in_1000s = 2;
end;
else
if (P_Cases_in_1000s ge 41.375) then do;
b_Cases_in_1000s = 3;
end;
else
if (P_Cases_in_1000s ge 30.7152777777777) then do;
b_Cases_in_1000s = 4;
end;
else
if (P_Cases_in_1000s ge 24.2777777777777) then do;
b_Cases_in_1000s = 5;
end;
else
if (P_Cases_in_1000s ge 18.0760869565217) then do;
b_Cases_in_1000s = 6;
end;
else
if (P_Cases_in_1000s ge 14.2084639498432) then do;
_temp_ = dmran(1234);
b_Cases_in_1000s = floor(7 + 2*_temp_);
end;
else
if (P_Cases_in_1000s ge 12.6414141414141) then do;
b_Cases_in_1000s = 9;
end;
else
if (P_Cases_in_1000s ge 10.9595959595959) then do;
b_Cases_in_1000s = 10;
end;
else
if (P_Cases_in_1000s ge 9.11660079051383) then do;
b_Cases_in_1000s = 11;
end;
else
if (P_Cases_in_1000s ge 5.28472222222222) then do;
b_Cases_in_1000s = 12;
end;
else
if (P_Cases_in_1000s ge 4.34722222222222) then do;
b_Cases_in_1000s = 13;
end;
else
if (P_Cases_in_1000s ge 2.33395522388059) then do;
b_Cases_in_1000s = 14;
end;
else
if (P_Cases_in_1000s ge 0.41791044776119) then do;
b_Cases_in_1000s = 15;
end;
else
if (P_Cases_in_1000s ge 0) then do;
_temp_ = dmran(1234);
b_Cases_in_1000s = floor(17 + 2*_temp_);
end;
else
do;
b_Cases_in_1000s = 20;
end;
