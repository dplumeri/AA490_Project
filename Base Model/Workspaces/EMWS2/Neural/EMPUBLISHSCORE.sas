***********************************;
*** Begin Scoring Code for Neural;
***********************************;
DROP _DM_BAD _EPS _NOCL_ _MAX_ _MAXP_ _SUM_ _NTRIALS;
 _DM_BAD = 0;
 _NOCL_ = .;
 _MAX_ = .;
 _MAXP_ = .;
 _SUM_ = .;
 _NTRIALS = .;
 _EPS =                1E-10;
LENGTH _WARN_ $4
;
      label S_Population_in_thousands = 'Standard: Population_in_thousands' ;

      label Age_group0_17 = 'Dummy: Age_group=0-17' ;

      label Age_group18_24 = 'Dummy: Age_group=18-24' ;

      label Age_group25_44 = 'Dummy: Age_group=25-44' ;

      label Age_group45_64 = 'Dummy: Age_group=45-64' ;

      label Age_group65_84 = 'Dummy: Age_group=65-84' ;

      label DiseaseAsthma = 'Dummy: Disease=Asthma' ;

      label DiseaseCancer__all = 'Dummy: Disease=Cancer, all' ;

      label DiseaseDementia_and_Alzheimer_ =
'Dummy: Disease=Dementia and Alzheimer''s disease' ;

      label DiseaseOsteoarthritis = 'Dummy: Disease=Osteoarthritis' ;

      label GenderAll = 'Dummy: Gender=All' ;

      label GenderFemale = 'Dummy: Gender=Female' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label H15 = 'Hidden: H1=5' ;

      label P_Cases_in_1000s = 'Predicted: Cases_in_1000s' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for Age_group ;
drop Age_group0_17 Age_group18_24 Age_group25_44 Age_group45_64 Age_group65_84
         ;
*** encoding is sparse, initialize to zero;
Age_group0_17 = 0;
Age_group18_24 = 0;
Age_group25_44 = 0;
Age_group45_64 = 0;
Age_group65_84 = 0;
if missing( Age_group ) then do;
   Age_group0_17 = .;
   Age_group18_24 = .;
   Age_group25_44 = .;
   Age_group45_64 = .;
   Age_group65_84 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm19 $ 19; drop _dm19 ;
   %DMNORMCP( Age_group , _dm19 )
   if _dm19 = '65-84'  then do;
      Age_group65_84 = 1;
   end;
   else if _dm19 = '18-24'  then do;
      Age_group18_24 = 1;
   end;
   else if _dm19 = '0-17'  then do;
      Age_group0_17 = 1;
   end;
   else if _dm19 = '85+'  then do;
      Age_group0_17 = -1;
      Age_group18_24 = -1;
      Age_group25_44 = -1;
      Age_group45_64 = -1;
      Age_group65_84 = -1;
   end;
   else if _dm19 = '25-44'  then do;
      Age_group25_44 = 1;
   end;
   else if _dm19 = '45-64'  then do;
      Age_group45_64 = 1;
   end;
   else do;
      Age_group0_17 = .;
      Age_group18_24 = .;
      Age_group25_44 = .;
      Age_group45_64 = .;
      Age_group65_84 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Disease ;
drop DiseaseAsthma DiseaseCancer__all DiseaseDementia_and_Alzheimer_
        DiseaseOsteoarthritis ;
*** encoding is sparse, initialize to zero;
DiseaseAsthma = 0;
DiseaseCancer__all = 0;
DiseaseDementia_and_Alzheimer_ = 0;
DiseaseOsteoarthritis = 0;
if missing( Disease ) then do;
   DiseaseAsthma = .;
   DiseaseCancer__all = .;
   DiseaseDementia_and_Alzheimer_ = .;
   DiseaseOsteoarthritis = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm32 $ 32; drop _dm32 ;
   %DMNORMCP( Disease , _dm32 )
   if _dm32 = 'CANCER, ALL'  then do;
      DiseaseCancer__all = 1;
   end;
   else if _dm32 = 'ASTHMA'  then do;
      DiseaseAsthma = 1;
   end;
   else if _dm32 = 'OSTEOARTHRITIS'  then do;
      DiseaseOsteoarthritis = 1;
   end;
   else if _dm32 = 'DEMENTIA AND ALZHEIMER''S DISEASE'  then do;
      DiseaseDementia_and_Alzheimer_ = 1;
   end;
   else if _dm32 = 'SEPTICEMIA'  then do;
      DiseaseAsthma = -1;
      DiseaseCancer__all = -1;
      DiseaseDementia_and_Alzheimer_ = -1;
      DiseaseOsteoarthritis = -1;
   end;
   else do;
      DiseaseAsthma = .;
      DiseaseCancer__all = .;
      DiseaseDementia_and_Alzheimer_ = .;
      DiseaseOsteoarthritis = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Gender ;
drop GenderAll GenderFemale ;
if missing( Gender ) then do;
   GenderAll = .;
   GenderFemale = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm10 $ 10; drop _dm10 ;
   _dm10 = put( Gender , $CHAR10. );
   %DMNORMIP( _dm10 )
   if _dm10 = 'ALL'  then do;
      GenderAll = 1;
      GenderFemale = 0;
   end;
   else if _dm10 = 'MALE'  then do;
      GenderAll = -1;
      GenderFemale = -1;
   end;
   else if _dm10 = 'FEMALE'  then do;
      GenderAll = 0;
      GenderFemale = 1;
   end;
   else do;
      GenderAll = .;
      GenderFemale = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   Population_in_thousands   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_Population_in_thousands  =    -1.33973697356729 +     0.00004274722206 *
        Population_in_thousands ;
END;
ELSE DO;
   IF MISSING( Population_in_thousands ) THEN S_Population_in_thousands  = . ;
   ELSE S_Population_in_thousands
          =    -1.33973697356729 +     0.00004274722206 *
        Population_in_thousands ;
END;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     1.35434005089982 * S_Population_in_thousands ;
   H12  =    -5.86736639290222 * S_Population_in_thousands ;
   H13  =     1.74534286115132 * S_Population_in_thousands ;
   H14  =     -1.7416965772114 * S_Population_in_thousands ;
   H15  =     0.32029026736697 * S_Population_in_thousands ;
   H11  = H11  +     1.71448870576879 * Age_group0_17
          +     1.77698251167841 * Age_group18_24  +     1.03025379631606 *
        Age_group25_44  +     -2.7956731934031 * Age_group45_64
          +    -1.03005728244483 * Age_group65_84  +    -0.94281877271546 *
        DiseaseAsthma  +      2.2147481918044 * DiseaseCancer__all
          +    -1.69110565485991 * DiseaseDementia_and_Alzheimer_
          +     1.35070603998304 * DiseaseOsteoarthritis
          +    -0.20138646157356 * GenderAll  +    -0.33007295308219 *
        GenderFemale ;
   H12  = H12  +    -0.49834529725908 * Age_group0_17
          +     6.65737966257656 * Age_group18_24  +     0.02166950755446 *
        Age_group25_44  +    -0.30406002314189 * Age_group45_64
          +    -0.19967481942436 * Age_group65_84  +     2.48663287133045 *
        DiseaseAsthma  +    -4.17996212144142 * DiseaseCancer__all
          +     7.87749987799108 * DiseaseDementia_and_Alzheimer_
          +    -3.48018763761733 * DiseaseOsteoarthritis
          +    -0.74940371145971 * GenderAll  +     1.76509155400586 *
        GenderFemale ;
   H13  = H13  +     1.77452647934571 * Age_group0_17
          +     1.30242349489465 * Age_group18_24  +     4.75511761734959 *
        Age_group25_44  +    -5.04989377605042 * Age_group45_64
          +    -14.6022849415037 * Age_group65_84  +     -0.5937322268467 *
        DiseaseAsthma  +     3.59429329496977 * DiseaseCancer__all
          +    -1.42393776965241 * DiseaseDementia_and_Alzheimer_
          +     -1.1581922307743 * DiseaseOsteoarthritis
          +     0.22970325988741 * GenderAll  +     0.16544413491246 *
        GenderFemale ;
   H14  = H14  +    -3.17942072873073 * Age_group0_17
          +    -3.71080374659487 * Age_group18_24  +    -2.41487691740168 *
        Age_group25_44  +     5.87238706134944 * Age_group45_64
          +     7.12807887019481 * Age_group65_84  +     4.95030154622387 *
        DiseaseAsthma  +    -3.98563182695072 * DiseaseCancer__all
          +     1.65479145935008 * DiseaseDementia_and_Alzheimer_
          +    -1.84356548332388 * DiseaseOsteoarthritis
          +     0.02515372327161 * GenderAll  +     0.14248788307797 *
        GenderFemale ;
   H15  = H15  +    -2.65499345189966 * Age_group0_17
          +    -2.52386407007236 * Age_group18_24  +    -0.08789214446679 *
        Age_group25_44  +     1.33690548242373 * Age_group45_64
          +     3.35753315084801 * Age_group65_84  +    -2.54327090277794 *
        DiseaseAsthma  +     3.22645343642654 * DiseaseCancer__all
          +     -1.7342325341365 * DiseaseDementia_and_Alzheimer_
          +     1.62294449342552 * DiseaseOsteoarthritis
          +     0.50944932247803 * GenderAll  +     1.16624523024671 *
        GenderFemale ;
   H11  =    -0.16328527582879 + H11 ;
   H12  =     3.43706584749845 + H12 ;
   H13  =    -3.84967331225192 + H13 ;
   H14  =     3.88592449819665 + H14 ;
   H15  =    -4.58028929812927 + H15 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
   H14  = TANH(H14 );
   H15  = TANH(H15 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
   H14  = .;
   H15  = .;
END;
*** *************************;
*** Writing the Node intervalTargets ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_Cases_in_1000s  =     67.4104297195872 * H11  +    -35.8921323485021 *
        H12  +    -24.7752792694521 * H13  +     81.8360046551309 * H14
          +     66.7196227687357 * H15 ;
   P_Cases_in_1000s  = P_Cases_in_1000s  +    -8.68845221932159 *
        S_Population_in_thousands ;
   P_Cases_in_1000s  = P_Cases_in_1000s  +    -42.2746060828309 *
        Age_group0_17  +     -47.143646201442 * Age_group18_24
          +    -36.7791443787182 * Age_group25_44  +      11.462692663179 *
        Age_group45_64  +      58.824895833719 * Age_group65_84
          +    -29.7087244942384 * DiseaseAsthma  +     65.9700972408222 *
        DiseaseCancer__all  +    -33.3466634179848 *
        DiseaseDementia_and_Alzheimer_  +     0.84531108399158 *
        DiseaseOsteoarthritis  +     30.4656747943978 * GenderAll
          +    -8.25358426398541 * GenderFemale ;
   P_Cases_in_1000s  =      96.558824557025 + P_Cases_in_1000s ;
END;
ELSE DO;
   P_Cases_in_1000s  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_Cases_in_1000s  =     71.1668909825033;
END;
********************************;
*** End Scoring Code for Neural;
********************************;
drop
S_Population_in_thousands
H11
H12
H13
H14
H15
;
