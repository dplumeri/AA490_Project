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
   else if _dm19 = '45-64'  then do;
      _0_3 = 1;
   end;
   else if _dm19 = '85+'  then do;
      _0_0 = -1;
      _0_1 = -1;
      _0_2 = -1;
      _0_3 = -1;
      _0_4 = -1;
   end;
   else if _dm19 = '65-84'  then do;
      _0_4 = 1;
   end;
   else if _dm19 = '18-24'  then do;
      _0_1 = 1;
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
   else if _dm32 = 'OSTEOARTHRITIS'  then do;
      _1_3 = 1;
   end;
   else if _dm32 = 'ASTHMA'  then do;
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
   _LP0 =     49.9179190751445;
   goto REG5DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: Age_group ;
_TEMP = 1;
_LP0 = _LP0 + (    -68.218939505593) * _TEMP * _0_0;
_LP0 = _LP0 + (   -14.7579337629462) * _TEMP * _0_1;
_LP0 = _LP0 + (   -78.5097315230807) * _TEMP * _0_2;
_LP0 = _LP0 + (    14.8718794691663) * _TEMP * _0_3;
_LP0 = _LP0 + (     105.10105866912) * _TEMP * _0_4;

***  Effect: Disease ;
_TEMP = 1;
_LP0 = _LP0 + (   -9.24084009672934) * _TEMP * _1_0;
_LP0 = _LP0 + (    61.7847909243756) * _TEMP * _1_1;
_LP0 = _LP0 + (   -39.8142696137315) * _TEMP * _1_2;
_LP0 = _LP0 + (    2.97554555294165) * _TEMP * _1_3;

***  Effect: Gender ;
_TEMP = 1;
_LP0 = _LP0 + (    4.36294125979976) * _TEMP * _2_0;

***  Effect: Population_in_thousands ;
_TEMP = Population_in_thousands ;
_LP0 = _LP0 + (    0.00310607604835 * _TEMP);

***  Effect: Age_group*Disease ;
_TEMP = 1;
_LP0 = _LP0 + (     80.303346895729) * _TEMP * _0_0 * _1_0;
_LP0 = _LP0 + (    -70.252908521696) * _TEMP * _0_0 * _1_1;
_LP0 = _LP0 + (    18.0287580656425) * _TEMP * _0_0 * _1_2;
_LP0 = _LP0 + (   -27.4006629526389) * _TEMP * _0_0 * _1_3;
_LP0 = _LP0 + (    15.2611371052263) * _TEMP * _0_1 * _1_0;
_LP0 = _LP0 + (   -59.5878423999859) * _TEMP * _0_1 * _1_1;
_LP0 = _LP0 + (    36.5507247588724) * _TEMP * _0_1 * _1_2;
_LP0 = _LP0 + (    -6.3277402763714) * _TEMP * _0_1 * _1_3;
_LP0 = _LP0 + (    23.5696362287826) * _TEMP * _0_2 * _1_0;
_LP0 = _LP0 + (   -26.3213979493903) * _TEMP * _0_2 * _1_1;
_LP0 = _LP0 + (    13.9686093610471) * _TEMP * _0_2 * _1_2;
_LP0 = _LP0 + (   -15.1414857600671) * _TEMP * _0_2 * _1_3;
_LP0 = _LP0 + (   -28.5925125279295) * _TEMP * _0_3 * _1_0;
_LP0 = _LP0 + (    79.5855180172679) * _TEMP * _0_3 * _1_1;
_LP0 = _LP0 + (    -45.539444954891) * _TEMP * _0_3 * _1_2;
_LP0 = _LP0 + (    23.7501274677249) * _TEMP * _0_3 * _1_3;
_LP0 = _LP0 + (   -82.8375370158417) * _TEMP * _0_4 * _1_0;
_LP0 = _LP0 + (    120.063914512013) * _TEMP * _0_4 * _1_1;
_LP0 = _LP0 + (   -57.0141821034771) * _TEMP * _0_4 * _1_2;
_LP0 = _LP0 + (    37.9161094005809) * _TEMP * _0_4 * _1_3;

***  Effect: Age_group*Gender ;
_TEMP = 1;
_LP0 = _LP0 + (   -7.93150243104012) * _TEMP * _0_0 * _2_0;
_LP0 = _LP0 + (   -2.88473738844764) * _TEMP * _0_1 * _2_0;
_LP0 = _LP0 + (    3.91403164879495) * _TEMP * _0_2 * _2_0;
_LP0 = _LP0 + (    2.58317683633376) * _TEMP * _0_3 * _2_0;
_LP0 = _LP0 + (    3.75341533588197) * _TEMP * _0_4 * _2_0;

***  Effect: Disease*Gender ;
_TEMP = 1;
_LP0 = _LP0 + (    1.19621301954507) * _TEMP * _1_0 * _2_0;
_LP0 = _LP0 + (    1.42200033324647) * _TEMP * _1_1 * _2_0;
_LP0 = _LP0 + (   -4.28664963595513) * _TEMP * _1_2 * _2_0;
_LP0 = _LP0 + (    3.75438619150629) * _TEMP * _1_3 * _2_0;
*--- Intercept ---*;
_LP0 = _LP0 + (   -24.8018210357458);

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
