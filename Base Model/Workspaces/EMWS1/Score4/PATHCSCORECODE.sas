*------------------------------------------------------------*;
* TOOL: Input Data Source;
* TYPE: SAMPLE;
* NODE: Ids5;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Statistics Exploration;
* TYPE: EXPLORE;
* NODE: Stat7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Partition Class;
* TYPE: SAMPLE;
* NODE: Part4;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Regression;
* TYPE: MODEL;
* NODE: Reg2;
*------------------------------------------------------------*;
*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;


drop _DM_BAD;
_DM_BAD=0;

*** Generate dummy variables for Age_Group ;
drop _0_0 _0_1 _0_2 ;
if missing( Age_Group ) then do;
   _0_0 = .;
   _0_1 = .;
   _0_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm16 $ 16; drop _dm16 ;
   %DMNORMCP( Age_Group , _dm16 )
   if _dm16 = '45 TO 64'  then do;
      _0_0 = 0;
      _0_1 = 0;
      _0_2 = 1;
   end;
   else if _dm16 = '65+'  then do;
      _0_0 = -1;
      _0_1 = -1;
      _0_2 = -1;
   end;
   else if _dm16 = '25 TO 44'  then do;
      _0_0 = 0;
      _0_1 = 1;
      _0_2 = 0;
   end;
   else if _dm16 = '16 TO 24'  then do;
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
   _LP0 =     6925863.09523809;
   goto REG2DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: Age_Group ;
_TEMP = 1;
_LP0 = _LP0 + (   -2781318.02735312) * _TEMP * _0_0;
_LP0 = _LP0 + (    5320163.35903969) * _TEMP * _0_1;
_LP0 = _LP0 + (    3157416.47557085) * _TEMP * _0_2;
*--- Intercept ---*;
_LP0 = _LP0 + (     6902739.0799847);

REG2DR1:

*** Predicted Value;
label P_Sum_Labor_Force_Pop = 'Predicted: Sum_Labor_Force_Pop' ;
P_Sum_Labor_Force_Pop = _LP0;


*************************************;
***** end scoring code for regression;
*************************************;
