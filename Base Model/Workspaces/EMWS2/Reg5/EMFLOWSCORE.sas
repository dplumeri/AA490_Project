*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

drop _Y;
_Y = Cases_in_1000s ;

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

*** Generate dummy variables for Gender ;
drop _2_0 ;
if missing( Gender ) then do;
   _2_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm10 $ 10; drop _dm10 ;
   _dm10 = put( Gender , $CHAR10. );
   %DMNORMIP( _dm10 )
   if _dm10 = 'FEMALE'  then do;
      _2_0 = 1;
   end;
   else if _dm10 = 'MALE'  then do;
      _2_0 = -1;
   end;
   else do;
      _2_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _LP0 =     40.5986013986014;
   goto REG5DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: Age_group ;
_TEMP = 1;
_LP0 = _LP0 + (   -49.4672921197793) * _TEMP * _0_0;
_LP0 = _LP0 + (   -21.7313427121025) * _TEMP * _0_1;
_LP0 = _LP0 + (   -53.6209888643958) * _TEMP * _0_2;
_LP0 = _LP0 + (    102.502871018983) * _TEMP * _0_3;

***  Effect: Disease ;
_TEMP = 1;
_LP0 = _LP0 + (   -4.46131810261602) * _TEMP * _1_0;
_LP0 = _LP0 + (    44.6018779092235) * _TEMP * _1_1;
_LP0 = _LP0 + (    -31.499567699561) * _TEMP * _1_2;
_LP0 = _LP0 + (   -0.74252562940894) * _TEMP * _1_3;

***  Effect: Gender ;
_TEMP = 1;
_LP0 = _LP0 + (    4.83591864146778) * _TEMP * _2_0;

***  Effect: Population_in_thousands ;
_TEMP = Population_in_thousands ;
_LP0 = _LP0 + (    0.00198409149548 * _TEMP);

***  Effect: Age_group*Disease ;
_TEMP = 1;
_LP0 = _LP0 + (    71.4273293508684) * _TEMP * _0_0 * _1_0;
_LP0 = _LP0 + (   -53.3097718606966) * _TEMP * _0_0 * _1_1;
_LP0 = _LP0 + (    9.33786909487515) * _TEMP * _0_0 * _1_2;
_LP0 = _LP0 + (   -20.9612651485176) * _TEMP * _0_0 * _1_3;
_LP0 = _LP0 + (    10.7796593988599) * _TEMP * _0_1 * _1_0;
_LP0 = _LP0 + (   -42.0138863118082) * _TEMP * _0_1 * _1_1;
_LP0 = _LP0 + (    28.7461211911806) * _TEMP * _0_1 * _1_2;
_LP0 = _LP0 + (   -3.23521994212167) * _TEMP * _0_1 * _1_3;
_LP0 = _LP0 + (    19.7458398116809) * _TEMP * _0_2 * _1_0;
_LP0 = _LP0 + (   -10.9477828764849) * _TEMP * _0_2 * _1_1;
_LP0 = _LP0 + (    5.72008672932023) * _TEMP * _0_2 * _1_2;
_LP0 = _LP0 + (   -11.7636065735945) * _TEMP * _0_2 * _1_3;
_LP0 = _LP0 + (   -88.5356337608595) * _TEMP * _0_3 * _1_0;
_LP0 = _LP0 + (    132.966100156406) * _TEMP * _0_3 * _1_1;
_LP0 = _LP0 + (   -70.4014518863319) * _TEMP * _0_3 * _1_2;
_LP0 = _LP0 + (    45.1384291109238) * _TEMP * _0_3 * _1_3;

***  Effect: Age_group*Gender ;
_TEMP = 1;
_LP0 = _LP0 + (    -8.1862991950576) * _TEMP * _0_0 * _2_0;
_LP0 = _LP0 + (   -3.41662890780362) * _TEMP * _0_1 * _2_0;
_LP0 = _LP0 + (    2.93242200068928) * _TEMP * _0_2 * _2_0;
_LP0 = _LP0 + (    7.94278094282438) * _TEMP * _0_3 * _2_0;

***  Effect: Disease*Gender ;
_TEMP = 1;
_LP0 = _LP0 + (   -1.41400770960081) * _TEMP * _1_0 * _2_0;
_LP0 = _LP0 + (    0.16409809193528) * _TEMP * _1_1 * _2_0;
_LP0 = _LP0 + (   -2.88206456532676) * _TEMP * _1_2 * _2_0;
_LP0 = _LP0 + (    4.51528265380696) * _TEMP * _1_3 * _2_0;
*--- Intercept ---*;
_LP0 = _LP0 + (    -2.5407661803408);

REG5DR1:

*** Predicted Value, Error, and Residual;
label P_Cases_in_1000s = 'Predicted: Cases_in_1000s' ;
P_Cases_in_1000s = _LP0;

drop _R;
if _Y = . then do;
   R_Cases_in_1000s = .;
end;
else do;
   _R = _Y - _LP0;
    label R_Cases_in_1000s = 'Residual: Cases_in_1000s' ;
   R_Cases_in_1000s = _R;
end;

*************************************;
***** end scoring code for regression;
*************************************;
