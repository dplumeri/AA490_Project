*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;


drop _DM_BAD;
_DM_BAD=0;

*** Check Population for missing values ;
if missing( Population ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

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
   if _dm19 = '45 TO 64'  then do;
      _0_0 = 0;
      _0_1 = 0;
      _0_2 = 1;
   end;
   else if _dm19 = '65+'  then do;
      _0_0 = -1;
      _0_1 = -1;
      _0_2 = -1;
   end;
   else if _dm19 = '16 TO 24'  then do;
      _0_0 = 1;
      _0_1 = 0;
      _0_2 = 0;
   end;
   else if _dm19 = '25 TO 44'  then do;
      _0_0 = 0;
      _0_1 = 1;
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

*** Generate dummy variables for Industry ;
drop _1_0 _1_1 _1_2 _1_3 ;
*** encoding is sparse, initialize to zero;
_1_0 = 0;
_1_1 = 0;
_1_2 = 0;
_1_3 = 0;
if missing( Industry ) then do;
   _1_0 = .;
   _1_1 = .;
   _1_2 = .;
   _1_3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm32 $ 32; drop _dm32 ;
   length _dm111 $ 111; drop _dm111;
   _dm111 = put( Industry , $CHAR111. );
   %DMNORMCP( _dm111, _dm32 )
   if _dm32 = 'SERVICE OCCUPATIONS'  then do;
      _1_0 = -1;
      _1_1 = -1;
      _1_2 = -1;
      _1_3 = -1;
   end;
   else if _dm32 = 'SALES AND OFFICE OCCUPATIONS'  then do;
      _1_3 = 1;
   end;
   else if _dm32 = 'PRODUCTION, TRANSPORTATION, AND'  then do;
      _1_2 = 1;
   end;
   else if _dm32 = 'NATURAL RESOURCES, CONSTRUCTION,'  then do;
      _1_1 = 1;
   end;
   else if _dm32 = 'MANAGEMENT, PROFESSIONAL, AND RE'  then do;
      _1_0 = 1;
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
   _LP0 =     6470696.42857143;
   goto REG2DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: Population*Age_group*Industry ;
_TEMP = Population ;
_LP0 = _LP0 + (   -0.11715613953136) * _TEMP * _0_0 * _1_0;
_LP0 = _LP0 + (    0.02700341050736) * _TEMP * _0_0 * _1_1;
_LP0 = _LP0 + (    0.01251898117875) * _TEMP * _0_0 * _1_2;
_LP0 = _LP0 + (    0.01863889821193) * _TEMP * _0_0 * _1_3;
_LP0 = _LP0 + (    0.09663568488618) * _TEMP * _0_1 * _1_0;
_LP0 = _LP0 + (   -0.03979851587655) * _TEMP * _0_1 * _1_1;
_LP0 = _LP0 + (   -0.03370616598682) * _TEMP * _0_1 * _1_2;
_LP0 = _LP0 + (    0.00628489271812) * _TEMP * _0_1 * _1_3;
_LP0 = _LP0 + (    0.09152611804654) * _TEMP * _0_2 * _1_0;
_LP0 = _LP0 + (   -0.03738941285564) * _TEMP * _0_2 * _1_1;
_LP0 = _LP0 + (   -0.02229371492902) * _TEMP * _0_2 * _1_2;
_LP0 = _LP0 + (    0.00483071597825) * _TEMP * _0_2 * _1_3;

***  Effect: Age_group ;
_TEMP = 1;
_LP0 = _LP0 + (   -1151827.58078611) * _TEMP * _0_0;
_LP0 = _LP0 + (    3344383.07340614) * _TEMP * _0_1;
_LP0 = _LP0 + (    1719019.78617864) * _TEMP * _0_2;

***  Effect: Industry ;
_TEMP = 1;
_LP0 = _LP0 + (    3665917.37954249) * _TEMP * _1_0;
_LP0 = _LP0 + (   -2802842.40028867) * _TEMP * _1_1;
_LP0 = _LP0 + (    -2038406.8909291) * _TEMP * _1_2;
_LP0 = _LP0 + (    1644635.92898508) * _TEMP * _1_3;

***  Effect: Population ;
_TEMP = Population ;
_LP0 = _LP0 + (    0.10026222163702 * _TEMP);
*--- Intercept ---*;
_LP0 = _LP0 + (    1131306.73108067);

REG2DR1:

*** Predicted Value;
label P_Sum_Labor_Force_Pop = 'Predicted: Sum_Labor_Force_Pop' ;
P_Sum_Labor_Force_Pop = _LP0;


*************************************;
***** end scoring code for regression;
*************************************;
