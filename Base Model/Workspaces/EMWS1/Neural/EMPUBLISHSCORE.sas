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
      I_Age_group  $ 19
      U_Age_group  $ 19
;
      label S_OG_Cases_in_Thousands = 'Standard: OG_Cases_in_Thousands' ;

      label S_Projected_Sum_Pop = 'Standard: Projected_Sum_Pop' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label H15 = 'Hidden: H1=5' ;

      label I_Age_group = 'Into: Age_group' ;

      label U_Age_group = 'Unnormalized Into: Age_group' ;

      label P_Age_group85_ = 'Predicted: Age_group=85+' ;

      label P_Age_group65_84 = 'Predicted: Age_group=65-84' ;

      label P_Age_group25_44 = 'Predicted: Age_group=25-44' ;

      label P_Age_group18_24 = 'Predicted: Age_group=18-24' ;

      label P_Age_group0_17 = 'Predicted: Age_group=0-17' ;

      label  _WARN_ = "Warnings";

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   OG_Cases_in_Thousands ,
   Projected_Sum_Pop   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_OG_Cases_in_Thousands  =    -0.63459664513109 +     0.00004618214454 *
        OG_Cases_in_Thousands ;
   S_Projected_Sum_Pop  =     -1.6917760112809 +   1.2200486734119E-6 *
        Projected_Sum_Pop ;
END;
ELSE DO;
   IF MISSING( OG_Cases_in_Thousands ) THEN S_OG_Cases_in_Thousands  = . ;
   ELSE S_OG_Cases_in_Thousands
          =    -0.63459664513109 +     0.00004618214454 *
        OG_Cases_in_Thousands ;
   IF MISSING( Projected_Sum_Pop ) THEN S_Projected_Sum_Pop  = . ;
   ELSE S_Projected_Sum_Pop  =     -1.6917760112809 +   1.2200486734119E-6 *
        Projected_Sum_Pop ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.76453864537454 * S_OG_Cases_in_Thousands
          +    -4.96385161058997 * S_Projected_Sum_Pop ;
   H12  =      0.3097251533603 * S_OG_Cases_in_Thousands
          +      -0.594616452979 * S_Projected_Sum_Pop ;
   H13  =       1.001352052502 * S_OG_Cases_in_Thousands
          +    -3.81399410249906 * S_Projected_Sum_Pop ;
   H14  =    -2.90241534494368 * S_OG_Cases_in_Thousands
          +      -2.245237780565 * S_Projected_Sum_Pop ;
   H15  =     -0.4057073628923 * S_OG_Cases_in_Thousands
          +    -5.91678440126499 * S_Projected_Sum_Pop ;
   H11  =    -6.02332729328379 + H11 ;
   H12  =     1.67996942875322 + H12 ;
   H13  =    -1.27147330976278 + H13 ;
   H14  =     3.07275869578323 + H14 ;
   H15  =     2.84950159675774 + H15 ;
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
*** Writing the Node Age_group ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_Age_group85_  =     7.43616755483059 * H11  +    -0.60345012237028 * H12
          +     7.09617287325171 * H13  +    -0.55447843924182 * H14
          +     0.25054821943193 * H15 ;
   P_Age_group65_84  =     0.72053872980745 * H11  +    -1.92023706556335 *
        H12  +     0.23893655440879 * H13  +    -6.15899461570346 * H14
          +    -3.19893085845603 * H15 ;
   P_Age_group25_44  =     1.03975079539109 * H11  +    -2.27374219652146 *
        H12  +     0.21418440526117 * H13  +     3.88385039849894 * H14
          +    -7.26411534255337 * H15 ;
   P_Age_group18_24  =     1.11496635314694 * H11  +     0.86659642025819 *
        H12  +     7.17506239611277 * H13  +     0.09076644290866 * H14
          +     0.49837696874627 * H15 ;
   P_Age_group85_  = P_Age_group85_  +     0.04546483780756 *
        S_OG_Cases_in_Thousands  +    -5.22097969305735 * S_Projected_Sum_Pop
         ;
   P_Age_group65_84  = P_Age_group65_84  +     1.74827655859679 *
        S_OG_Cases_in_Thousands  +     3.12017287293122 * S_Projected_Sum_Pop
         ;
   P_Age_group25_44  = P_Age_group25_44  +    -1.54094188978032 *
        S_OG_Cases_in_Thousands  +     3.21868764169841 * S_Projected_Sum_Pop
         ;
   P_Age_group18_24  = P_Age_group18_24  +    -0.72909828664336 *
        S_OG_Cases_in_Thousands  +    -1.19037744543653 * S_Projected_Sum_Pop
         ;
   P_Age_group85_  =    -0.34657015870063 + P_Age_group85_ ;
   P_Age_group65_84  =    -1.16407786251628 + P_Age_group65_84 ;
   P_Age_group25_44  =    -1.57576346659085 + P_Age_group25_44 ;
   P_Age_group18_24  =    -1.23055686466775 + P_Age_group18_24 ;
   P_Age_group0_17  = 0;
   _MAX_ = MAX (P_Age_group85_ , P_Age_group65_84 , P_Age_group25_44 ,
        P_Age_group18_24 , P_Age_group0_17 );
   _SUM_ = 0.;
   P_Age_group85_  = EXP(P_Age_group85_  - _MAX_);
   _SUM_ = _SUM_ + P_Age_group85_ ;
   P_Age_group65_84  = EXP(P_Age_group65_84  - _MAX_);
   _SUM_ = _SUM_ + P_Age_group65_84 ;
   P_Age_group25_44  = EXP(P_Age_group25_44  - _MAX_);
   _SUM_ = _SUM_ + P_Age_group25_44 ;
   P_Age_group18_24  = EXP(P_Age_group18_24  - _MAX_);
   _SUM_ = _SUM_ + P_Age_group18_24 ;
   P_Age_group0_17  = EXP(P_Age_group0_17  - _MAX_);
   _SUM_ = _SUM_ + P_Age_group0_17 ;
   P_Age_group85_  = P_Age_group85_  / _SUM_;
   P_Age_group65_84  = P_Age_group65_84  / _SUM_;
   P_Age_group25_44  = P_Age_group25_44  / _SUM_;
   P_Age_group18_24  = P_Age_group18_24  / _SUM_;
   P_Age_group0_17  = P_Age_group0_17  / _SUM_;
END;
ELSE DO;
   P_Age_group85_  = .;
   P_Age_group65_84  = .;
   P_Age_group25_44  = .;
   P_Age_group18_24  = .;
   P_Age_group0_17  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_Age_group85_  =     0.20454545454545;
   P_Age_group65_84  =     0.20454545454545;
   P_Age_group25_44  =     0.20454545454545;
   P_Age_group18_24  =     0.19047619047619;
   P_Age_group0_17  =     0.19588744588744;
END;
*** *************************;
*** Writing the I_Age_group  AND U_Age_group ;
*** *************************;
_MAXP_ = P_Age_group85_ ;
I_Age_group  = "85+                " ;
U_Age_group  = "85+                " ;
IF( _MAXP_ LT P_Age_group65_84  ) THEN DO;
   _MAXP_ = P_Age_group65_84 ;
   I_Age_group  = "65-84              " ;
   U_Age_group  = "65-84              " ;
END;
IF( _MAXP_ LT P_Age_group25_44  ) THEN DO;
   _MAXP_ = P_Age_group25_44 ;
   I_Age_group  = "25-44              " ;
   U_Age_group  = "25-44              " ;
END;
IF( _MAXP_ LT P_Age_group18_24  ) THEN DO;
   _MAXP_ = P_Age_group18_24 ;
   I_Age_group  = "18-24              " ;
   U_Age_group  = "18-24              " ;
END;
IF( _MAXP_ LT P_Age_group0_17  ) THEN DO;
   _MAXP_ = P_Age_group0_17 ;
   I_Age_group  = "0-17               " ;
   U_Age_group  = "0-17               " ;
END;
********************************;
*** End Scoring Code for Neural;
********************************;
drop
S_OG_Cases_in_Thousands
S_Projected_Sum_Pop
H11
H12
H13
H14
H15
;
