*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;


drop _DM_BAD;
_DM_BAD=0;

*** Generate dummy variables for Age_group ;
drop _0_0 _0_1 _0_2 ;
if missing( Age_group ) then do;
   _0_0 = .;
   _0_1 = .;
   _0_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm19 $ 19; drop _dm19 ;
   %DMNORMCP( Age_group , _dm19 )
   if _dm19 = '65+'  then do;
      _0_0 = -1;
      _0_1 = -1;
      _0_2 = -1;
   end;
   else if _dm19 = '25 TO 44'  then do;
      _0_0 = 0;
      _0_1 = 1;
      _0_2 = 0;
   end;
   else if _dm19 = '45 TO 64'  then do;
      _0_0 = 0;
      _0_1 = 0;
      _0_2 = 1;
   end;
   else if _dm19 = '16 TO 24'  then do;
      _0_0 = 1;
      _0_1 = 0;
      _0_2 = 0;
   end;
   else do;
      _0_0 = .;
      _0_1 = .;
      _0_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _LP0 =     6927309.52380952;
   goto REG2DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: Age_group ;
_TEMP = 1;
_LP0 = _LP0 + (   -3163800.85168138) * _TEMP * _0_0;
_LP0 = _LP0 + (    6115407.09919127) * _TEMP * _0_1;
_LP0 = _LP0 + (    2844093.69968755) * _TEMP * _0_2;
*--- Intercept ---*;
_LP0 = _LP0 + (     6903615.9777318);

REG2DR1:

*** Predicted Value;
label P_Sum_Labor_Force_Pop = 'Predicted: Sum_Labor_Force_Pop' ;
P_Sum_Labor_Force_Pop = _LP0;


*************************************;
***** end scoring code for regression;
*************************************;
