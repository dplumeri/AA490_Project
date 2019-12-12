*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;


drop _DM_BAD;
_DM_BAD=0;

*** Check Population_in_thousands for missing values ;
if missing( Population_in_thousands ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Generate dummy variables for Age_group ;
drop _0_0 _0_1 _0_2 _0_3 ;
*** encoding is sparse, initialize to zero;
_0_0 = 0;
_0_1 = 0;
_0_2 = 0;
_0_3 = 0;
if missing( Age_group ) then do;
   _0_0 = .;
   _0_1 = .;
   _0_2 = .;
   _0_3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm19 $ 19; drop _dm19 ;
   %DMNORMCP( Age_group , _dm19 )
   if _dm19 = '85+'  then do;
      _0_0 = -1;
      _0_1 = -1;
      _0_2 = -1;
      _0_3 = -1;
   end;
   else if _dm19 = '18-24'  then do;
      _0_1 = 1;
   end;
   else if _dm19 = '25-44'  then do;
      _0_2 = 1;
   end;
   else if _dm19 = '65-84'  then do;
      _0_3 = 1;
   end;
   else if _dm19 = '0-17'  then do;
      _0_0 = 1;
   end;
   else do;
      _0_0 = .;
      _0_1 = .;
      _0_2 = .;
      _0_3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Disease ;
drop _1_0 _1_1 _1_2 _1_3 ;
*** encoding is sparse, initialize to zero;
_1_0 = 0;
_1_1 = 0;
_1_2 = 0;
_1_3 = 0;
if missing( Disease ) then do;
   _1_0 = .;
   _1_1 = .;
   _1_2 = .;
   _1_3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm32 $ 32; drop _dm32 ;
   %DMNORMCP( Disease , _dm32 )
   if _dm32 = 'SEPTICEMIA'  then do;
      _1_0 = -1;
      _1_1 = -1;
      _1_2 = -1;
      _1_3 = -1;
   end;
   else if _dm32 = 'ASTHMA'  then do;
      _1_0 = 1;
   end;
   else if _dm32 = 'OSTEOARTHRITIS'  then do;
      _1_3 = 1;
   end;
   else if _dm32 = 'DEMENTIA AND ALZHEIMER''S DISEASE'  then do;
      _1_2 = 1;
   end;
   else if _dm32 = 'CANCER, ALL'  then do;
      _1_1 = 1;
   end;
   else do;
      _1_0 = .;
      _1_1 = .;
      _1_2 = .;
      _1_3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _LP0 =     40.5986013986014;
   goto REGDR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: Age_group ;
_TEMP = 1;
_LP0 = _LP0 + (   -84.3760343204245) * _TEMP * _0_0;
_LP0 = _LP0 + (   -1.85481058287241) * _TEMP * _0_1;
_LP0 = _LP0 + (   -95.3769839894678) * _TEMP * _0_2;
_LP0 = _LP0 + (    115.439159077995) * _TEMP * _0_3;

***  Effect: Disease ;
_TEMP = 1;
_LP0 = _LP0 + (   -6.29936121640495) * _TEMP * _1_0;
_LP0 = _LP0 + (    42.9137738259968) * _TEMP * _1_1;
_LP0 = _LP0 + (   -29.7469640337809) * _TEMP * _1_2;
_LP0 = _LP0 + (    1.04689481637702) * _TEMP * _1_3;

***  Effect: Population_in_thousands ;
_TEMP = Population_in_thousands ;
_LP0 = _LP0 + (    0.00416587620236 * _TEMP);
*--- Intercept ---*;
_LP0 = _LP0 + (   -51.0366404449398);

REGDR1:

*** Predicted Value;
label P_Cases_in_1000s = 'Predicted: Cases_in_1000s' ;
P_Cases_in_1000s = _LP0;


*************************************;
***** end scoring code for regression;
*************************************;
