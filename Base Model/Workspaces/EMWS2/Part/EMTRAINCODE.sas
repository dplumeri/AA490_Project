*------------------------------------------------------------*;
* Part: Create random partition;
*------------------------------------------------------------*;
data
EMWS2.Part_TRAIN(label="")
EMWS2.Part_VALIDATE(label="")
;
retain _seed_ 12345;
drop _seed_ _genvalue_;
call ranuni(_seed_, _genvalue_);
label _dataobs_ = "%sysfunc(sasmsg(sashelp.dmine, sample_dataobs_vlabel, NOQUOTE))";
_dataobs_ = _N_;
drop _c00:;
set EMWS2.Stat_TRAIN;
if (1040 +1-_n_)*_genvalue_ <= (728 - _C000001) then do;
_C000001 + 1;
output EMWS2.Part_TRAIN;
end;
else do;
_C000002 + 1;
output EMWS2.Part_VALIDATE;
end;
run;
run;
