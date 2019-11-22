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

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label H15 = 'Hidden: H1=5' ;

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
   if _dm19 = '25 TO 44'  then do;
      Age_group16_to_24 = 0;
      Age_group25_to_44 = 1;
      Age_group45_to_64 = 0;
   end;
   else if _dm19 = '65+'  then do;
      Age_group16_to_24 = -1;
      Age_group25_to_44 = -1;
      Age_group45_to_64 = -1;
   end;
   else if _dm19 = '16 TO 24'  then do;
      Age_group16_to_24 = 1;
      Age_group25_to_44 = 0;
      Age_group45_to_64 = 0;
   end;
   else if _dm19 = '45 TO 64'  then do;
      Age_group16_to_24 = 0;
      Age_group25_to_44 = 0;
      Age_group45_to_64 = 1;
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
   S_Population_in_thousands  =    -1.87364654722034 +     0.00004806883022 *
        Population_in_thousands ;
END;
ELSE DO;
   IF MISSING( Population_in_thousands ) THEN S_Population_in_thousands  = . ;
   ELSE S_Population_in_thousands
          =    -1.87364654722034 +     0.00004806883022 *
        Population_in_thousands ;
END;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -10.5567860619218 * S_Population_in_thousands ;
   H12  =     6.93674374688679 * S_Population_in_thousands ;
   H13  =     7.97463271293276 * S_Population_in_thousands ;
   H14  =    -2.96157455818886 * S_Population_in_thousands ;
   H15  =      4.9967181694671 * S_Population_in_thousands ;
   H11  = H11  +    -11.6869571982903 * Age_group16_to_24
          +     10.2910675953121 * Age_group25_to_44
          +    -2.67490802081759 * Age_group45_to_64
          +    -1.10047437764076 * Date2000  +    -0.22760053126253 * Date2001
          +    -3.40954321604118 * Date2002  +    -0.60452251018176 * Date2003
          +    -1.03783572365717 * Date2004  +    -0.54238684306836 * Date2005
          +    -1.80290984208328 * Date2006  +     2.30444950898572 * Date2007
          +     0.28846951445795 * Date2008  +    -0.62558742417256 * Date2009
          +    -0.92614337641004 * Date2010  +    -1.14935618765427 * Date2011
          +     0.42630552474157 * Date2012 ;
   H12  = H12  +      5.1341539558253 * Age_group16_to_24
          +    -1.85154808121503 * Age_group25_to_44
          +    -0.21963193751603 * Age_group45_to_64
          +     0.67968076087533 * Date2000  +     -0.2213889785313 * Date2001
          +     0.90857120287394 * Date2002  +    -0.39051573868889 * Date2003
          +    -0.88481111060544 * Date2004  +     0.82639309413488 * Date2005
          +     0.56101709444704 * Date2006  +    -1.60116887850484 * Date2007
          +    -0.14101840804294 * Date2008  +     0.57133076039339 * Date2009
          +     0.56354245938444 * Date2010  +     0.01755253253051 * Date2011
          +     0.20400190699063 * Date2012 ;
   H13  = H13  +     6.54896826830039 * Age_group16_to_24
          +    -5.96257556419985 * Age_group25_to_44
          +    -1.03829245308179 * Age_group45_to_64
          +      0.5273199909973 * Date2000  +    -1.16104235179963 * Date2001
          +     0.55522670162147 * Date2002  +    -1.89314202170014 * Date2003
          +    -1.01567903024112 * Date2004  +     0.38130258078793 * Date2005
          +     0.21728270575449 * Date2006  +    -2.94142752103015 * Date2007
          +    -0.77285836854397 * Date2008  +    -0.90322430952049 * Date2009
          +    -1.08347007669971 * Date2010  +    -1.55758639952604 * Date2011
          +     0.18020721840761 * Date2012 ;
   H14  = H14  +     0.38670331780541 * Age_group16_to_24
          +    -1.05097959254072 * Age_group25_to_44
          +     1.96761736600783 * Age_group45_to_64
          +    -0.18360301011118 * Date2000  +     0.17293362273923 * Date2001
          +    -1.43323685000342 * Date2002  +      0.0272054881225 * Date2003
          +    -0.71125460179926 * Date2004  +    -0.77561194746101 * Date2005
          +    -0.73592366437635 * Date2006  +     1.26146631848131 * Date2007
          +     0.23163572016059 * Date2008  +    -0.17917872246374 * Date2009
          +    -0.11229699447691 * Date2010  +     0.40765262698265 * Date2011
          +    -0.75347814872141 * Date2012 ;
   H15  = H15  +     6.05287136294286 * Age_group16_to_24
          +    -3.79644901080526 * Age_group25_to_44
          +     1.21876416645613 * Age_group45_to_64
          +     3.86274213785008 * Date2000  +    -3.03988820362945 * Date2001
          +     3.63422315190693 * Date2002  +    -2.86024226192798 * Date2003
          +     1.31190653109364 * Date2004  +     1.00269797540369 * Date2005
          +     2.22154927414665 * Date2006  +    -3.83979602461957 * Date2007
          +     4.44191782076897 * Date2008  +     3.47148215279693 * Date2009
          +     3.48556234924851 * Date2010  +     2.70069017647433 * Date2011
          +    -1.24140391383962 * Date2012 ;
   H11  =    -7.92818491829576 + H11 ;
   H12  =    -4.07978141494418 + H12 ;
   H13  =    -5.38343814140791 + H13 ;
   H14  =    -0.18602948673383 + H14 ;
   H15  =     1.32351071847022 + H15 ;
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
   P_Sum_Labor_Force_Pop  =     1202843.43179155 * H11
          +    -948614.000404475 * H12  +    -892176.275748305 * H13
          +     108381.926973916 * H14  +    -1312495.62626186 * H15 ;
   P_Sum_Labor_Force_Pop  = P_Sum_Labor_Force_Pop  +     3828588.58021984 *
        S_Population_in_thousands ;
   P_Sum_Labor_Force_Pop  = P_Sum_Labor_Force_Pop  +     825881.286839296 *
        Age_group16_to_24  +       3494649.914537 * Age_group25_to_44
          +     2356092.99042497 * Age_group45_to_64
          +     161354.844294645 * Date2000  +     61402.3535329015 * Date2001
          +      142996.97687617 * Date2002  +     195762.159998255 * Date2003
          +     80843.3279672504 * Date2004  +    -7558.25823677259 * Date2005
          +     84781.8608938522 * Date2006  +     284398.657112347 * Date2007
          +     160257.474819793 * Date2008  +     9735.37887295724 * Date2009
          +     64520.7957197358 * Date2010  +     151481.035764261 * Date2011
          +     210465.484947051 * Date2012 ;
   P_Sum_Labor_Force_Pop  =     6735624.99997696 + P_Sum_Labor_Force_Pop ;
END;
ELSE DO;
   P_Sum_Labor_Force_Pop  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_Sum_Labor_Force_Pop  =              6735625;
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
