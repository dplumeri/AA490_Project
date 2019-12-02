*------------------------------------------------------------*;
* EM SCORE CODE;
* EM Version: 14.2;
* SAS Release: 9.04.01M4P110916;
* Host: 830-5CG9310VLM;
* Encoding: wlatin1;
* Locale: en_US;
* Project Path: C:\Users\student\Desktop\AA 490\Final Project\AA490_Project;
* Project Name: Base Model;
* Diagram Id: EMWS2;
* Diagram Name: Base Model 2;
* Generated by: student;
* Date: 26NOV2019:15:41:54;
*------------------------------------------------------------*;
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
* TOOL: Regression;
* TYPE: MODEL;
* NODE: Reg;
*------------------------------------------------------------*;
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
   if _dm19 = '25 TO 44'  then do;
      _0_0 = 0;
      _0_1 = 1;
      _0_2 = 0;
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
   else if _dm19 = '45 TO 64'  then do;
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

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _LP0 =              6735625;
   goto REGDR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: Age_group ;
_TEMP = 1;
_LP0 = _LP0 + (   -3040910.37264701) * _TEMP * _0_0;
_LP0 = _LP0 + (    6062586.55084148) * _TEMP * _0_1;
_LP0 = _LP0 + (    2679854.86544822) * _TEMP * _0_2;
*--- Intercept ---*;
_LP0 = _LP0 + (    6785065.13455177);

REGDR1:

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
*------------------------------------------------------------*;
* TOOL: Model Compare Class;
* TYPE: ASSESS;
* NODE: MdlComp;
*------------------------------------------------------------*;
drop _temp_;
if (P_Sum_Labor_Force_Pop ge 12847651.6853932) then do;
b_Sum_Labor_Force_ = 1;
end;
else
if (P_Sum_Labor_Force_Pop ge 9464919.99999999) then do;
_temp_ = dmran(1234);
b_Sum_Labor_Force_ = floor(5 + 2*_temp_);
end;
else
if (P_Sum_Labor_Force_Pop ge 3744154.76190476) then do;
_temp_ = dmran(1234);
b_Sum_Labor_Force_ = floor(9 + 2*_temp_);
end;
else
if (P_Sum_Labor_Force_Pop ge 1083534.09090907) then do;
_temp_ = dmran(1234);
b_Sum_Labor_Force_ = floor(14 + 2*_temp_);
end;
else
do;
b_Sum_Labor_Force_ = 20;
end;
*------------------------------------------------------------*;
* TOOL: Score Node;
* TYPE: ASSESS;
* NODE: Score2;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Score2: Creating Fixed Names;
*------------------------------------------------------------*;
LABEL EM_SEGMENT = 'Segment';
EM_SEGMENT = b_Sum_Labor_Force_;
LABEL EM_PREDICTION= "Prediction for Sum_Labor_Force_Pop";
EM_PREDICTION = P_Sum_Labor_Force_Pop;
LABEL = 'Target Variable: Sum_Labor_Force_Pop';
EM_VALUETARGET = Sum_Labor_Force_Pop;
