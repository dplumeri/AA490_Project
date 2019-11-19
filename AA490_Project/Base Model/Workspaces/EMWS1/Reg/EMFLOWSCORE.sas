*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_Age_group $ 19;
label I_Age_group = 'Into: Age_group' ;
*** Target Values;
array REGDRF [5] $19 _temporary_ ('85+' '65-84' '25-44' '18-24' '0-17' );
label U_Age_group = 'Unnormalized Into: Age_group' ;
length U_Age_group $ 19;
*** Unnormalized target values;
array REGDRU[5] $ 19 _temporary_ ('85+                '  
'65-84              '  '25-44              '  '18-24              '  
'0-17               ' );

*** Generate dummy variables for Age_group ;
drop _Y ;
label F_Age_group = 'From: Age_group' ;
length F_Age_group $ 19;
%DMNORMCP( Age_group , F_Age_group )
if missing( Age_group ) then do;
   _Y = .;
end;
else do;
   if F_Age_group = '25-44'  then do;
      _Y = 2;
   end;
   else if F_Age_group = '65-84'  then do;
      _Y = 1;
   end;
   else if F_Age_group = '85+'  then do;
      _Y = 0;
   end;
   else if F_Age_group = '18-24'  then do;
      _Y = 3;
   end;
   else if F_Age_group = '0-17'  then do;
      _Y = 4;
   end;
   else do;
      _Y = .;
   end;
end;

drop _DM_BAD;
_DM_BAD=0;

*** Check Projected_Sum_Pop for missing values ;
if missing( Projected_Sum_Pop ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.2045454545;
   _P1 = 0.2045454545;
   _P2 = 0.2045454545;
   _P3 = 0.1904761905;
   _P4 = 0.1958874459;
   goto REGDR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0  _LP1 _LP2 _LP3;
_LP0 = 0;
_LP1 = 0;
_LP2 = 0;
_LP3 = 0;

***  Effect: Projected_Sum_Pop ;
_TEMP = Projected_Sum_Pop ;
_LP0 = _LP0 + (   -0.00005237216765 * _TEMP);
_LP1 = _LP1 + (    0.00007409396434 * _TEMP);
_LP2 = _LP2 + (    0.00004594744223 * _TEMP);
_LP3 = _LP3 + (   -0.00001602024499 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1 _P2 _P3 _P4;
drop _LPMAX;
_LPMAX= 0;
_LP0 =     34.6944595978139 + _LP0;
if _LPMAX < _LP0 then _LPMAX = _LP0;
_LP1 =    -143.743698657692 + _LP1;
if _LPMAX < _LP1 then _LPMAX = _LP1;
_LP2 =    -81.8323041687444 + _LP2;
if _LPMAX < _LP2 then _LPMAX = _LP2;
_LP3 =     18.3099747103227 + _LP3;
if _LPMAX < _LP3 then _LPMAX = _LP3;
_LP0 = exp(_LP0 - _LPMAX);
_LP1 = exp(_LP1 - _LPMAX);
_LP2 = exp(_LP2 - _LPMAX);
_LP3 = exp(_LP3 - _LPMAX);
_LPMAX = exp(-_LPMAX);
_P4 = 1 / (_LPMAX + _LP0 + _LP1 + _LP2 + _LP3);
_P0 = _LP0 * _P4;
_P1 = _LP1 * _P4;
_P2 = _LP2 * _P4;
_P3 = _LP3 * _P4;
_P4 = _LPMAX * _P4;

REGDR1:

*** Residuals;
if (_Y = .) then do;
   R_Age_group85_ = .;
   R_Age_group65_84 = .;
   R_Age_group25_44 = .;
   R_Age_group18_24 = .;
   R_Age_group0_17 = .;
end;
else do;
    label R_Age_group85_ = 'Residual: Age_group=85+' ;
    label R_Age_group65_84 = 'Residual: Age_group=65-84' ;
    label R_Age_group25_44 = 'Residual: Age_group=25-44' ;
    label R_Age_group18_24 = 'Residual: Age_group=18-24' ;
    label R_Age_group0_17 = 'Residual: Age_group=0-17' ;
   R_Age_group85_ = - _P0;
   R_Age_group65_84 = - _P1;
   R_Age_group25_44 = - _P2;
   R_Age_group18_24 = - _P3;
   R_Age_group0_17 = - _P4;
   select( _Y );
      when (0)  R_Age_group85_ = R_Age_group85_ + 1;
      when (1)  R_Age_group65_84 = R_Age_group65_84 + 1;
      when (2)  R_Age_group25_44 = R_Age_group25_44 + 1;
      when (3)  R_Age_group18_24 = R_Age_group18_24 + 1;
      when (4)  R_Age_group0_17 = R_Age_group0_17 + 1;
   end;
end;

*** Posterior Probabilities and Predicted Level;
label P_Age_group85_ = 'Predicted: Age_group=85+' ;
label P_Age_group65_84 = 'Predicted: Age_group=65-84' ;
label P_Age_group25_44 = 'Predicted: Age_group=25-44' ;
label P_Age_group18_24 = 'Predicted: Age_group=18-24' ;
label P_Age_group0_17 = 'Predicted: Age_group=0-17' ;
P_Age_group85_ = _P0;
_MAXP = _P0;
_IY = 1;
P_Age_group65_84 = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
P_Age_group25_44 = _P2;
if (_P2 >  _MAXP + 1E-8) then do;
   _MAXP = _P2;
   _IY = 3;
end;
P_Age_group18_24 = _P3;
if (_P3 >  _MAXP + 1E-8) then do;
   _MAXP = _P3;
   _IY = 4;
end;
P_Age_group0_17 = _P4;
if (_P4 >  _MAXP + 1E-8) then do;
   _MAXP = _P4;
   _IY = 5;
end;
I_Age_group = REGDRF[_IY];
U_Age_group = REGDRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
