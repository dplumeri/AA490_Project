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
      label Age_group16_to_24 = 'Dummy: Age_group=16 to 24' ;

      label Age_group25_to_44 = 'Dummy: Age_group=25 to 44' ;

      label Age_group45_to_64 = 'Dummy: Age_group=45 to 64' ;

      label G_Date0 = 'Dummy: G_Date=0' ;

      label G_Date1 = 'Dummy: G_Date=1' ;

      label G_Date2 = 'Dummy: G_Date=2' ;

      label G_Date3 = 'Dummy: G_Date=3' ;

      label G_Date4 = 'Dummy: G_Date=4' ;

      label G_Date5 = 'Dummy: G_Date=5' ;

      label G_Date6 = 'Dummy: G_Date=6' ;

      label G_Date7 = 'Dummy: G_Date=7' ;

      label G_Date8 = 'Dummy: G_Date=8' ;

      label G_Date9 = 'Dummy: G_Date=9' ;

      label G_Date10 = 'Dummy: G_Date=10' ;

      label G_Date11 = 'Dummy: G_Date=11' ;

      label OPT_Population_01_low_27749_91 =
'Dummy: OPT_Population_in_thousands=01:low-27749.913' ;

      label OPT_Population_02_27749_913_40 =
'Dummy: OPT_Population_in_thousands=02:27749.913-40523.919' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label P_Sum_Labor_Force_Pop = 'Predicted: Sum_Labor_Force_Pop' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for Age_group ;
drop Age_group16_to_24 Age_group25_to_44 Age_group45_to_64 ;
if missing( Age_group ) then do;
   Age_group16_to_24 = .;
   Age_group25_to_44 = .;
   Age_group45_to_64 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm19 $ 19; drop _dm19 ;
   %DMNORMCP( Age_group , _dm19 )
   if _dm19 = '65+'  then do;
      Age_group16_to_24 = -1;
      Age_group25_to_44 = -1;
      Age_group45_to_64 = -1;
   end;
   else if _dm19 = '45 TO 64'  then do;
      Age_group16_to_24 = 0;
      Age_group25_to_44 = 0;
      Age_group45_to_64 = 1;
   end;
   else if _dm19 = '25 TO 44'  then do;
      Age_group16_to_24 = 0;
      Age_group25_to_44 = 1;
      Age_group45_to_64 = 0;
   end;
   else if _dm19 = '16 TO 24'  then do;
      Age_group16_to_24 = 1;
      Age_group25_to_44 = 0;
      Age_group45_to_64 = 0;
   end;
   else do;
      Age_group16_to_24 = .;
      Age_group25_to_44 = .;
      Age_group45_to_64 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Date ;
drop G_Date0 G_Date1 G_Date2 G_Date3 G_Date4 G_Date5 G_Date6 G_Date7 G_Date8
        G_Date9 G_Date10 G_Date11 ;
*** encoding is sparse, initialize to zero;
G_Date0 = 0;
G_Date1 = 0;
G_Date2 = 0;
G_Date3 = 0;
G_Date4 = 0;
G_Date5 = 0;
G_Date6 = 0;
G_Date7 = 0;
G_Date8 = 0;
G_Date9 = 0;
G_Date10 = 0;
G_Date11 = 0;
if missing( G_Date ) then do;
   G_Date0 = .;
   G_Date1 = .;
   G_Date2 = .;
   G_Date3 = .;
   G_Date4 = .;
   G_Date5 = .;
   G_Date6 = .;
   G_Date7 = .;
   G_Date8 = .;
   G_Date9 = .;
   G_Date10 = .;
   G_Date11 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Date , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '3'  then do;
      if _dm12 <= '11'  then do;
         if _dm12 <= '1'  then do;
            if _dm12 = '0'  then do;
               G_Date0 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '1'  then do;
                  G_Date1 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '10'  then do;
               G_Date10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  G_Date11 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
      end;
      else do;
         if _dm12 <= '2'  then do;
            if _dm12 = '12'  then do;
               G_Date0 = -1;
               G_Date1 = -1;
               G_Date2 = -1;
               G_Date3 = -1;
               G_Date4 = -1;
               G_Date5 = -1;
               G_Date6 = -1;
               G_Date7 = -1;
               G_Date8 = -1;
               G_Date9 = -1;
               G_Date10 = -1;
               G_Date11 = -1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '2'  then do;
                  G_Date2 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '3'  then do;
               G_Date3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '6'  then do;
         if _dm12 <= '5'  then do;
            if _dm12 = '4'  then do;
               G_Date4 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '5'  then do;
                  G_Date5 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '6'  then do;
               G_Date6 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 <= '8'  then do;
            if _dm12 = '7'  then do;
               G_Date7 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '8'  then do;
                  G_Date8 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '9'  then do;
               G_Date9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      G_Date0 = .;
      G_Date1 = .;
      G_Date2 = .;
      G_Date3 = .;
      G_Date4 = .;
      G_Date5 = .;
      G_Date6 = .;
      G_Date7 = .;
      G_Date8 = .;
      G_Date9 = .;
      G_Date10 = .;
      G_Date11 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for OPT_Population_in_thousands ;
drop OPT_Population_01_low_27749_91 OPT_Population_02_27749_913_40 ;
if missing( OPT_Population_in_thousands ) then do;
   OPT_Population_01_low_27749_91 = .;
   OPT_Population_02_27749_913_40 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm32 $ 32; drop _dm32 ;
   %DMNORMCP( OPT_Population_in_thousands , _dm32 )
   if _dm32 = '03:40523.919-HIGH, MISSING'  then do;
      OPT_Population_01_low_27749_91 = -1;
      OPT_Population_02_27749_913_40 = -1;
   end;
   else if _dm32 = '01:LOW-27749.913'  then do;
      OPT_Population_01_low_27749_91 = 1;
      OPT_Population_02_27749_913_40 = 0;
   end;
   else if _dm32 = '02:27749.913-40523.919'  then do;
      OPT_Population_01_low_27749_91 = 0;
      OPT_Population_02_27749_913_40 = 1;
   end;
   else do;
      OPT_Population_01_low_27749_91 = .;
      OPT_Population_02_27749_913_40 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     97.4825147671137 * Age_group16_to_24  +    -54.0533453853029 *
        Age_group25_to_44  +     64.4920176969353 * Age_group45_to_64
          +      72.559960370367 * G_Date0  +    -102.561873008137 * G_Date1
          +      57.450222707413 * G_Date2  +    -0.06961118350436 * G_Date3
          +    -20.7155488923534 * G_Date4  +      83.779366030055 * G_Date5
          +    -137.813372727696 * G_Date6  +    -49.3461512501977 * G_Date7
          +     105.985648859758 * G_Date8  +    -82.2402484669472 * G_Date9
          +     -284.67976511353 * G_Date10  +      265.00939569491 * G_Date11
          +    -21.8603956931506 * OPT_Population_01_low_27749_91
          +     19.4609962231357 * OPT_Population_02_27749_913_40 ;
   H12  =     82427714392341.5 * Age_group16_to_24  +     82427714392180.1 *
        Age_group25_to_44  +     82427714391856.2 * Age_group45_to_64
          +    -8.09084854960675 * G_Date0  +     0.01703164607637 * G_Date1
          +    -186.531159399822 * G_Date2  +     2.74427239034311 * G_Date3
          +     5.37631520021484 * G_Date4  +    -5.77967319782334 * G_Date5
          +    -1.69905456184039 * G_Date6  +     -129415044330559 * G_Date7
          +     138.272374638161 * G_Date8  +    -9.70216921877553 * G_Date9
          +    -16.9592925352738 * G_Date10  +     46987329938354.4 * G_Date11
          +    -82427714392534.8 * OPT_Population_01_low_27749_91
          +    -313.419032271461 * OPT_Population_02_27749_913_40 ;
   H13  =    -9617.22385559946 * Age_group16_to_24  +    -236523.348902238 *
        Age_group25_to_44  +    -9618.36552345647 * Age_group45_to_64
          +     0.50368458011756 * G_Date0  +     0.27673958870928 * G_Date1
          +     0.21792698243068 * G_Date2  +     0.12287656450076 * G_Date3
          +    -0.09567859273321 * G_Date4  +     0.14980836065414 * G_Date5
          +    -0.02999302827684 * G_Date6  +    -0.23463906785714 * G_Date7
          +    -0.03202899324402 * G_Date8  +    -0.30765412348637 * G_Date9
          +    -0.22060400718538 * G_Date10  +    -0.10304573543441 * G_Date11
          +     0.00092905422664 * OPT_Population_01_low_27749_91
          +     0.12320282835843 * OPT_Population_02_27749_913_40 ;
   H11  =    -21756.1066100815 + H11 ;
   H12  =    -82427714378273.8 + H12 ;
   H13  =     9617.91970044019 + H13 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
END;
*** *************************;
*** Writing the Node intervalTargets ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_Sum_Labor_Force_Pop  =    -330177.766159279 * H11
          +     156009.841380317 * H12  +    -5747220.41341706 * H13 ;
   P_Sum_Labor_Force_Pop  =      6802663.5740012 + P_Sum_Labor_Force_Pop ;
END;
ELSE DO;
   P_Sum_Labor_Force_Pop  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_Sum_Labor_Force_Pop  =     6872727.89115646;
END;
********************************;
*** End Scoring Code for Neural;
********************************;
drop
H11
H12
H13
;
