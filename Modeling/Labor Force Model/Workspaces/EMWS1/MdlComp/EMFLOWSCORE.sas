drop _temp_;
if (P_Sum_Labor_Force_Pop ge 11279545.1505016) then do;
b_Sum_Labor_Force_ = 1;
end;
else
if (P_Sum_Labor_Force_Pop ge 3696637.03703703) then do;
_temp_ = dmran(1234);
b_Sum_Labor_Force_ = floor(10 + 2*_temp_);
end;
else
if (P_Sum_Labor_Force_Pop ge 1100870.12987012) then do;
_temp_ = dmran(1234);
b_Sum_Labor_Force_ = floor(14 + 2*_temp_);
end;
else
do;
b_Sum_Labor_Force_ = 20;
end;
