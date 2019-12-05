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

*** Generate dummy variables for Date ;
drop _1_0 _1_1 _1_2 _1_3 _1_4 _1_5 _1_6 _1_7 _1_8 _1_9 _1_10 _1_11 _1_12 _1_13
         _1_14 _1_15 _1_16 _1_17 _1_18 _1_19 ;
*** encoding is sparse, initialize to zero;
_1_0 = 0;
_1_1 = 0;
_1_2 = 0;
_1_3 = 0;
_1_4 = 0;
_1_5 = 0;
_1_6 = 0;
_1_7 = 0;
_1_8 = 0;
_1_9 = 0;
_1_10 = 0;
_1_11 = 0;
_1_12 = 0;
_1_13 = 0;
_1_14 = 0;
_1_15 = 0;
_1_16 = 0;
_1_17 = 0;
_1_18 = 0;
_1_19 = 0;
if missing( Date ) then do;
   _1_0 = .;
   _1_1 = .;
   _1_2 = .;
   _1_3 = .;
   _1_4 = .;
   _1_5 = .;
   _1_6 = .;
   _1_7 = .;
   _1_8 = .;
   _1_9 = .;
   _1_10 = .;
   _1_11 = .;
   _1_12 = .;
   _1_13 = .;
   _1_14 = .;
   _1_15 = .;
   _1_16 = .;
   _1_17 = .;
   _1_18 = .;
   _1_19 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm10 $ 10; drop _dm10 ;
   %DMNORMCP( Date , _dm10 )
   _dm_find = 0; drop _dm_find;
   if _dm10 <= '2000'  then do;
      if _dm10 <= '1995'  then do;
         if _dm10 <= '1992'  then do;
            if _dm10 <= '1991'  then do;
               if _dm10 = '1990'  then do;
                  _1_0 = 1;
                  _dm_find = 1;
               end;
               else do;
                  if _dm10 = '1991'  then do;
                     _1_1 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _dm10 = '1992'  then do;
                  _1_2 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm10 <= '1994'  then do;
               if _dm10 = '1993'  then do;
                  _1_3 = 1;
                  _dm_find = 1;
               end;
               else do;
                  if _dm10 = '1994'  then do;
                     _1_4 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _dm10 = '1995'  then do;
                  _1_5 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
      end;
      else do;
         if _dm10 <= '1998'  then do;
            if _dm10 <= '1997'  then do;
               if _dm10 = '1996'  then do;
                  _1_6 = 1;
                  _dm_find = 1;
               end;
               else do;
                  if _dm10 = '1997'  then do;
                     _1_7 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _dm10 = '1998'  then do;
                  _1_8 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm10 = '1999'  then do;
               _1_9 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm10 = '2000'  then do;
                  _1_10 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
      end;
   end;
   else do;
      if _dm10 <= '2005'  then do;
         if _dm10 <= '2003'  then do;
            if _dm10 <= '2002'  then do;
               if _dm10 = '2001'  then do;
                  _1_11 = 1;
                  _dm_find = 1;
               end;
               else do;
                  if _dm10 = '2002'  then do;
                     _1_12 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _dm10 = '2003'  then do;
                  _1_13 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm10 = '2004'  then do;
               _1_14 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm10 = '2005'  then do;
                  _1_15 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
      end;
      else do;
         if _dm10 <= '2008'  then do;
            if _dm10 <= '2007'  then do;
               if _dm10 = '2006'  then do;
                  _1_16 = 1;
                  _dm_find = 1;
               end;
               else do;
                  if _dm10 = '2007'  then do;
                     _1_17 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _dm10 = '2008'  then do;
                  _1_18 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm10 = '2009'  then do;
               _1_19 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm10 = '2010'  then do;
                  _1_0 = -1;
                  _1_1 = -1;
                  _1_2 = -1;
                  _1_3 = -1;
                  _1_4 = -1;
                  _1_5 = -1;
                  _1_6 = -1;
                  _1_7 = -1;
                  _1_8 = -1;
                  _1_9 = -1;
                  _1_10 = -1;
                  _1_11 = -1;
                  _1_12 = -1;
                  _1_13 = -1;
                  _1_14 = -1;
                  _1_15 = -1;
                  _1_16 = -1;
                  _1_17 = -1;
                  _1_18 = -1;
                  _1_19 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _1_0 = .;
      _1_1 = .;
      _1_2 = .;
      _1_3 = .;
      _1_4 = .;
      _1_5 = .;
      _1_6 = .;
      _1_7 = .;
      _1_8 = .;
      _1_9 = .;
      _1_10 = .;
      _1_11 = .;
      _1_12 = .;
      _1_13 = .;
      _1_14 = .;
      _1_15 = .;
      _1_16 = .;
      _1_17 = .;
      _1_18 = .;
      _1_19 = .;
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

*** Generate dummy variables for OPT_Population_in_thousands ;
drop _4_0 _4_1 _4_2 ;
if missing( OPT_Population_in_thousands ) then do;
   _4_0 = .;
   _4_1 = .;
   _4_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm32 $ 32; drop _dm32 ;
   %DMNORMCP( OPT_Population_in_thousands , _dm32 )
   if _dm32 = '02:8773.6505-34177.5, MISSING'  then do;
      _4_0 = 0;
      _4_1 = 1;
      _4_2 = 0;
   end;
   else if _dm32 = '01:LOW-8773.6505'  then do;
      _4_0 = 1;
      _4_1 = 0;
      _4_2 = 0;
   end;
   else if _dm32 = '03:34177.5-72628.5'  then do;
      _4_0 = 0;
      _4_1 = 0;
      _4_2 = 1;
   end;
   else if _dm32 = '04:72628.5-HIGH'  then do;
      _4_0 = -1;
      _4_1 = -1;
      _4_2 = -1;
   end;
   else do;
      _4_0 = .;
      _4_1 = .;
      _4_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _LP0 =     22.4354838709677;
   goto REG2DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: Age_group ;
_TEMP = 1;
_LP0 = _LP0 + (   -2.37601423285391) * _TEMP * _0_0;
_LP0 = _LP0 + (   -11.5032044757618) * _TEMP * _0_1;
_LP0 = _LP0 + (     13.880816803998) * _TEMP * _0_2;

***  Effect: Date ;
_TEMP = 1;
_LP0 = _LP0 + (    2.24616472990107) * _TEMP * _1_0;
_LP0 = _LP0 + (   -6.13240139877714) * _TEMP * _1_1;
_LP0 = _LP0 + (    7.32121895343001) * _TEMP * _1_2;
_LP0 = _LP0 + (    2.80827805772321) * _TEMP * _1_3;
_LP0 = _LP0 + (   -6.45892184894138) * _TEMP * _1_4;
_LP0 = _LP0 + (   -1.31556098880476) * _TEMP * _1_5;
_LP0 = _LP0 + (    3.46921127615725) * _TEMP * _1_6;
_LP0 = _LP0 + (    5.75111158015781) * _TEMP * _1_7;
_LP0 = _LP0 + (     -4.481076621042) * _TEMP * _1_8;
_LP0 = _LP0 + (   -2.49533933059043) * _TEMP * _1_9;
_LP0 = _LP0 + (    1.76670264226018) * _TEMP * _1_10;
_LP0 = _LP0 + (    -1.8915906193288) * _TEMP * _1_11;
_LP0 = _LP0 + (   -4.14883233660799) * _TEMP * _1_12;
_LP0 = _LP0 + (    4.45384569915666) * _TEMP * _1_13;
_LP0 = _LP0 + (    10.4880723112567) * _TEMP * _1_14;
_LP0 = _LP0 + (   -2.42979223787572) * _TEMP * _1_15;
_LP0 = _LP0 + (    1.29114412200599) * _TEMP * _1_16;
_LP0 = _LP0 + (    2.55351200783408) * _TEMP * _1_17;
_LP0 = _LP0 + (   -5.10991692425811) * _TEMP * _1_18;
_LP0 = _LP0 + (    5.64231982967194) * _TEMP * _1_19;

***  Effect: Disease ;
_TEMP = 1;
_LP0 = _LP0 + (    23.8144456058887) * _TEMP * _2_0;
_LP0 = _LP0 + (    6.17241906776287) * _TEMP * _2_1;
_LP0 = _LP0 + (   -13.7078634471084) * _TEMP * _2_2;
_LP0 = _LP0 + (   -13.9913005416553) * _TEMP * _2_3;

***  Effect: Gender ;
_TEMP = 1;
_LP0 = _LP0 + (    9.05872441749821) * _TEMP * _3_0;
_LP0 = _LP0 + (   -3.23831856399694) * _TEMP * _3_1;

***  Effect: OPT_Population_in_thousands ;
_TEMP = 1;
_LP0 = _LP0 + (   -1.19074151505959) * _TEMP * _4_0;
_LP0 = _LP0 + (   -16.0522869236569) * _TEMP * _4_1;
_LP0 = _LP0 + (                   0) * _TEMP * _4_2;
*--- Intercept ---*;
_LP0 = _LP0 + (    29.6164686515964);

REG2DR1:

*** Predicted Value;
label P_Cases_in_1000s = 'Predicted: Cases_in_1000s' ;
P_Cases_in_1000s = _LP0;


*************************************;
***** end scoring code for regression;
*************************************;
