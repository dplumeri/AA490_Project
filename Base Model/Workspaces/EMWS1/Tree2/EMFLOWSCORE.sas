****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;
 
******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH F_Age_group  $   19;
LENGTH I_Age_group  $   19;
LENGTH U_Age_group  $   19;
LENGTH _WARN_  $    4;
 
******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_Age_group0_17 = 'Predicted: Age_group=0-17' ;
label P_Age_group18_24 = 'Predicted: Age_group=18-24' ;
label P_Age_group25_44 = 'Predicted: Age_group=25-44' ;
label P_Age_group65_84 = 'Predicted: Age_group=65-84' ;
label P_Age_group85_ = 'Predicted: Age_group=85+' ;
label Q_Age_group0_17 = 'Unadjusted P: Age_group=0-17' ;
label Q_Age_group18_24 = 'Unadjusted P: Age_group=18-24' ;
label Q_Age_group25_44 = 'Unadjusted P: Age_group=25-44' ;
label Q_Age_group65_84 = 'Unadjusted P: Age_group=65-84' ;
label Q_Age_group85_ = 'Unadjusted P: Age_group=85+' ;
label V_Age_group0_17 = 'Validated: Age_group=0-17' ;
label V_Age_group18_24 = 'Validated: Age_group=18-24' ;
label V_Age_group25_44 = 'Validated: Age_group=25-44' ;
label V_Age_group65_84 = 'Validated: Age_group=65-84' ;
label V_Age_group85_ = 'Validated: Age_group=85+' ;
label R_Age_group0_17 = 'Residual: Age_group=0-17' ;
label R_Age_group18_24 = 'Residual: Age_group=18-24' ;
label R_Age_group25_44 = 'Residual: Age_group=25-44' ;
label R_Age_group65_84 = 'Residual: Age_group=65-84' ;
label R_Age_group85_ = 'Residual: Age_group=85+' ;
label F_Age_group = 'From: Age_group' ;
label I_Age_group = 'Into: Age_group' ;
label U_Age_group = 'Unnormalized Into: Age_group' ;
label _WARN_ = 'Warnings' ;
 
 
******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_19 $     19; DROP _ARBFMT_19;
_ARBFMT_19 = ' '; /* Initialize to avoid warning. */
 
 
_ARBFMT_19 = PUT( Age_group , $19.);
 %DMNORMCP( _ARBFMT_19, F_Age_group );
 
******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(Projected_Sum_Pop ) AND
             2194576.5 <= Projected_Sum_Pop  THEN DO;
  _NODE_  =                    3;
  _LEAF_  =                    5;
  P_Age_group0_17  =                    0;
  P_Age_group18_24  =                    0;
  P_Age_group25_44  =                    0;
  P_Age_group65_84  =                    1;
  P_Age_group85_  =                    0;
  Q_Age_group0_17  =                    0;
  Q_Age_group18_24  =                    0;
  Q_Age_group25_44  =                    0;
  Q_Age_group65_84  =                    1;
  Q_Age_group85_  =                    0;
  V_Age_group0_17  =                    0;
  V_Age_group18_24  =                    0;
  V_Age_group25_44  =                    0;
  V_Age_group65_84  =                    1;
  V_Age_group85_  =                    0;
  I_Age_group  = '65-84' ;
  U_Age_group  = '65-84' ;
  END;
ELSE DO;
  IF  NOT MISSING(Projected_Sum_Pop ) AND
               1144855.5 <= Projected_Sum_Pop  THEN DO;
    IF  NOT MISSING(Projected_Sum_Pop ) AND
      Projected_Sum_Pop  <              1780976 THEN DO;
      _NODE_  =                    8;
      _LEAF_  =                    3;
      P_Age_group0_17  =                    1;
      P_Age_group18_24  =                    0;
      P_Age_group25_44  =                    0;
      P_Age_group65_84  =                    0;
      P_Age_group85_  =                    0;
      Q_Age_group0_17  =                    1;
      Q_Age_group18_24  =                    0;
      Q_Age_group25_44  =                    0;
      Q_Age_group65_84  =                    0;
      Q_Age_group85_  =                    0;
      V_Age_group0_17  =                    1;
      V_Age_group18_24  =                    0;
      V_Age_group25_44  =                    0;
      V_Age_group65_84  =                    0;
      V_Age_group85_  =                    0;
      I_Age_group  = '0-17' ;
      U_Age_group  = '0-17' ;
      END;
    ELSE DO;
      _NODE_  =                    9;
      _LEAF_  =                    4;
      P_Age_group0_17  =                    0;
      P_Age_group18_24  =                    0;
      P_Age_group25_44  =                    1;
      P_Age_group65_84  =                    0;
      P_Age_group85_  =                    0;
      Q_Age_group0_17  =                    0;
      Q_Age_group18_24  =                    0;
      Q_Age_group25_44  =                    1;
      Q_Age_group65_84  =                    0;
      Q_Age_group85_  =                    0;
      V_Age_group0_17  =                    0;
      V_Age_group18_24  =                    0;
      V_Age_group25_44  =                    1;
      V_Age_group65_84  =                    0;
      V_Age_group85_  =                    0;
      I_Age_group  = '25-44' ;
      U_Age_group  = '25-44' ;
      END;
    END;
  ELSE DO;
    IF  NOT MISSING(Projected_Sum_Pop ) AND
                  450380.5 <= Projected_Sum_Pop  THEN DO;
      _NODE_  =                    7;
      _LEAF_  =                    2;
      P_Age_group0_17  =                    0;
      P_Age_group18_24  =                    1;
      P_Age_group25_44  =                    0;
      P_Age_group65_84  =                    0;
      P_Age_group85_  =                    0;
      Q_Age_group0_17  =                    0;
      Q_Age_group18_24  =                    1;
      Q_Age_group25_44  =                    0;
      Q_Age_group65_84  =                    0;
      Q_Age_group85_  =                    0;
      V_Age_group0_17  =                    0;
      V_Age_group18_24  =                    1;
      V_Age_group25_44  =                    0;
      V_Age_group65_84  =                    0;
      V_Age_group85_  =                    0;
      I_Age_group  = '18-24' ;
      U_Age_group  = '18-24' ;
      END;
    ELSE DO;
      _NODE_  =                    6;
      _LEAF_  =                    1;
      P_Age_group0_17  =                    0;
      P_Age_group18_24  =                    0;
      P_Age_group25_44  =                    0;
      P_Age_group65_84  =                    0;
      P_Age_group85_  =                    1;
      Q_Age_group0_17  =                    0;
      Q_Age_group18_24  =                    0;
      Q_Age_group25_44  =                    0;
      Q_Age_group65_84  =                    0;
      Q_Age_group85_  =                    1;
      V_Age_group0_17  =                    0;
      V_Age_group18_24  =                    0;
      V_Age_group25_44  =                    0;
      V_Age_group65_84  =                    0;
      V_Age_group85_  =                    1;
      I_Age_group  = '85+' ;
      U_Age_group  = '85+' ;
      END;
    END;
  END;
 
*****  RESIDUALS R_ *************;
IF  F_Age_group  NE '0-17'
AND F_Age_group  NE '18-24'
AND F_Age_group  NE '25-44'
AND F_Age_group  NE '65-84'
AND F_Age_group  NE '85+'  THEN DO;
        R_Age_group0_17  = .;
        R_Age_group18_24  = .;
        R_Age_group25_44  = .;
        R_Age_group65_84  = .;
        R_Age_group85_  = .;
 END;
 ELSE DO;
       R_Age_group0_17  =  -P_Age_group0_17 ;
       R_Age_group18_24  =  -P_Age_group18_24 ;
       R_Age_group25_44  =  -P_Age_group25_44 ;
       R_Age_group65_84  =  -P_Age_group65_84 ;
       R_Age_group85_  =  -P_Age_group85_ ;
       SELECT( F_Age_group  );
          WHEN( '0-17'  ) R_Age_group0_17  = R_Age_group0_17  +1;
          WHEN( '18-24'  ) R_Age_group18_24  = R_Age_group18_24  +1;
          WHEN( '25-44'  ) R_Age_group25_44  = R_Age_group25_44  +1;
          WHEN( '65-84'  ) R_Age_group65_84  = R_Age_group65_84  +1;
          WHEN( '85+'  ) R_Age_group85_  = R_Age_group85_  +1;
       END;
 END;
 
****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
 
drop _LEAF_;
