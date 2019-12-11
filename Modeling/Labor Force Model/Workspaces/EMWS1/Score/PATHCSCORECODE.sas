*------------------------------------------------------------*;
* TOOL: Input Data Source;
* TYPE: SAMPLE;
* NODE: Ids;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Statistics Exploration;
* TYPE: EXPLORE;
* NODE: Stat;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Partition Class;
* TYPE: SAMPLE;
* NODE: Part;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Transform;
* TYPE: MODIFY;
* NODE: Trans;
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
*------------------------------------------------------------*;
* TOOL: Model Compare Class;
* TYPE: ASSESS;
* NODE: MdlComp;
*------------------------------------------------------------*;
if (P_Sum_Labor_Force_Pop ge 17029481.7978798) then do;
b_Sum_Labor_Force_ = 1;
end;
else
if (P_Sum_Labor_Force_Pop ge 13206359.3878711) then do;
b_Sum_Labor_Force_ = 2;
end;
else
if (P_Sum_Labor_Force_Pop ge 12065470.6673056) then do;
b_Sum_Labor_Force_ = 3;
end;
else
if (P_Sum_Labor_Force_Pop ge 9865489.05309438) then do;
b_Sum_Labor_Force_ = 4;
end;
else
if (P_Sum_Labor_Force_Pop ge 7978342.83389718) then do;
b_Sum_Labor_Force_ = 5;
end;
else
if (P_Sum_Labor_Force_Pop ge 7662746.84197176) then do;
b_Sum_Labor_Force_ = 6;
end;
else
if (P_Sum_Labor_Force_Pop ge 7109831.74806458) then do;
b_Sum_Labor_Force_ = 7;
end;
else
if (P_Sum_Labor_Force_Pop ge 6750725.60845963) then do;
b_Sum_Labor_Force_ = 8;
end;
else
if (P_Sum_Labor_Force_Pop ge 6346681.38848996) then do;
b_Sum_Labor_Force_ = 9;
end;
else
if (P_Sum_Labor_Force_Pop ge 5937787.47135114) then do;
b_Sum_Labor_Force_ = 10;
end;
else
if (P_Sum_Labor_Force_Pop ge 5320836.16568174) then do;
b_Sum_Labor_Force_ = 11;
end;
else
if (P_Sum_Labor_Force_Pop ge 4037380.08198447) then do;
b_Sum_Labor_Force_ = 12;
end;
else
if (P_Sum_Labor_Force_Pop ge 2973715.76739902) then do;
b_Sum_Labor_Force_ = 13;
end;
else
if (P_Sum_Labor_Force_Pop ge 2164424.14819361) then do;
b_Sum_Labor_Force_ = 14;
end;
else
if (P_Sum_Labor_Force_Pop ge 1958888.01750922) then do;
b_Sum_Labor_Force_ = 15;
end;
else
if (P_Sum_Labor_Force_Pop ge 1696780.98876606) then do;
b_Sum_Labor_Force_ = 16;
end;
else
if (P_Sum_Labor_Force_Pop ge 1368543.29966416) then do;
b_Sum_Labor_Force_ = 17;
end;
else
if (P_Sum_Labor_Force_Pop ge 938418.263691422) then do;
b_Sum_Labor_Force_ = 18;
end;
else
if (P_Sum_Labor_Force_Pop ge 446728.34406193) then do;
b_Sum_Labor_Force_ = 19;
end;
else
do;
b_Sum_Labor_Force_ = 20;
end;
