*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

drop _Y;
_Y = Sum_Labor_Force_Pop ;

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
   else if _dm19 = '25 TO 44'  then do;
      _0_0 = 0;
      _0_1 = 1;
      _0_2 = 0;
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
   if _dm32 = 'SALES AND OFFICE OCCUPATIONS'  then do;
      _1_3 = 1;
   end;
   else if _dm32 = 'SERVICE OCCUPATIONS'  then do;
      _1_0 = -1;
      _1_1 = -1;
      _1_2 = -1;
      _1_3 = -1;
   end;
   else if _dm32 = 'NATURAL RESOURCES, CONSTRUCTION,'  then do;
      _1_1 = 1;
   end;
   else if _dm32 = 'PRODUCTION, TRANSPORTATION, AND'  then do;
      _1_2 = 1;
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
   _LP0 =     6986556.12244898;
   goto REG3DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: Age_group ;
_TEMP = 1;
_LP0 = _LP0 + (    -3050920.5611938) * _TEMP * _0_0;
_LP0 = _LP0 + (    5715179.28557613) * _TEMP * _0_1;
_LP0 = _LP0 + (    3344400.58625212) * _TEMP * _0_2;

***  Effect: Industry ;
_TEMP = 1;
_LP0 = _LP0 + (    5305194.24829287) * _TEMP * _1_0;
_LP0 = _LP0 + (    -3756132.0072696) * _TEMP * _1_1;
_LP0 = _LP0 + (   -2725624.61923406) * _TEMP * _1_2;
_LP0 = _LP0 + (    1992762.38030448) * _TEMP * _1_3;
*--- Intercept ---*;
_LP0 = _LP0 + (    6791358.48762649);

REG3DR1:

*** Predicted Value, Error, and Residual;
label P_Sum_Labor_Force_Pop = 'Predicted: Sum_Labor_Force_Pop' ;
P_Sum_Labor_Force_Pop = _LP0;

drop _R;
if _Y = . then do;
   R_Sum_Labor_Force_Pop = .;
end;
else do;
   _R = _Y - _LP0;
    label R_Sum_Labor_Force_Pop = 'Residual: Sum_Labor_Force_Pop' ;
   R_Sum_Labor_Force_Pop = _R;
end;

*************************************;
***** end scoring code for regression;
*************************************;