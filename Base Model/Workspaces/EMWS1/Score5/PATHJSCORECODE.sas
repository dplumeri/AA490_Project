*------------------------------------------------------------*;
* TOOL: Input Data Source;
* TYPE: SAMPLE;
* NODE: Ids4;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Statistics Exploration;
* TYPE: EXPLORE;
* NODE: Stat7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Partition Class;
* TYPE: SAMPLE;
* NODE: Part4;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural2;
*------------------------------------------------------------*;
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

      label Date2010 = 'Dummy: Date=2010' ;

      label Date2011 = 'Dummy: Date=2011' ;

      label Date2012 = 'Dummy: Date=2012' ;

      label Genderboth_sexes = 'Dummy: Gender=both sexes' ;

      label Genderfemale = 'Dummy: Gender=female' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label H15 = 'Hidden: H1=5' ;

      label P_Population_in_thousands = 'Predicted: Population_in_thousands' ;

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
   else if _dm19 = '25 TO 44'  then do;
      Age_group16_to_24 = 0;
      Age_group25_to_44 = 1;
      Age_group45_to_64 = 0;
   end;
   else if _dm19 = '45 TO 64'  then do;
      Age_group16_to_24 = 0;
      Age_group25_to_44 = 0;
      Age_group45_to_64 = 1;
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

*** Generate dummy variables for Date ;
drop Date2000 Date2001 Date2002 Date2003 Date2004 Date2005 Date2006 Date2007
        Date2008 Date2009 Date2010 Date2011 Date2012 ;
*** encoding is sparse, initialize to zero;
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
Date2010 = 0;
Date2011 = 0;
Date2012 = 0;
if missing( Date ) then do;
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
   Date2010 = .;
   Date2011 = .;
   Date2012 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm10 $ 10; drop _dm10 ;
   %DMNORMCP( Date , _dm10 )
   _dm_find = 0; drop _dm_find;
   if _dm10 <= '2006'  then do;
      if _dm10 <= '2003'  then do;
         if _dm10 <= '2001'  then do;
            if _dm10 = '2000'  then do;
               Date2000 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm10 = '2001'  then do;
                  Date2001 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm10 = '2002'  then do;
               Date2002 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm10 = '2003'  then do;
                  Date2003 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
      end;
      else do;
         if _dm10 <= '2005'  then do;
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
         else do;
            if _dm10 = '2006'  then do;
               Date2006 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm10 <= '2010'  then do;
         if _dm10 <= '2008'  then do;
            if _dm10 = '2007'  then do;
               Date2007 = 1;
               _dm_find = 1;
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
                  Date2010 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
      end;
      else do;
         if _dm10 <= '2012'  then do;
            if _dm10 = '2011'  then do;
               Date2011 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm10 = '2012'  then do;
                  Date2012 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm10 = '2013'  then do;
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
               Date2010 = -1;
               Date2011 = -1;
               Date2012 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
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
      Date2010 = .;
      Date2011 = .;
      Date2012 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Gender ;
drop Genderboth_sexes Genderfemale ;
if missing( Gender ) then do;
   Genderboth_sexes = .;
   Genderfemale = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm10 $ 10; drop _dm10 ;
   _dm10 = put( Gender , $CHAR10. );
   %DMNORMIP( _dm10 )
   if _dm10 = 'FEMALE'  then do;
      Genderboth_sexes = 0;
      Genderfemale = 1;
   end;
   else if _dm10 = 'MALE'  then do;
      Genderboth_sexes = -1;
      Genderfemale = -1;
   end;
   else if _dm10 = 'BOTH SEXES'  then do;
      Genderboth_sexes = 1;
      Genderfemale = 0;
   end;
   else do;
      Genderboth_sexes = .;
      Genderfemale = .;
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
   H11  =     2.80451581665555 * Age_group16_to_24  +     2.66257618857886 *
        Age_group25_to_44  +     2.27428042621142 * Age_group45_to_64
          +     0.47125292322736 * Date2000  +     0.23311851428843 * Date2001
          +     0.54902464433691 * Date2002  +    -0.15346735222469 * Date2003
          +     0.46944685861628 * Date2004  +     0.37604954513678 * Date2005
          +     0.39061416762273 * Date2006  +    -0.24695161265506 * Date2007
          +     -0.0940988910836 * Date2008  +      0.0228204870683 * Date2009
          +     0.61252140974112 * Date2010  +     0.16504723185446 * Date2011
          +     0.23086005632781 * Date2012  +     -0.5597343477957 *
        Genderboth_sexes  +    -0.52754157640117 * Genderfemale ;
   H12  =    -6.52971491740447 * Age_group16_to_24  +     0.28569861827114 *
        Age_group25_to_44  +    -0.00982281623129 * Age_group45_to_64
          +    -0.30625236358766 * Date2000  +    -1.21137798020402 * Date2001
          +    -1.51645564020364 * Date2002  +     0.86299496720353 * Date2003
          +    -0.93498774344571 * Date2004  +      0.6242111488688 * Date2005
          +    -2.36836348342809 * Date2006  +     1.12449399595682 * Date2007
          +     1.85047727439571 * Date2008  +     1.70776212926759 * Date2009
          +    -1.41962995460536 * Date2010  +     1.62083296703886 * Date2011
          +      1.4873652063756 * Date2012  +    -0.03519221005738 *
        Genderboth_sexes  +     -2.3955157311532 * Genderfemale ;
   H13  =     7.06158999344795 * Age_group16_to_24  +     0.57048096601117 *
        Age_group25_to_44  +     2.63895819015121 * Age_group45_to_64
          +    -0.16828253491725 * Date2000  +    -1.28332184684902 * Date2001
          +     0.50133567355546 * Date2002  +    -0.77559399613047 * Date2003
          +     0.78813284182853 * Date2004  +     0.41238962207276 * Date2005
          +     -0.5968396858171 * Date2006  +    -0.66033245840418 * Date2007
          +    -1.37018067368506 * Date2008  +     0.08381409125405 * Date2009
          +    -0.75540384347548 * Date2010  +    -0.02835506626351 * Date2011
          +    -0.49849084530149 * Date2012  +     1.13117701174471 *
        Genderboth_sexes  +     1.64736127034363 * Genderfemale ;
   H14  =      3.4630872113265 * Age_group16_to_24  +     4.47136694021352 *
        Age_group25_to_44  +     2.72605263191296 * Age_group45_to_64
          +     0.74703333016594 * Date2000  +     0.56768441734246 * Date2001
          +      1.1194903343746 * Date2002  +     0.35057468036228 * Date2003
          +     0.81946953762189 * Date2004  +     0.72110714351831 * Date2005
          +     0.88434900503026 * Date2006  +    -0.06920733547316 * Date2007
          +    -0.15761719875234 * Date2008  +     0.58373614901827 * Date2009
          +     0.52761282361936 * Date2010  +     0.59835393969457 * Date2011
          +    -0.03571345430143 * Date2012  +    -1.59476884959088 *
        Genderboth_sexes  +    -1.01398015589094 * Genderfemale ;
   H15  =    -8.58338025897798 * Age_group16_to_24  +     1.73431130182411 *
        Age_group25_to_44  +    -2.50959190344774 * Age_group45_to_64
          +    -2.01062257249017 * Date2000  +    -1.65707328817157 * Date2001
          +    -0.45538932981411 * Date2002  +    -1.16471188125424 * Date2003
          +    -3.28879121393757 * Date2004  +    -0.47862384065246 * Date2005
          +    -1.01023576957189 * Date2006  +     1.29345923113314 * Date2007
          +     3.00513118567611 * Date2008  +     -0.0493540201805 * Date2009
          +     0.59692696836937 * Date2010  +     0.58089574713768 * Date2011
          +     1.85854307287315 * Date2012  +    -0.84076518654861 *
        Genderboth_sexes  +     1.94410703586789 * Genderfemale ;
   H11  =     2.48053561642249 + H11 ;
   H12  =     1.79073624896972 + H12 ;
   H13  =     2.85387370456884 + H13 ;
   H14  =     3.49449374745814 + H14 ;
   H15  =     1.94199856063024 + H15 ;
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
   P_Population_in_thousands  =     1205.29793130634 * H11
          +     1161.95461367712 * H12  +    -3343.15103184733 * H13
          +    -2016.50607171174 * H14  +     5915.28044708513 * H15 ;
   P_Sum_Labor_Force_Pop  =    -295059.596508757 * H11
          +     1200951.00495338 * H12  +    -622386.835301285 * H13
          +     -467275.30556996 * H14  +     1356666.24875043 * H15 ;
   P_Population_in_thousands  = P_Population_in_thousands
          +     728.718562311591 * Age_group16_to_24
          +     13881.1646508779 * Age_group25_to_44
          +     11891.1993266939 * Age_group45_to_64
          +    -734.876069986509 * Date2000  +    -1005.44966893069 * Date2001
          +    -196.729378741228 * Date2002  +    -548.124329064577 * Date2003
          +    -706.153079137373 * Date2004  +    -393.473056965343 * Date2005
          +    -450.137223833081 * Date2006  +     -554.78332702273 * Date2007
          +    -258.442730517595 * Date2008  +     -103.62092126527 * Date2009
          +    -200.510083639569 * Date2010  +     406.714770016742 * Date2011
          +    -474.646386339079 * Date2012  +     18344.9984154323 *
        Genderboth_sexes  +     1012.85516998176 * Genderfemale ;
   P_Sum_Labor_Force_Pop  = P_Sum_Labor_Force_Pop  +     1381575.51824344 *
        Age_group16_to_24  +     5606191.01745719 * Age_group25_to_44
          +     4011210.80381704 * Age_group45_to_64
          +    -25961.8994106242 * Date2000  +    -119891.686127416 * Date2001
          +     59716.3277166119 * Date2002  +     104896.712470764 * Date2003
          +    -71742.1586759904 * Date2004  +     71167.8765069561 * Date2005
          +    -29647.3704495667 * Date2006  +     186857.778701065 * Date2007
          +     121123.726203765 * Date2008  +     106127.807854169 * Date2009
          +    -10559.2515420828 * Date2010  +     129158.867206917 * Date2011
          +     76664.9084844277 * Date2012  +     226995.438713328 *
        Genderboth_sexes  +    -3400.00464106612 * Genderfemale ;
   P_Population_in_thousands  =     38841.2806487802 +
        P_Population_in_thousands ;
   P_Sum_Labor_Force_Pop  =     6927309.52378857 + P_Sum_Labor_Force_Pop ;
END;
ELSE DO;
   P_Population_in_thousands  = .;
   P_Sum_Labor_Force_Pop  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_Population_in_thousands  =     38841.2806488095;
   P_Sum_Labor_Force_Pop  =     6927309.52380952;
END;
********************************;
*** End Scoring Code for Neural;
********************************;
drop
H11
H12
H13
H14
H15
;
*------------------------------------------------------------*;
* TOOL: Model Compare Class;
* TYPE: ASSESS;
* NODE: MdlComp2;
*------------------------------------------------------------*;
if (P_Population_in_thousands ge 73345.5958813221) then do;
b_Population_in_th = 1;
end;
else
if (P_Population_in_thousands ge 63549.9703592953) then do;
b_Population_in_th = 2;
end;
else
if (P_Population_in_thousands ge 59513.896483804) then do;
b_Population_in_th = 3;
end;
else
if (P_Population_in_thousands ge 56139.4932157775) then do;
b_Population_in_th = 4;
end;
else
if (P_Population_in_thousands ge 54199.6523007248) then do;
b_Population_in_th = 5;
end;
else
if (P_Population_in_thousands ge 51699.0387624403) then do;
b_Population_in_th = 6;
end;
else
if (P_Population_in_thousands ge 46484.7601404305) then do;
b_Population_in_th = 7;
end;
else
if (P_Population_in_thousands ge 43279.4996245372) then do;
b_Population_in_th = 8;
end;
else
if (P_Population_in_thousands ge 41442.7961529277) then do;
b_Population_in_th = 9;
end;
else
if (P_Population_in_thousands ge 38995.5279012171) then do;
b_Population_in_th = 10;
end;
else
if (P_Population_in_thousands ge 36482.2536953926) then do;
b_Population_in_th = 11;
end;
else
if (P_Population_in_thousands ge 29154.4120203551) then do;
b_Population_in_th = 12;
end;
else
if (P_Population_in_thousands ge 28724.0283181155) then do;
b_Population_in_th = 13;
end;
else
if (P_Population_in_thousands ge 24354.96245556) then do;
b_Population_in_th = 14;
end;
else
if (P_Population_in_thousands ge 23953.9530595373) then do;
b_Population_in_th = 15;
end;
else
if (P_Population_in_thousands ge 22102.788540459) then do;
b_Population_in_th = 16;
end;
else
if (P_Population_in_thousands ge 9424.27590782892) then do;
b_Population_in_th = 17;
end;
else
if (P_Population_in_thousands ge 8267.9987442528) then do;
b_Population_in_th = 18;
end;
else
if (P_Population_in_thousands ge 3751.11686117438) then do;
b_Population_in_th = 19;
end;
else
do;
b_Population_in_th = 20;
end;
