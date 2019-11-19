*****************************************;
*** Begin Scoring Code from PROC DMVQ ***;
*****************************************;


*** Begin Class Look-up, Standardization, Replacement ;
drop _dm_bad; _dm_bad = 0;

*** Standardize Projected_Sum_Pop ;
drop T_Projected_Sum_Pop ;
if missing( Projected_Sum_Pop ) then T_Projected_Sum_Pop = .;
else T_Projected_Sum_Pop = (Projected_Sum_Pop
         - 1374054.76507936) * 1.2287347886416E-6;

*** Standardize Year ;
drop T_Year ;
if missing( Year ) then T_Year = .;
else T_Year = (Year - 2000.37777777777) * 0.16642398069186;

*** Generate dummy variables for Age_group ;
drop Age_group0_17 Age_group18_24 Age_group25_44 Age_group65_84 Age_group85_ ;
if missing( Age_group ) then do;
   Age_group0_17 = .;
   Age_group18_24 = .;
   Age_group25_44 = .;
   Age_group65_84 = .;
   Age_group85_ = .;
end;
else do;
   length _dm19 $ 19; drop _dm19 ;
   %DMNORMCP( Age_group , _dm19 )
   if _dm19 = '0-17'  then do;
      Age_group0_17 = 0.8806311706765;
      Age_group18_24 = -0.22453699894669;
      Age_group25_44 = -0.22564367901453;
      Age_group65_84 = -0.2156418636321;
      Age_group85_ = -0.22453699894669;
   end;
   else if _dm19 = '25-44'  then do;
      Age_group0_17 = -0.22674934334784;
      Age_group18_24 = -0.22453699894669;
      Age_group25_44 = 0.88494630363511;
      Age_group65_84 = -0.2156418636321;
      Age_group85_ = -0.22453699894669;
   end;
   else if _dm19 = '18-24'  then do;
      Age_group0_17 = -0.22674934334784;
      Age_group18_24 = 0.88930795645817;
      Age_group25_44 = -0.22564367901453;
      Age_group65_84 = -0.2156418636321;
      Age_group85_ = -0.22453699894669;
   end;
   else if _dm19 = '85+'  then do;
      Age_group0_17 = -0.22674934334784;
      Age_group18_24 = -0.22453699894669;
      Age_group25_44 = -0.22564367901453;
      Age_group65_84 = -0.2156418636321;
      Age_group85_ = 0.88930795645817;
   end;
   else if _dm19 = '65-84'  then do;
      Age_group0_17 = -0.22674934334784;
      Age_group18_24 = -0.22453699894669;
      Age_group25_44 = -0.22564367901453;
      Age_group65_84 = 0.92599153206728;
      Age_group85_ = -0.22453699894669;
   end;
   else do;
      Age_group0_17 = .;
      Age_group18_24 = .;
      Age_group25_44 = .;
      Age_group65_84 = .;
      Age_group85_ = .;
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Gender ;
drop GenderAll GenderFemale GenderMale ;
if missing( Gender ) then do;
   GenderAll = .;
   GenderFemale = .;
   GenderMale = .;
end;
else do;
   length _dm6 $ 6; drop _dm6 ;
   _dm6 = put( Gender , $CHAR6. );
   %DMNORMIP( _dm6 )
   if _dm6 = 'ALL'  then do;
      GenderAll = 0.79307595317319;
      GenderFemale = -0.39487878637533;
      GenderMale = -0.40938189953869;
   end;
   else if _dm6 = 'MALE'  then do;
      GenderAll = -0.41963727619358;
      GenderFemale = -0.39487878637533;
      GenderMale = 0.81294320334935;
   end;
   else if _dm6 = 'FEMALE'  then do;
      GenderAll = -0.41963727619358;
      GenderFemale = 0.842800991816;
      GenderMale = -0.40938189953869;
   end;
   else do;
      GenderAll = .;
      GenderFemale = .;
      GenderMale = .;
      _DM_BAD = 1;
   end;
end;

*** End Class Look-up, Standardization, Replacement ;


*** Omitted Cases;
if _dm_bad then do;
   _SEGMENT_ = .; Distance = .;
   goto CLUSvlex ;
end; *** omitted;

*** Compute Distances and Cluster Membership;
label _SEGMENT_ = 'Segment Id' ;
label Distance = 'Distance' ;
array CLUSvads [5] _temporary_;
drop _vqclus _vqmvar _vqnvar;
_vqmvar = 0;
do _vqclus = 1 to 5; CLUSvads [_vqclus] = 0; end;
if not missing( T_Projected_Sum_Pop ) then do;
   CLUSvads [1] + ( T_Projected_Sum_Pop - -1.13864754696814 )**2;
   CLUSvads [2] + ( T_Projected_Sum_Pop - 0.32770877172502 )**2;
   CLUSvads [3] + ( T_Projected_Sum_Pop - -1.13095083877626 )**2;
   CLUSvads [4] + ( T_Projected_Sum_Pop - 1.05965016711499 )**2;
   CLUSvads [5] + ( T_Projected_Sum_Pop - 0.8387666099787 )**2;
end;
else _vqmvar + 1;
if not missing( T_Year ) then do;
   CLUSvads [1] + ( T_Year - 0.79194280104988 )**2;
   CLUSvads [2] + ( T_Year - -0.47316406567662 )**2;
   CLUSvads [3] + ( T_Year - -0.9509205556144 )**2;
   CLUSvads [4] + ( T_Year - -0.85600899137845 )**2;
   CLUSvads [5] + ( T_Year - 0.94074650440685 )**2;
end;
else _vqmvar + 1;
if not missing( Age_group0_17 ) then do;
   CLUSvads [1] + ( Age_group0_17 - -0.22674934334784 )**2;
   CLUSvads [2] + ( Age_group0_17 - 0.8806311706765 )**2;
   CLUSvads [3] + ( Age_group0_17 - -0.22674934334784 )**2;
   CLUSvads [4] + ( Age_group0_17 - -0.22674934334784 )**2;
   CLUSvads [5] + ( Age_group0_17 - -0.0376843775388 )**2;
end;
else _vqmvar + 0.2;
if not missing( Age_group18_24 ) then do;
   CLUSvads [1] + ( Age_group18_24 - 0.32394725939661 )**2;
   CLUSvads [2] + ( Age_group18_24 - -0.22453699894669 )**2;
   CLUSvads [3] + ( Age_group18_24 - 0.34151535543938 )**2;
   CLUSvads [4] + ( Age_group18_24 - -0.22453699894669 )**2;
   CLUSvads [5] + ( Age_group18_24 - -0.22453699894669 )**2;
end;
else _vqmvar + 0.19999999999999;
if not missing( Age_group25_44 ) then do;
   CLUSvads [1] + ( Age_group25_44 - -0.22564367901453 )**2;
   CLUSvads [2] + ( Age_group25_44 - -0.22564367901453 )**2;
   CLUSvads [3] + ( Age_group25_44 - -0.22564367901453 )**2;
   CLUSvads [4] + ( Age_group25_44 - 0.24460613345874 )**2;
   CLUSvads [5] + ( Age_group25_44 - 0.32287942217218 )**2;
end;
else _vqmvar + 0.2;
if not missing( Age_group65_84 ) then do;
   CLUSvads [1] + ( Age_group65_84 - -0.2156418636321 )**2;
   CLUSvads [2] + ( Age_group65_84 - -0.2156418636321 )**2;
   CLUSvads [3] + ( Age_group65_84 - -0.2156418636321 )**2;
   CLUSvads [4] + ( Age_group65_84 - 0.44259721136574 )**2;
   CLUSvads [5] + ( Age_group65_84 - 0.16722299468171 )**2;
end;
else _vqmvar + 0.19999999999999;
if not missing( Age_group85_ ) then do;
   CLUSvads [1] + ( Age_group85_ - 0.34082369811486 )**2;
   CLUSvads [2] + ( Age_group85_ - -0.22453699894669 )**2;
   CLUSvads [3] + ( Age_group85_ - 0.32325560207209 )**2;
   CLUSvads [4] + ( Age_group85_ - -0.22453699894669 )**2;
   CLUSvads [5] + ( Age_group85_ - -0.22453699894669 )**2;
end;
else _vqmvar + 0.19999999999999;
if not missing( GenderAll ) then do;
   CLUSvads [1] + ( GenderAll - 0.03972379553625 )**2;
   CLUSvads [2] + ( GenderAll - -0.07143248756351 )**2;
   CLUSvads [3] + ( GenderAll - -0.03196665369108 )**2;
   CLUSvads [4] + ( GenderAll - 0.00645115574609 )**2;
   CLUSvads [5] + ( GenderAll - 0.03143288838796 )**2;
end;
else _vqmvar + 0.33333333333333;
if not missing( GenderFemale ) then do;
   CLUSvads [1] + ( GenderFemale - 0.04581022555643 )**2;
   CLUSvads [2] + ( GenderFemale - 0.03402014666127 )**2;
   CLUSvads [3] + ( GenderFemale - -0.02966180264674 )**2;
   CLUSvads [4] + ( GenderFemale - -0.01576966512753 )**2;
   CLUSvads [5] + ( GenderFemale - -0.02508421850109 )**2;
end;
else _vqmvar + 0.33333333333333;
if not missing( GenderMale ) then do;
   CLUSvads [1] + ( GenderMale - -0.08528054650019 )**2;
   CLUSvads [2] + ( GenderMale - 0.03840056389554 )**2;
   CLUSvads [3] + ( GenderMale - 0.06151383681981 )**2;
   CLUSvads [4] + ( GenderMale - 0.00907173928784 )**2;
   CLUSvads [5] + ( GenderMale - -0.00690899980726 )**2;
end;
else _vqmvar + 0.33333333333333;
_vqnvar = 4 - _vqmvar;
if _vqnvar <= 4.5474735088646E-12 then do;
   _SEGMENT_ = .; Distance = .;
end;
else do;
   _SEGMENT_ = 1; Distance = CLUSvads [1];
   _vqfzdst = Distance * 0.99999999999988; drop _vqfzdst;
   do _vqclus = 2 to 5;
      if CLUSvads [_vqclus] < _vqfzdst then do;
         _SEGMENT_ = _vqclus; Distance = CLUSvads [_vqclus];
         _vqfzdst = Distance * 0.99999999999988;
      end;
   end;
   Distance = sqrt(Distance * (4 / _vqnvar));
end;
CLUSvlex :;

***************************************;
*** End Scoring Code from PROC DMVQ ***;
***************************************;
*------------------------------------------------------------*;
* Clus: Creating Segment Label;
*------------------------------------------------------------*;
length _SEGMENT_LABEL_ $80;
label _SEGMENT_LABEL_='Segment Description';
if _SEGMENT_ = 1 then _SEGMENT_LABEL_="Cluster1";
else
if _SEGMENT_ = 2 then _SEGMENT_LABEL_="Cluster2";
else
if _SEGMENT_ = 3 then _SEGMENT_LABEL_="Cluster3";
else
if _SEGMENT_ = 4 then _SEGMENT_LABEL_="Cluster4";
else
if _SEGMENT_ = 5 then _SEGMENT_LABEL_="Cluster5";
