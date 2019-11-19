****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH I_Age_group  $   19; 
LENGTH U_Age_group  $   19; 
LENGTH _WARN_  $    4; 

******              LABELS FOR NEW VARIABLES              ******;
label P_Age_group0_17 = 'Predicted: Age_group=0-17' ;
      P_Age_group0_17  = 0;
label P_Age_group18_24 = 'Predicted: Age_group=18-24' ;
      P_Age_group18_24  = 0;
label P_Age_group25_44 = 'Predicted: Age_group=25-44' ;
      P_Age_group25_44  = 0;
label P_Age_group65_84 = 'Predicted: Age_group=65-84' ;
      P_Age_group65_84  = 0;
label P_Age_group85_ = 'Predicted: Age_group=85+' ;
      P_Age_group85_  = 0;
label Q_Age_group0_17 = 'Unadjusted P: Age_group=0-17' ;
      Q_Age_group0_17  = 0;
label Q_Age_group18_24 = 'Unadjusted P: Age_group=18-24' ;
      Q_Age_group18_24  = 0;
label Q_Age_group25_44 = 'Unadjusted P: Age_group=25-44' ;
      Q_Age_group25_44  = 0;
label Q_Age_group65_84 = 'Unadjusted P: Age_group=65-84' ;
      Q_Age_group65_84  = 0;
label Q_Age_group85_ = 'Unadjusted P: Age_group=85+' ;
      Q_Age_group85_  = 0;
label I_Age_group = 'Into: Age_group' ;
label U_Age_group = 'Unnormalized Into: Age_group' ;
label _WARN_ = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_19 $     19; DROP _ARBFMT_19; 
_ARBFMT_19 = ' '; /* Initialize to avoid warning. */


ARRAY BOOST_ARB_Y_VEC_[5] _TEMPORARY_ ;
   BOOST_ARB_Y_VEC_[1] = 0;
   BOOST_ARB_Y_VEC_[2] = 0;
   BOOST_ARB_Y_VEC_[3] = 0;
   BOOST_ARB_Y_VEC_[4] = 0;
   BOOST_ARB_Y_VEC_[5] = 0;
ARRAY BOOST_ARB_BADF_VEC_[5] _TEMPORARY_ ;
   BOOST_ARB_BADF_VEC_[1] = 0;
   BOOST_ARB_BADF_VEC_[2] = 0;
   BOOST_ARB_BADF_VEC_[3] = 0;
   BOOST_ARB_BADF_VEC_[4] = 0;
   BOOST_ARB_BADF_VEC_[5] = 0;

******             ASSIGN OBSERVATION TO NODE             ******;
 DROP _ARB_P_;
 _ARB_P_ = 0;
 DROP _ARB_PPATH_; _ARB_PPATH_ = 1;

********** LEAF     1  NODE  2182 ***************;
IF BOOST_ARB_BADF_VEC_[1] EQ 0 THEN DO; 

   DROP _BRANCH_;
  _BRANCH_ = -1;
    IF  NOT MISSING(Projected_Sum_Pop ) AND 
    Projected_Sum_Pop  <              1780976 THEN DO;
     _BRANCH_ =    1; 
    END; 
   IF MISSING(Projected_Sum_Pop ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(OG_Cases_in_Thousands ) THEN DO;
        IF OG_Cases_in_Thousands  <                20145 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Projected_Sum_Pop  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Projected_Sum_Pop ) AND 
      Projected_Sum_Pop  <            1144855.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Projected_Sum_Pop  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
      BOOST_ARB_Y_VEC_[1] + -0.1;
      END;
    END;
  END;

********** LEAF     2  NODE  2183 ***************;
IF BOOST_ARB_BADF_VEC_[1] EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Projected_Sum_Pop ) AND 
    Projected_Sum_Pop  <              1780976 THEN DO;
     _BRANCH_ =    1; 
    END; 
   IF MISSING(Projected_Sum_Pop ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(OG_Cases_in_Thousands ) THEN DO;
        IF OG_Cases_in_Thousands  <                20145 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Projected_Sum_Pop  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Projected_Sum_Pop ) AND 
                 1144855.5 <= Projected_Sum_Pop  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
      BOOST_ARB_Y_VEC_[1] + 0.4;
      END;
    END;
  END;

********** LEAF     3  NODE  2173 ***************;
IF BOOST_ARB_BADF_VEC_[1] EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Projected_Sum_Pop ) AND 
                 1780976 <= Projected_Sum_Pop  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(Projected_Sum_Pop ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(OG_Cases_in_Thousands ) THEN DO;
        IF                20145 <= OG_Cases_in_Thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
    BOOST_ARB_Y_VEC_[1] + -0.1;
    END;
  END;

********** LEAF     4  NODE  2174 ***************;
IF BOOST_ARB_BADF_VEC_[2] EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(OG_Cases_in_Thousands ) AND 
    OG_Cases_in_Thousands  <                 1245 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( OG_Cases_in_Thousands  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;
    BOOST_ARB_Y_VEC_[2] + 0.3788135593;
    END;
  END;

********** LEAF     5  NODE  2175 ***************;
IF BOOST_ARB_BADF_VEC_[2] EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(OG_Cases_in_Thousands ) AND 
                    1245 <= OG_Cases_in_Thousands  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
    BOOST_ARB_Y_VEC_[2] + -0.1;
    END;
  END;

********** LEAF     6  NODE  2176 ***************;
IF BOOST_ARB_BADF_VEC_[3] EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Projected_Sum_Pop ) AND 
    Projected_Sum_Pop  <              1780976 THEN DO;
     _BRANCH_ =    1; 
    END; 
   IF MISSING(Projected_Sum_Pop ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(OG_Cases_in_Thousands ) THEN DO;
        IF OG_Cases_in_Thousands  <                20145 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Projected_Sum_Pop  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;
    BOOST_ARB_Y_VEC_[3] + -0.1;
    END;
  END;

********** LEAF     7  NODE  2184 ***************;
IF BOOST_ARB_BADF_VEC_[3] EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Projected_Sum_Pop ) AND 
                 1780976 <= Projected_Sum_Pop  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(Projected_Sum_Pop ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(OG_Cases_in_Thousands ) THEN DO;
        IF                20145 <= OG_Cases_in_Thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(OG_Cases_in_Thousands ) AND 
      OG_Cases_in_Thousands  <                19365 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(OG_Cases_in_Thousands ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Projected_Sum_Pop ) THEN DO;
          IF Projected_Sum_Pop  <            2194576.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( OG_Cases_in_Thousands  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
      BOOST_ARB_Y_VEC_[3] + 0.4;
      END;
    END;
  END;

********** LEAF     8  NODE  2185 ***************;
IF BOOST_ARB_BADF_VEC_[3] EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Projected_Sum_Pop ) AND 
                 1780976 <= Projected_Sum_Pop  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(Projected_Sum_Pop ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(OG_Cases_in_Thousands ) THEN DO;
        IF                20145 <= OG_Cases_in_Thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(OG_Cases_in_Thousands ) AND 
                     19365 <= OG_Cases_in_Thousands  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(OG_Cases_in_Thousands ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Projected_Sum_Pop ) THEN DO;
          IF            2194576.5 <= Projected_Sum_Pop  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
      BOOST_ARB_Y_VEC_[3] + -0.1;
      END;
    END;
  END;

********** LEAF     9  NODE  2178 ***************;
IF BOOST_ARB_BADF_VEC_[4] EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(OG_Cases_in_Thousands ) AND 
    OG_Cases_in_Thousands  <                20145 THEN DO;
     _BRANCH_ =    1; 
    END; 
   IF MISSING(OG_Cases_in_Thousands ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Projected_Sum_Pop ) THEN DO;
        IF Projected_Sum_Pop  <            2194576.5 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( OG_Cases_in_Thousands  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;
    BOOST_ARB_Y_VEC_[4] + -0.1;
    END;
  END;

********** LEAF    10  NODE  2179 ***************;
IF BOOST_ARB_BADF_VEC_[4] EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(OG_Cases_in_Thousands ) AND 
                   20145 <= OG_Cases_in_Thousands  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(OG_Cases_in_Thousands ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Projected_Sum_Pop ) THEN DO;
        IF            2194576.5 <= Projected_Sum_Pop  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
    BOOST_ARB_Y_VEC_[4] + 0.4;
    END;
  END;

********** LEAF    11  NODE  2180 ***************;
IF BOOST_ARB_BADF_VEC_[5] EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Projected_Sum_Pop ) AND 
    Projected_Sum_Pop  <             450380.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
    BOOST_ARB_Y_VEC_[5] + 0.4;
    END;
  END;

********** LEAF    12  NODE  2181 ***************;
IF BOOST_ARB_BADF_VEC_[5] EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Projected_Sum_Pop ) AND 
                450380.5 <= Projected_Sum_Pop  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Projected_Sum_Pop  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;
    BOOST_ARB_Y_VEC_[5] + -0.1;
    END;
  END;
 DROP _ARB_ONE_;
 DROP _ARB_I_ _ARB_IP_;
 _ARB_P_   = 0;
 _ARB_ONE_ = 0;

*****  CHECK FOR PERFECT PREDICTION ****;
IF BOOST_ARB_BADF_VEC_[1] EQ 0 AND BOOST_ARB_Y_VEC_[1] > 45 THEN _ARB_ONE_ = 
        1;
IF BOOST_ARB_BADF_VEC_[2] EQ 0 AND BOOST_ARB_Y_VEC_[2] > 45 THEN _ARB_ONE_ = 
        2;
IF BOOST_ARB_BADF_VEC_[3] EQ 0 AND BOOST_ARB_Y_VEC_[3] > 45 THEN _ARB_ONE_ = 
        3;
IF BOOST_ARB_BADF_VEC_[4] EQ 0 AND BOOST_ARB_Y_VEC_[4] > 45 THEN _ARB_ONE_ = 
        4;
IF BOOST_ARB_BADF_VEC_[5] EQ 0 AND BOOST_ARB_Y_VEC_[5] > 45 THEN _ARB_ONE_ = 
        5;

*****  COMPUTE POSTERIOR PROBABILITY *************;
IF _ARB_ONE_ NE 0 THEN DO;
  IF _ARB_ONE_ EQ 1 THEN P_Age_group0_17  = 1.0;
  ELSE  P_Age_group0_17  = 0.0;
END;
ELSE IF BOOST_ARB_BADF_VEC_[1] NE 0 OR BOOST_ARB_Y_VEC_[1] < -45 THEN DO;
  P_Age_group0_17  = 0.0;
END;
ELSE DO;
  P_Age_group0_17  = EXP(BOOST_ARB_Y_VEC_[1]);
   _ARB_P_ + P_Age_group0_17 ;
END;

IF _ARB_ONE_ NE 0 THEN DO;
  IF _ARB_ONE_ EQ 2 THEN P_Age_group18_24  = 1.0;
  ELSE  P_Age_group18_24  = 0.0;
END;
ELSE IF BOOST_ARB_BADF_VEC_[2] NE 0 OR BOOST_ARB_Y_VEC_[2] < -45 THEN DO;
  P_Age_group18_24  = 0.0;
END;
ELSE DO;
  P_Age_group18_24  = EXP(BOOST_ARB_Y_VEC_[2]);
   _ARB_P_ + P_Age_group18_24 ;
END;

IF _ARB_ONE_ NE 0 THEN DO;
  IF _ARB_ONE_ EQ 3 THEN P_Age_group25_44  = 1.0;
  ELSE  P_Age_group25_44  = 0.0;
END;
ELSE IF BOOST_ARB_BADF_VEC_[3] NE 0 OR BOOST_ARB_Y_VEC_[3] < -45 THEN DO;
  P_Age_group25_44  = 0.0;
END;
ELSE DO;
  P_Age_group25_44  = EXP(BOOST_ARB_Y_VEC_[3]);
   _ARB_P_ + P_Age_group25_44 ;
END;

IF _ARB_ONE_ NE 0 THEN DO;
  IF _ARB_ONE_ EQ 4 THEN P_Age_group65_84  = 1.0;
  ELSE  P_Age_group65_84  = 0.0;
END;
ELSE IF BOOST_ARB_BADF_VEC_[4] NE 0 OR BOOST_ARB_Y_VEC_[4] < -45 THEN DO;
  P_Age_group65_84  = 0.0;
END;
ELSE DO;
  P_Age_group65_84  = EXP(BOOST_ARB_Y_VEC_[4]);
   _ARB_P_ + P_Age_group65_84 ;
END;

IF _ARB_ONE_ NE 0 THEN DO;
  IF _ARB_ONE_ EQ 5 THEN P_Age_group85_  = 1.0;
  ELSE  P_Age_group85_  = 0.0;
END;
ELSE IF BOOST_ARB_BADF_VEC_[5] NE 0 OR BOOST_ARB_Y_VEC_[5] < -45 THEN DO;
  P_Age_group85_  = 0.0;
END;
ELSE DO;
  P_Age_group85_  = EXP(BOOST_ARB_Y_VEC_[5]);
   _ARB_P_ + P_Age_group85_ ;
END;

IF _ARB_ONE_ EQ 0 THEN DO;
  IF _ARB_P_ > 0 THEN DO;
    _ARB_I_ = 0;
    IF BOOST_ARB_BADF_VEC_[1] EQ 0 THEN P_Age_group0_17  = P_Age_group0_17  / 
        _ARB_P_;
    ELSE DO;
      P_Age_group0_17  = 0.1993637328;
      _ARB_I_ = _ARB_I_ + 1;
    END;
    IF BOOST_ARB_BADF_VEC_[2] EQ 0 THEN P_Age_group18_24  = P_Age_group18_24  
        / _ARB_P_;
    ELSE DO;
      P_Age_group18_24  = 0.1993637328;
      _ARB_I_ = _ARB_I_ + 1;
    END;
    IF BOOST_ARB_BADF_VEC_[3] EQ 0 THEN P_Age_group25_44  = P_Age_group25_44  
        / _ARB_P_;
    ELSE DO;
      P_Age_group25_44  = 0.2004241782;
      _ARB_I_ = _ARB_I_ + 1;
    END;
    IF BOOST_ARB_BADF_VEC_[4] EQ 0 THEN P_Age_group65_84  = P_Age_group65_84  
        / _ARB_P_;
    ELSE DO;
      P_Age_group65_84  = 0.2004241782;
      _ARB_I_ = _ARB_I_ + 1;
    END;
    IF BOOST_ARB_BADF_VEC_[5] EQ 0 THEN P_Age_group85_  = P_Age_group85_  / 
        _ARB_P_;
    ELSE DO;
      P_Age_group85_  = 0.2004241782;
      _ARB_I_ = _ARB_I_ + 1;
    END;
    IF _ARB_I_ > 0 THEN DO;
       _ARB_P_   = 0;
       _ARB_P_ + P_Age_group0_17 ;
       _ARB_P_ + P_Age_group18_24 ;
       _ARB_P_ + P_Age_group25_44 ;
       _ARB_P_ + P_Age_group65_84 ;
       _ARB_P_ + P_Age_group85_ ;
      P_Age_group0_17  = P_Age_group0_17  / _ARB_P_;
      P_Age_group18_24  = P_Age_group18_24  / _ARB_P_;
      P_Age_group25_44  = P_Age_group25_44  / _ARB_P_;
      P_Age_group65_84  = P_Age_group65_84  / _ARB_P_;
      P_Age_group85_  = P_Age_group85_  / _ARB_P_;
    END;
  END;
  ELSE DO;
    P_Age_group0_17  = 0.1993637328;
    P_Age_group18_24  = 0.1993637328;
    P_Age_group25_44  = 0.2004241782;
    P_Age_group65_84  = 0.2004241782;
    P_Age_group85_  = 0.2004241782;
  END;
END;
*****  CREATE Q_: POSTERIORS WITHOUT PRIORS ****;
Q_Age_group0_17  = P_Age_group0_17 ;
Q_Age_group18_24  = P_Age_group18_24 ;
Q_Age_group25_44  = P_Age_group25_44 ;
Q_Age_group65_84  = P_Age_group65_84 ;
Q_Age_group85_  = P_Age_group85_ ;

*****  I_ AND U_ VARIABLES *******************;
 _ARB_IP_ = -1.0;
 IF _ARB_IP_ + 1.0/32768.0 < P_Age_group0_17 THEN DO;
   _ARB_IP_ = P_Age_group0_17 ;
   _ARB_I_  = 1;
   END;
 IF _ARB_IP_ + 1.0/32768.0 < P_Age_group18_24 THEN DO;
   _ARB_IP_ = P_Age_group18_24 ;
   _ARB_I_  = 2;
   END;
 IF _ARB_IP_ + 1.0/32768.0 < P_Age_group25_44 THEN DO;
   _ARB_IP_ = P_Age_group25_44 ;
   _ARB_I_  = 3;
   END;
 IF _ARB_IP_ + 1.0/32768.0 < P_Age_group65_84 THEN DO;
   _ARB_IP_ = P_Age_group65_84 ;
   _ARB_I_  = 4;
   END;
 IF _ARB_IP_ + 1.0/32768.0 < P_Age_group85_ THEN DO;
   _ARB_IP_ = P_Age_group85_ ;
   _ARB_I_  = 5;
   END;
 SELECT( _ARB_I_);
  WHEN( 1) DO;
    I_Age_group  = '0-17' ;
    U_Age_group  = '0-17' ;
     END;
  WHEN( 2) DO;
    I_Age_group  = '18-24' ;
    U_Age_group  = '18-24' ;
     END;
  WHEN( 3) DO;
    I_Age_group  = '25-44' ;
    U_Age_group  = '25-44' ;
     END;
  WHEN( 4) DO;
    I_Age_group  = '65-84' ;
    U_Age_group  = '65-84' ;
     END;
  WHEN( 5) DO;
    I_Age_group  = '85+' ;
    U_Age_group  = '85+' ;
     END;
   END;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

