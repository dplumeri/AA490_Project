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
      label S_Population = 'Standard: Population' ;

      label Age_group16_to_24 = 'Dummy: Age_group=16 to 24' ;

      label Age_group25_to_44 = 'Dummy: Age_group=25 to 44' ;

      label Age_group45_to_64 = 'Dummy: Age_group=45 to 64' ;

      label IndustryManagement__profession = 
'Dummy: Industry=Management, professional, and related occupations' ;

      label IndustryNatural_resources__con = 'Dummy: Industry=Natural resourc
es, construction, and maintenance occupations' ;

      label IndustryProduction__transporta = 'Dummy: Industry=Production, tra
nsportation, and material moving occupations' ;

      label IndustrySales_and_office_occup = 
'Dummy: Industry=Sales and office occupations' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label P_Sum_Labor_Force_Pop = 'Predicted: Sum_Labor_Force_Pop' ;

      label R_Sum_Labor_Force_Pop = 'Residual: Sum_Labor_Force_Pop' ;

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
   if _dm19 = '45 TO 64'  then do;
      Age_group16_to_24 = 0;
      Age_group25_to_44 = 0;
      Age_group45_to_64 = 1;
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
   else if _dm19 = '25 TO 44'  then do;
      Age_group16_to_24 = 0;
      Age_group25_to_44 = 1;
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

*** Generate dummy variables for Industry ;
drop IndustryManagement__profession IndustryNatural_resources__con 
        IndustryProduction__transporta IndustrySales_and_office_occup ;
*** encoding is sparse, initialize to zero;
IndustryManagement__profession = 0;
IndustryNatural_resources__con = 0;
IndustryProduction__transporta = 0;
IndustrySales_and_office_occup = 0;
if missing( Industry ) then do;
   IndustryManagement__profession = .;
   IndustryNatural_resources__con = .;
   IndustryProduction__transporta = .;
   IndustrySales_and_office_occup = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm32 $ 32; drop _dm32 ;
   length _dm111 $ 111; drop _dm111;
   _dm111 = put( Industry , $CHAR111. );
   %DMNORMCP( _dm111, _dm32 )
   if _dm32 = 'SERVICE OCCUPATIONS'  then do;
      IndustryManagement__profession = -1;
      IndustryNatural_resources__con = -1;
      IndustryProduction__transporta = -1;
      IndustrySales_and_office_occup = -1;
   end;
   else if _dm32 = 'SALES AND OFFICE OCCUPATIONS'  then do;
      IndustrySales_and_office_occup = 1;
   end;
   else if _dm32 = 'PRODUCTION, TRANSPORTATION, AND'  then do;
      IndustryProduction__transporta = 1;
   end;
   else if _dm32 = 'NATURAL RESOURCES, CONSTRUCTION,'  then do;
      IndustryNatural_resources__con = 1;
   end;
   else if _dm32 = 'MANAGEMENT, PROFESSIONAL, AND RE'  then do;
      IndustryManagement__profession = 1;
   end;
   else do;
      IndustryManagement__profession = .;
      IndustryNatural_resources__con = .;
      IndustryProduction__transporta = .;
      IndustrySales_and_office_occup = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   Population   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_Population  =    -2.83964697481178 +   4.7992594103827E-8 * Population ;
END;
ELSE DO;
   IF MISSING( Population ) THEN S_Population  = . ;
   ELSE S_Population  =    -2.83964697481178 +   4.7992594103827E-8 * 
        Population ;
END;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -1.07683938427355 * S_Population ;
   H12  =    -0.42418815980383 * S_Population ;
   H13  =      3.0458121085363 * S_Population ;
   H11  = H11  +     8.13620736214956 * Age_group16_to_24
          +    -5.69040629530111 * Age_group25_to_44
          +    -5.22627950724203 * Age_group45_to_64
          +    -8.20612991861404 * IndustryManagement__profession
          +     3.30962239961027 * IndustryNatural_resources__con
          +     2.59408016791381 * IndustryProduction__transporta
          +     0.18418992149364 * IndustrySales_and_office_occup ;
   H12  = H12  +     1.36164859072813 * Age_group16_to_24
          +     -4.9915715407152 * Age_group25_to_44
          +     0.87612368059709 * Age_group45_to_64
          +    -0.19832109582943 * IndustryManagement__profession
          +      1.0202053535978 * IndustryNatural_resources__con
          +    -0.28879843563274 * IndustryProduction__transporta
          +    -0.37557781715296 * IndustrySales_and_office_occup ;
   H13  = H13  +     84.2151951296337 * Age_group16_to_24
          +    -214.422271679173 * Age_group25_to_44
          +     47.6963303243508 * Age_group45_to_64
          +     5.49661823542271 * IndustryManagement__profession
          +    -7.94703019484785 * IndustryNatural_resources__con
          +     22.7643905758641 * IndustryProduction__transporta
          +    -11.6169698318882 * IndustrySales_and_office_occup ;
   H11  =     4.76991388120461 + H11 ;
   H12  =    -2.62037956892498 + H12 ;
   H13  =    -79.9842004687623 + H13 ;
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
   P_Sum_Labor_Force_Pop  =    -3873412.99092811 * H11
          +     -3446294.2697551 * H12  +    -706714.692803363 * H13 ;
   P_Sum_Labor_Force_Pop  =       5563212.759221 + P_Sum_Labor_Force_Pop ;
END;
ELSE DO;
   P_Sum_Labor_Force_Pop  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_Sum_Labor_Force_Pop  =     6470696.42857143;
END;
*** *****************************;
*** Writing the Residuals  of the Node intervalTargets ;
*** ******************************;
IF MISSING( Sum_Labor_Force_Pop ) THEN R_Sum_Labor_Force_Pop  = . ;
ELSE R_Sum_Labor_Force_Pop  = Sum_Labor_Force_Pop  - P_Sum_Labor_Force_Pop ;
********************************;
*** End Scoring Code for Neural;
********************************;
