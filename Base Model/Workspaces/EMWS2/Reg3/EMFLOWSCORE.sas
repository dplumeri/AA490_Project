*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

drop _Y;
_Y = Cases_in_1000s ;

drop _DM_BAD;
_DM_BAD=0;

*** Generate dummy variables for Age_group ;
drop _0_0 _0_1 _0_2 _0_3 _0_4 ;
*** encoding is sparse, initialize to zero;
_0_0 = 0;
_0_1 = 0;
_0_2 = 0;
_0_3 = 0;
_0_4 = 0;
if missing( Age_group ) then do;
   _0_0 = .;
   _0_1 = .;
   _0_2 = .;
   _0_3 = .;
   _0_4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm19 $ 19; drop _dm19 ;
   %DMNORMCP( Age_group , _dm19 )
   if _dm19 = '65-84'  then do;
      _0_4 = 1;
   end;
   else if _dm19 = '18-24'  then do;
      _0_1 = 1;
   end;
   else if _dm19 = '0-17'  then do;
      _0_0 = 1;
   end;
   else if _dm19 = '85+'  then do;
      _0_0 = -1;
      _0_1 = -1;
      _0_2 = -1;
      _0_3 = -1;
      _0_4 = -1;
   end;
   else if _dm19 = '25-44'  then do;
      _0_2 = 1;
   end;
   else if _dm19 = '45-64'  then do;
      _0_3 = 1;
   end;
   else do;
      _0_0 = .;
      _0_1 = .;
      _0_2 = .;
      _0_3 = .;
      _0_4 = .;
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
   if _dm32 = 'CANCER, ALL'  then do;
      _1_1 = 1;
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
   else if _dm32 = 'SEPTICEMIA'  then do;
      _1_0 = -1;
      _1_1 = -1;
      _1_2 = -1;
      _1_3 = -1;
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
drop _2_0 _2_1 ;
if missing( Gender ) then do;
   _2_0 = .;
   _2_1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm10 $ 10; drop _dm10 ;
   _dm10 = put( Gender , $CHAR10. );
   %DMNORMIP( _dm10 )
   if _dm10 = 'ALL'  then do;
      _2_0 = 1;
      _2_1 = 0;
   end;
   else if _dm10 = 'MALE'  then do;
      _2_0 = -1;
      _2_1 = -1;
   end;
   else if _dm10 = 'FEMALE'  then do;
      _2_0 = 0;
      _2_1 = 1;
   end;
   else do;
      _2_0 = .;
      _2_1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _LP0 =     71.1668909825033;
   goto REG3DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: Age_group ;
_TEMP = 1;
_LP0 = _LP0 + (   -43.8056890607145) * _TEMP * _0_0;
_LP0 = _LP0 + (   -64.2613986008538) * _TEMP * _0_1;
_LP0 = _LP0 + (   -31.6108040350378) * _TEMP * _0_2;
_LP0 = _LP0 + (    51.3319121658971) * _TEMP * _0_3;
_LP0 = _LP0 + (    120.289837755199) * _TEMP * _0_4;

***  Effect: Disease ;
_TEMP = 1;
_LP0 = _LP0 + (   -14.3934266242964) * _TEMP * _1_0;
_LP0 = _LP0 + (    88.0560967443537) * _TEMP * _1_1;
_LP0 = _LP0 + (   -50.1961812920124) * _TEMP * _1_2;
_LP0 = _LP0 + (    2.53879969767984) * _TEMP * _1_3;

***  Effect: Gender ;
_TEMP = 1;
_LP0 = _LP0 + (    36.1777425477028) * _TEMP * _2_0;
_LP0 = _LP0 + (   -10.7483953124386) * _TEMP * _2_1;
*--- Intercept ---*;
_LP0 = _LP0 + (    68.4345277089545);

REG3DR1:

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
