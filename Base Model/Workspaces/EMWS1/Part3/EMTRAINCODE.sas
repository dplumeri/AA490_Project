*------------------------------------------------------------*;
* Part3: Retrieving stratification variable(s) levels;
*------------------------------------------------------------*;
proc freq data=EMWS1.Stat4_TRAIN noprint;
table
Age_group
/out=WORK.Part3_FREQ(drop=percent);
run;
proc sort data=WORK.Part3_FREQ;
by descending count;
run;
* Part3: Retrieving levels that meet minimum requirement;
data WORK.Part3_FREQ2(keep = count);
set WORK.Part3_FREQ;
where (.01 * 60 * count) >= 3;
run;
*------------------------------------------------------------*;
* Part3: Create stratified partitioning;
*------------------------------------------------------------*;
data
EMWS1.Part3_TRAIN(label="")
EMWS1.Part3_VALIDATE(label="")
;
retain _seed_ 12345;
drop _seed_ _genvalue_;
call ranuni(_seed_, _genvalue_);
label _dataobs_ = "%sysfunc(sasmsg(sashelp.dmine, sample_dataobs_vlabel, NOQUOTE))";
_dataobs_ = _N_;
drop _c00:;
set EMWS1.Stat4_TRAIN;
if
strip(Age_group) = '0-17'
then do;
if (315+1-_C000003)*_genvalue_ <= (189 - _C000001) then do;
_C000001 + 1;
output EMWS1.Part3_TRAIN;
end;
else do;
_C000002 + 1;
output EMWS1.Part3_VALIDATE;
end;
_C000003+1;
end;
else if
strip(Age_group) = '18-24'
then do;
if (315+1-_C000006)*_genvalue_ <= (189 - _C000004) then do;
_C000004 + 1;
output EMWS1.Part3_TRAIN;
end;
else do;
_C000005 + 1;
output EMWS1.Part3_VALIDATE;
end;
_C000006+1;
end;
else if
strip(Age_group) = '25-44'
then do;
if (315+1-_C000009)*_genvalue_ <= (189 - _C000007) then do;
_C000007 + 1;
output EMWS1.Part3_TRAIN;
end;
else do;
_C000008 + 1;
output EMWS1.Part3_VALIDATE;
end;
_C000009+1;
end;
else if
strip(Age_group) = '65-84'
then do;
if (315+1-_C0000012)*_genvalue_ <= (189 - _C0000010) then do;
_C0000010 + 1;
output EMWS1.Part3_TRAIN;
end;
else do;
_C0000011 + 1;
output EMWS1.Part3_VALIDATE;
end;
_C0000012+1;
end;
else if
strip(Age_group) = '85+'
then do;
if (315+1-_C0000015)*_genvalue_ <= (189 - _C0000013) then do;
_C0000013 + 1;
output EMWS1.Part3_TRAIN;
end;
else do;
_C0000014 + 1;
output EMWS1.Part3_VALIDATE;
end;
_C0000015+1;
end;
run;
