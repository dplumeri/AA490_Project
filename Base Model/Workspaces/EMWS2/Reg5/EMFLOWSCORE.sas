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
   goto REG5DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: Age_group ;
_TEMP = 1;
_LP0 = _LP0 + (   -84.1465020592624) * _TEMP * _0_0;
_LP0 = _LP0 + (    -31.006700784857) * _TEMP * _0_1;
_LP0 = _LP0 + (   -91.6643797418806) * _TEMP * _0_2;
_LP0 = _LP0 + (    16.7352981475505) * _TEMP * _0_3;
_LP0 = _LP0 + (    135.981696969436) * _TEMP * _0_4;

***  Effect: Disease ;
_TEMP = 1;
_LP0 = _LP0 + (   -12.2053390767351) * _TEMP * _1_0;
_LP0 = _LP0 + (    80.4716385703026) * _TEMP * _1_1;
_LP0 = _LP0 + (   -53.7012382224316) * _TEMP * _1_2;
_LP0 = _LP0 + (    6.14004140144112) * _TEMP * _1_3;

***  Effect: Gender ;
_TEMP = 1;
_LP0 = _LP0 + (    2.40137961010665) * _TEMP * _2_0;
_LP0 = _LP0 + (    2.45394638044741) * _TEMP * _2_1;

***  Effect: Population_in_thousands ;
_TEMP = Population_in_thousands ;
_LP0 = _LP0 + (    0.00425114961427 * _TEMP);

***  Effect: Age_group*Disease ;
_TEMP = 1;
_LP0 = _LP0 + (    113.794719126308) * _TEMP * _0_0 * _1_0;
_LP0 = _LP0 + (    -94.887352316558) * _TEMP * _0_0 * _1_1;
_LP0 = _LP0 + (     22.873937580152) * _TEMP * _0_0 * _1_2;
_LP0 = _LP0 + (    -38.989914654049) * _TEMP * _0_0 * _1_3;
_LP0 = _LP0 + (     21.728912244195) * _TEMP * _0_1 * _1_0;
_LP0 = _LP0 + (    -79.538318750293) * _TEMP * _0_1 * _1_1;
_LP0 = _LP0 + (    48.4491741357276) * _TEMP * _0_1 * _1_2;
_LP0 = _LP0 + (   -10.1161239363324) * _TEMP * _0_1 * _1_3;
_LP0 = _LP0 + (     32.126389761521) * _TEMP * _0_2 * _1_0;
_LP0 = _LP0 + (   -37.7375365343049) * _TEMP * _0_2 * _1_1;
_LP0 = _LP0 + (     20.716827737127) * _TEMP * _0_2 * _1_2;
_LP0 = _LP0 + (   -21.0817614530002) * _TEMP * _0_2 * _1_3;
_LP0 = _LP0 + (   -42.4340889677876) * _TEMP * _0_3 * _1_0;
_LP0 = _LP0 + (    114.489069160712) * _TEMP * _0_3 * _1_1;
_LP0 = _LP0 + (    -55.080118565068) * _TEMP * _0_3 * _1_2;
_LP0 = _LP0 + (    18.8587811769618) * _TEMP * _0_3 * _1_3;
_LP0 = _LP0 + (   -113.033635735572) * _TEMP * _0_4 * _1_0;
_LP0 = _LP0 + (     154.33172985213) * _TEMP * _0_4 * _1_1;
_LP0 = _LP0 + (   -86.4077688202612) * _TEMP * _0_4 * _1_2;
_LP0 = _LP0 + (     71.320720457892) * _TEMP * _0_4 * _1_3;

***  Effect: Age_group*Gender ;
_TEMP = 1;
_LP0 = _LP0 + (   -32.9934878080782) * _TEMP * _0_0 * _2_0;
_LP0 = _LP0 + (    11.2813855111767) * _TEMP * _0_0 * _2_1;
_LP0 = _LP0 + (   -30.8526059637524) * _TEMP * _0_1 * _2_0;
_LP0 = _LP0 + (    12.0270364199461) * _TEMP * _0_1 * _2_1;
_LP0 = _LP0 + (   -27.8997692812624) * _TEMP * _0_2 * _2_0;
_LP0 = _LP0 + (    15.5490944128048) * _TEMP * _0_2 * _2_1;
_LP0 = _LP0 + (    13.0491086328875) * _TEMP * _0_3 * _2_0;
_LP0 = _LP0 + (    -4.9384652700938) * _TEMP * _0_3 * _2_1;
_LP0 = _LP0 + (    66.7736288957625) * _TEMP * _0_4 * _2_0;
_LP0 = _LP0 + (   -30.3855703119156) * _TEMP * _0_4 * _2_1;

***  Effect: Disease*Gender ;
_TEMP = 1;
_LP0 = _LP0 + (   -7.95173065294366) * _TEMP * _1_0 * _2_0;
_LP0 = _LP0 + (    5.52375108338594) * _TEMP * _1_0 * _2_1;
_LP0 = _LP0 + (    43.0776092337007) * _TEMP * _1_1 * _2_0;
_LP0 = _LP0 + (   -25.4311076127981) * _TEMP * _1_1 * _2_1;
_LP0 = _LP0 + (   -24.9124879964201) * _TEMP * _1_2 * _2_0;
_LP0 = _LP0 + (    9.56475214739702) * _TEMP * _1_2 * _2_1;
_LP0 = _LP0 + (    0.69633150090433) * _TEMP * _1_3 * _2_0;
_LP0 = _LP0 + (     7.6420354503076) * _TEMP * _1_3 * _2_1;

***  Effect: Population_in_thousands*Population_in_thousands ;
_TEMP = Population_in_thousands  * Population_in_thousands ;
_LP0 = _LP0 + ( -2.1969634644604E-8 * _TEMP);
*--- Intercept ---*;
_LP0 = _LP0 + (    -34.551195312416);

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
