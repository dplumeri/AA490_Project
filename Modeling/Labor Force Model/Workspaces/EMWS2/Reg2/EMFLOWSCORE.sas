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
   if _dm19 = '25-44'  then do;
      _0_2 = 1;
   end;
   else if _dm19 = '18-24'  then do;
      _0_1 = 1;
   end;
   else if _dm19 = '65-84'  then do;
      _0_4 = 1;
   end;
   else if _dm19 = '85+'  then do;
      _0_0 = -1;
      _0_1 = -1;
      _0_2 = -1;
      _0_3 = -1;
      _0_4 = -1;
   end;
   else if _dm19 = '45-64'  then do;
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
   if _dm32 = 'DEMENTIA AND ALZHEIMER''S DISEASE'  then do;
      _1_2 = 1;
   end;
   else if _dm32 = 'SEPTICEMIA'  then do;
      _1_0 = -1;
      _1_1 = -1;
      _1_2 = -1;
      _1_3 = -1;
   end;
   else if _dm32 = 'CANCER, ALL'  then do;
      _1_1 = 1;
   end;
   else if _dm32 = 'ASTHMA'  then do;
      _1_0 = 1;
   end;
   else if _dm32 = 'OSTEOARTHRITIS'  then do;
      _1_3 = 1;
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
   _LP0 =     46.0689655172413;
   goto REG2DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: Age_group ;
_TEMP = 1;
_LP0 = _LP0 + (   -66.5645885599173) * _TEMP * _0_0;
_LP0 = _LP0 + (    -17.194587418335) * _TEMP * _0_1;
_LP0 = _LP0 + (   -75.2320473175871) * _TEMP * _0_2;
_LP0 = _LP0 + (    16.8608002902338) * _TEMP * _0_3;
_LP0 = _LP0 + (    104.897572499115) * _TEMP * _0_4;

***  Effect: Disease ;
_TEMP = 1;
_LP0 = _LP0 + (   -8.98056702801211) * _TEMP * _1_0;
_LP0 = _LP0 + (    58.6325553350135) * _TEMP * _1_1;
_LP0 = _LP0 + (   -40.9989660116518) * _TEMP * _1_2;
_LP0 = _LP0 + (    7.32668403941003) * _TEMP * _1_3;

***  Effect: Gender ;
_TEMP = 1;
_LP0 = _LP0 + (    3.32037203360082) * _TEMP * _2_0;

***  Effect: Population_in_thousands ;
_TEMP = Population_in_thousands ;
_LP0 = _LP0 + (    0.00292066934032 * _TEMP);

***  Effect: Age_group*Disease ;
_TEMP = 1;
_LP0 = _LP0 + (    80.6002480602313) * _TEMP * _0_0 * _1_0;
_LP0 = _LP0 + (   -66.9383119038907) * _TEMP * _0_0 * _1_1;
_LP0 = _LP0 + (    17.8962836331807) * _TEMP * _0_0 * _1_2;
_LP0 = _LP0 + (    -31.181334075135) * _TEMP * _0_0 * _1_3;
_LP0 = _LP0 + (    14.0333968933536) * _TEMP * _0_1 * _1_0;
_LP0 = _LP0 + (   -55.6196532646358) * _TEMP * _0_1 * _1_1;
_LP0 = _LP0 + (    38.2440606963166) * _TEMP * _0_1 * _1_2;
_LP0 = _LP0 + (   -10.5320592454678) * _TEMP * _0_1 * _1_3;
_LP0 = _LP0 + (     27.177766378298) * _TEMP * _0_2 * _1_0;
_LP0 = _LP0 + (   -23.6940585111808) * _TEMP * _0_2 * _1_1;
_LP0 = _LP0 + (    13.0674707746462) * _TEMP * _0_2 * _1_2;
_LP0 = _LP0 + (   -16.9275634674651) * _TEMP * _0_2 * _1_3;
_LP0 = _LP0 + (    -30.761581882029) * _TEMP * _0_3 * _1_0;
_LP0 = _LP0 + (    83.1020908205616) * _TEMP * _0_3 * _1_1;
_LP0 = _LP0 + (    -46.686744949509) * _TEMP * _0_3 * _1_2;
_LP0 = _LP0 + (    23.5387872514758) * _TEMP * _0_3 * _1_3;
_LP0 = _LP0 + (   -84.1948351512797) * _TEMP * _0_4 * _1_0;
_LP0 = _LP0 + (    103.389783324423) * _TEMP * _0_4 * _1_1;
_LP0 = _LP0 + (   -57.6241637126923) * _TEMP * _0_4 * _1_2;
_LP0 = _LP0 + (    52.6796051098899) * _TEMP * _0_4 * _1_3;

***  Effect: Age_group*Gender ;
_TEMP = 1;
_LP0 = _LP0 + (   -4.39796651497357) * _TEMP * _0_0 * _2_0;
_LP0 = _LP0 + (    -1.9018038527319) * _TEMP * _0_1 * _2_0;
_LP0 = _LP0 + (    6.09902255224133) * _TEMP * _0_2 * _2_0;
_LP0 = _LP0 + (    0.36606314184135) * _TEMP * _0_3 * _2_0;
_LP0 = _LP0 + (   -1.59053643126356) * _TEMP * _0_4 * _2_0;

***  Effect: Disease*Gender ;
_TEMP = 1;
_LP0 = _LP0 + (    4.71580923131379) * _TEMP * _1_0 * _2_0;
_LP0 = _LP0 + (    0.50826261458912) * _TEMP * _1_1 * _2_0;
_LP0 = _LP0 + (   -3.94861425218476) * _TEMP * _1_2 * _2_0;
_LP0 = _LP0 + (    0.97574445780895) * _TEMP * _1_3 * _2_0;
*--- Intercept ---*;
_LP0 = _LP0 + (    -19.884267014024);

REG2DR1:

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
