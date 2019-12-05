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

      label Date1990 = 'Dummy: Date=1990' ;

      label Date1991 = 'Dummy: Date=1991' ;

      label Date1992 = 'Dummy: Date=1992' ;

      label Date1993 = 'Dummy: Date=1993' ;

      label Date1994 = 'Dummy: Date=1994' ;

      label Date1995 = 'Dummy: Date=1995' ;

      label Date1996 = 'Dummy: Date=1996' ;

      label Date1997 = 'Dummy: Date=1997' ;

      label Date1998 = 'Dummy: Date=1998' ;

      label Date1999 = 'Dummy: Date=1999' ;

      label Date2000 = 'Dummy: Date=2000' ;

      label Date2001 = 'Dummy: Date=2001' ;

      label Date2002 = 'Dummy: Date=2002' ;

      label Date2003 = 'Dummy: Date=2003' ;

      label Date2004 = 'Dummy: Date=2004' ;

      label Date2005 = 'Dummy: Date=2005' ;

      label Date2006 = 'Dummy: Date=2006' ;

      label Date2007 = 'Dummy: Date=2007' ;

      label Date2008 = 'Dummy: Date=2008' ;

      label Date2009 = 'Dummy: Date=2009' ;

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
drop Age_group0_17 Age_group18_24 Age_group25_44 ;
if missing( Age_group ) then do;
   Age_group0_17 = .;
   Age_group18_24 = .;
   Age_group25_44 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm19 $ 19; drop _dm19 ;
   %DMNORMCP( Age_group , _dm19 )
   if _dm19 = '18-24'  then do;
      Age_group0_17 = 0;
      Age_group18_24 = 1;
      Age_group25_44 = 0;
   end;
   else if _dm19 = '85+'  then do;
      Age_group0_17 = -1;
      Age_group18_24 = -1;
      Age_group25_44 = -1;
   end;
   else if _dm19 = '0-17'  then do;
      Age_group0_17 = 1;
      Age_group18_24 = 0;
      Age_group25_44 = 0;
   end;
   else if _dm19 = '25-44'  then do;
      Age_group0_17 = 0;
      Age_group18_24 = 0;
      Age_group25_44 = 1;
   end;
   else do;
      Age_group0_17 = .;
      Age_group18_24 = .;
      Age_group25_44 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Date ;
drop Date1990 Date1991 Date1992 Date1993 Date1994 Date1995 Date1996 Date1997 
        Date1998 Date1999 Date2000 Date2001 Date2002 Date2003 Date2004 
        Date2005 Date2006 Date2007 Date2008 Date2009 ;
*** encoding is sparse, initialize to zero;
Date1990 = 0;
Date1991 = 0;
Date1992 = 0;
Date1993 = 0;
Date1994 = 0;
Date1995 = 0;
Date1996 = 0;
Date1997 = 0;
Date1998 = 0;
Date1999 = 0;
Date2000 = 0;
Date2001 = 0;
Date2002 = 0;
Date2003 = 0;
Date2004 = 0;
Date2005 = 0;
Date2006 = 0;
Date2007 = 0;
Date2008 = 0;
Date2009 = 0;
if missing( Date ) then do;
   Date1990 = .;
   Date1991 = .;
   Date1992 = .;
   Date1993 = .;
   Date1994 = .;
   Date1995 = .;
   Date1996 = .;
   Date1997 = .;
   Date1998 = .;
   Date1999 = .;
   Date2000 = .;
   Date2001 = .;
   Date2002 = .;
   Date2003 = .;
   Date2004 = .;
   Date2005 = .;
   Date2006 = .;
   Date2007 = .;
   Date2008 = .;
   Date2009 = .;
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
                  Date1990 = 1;
                  _dm_find = 1;
               end;
               else do;
                  if _dm10 = '1991'  then do;
                     Date1991 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _dm10 = '1992'  then do;
                  Date1992 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm10 <= '1994'  then do;
               if _dm10 = '1993'  then do;
                  Date1993 = 1;
                  _dm_find = 1;
               end;
               else do;
                  if _dm10 = '1994'  then do;
                     Date1994 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _dm10 = '1995'  then do;
                  Date1995 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
      end;
      else do;
         if _dm10 <= '1998'  then do;
            if _dm10 <= '1997'  then do;
               if _dm10 = '1996'  then do;
                  Date1996 = 1;
                  _dm_find = 1;
               end;
               else do;
                  if _dm10 = '1997'  then do;
                     Date1997 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _dm10 = '1998'  then do;
                  Date1998 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm10 = '1999'  then do;
               Date1999 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm10 = '2000'  then do;
                  Date2000 = 1;
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
                  Date2001 = 1;
                  _dm_find = 1;
               end;
               else do;
                  if _dm10 = '2002'  then do;
                     Date2002 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _dm10 = '2003'  then do;
                  Date2003 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm10 = '2004'  then do;
               Date2004 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm10 = '2005'  then do;
                  Date2005 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
      end;
      else do;
         if _dm10 <= '2008'  then do;
            if _dm10 <= '2007'  then do;
               if _dm10 = '2006'  then do;
                  Date2006 = 1;
                  _dm_find = 1;
               end;
               else do;
                  if _dm10 = '2007'  then do;
                     Date2007 = 1;
                     _dm_find = 1;
                  end;
               end;
            end;
            else do;
               if _dm10 = '2008'  then do;
                  Date2008 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm10 = '2009'  then do;
               Date2009 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm10 = '2010'  then do;
                  Date1990 = -1;
                  Date1991 = -1;
                  Date1992 = -1;
                  Date1993 = -1;
                  Date1994 = -1;
                  Date1995 = -1;
                  Date1996 = -1;
                  Date1997 = -1;
                  Date1998 = -1;
                  Date1999 = -1;
                  Date2000 = -1;
                  Date2001 = -1;
                  Date2002 = -1;
                  Date2003 = -1;
                  Date2004 = -1;
                  Date2005 = -1;
                  Date2006 = -1;
                  Date2007 = -1;
                  Date2008 = -1;
                  Date2009 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      Date1990 = .;
      Date1991 = .;
      Date1992 = .;
      Date1993 = .;
      Date1994 = .;
      Date1995 = .;
      Date1996 = .;
      Date1997 = .;
      Date1998 = .;
      Date1999 = .;
      Date2000 = .;
      Date2001 = .;
      Date2002 = .;
      Date2003 = .;
      Date2004 = .;
      Date2005 = .;
      Date2006 = .;
      Date2007 = .;
      Date2008 = .;
      Date2009 = .;
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
   if _dm32 = 'ASTHMA'  then do;
      DiseaseAsthma = 1;
   end;
   else if _dm32 = 'CANCER, ALL'  then do;
      DiseaseCancer__all = 1;
   end;
   else if _dm32 = 'SEPTICEMIA'  then do;
      DiseaseAsthma = -1;
      DiseaseCancer__all = -1;
      DiseaseDementia_and_Alzheimer_ = -1;
      DiseaseOsteoarthritis = -1;
   end;
   else if _dm32 = 'OSTEOARTHRITIS'  then do;
      DiseaseOsteoarthritis = 1;
   end;
   else if _dm32 = 'DEMENTIA AND ALZHEIMER''S DISEASE'  then do;
      DiseaseDementia_and_Alzheimer_ = 1;
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
   S_Population_in_thousands  =    -1.07937284241798 +     0.00004492080679 * 
        Population_in_thousands ;
END;
ELSE DO;
   IF MISSING( Population_in_thousands ) THEN S_Population_in_thousands  = . ;
   ELSE S_Population_in_thousands
          =    -1.07937284241798 +     0.00004492080679 * 
        Population_in_thousands ;
END;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -4.69352130447972 * S_Population_in_thousands ;
   H12  =     5.06599717292821 * S_Population_in_thousands ;
   H13  =     9.80634004124476 * S_Population_in_thousands ;
   H14  =     3.31228883566718 * S_Population_in_thousands ;
   H15  =     2.65204463622264 * S_Population_in_thousands ;
   H11  = H11  +    -2.07549456644559 * Age_group0_17
          +     1.89028492207963 * Age_group18_24  +     0.22053737030127 * 
        Age_group25_44  +     0.69659443678365 * Date1990
          +     0.76034786483757 * Date1991  +      1.5555930805213 * Date1992
          +     0.48544690836429 * Date1993  +     0.39299434842502 * Date1994
          +     0.69548660210847 * Date1995  +     0.64404991008731 * Date1996
          +     0.81679921845806 * Date1997  +     0.53332314724246 * Date1998
          +     1.07150299228461 * Date1999  +      0.7453160964498 * Date2000
          +     0.90624856895714 * Date2001  +     1.25713648304045 * Date2002
          +     0.83267142151879 * Date2003  +       1.214226605094 * Date2004
          +     1.09288669379468 * Date2005  +     0.28321292187401 * Date2006
          +     1.13140317909567 * Date2007  +     1.02313288593481 * Date2008
          +     0.99491883505772 * Date2009  +    -7.71401550934144 * 
        DiseaseAsthma  +     1.59964499587479 * DiseaseCancer__all
          +     0.70480948708574 * DiseaseDementia_and_Alzheimer_
          +     0.72797177718724 * DiseaseOsteoarthritis
          +     0.46530598096977 * GenderAll  +     1.18299451025555 * 
        GenderFemale ;
   H12  = H12  +      7.3312221277029 * Age_group0_17
          +     5.73850136241549 * Age_group18_24  +     10.6973185841868 * 
        Age_group25_44  +     -1.3553395840109 * Date1990
          +    -1.64661531486796 * Date1991  +    -0.38696387838105 * Date1992
          +    -1.07583510589596 * Date1993  +    -1.20049741606894 * Date1994
          +    -1.48670117795664 * Date1995  +     0.56202204438682 * Date1996
          +    -0.70377483370229 * Date1997  +    -1.70290790819299 * Date1998
          +    -2.15232681013713 * Date1999  +     -1.3734118962421 * Date2000
          +    -1.53351964013452 * Date2001  +    -2.41748704002257 * Date2002
          +    -0.09137745061889 * Date2003  +    -1.22928905028318 * Date2004
          +    -2.52486294132669 * Date2005  +    -2.83313300695631 * Date2006
          +    -2.38969371440024 * Date2007  +    -1.97455468478895 * Date2008
          +    -2.79577318369912 * Date2009  +     10.0930545342347 * 
        DiseaseAsthma  +     2.53463690769088 * DiseaseCancer__all
          +    -5.44974536050982 * DiseaseDementia_and_Alzheimer_
          +    -6.66366786440493 * DiseaseOsteoarthritis
          +    -13.7993284481877 * GenderAll  +    -11.2856836835284 * 
        GenderFemale ;
   H13  = H13  +     11.5320728758474 * Age_group0_17
          +     2.55083959476408 * Age_group18_24  +     9.45497681685949 * 
        Age_group25_44  +    -2.22305273880915 * Date1990
          +     0.71228320972948 * Date1991  +    -1.69671242363179 * Date1992
          +    -2.07096834302197 * Date1993  +    -1.48125572009704 * Date1994
          +     -0.8875899757714 * Date1995  +      -2.421179817414 * Date1996
          +    -1.64953820814596 * Date1997  +     0.05899063834564 * Date1998
          +    -0.65976162782464 * Date1999  +    -2.12021732370381 * Date2000
          +    -0.23218871697767 * Date2001  +     0.49680053450197 * Date2002
          +    -3.37070416383577 * Date2003  +    -3.19700960081452 * Date2004
          +    -1.44905372985012 * Date2005  +    -0.35504408925028 * Date2006
          +    -2.42366014359047 * Date2007  +      1.4891459456614 * Date2008
          +    -0.95536468399431 * Date2009  +    -16.2644106277431 * 
        DiseaseAsthma  +    -1.07420198692332 * DiseaseCancer__all
          +     2.30579249007472 * DiseaseDementia_and_Alzheimer_
          +     3.20017776671941 * DiseaseOsteoarthritis
          +    -4.15046784729369 * GenderAll  +    -5.78061485020609 * 
        GenderFemale ;
   H14  = H14  +    -1.55108658966307 * Age_group0_17
          +    -10.3789605699185 * Age_group18_24  +    -1.95904692133192 * 
        Age_group25_44  +    -0.91391521151454 * Date1990
          +     0.51833472596654 * Date1991  +    -0.97926312698119 * Date1992
          +     0.18708730131971 * Date1993  +     0.60637947309503 * Date1994
          +    -0.26873764949416 * Date1995  +    -0.16817982853005 * Date1996
          +    -0.46955908040279 * Date1997  +     0.35343370229359 * Date1998
          +    -0.36562316393328 * Date1999  +     0.19705393231327 * Date2000
          +     0.37838157041407 * Date2001  +    -0.71736834843823 * Date2002
          +      0.2251319319131 * Date2003  +    -0.52219814910984 * Date2004
          +    -0.37183668462567 * Date2005  +     0.18776533343514 * Date2006
          +    -0.52283406693355 * Date2007  +     0.27924787632052 * Date2008
          +    -0.18114426047562 * Date2009  +     11.6289452155843 * 
        DiseaseAsthma  +     1.69855966477549 * DiseaseCancer__all
          +     4.07538413528311 * DiseaseDementia_and_Alzheimer_
          +     4.80541528234248 * DiseaseOsteoarthritis
          +     4.09040653943265 * GenderAll  +     5.64960081562795 * 
        GenderFemale ;
   H15  = H15  +      1.0377579474386 * Age_group0_17
          +    -7.41619727993334 * Age_group18_24  +    -4.56557554204821 * 
        Age_group25_44  +    -0.51974691842413 * Date1990
          +     0.18036839777598 * Date1991  +    -0.35174707148871 * Date1992
          +     0.71100844589891 * Date1993  +    -0.43490457226145 * Date1994
          +    -0.17077200125489 * Date1995  +     0.14632687316425 * Date1996
          +    -0.04997436214043 * Date1997  +     0.22148905595863 * Date1998
          +    -0.75589634680008 * Date1999  +    -0.06995609300308 * Date2000
          +     0.30369084965141 * Date2001  +    -0.63422767137316 * Date2002
          +     -0.1622350831455 * Date2003  +     0.36661113505189 * Date2004
          +    -0.23801941735777 * Date2005  +     0.69380511406108 * Date2006
          +    -0.04835278994052 * Date2007  +     0.17415908606882 * Date2008
          +     0.41739592966721 * Date2009  +     8.22227335247361 * 
        DiseaseAsthma  +    -1.93468543480133 * DiseaseCancer__all
          +    -0.44345159476264 * DiseaseDementia_and_Alzheimer_
          +    -0.67155128279256 * DiseaseOsteoarthritis
          +     -3.5896398512769 * GenderAll  +    -3.19425758541995 * 
        GenderFemale ;
   H11  =    -0.67879361033073 + H11 ;
   H12  =    -10.2997091319747 + H12 ;
   H13  =     -18.993712447529 + H13 ;
   H14  =    -5.80002297793079 + H14 ;
   H15  =     3.27949226428233 + H15 ;
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
   P_Cases_in_1000s  =     6.20558898162838 * H11  +     28.0802050542927 * 
        H12  +     -19.925743519177 * H13  +    -8.37268681364557 * H14
          +    -6.13796165178146 * H15 ;
   P_Cases_in_1000s  = P_Cases_in_1000s  +     19.0677178757299 * 
        S_Population_in_thousands ;
   P_Cases_in_1000s  = P_Cases_in_1000s  +     1.84323898299894 * 
        Age_group0_17  +    -32.2129039547762 * Age_group18_24
          +    -5.87042279413697 * Age_group25_44  +     0.64644874320222 * 
        Date1990  +    -0.61767104718305 * Date1991  +     2.10674090462058 * 
        Date1992  +     1.84201515067404 * Date1993  +    -2.61852689637743 * 
        Date1994  +     0.56014165474937 * Date1995  +     2.14278607761748 * 
        Date1996  +     3.23282628380366 * Date1997  +    -0.43138647584633 * 
        Date1998  +    -1.08959810703247 * Date1999  +     1.41287345304834 * 
        Date2000  +     0.48675488348262 * Date2001  +    -1.09566933054394 * 
        Date2002  +     3.59139119254411 * Date2003  +     6.02349786881733 * 
        Date2004  +    -2.58297796573657 * Date2005  +     2.68750938943843 * 
        Date2006  +     2.97573207261795 * Date2007  +     -1.6913818668857 * 
        Date2008  +     3.26943114185455 * Date2009  +     28.1005313349182 * 
        DiseaseAsthma  +     8.57749337260825 * DiseaseCancer__all
          +    -13.3693815595488 * DiseaseDementia_and_Alzheimer_
          +    -15.7176459386255 * DiseaseOsteoarthritis
          +     15.9878679482132 * GenderAll  +     4.75599475926515 * 
        GenderFemale ;
   P_Cases_in_1000s  =     21.2149380922315 + P_Cases_in_1000s ;
END;
ELSE DO;
   P_Cases_in_1000s  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_Cases_in_1000s  =     22.4354838709677;
END;
********************************;
*** End Scoring Code for Neural;
********************************;
