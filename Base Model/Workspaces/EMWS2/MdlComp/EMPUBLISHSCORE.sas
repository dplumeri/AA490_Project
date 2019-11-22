drop _temp_;
if (P_Sum_Labor_Force_Pop ge 12847651.6853932) then do;
b_Sum_Labor_Force_ = 1;
end;
else
if (P_Sum_Labor_Force_Pop ge 9464919.99999999) then do;
_temp_ = dmran(1234);
b_Sum_Labor_Force_ = floor(5 + 2*_temp_);
end;
else
if (P_Sum_Labor_Force_Pop ge 3744154.76190476) then do;
_temp_ = dmran(1234);
b_Sum_Labor_Force_ = floor(9 + 2*_temp_);
end;
else
if (P_Sum_Labor_Force_Pop ge 1083534.09090907) then do;
_temp_ = dmran(1234);
b_Sum_Labor_Force_ = floor(14 + 2*_temp_);
end;
else
do;
b_Sum_Labor_Force_ = 20;
end;
