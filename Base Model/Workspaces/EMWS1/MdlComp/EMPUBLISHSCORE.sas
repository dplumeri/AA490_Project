drop _temp_;
do;
_temp_ = dmran(1234);
b_Disease = floor(1 + 20*_temp_);
end;
