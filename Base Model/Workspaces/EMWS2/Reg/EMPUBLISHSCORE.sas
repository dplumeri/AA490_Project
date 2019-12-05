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
   if _dm19 = '18-24'  then do;
      _0_0 = 0;
      _0_1 = 1;
      _0_2 = 0;
   end;
   else if _dm19 = '85+'  then do;
      _0_0 = -1;
      _0_1 = -1;
      _0_2 = -1;
   end;
   else if _dm19 = '0-17'  then do;
      _0_0 = 1;
      _0_1 = 0;
      _0_2 = 0;
   end;
   else if _dm19 = '25-44'  then do;
      _0_0 = 0;
      _0_1 = 0;
      _0_2 = 1;
   end;
   else do;
      _0_0 = .;
      _0_1 = .;
      _0_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Disease ;
drop _2_0 _2_1 _2_2 _2_3 ;
*** encoding is sparse, initialize to zero;
_2_0 = 0;
_2_1 = 0;
_2_2 = 0;
_2_3 = 0;
if missing( Disease ) then do;
   _2_0 = .;
   _2_1 = .;
   _2_2 = .;
   _2_3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm32 $ 32; drop _dm32 ;
   %DMNORMCP( Disease , _dm32 )
   if _dm32 = 'ASTHMA'  then do;
      _2_0 = 1;
   end;
   else if _dm32 = 'CANCER, ALL'  then do;
      _2_1 = 1;
   end;
   else if _dm32 = 'SEPTICEMIA'  then do;
      _2_0 = -1;
      _2_1 = -1;
      _2_2 = -1;
      _2_3 = -1;
   end;
   else if _dm32 = 'OSTEOARTHRITIS'  then do;
      _2_3 = 1;
   end;
   else if _dm32 = 'DEMENTIA AND ALZHEIMER''S DISEASE'  then do;
      _2_2 = 1;
   end;
   else do;
      _2_0 = .;
      _2_1 = .;
      _2_2 = .;
      _2_3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Gender ;
drop _3_0 _3_1 ;
if missing( Gender ) then do;
   _3_0 = .;
   _3_1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm10 $ 10; drop _dm10 ;
   _dm10 = put( Gender , $CHAR10. );
   %DMNORMIP( _dm10 )
   if _dm10 = 'ALL'  then do;
      _3_0 = 1;
      _3_1 = 0;
   end;
   else if _dm10 = 'MALE'  then do;
      _3_0 = -1;
      _3_1 = -1;
   end;
   else if _dm10 = 'FEMALE'  then do;
      _3_0 = 0;
      _3_1 = 1;
   end;
   else do;
      _3_0 = .;
      _3_1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _LP0 =     22.4354838709677;
   goto REGDR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: Age_group ;
_TEMP = 1;
_LP0 = _LP0 + (    7.54488189765086) * _TEMP * _0_0;
_LP0 = _LP0 + (   -22.0524748686436) * _TEMP * _0_1;
_LP0 = _LP0 + (    9.33187822958524) * _TEMP * _0_2;

***  Effect: Disease ;
_TEMP = 1;
_LP0 = _LP0 + (    24.1020869327921) * _TEMP * _2_0;
_LP0 = _LP0 + (    5.84456441652429) * _TEMP * _2_1;
_LP0 = _LP0 + (   -13.7943481128578) * _TEMP * _2_2;
_LP0 = _LP0 + (   -14.4429412167997) * _TEMP * _2_3;

***  Effect: Gender ;
_TEMP = 1;
_LP0 = _LP0 + (     11.286481072028) * _TEMP * _3_0;
_LP0 = _LP0 + (    -4.4860056921222) * _TEMP * _3_1;
*--- Intercept ---*;
_LP0 = _LP0 + (     23.795654855786);

REGDR1:

*** Predicted Value;
label P_Cases_in_1000s = 'Predicted: Cases_in_1000s' ;
P_Cases_in_1000s = _LP0;


*************************************;
***** end scoring code for regression;
*************************************;
