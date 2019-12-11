****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH _WARN_  $    4; 

******              LABELS FOR NEW VARIABLES              ******;
label P_Sum_Labor_Force_Pop = 'Predicted: Sum_Labor_Force_Pop' ;
      P_Sum_Labor_Force_Pop  = 0;
label _WARN_ = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_111 $    111; DROP _ARBFMT_111; 
_ARBFMT_111 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_19 $     19; DROP _ARBFMT_19; 
_ARBFMT_19 = ' '; /* Initialize to avoid warning. */


 DROP _ARB_F_;
 DROP _ARB_BADF_;
     _ARB_F_ = 6470696.4286;
     _ARB_BADF_ = 0;
******             ASSIGN OBSERVATION TO NODE             ******;
 DROP _ARB_P_;
 _ARB_P_ = 0;
 DROP _ARB_PPATH_; _ARB_PPATH_ = 1;

********** LEAF     1  NODE   302 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

   DROP _BRANCH_;
  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             54607302 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -221334.3487;
      END;
    END;
  END;

********** LEAF     2  NODE   303 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             54607302 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -526922.2744;
      END;
    END;
  END;

********** LEAF     3  NODE   304 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                54607302 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
        'SERVICE OCCUPATIONS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 604986.60714;
      END;
    END;
  END;

********** LEAF     4  NODE   305 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                54607302 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 156843.69048;
      END;
    END;
  END;

********** LEAF     5  NODE   309 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           63459801.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -218097.9668;
      END;
    END;
  END;

********** LEAF     6  NODE   310 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           63459801.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -477113.1297;
      END;
    END;
  END;

********** LEAF     7  NODE   311 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
              63459801.5 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
        'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 914422.60552;
      END;
    END;
  END;

********** LEAF     8  NODE   312 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
              63459801.5 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 78415.129762;
      END;
    END;
  END;

********** LEAF     9  NODE   316 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             54607302 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -195382.6613;
      END;
    END;
  END;

********** LEAF    10  NODE   317 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             54607302 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -433626.1024;
      END;
    END;
  END;

********** LEAF    11  NODE   318 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                54607302 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
        'NATURAL RESOURCES, CONSTRUCTION,' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 721292.44373;
      END;
    END;
  END;

********** LEAF    12  NODE   319 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                54607302 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -23533.02749;
      END;
    END;
  END;

********** LEAF    13  NODE   323 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           63459801.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '65+' ,'16 TO 24' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -379717.9002;
      END;
    END;
  END;

********** LEAF    14  NODE   324 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           63459801.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -155475.6452;
      END;
    END;
  END;

********** LEAF    15  NODE   325 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
              63459801.5 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
        'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 713953.04865;
      END;
    END;
  END;

********** LEAF    16  NODE   326 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
              63459801.5 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 28041.970048;
      END;
    END;
  END;

********** LEAF    17  NODE   330 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           67762212.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
      'SERVICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -124412.4402;
      END;
    END;
  END;

********** LEAF    18  NODE   331 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           67762212.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'NATURAL RESOURCES, CONSTRUCTION,' ,'MANAGEMENT, PROFESSIONAL, AND RE' )
       THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'SERVICE OCCUPATIONS' ,
        'PRODUCTION, TRANSPORTATION, AND' ,
        'NATURAL RESOURCES, CONSTRUCTION,' ,
        'MANAGEMENT, PROFESSIONAL, AND RE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -317997.2199;
      END;
    END;
  END;

********** LEAF    19  NODE   332 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
              67762212.5 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
      'SERVICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'SERVICE OCCUPATIONS' ,
        'PRODUCTION, TRANSPORTATION, AND' ,
        'NATURAL RESOURCES, CONSTRUCTION,' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 535620.26901;
      END;
    END;
  END;

********** LEAF    20  NODE   333 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
              67762212.5 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 2730.959335;
      END;
    END;
  END;

********** LEAF    21  NODE   337 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             54607302 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -167684.2499;
      END;
    END;
  END;

********** LEAF    22  NODE   338 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             54607302 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -322062.9391;
      END;
    END;
  END;

********** LEAF    23  NODE   339 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                54607302 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
        'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 526508.77063;
      END;
    END;
  END;

********** LEAF    24  NODE   340 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                54607302 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 16990.641809;
      END;
    END;
  END;

********** LEAF    25  NODE   344 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             81989046 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'45 TO 64' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'45 TO 64' ,'65+' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -101124.7745;
      END;
    END;
  END;

********** LEAF    26  NODE   345 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             81989046 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -289795.7731;
      END;
    END;
  END;

********** LEAF    27  NODE   343 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                81989046 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 261651.79711;
    END;
  END;

********** LEAF    28  NODE   349 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           63459801.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -111631.2596;
      END;
    END;
  END;

********** LEAF    29  NODE   350 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           63459801.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -279040.6498;
      END;
    END;
  END;

********** LEAF    30  NODE   351 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
              63459801.5 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
        'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 521833.87149;
      END;
    END;
  END;

********** LEAF    31  NODE   352 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
              63459801.5 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 16586.951557;
      END;
    END;
  END;

********** LEAF    32  NODE   356 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             64561783 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
      'SERVICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'SERVICE OCCUPATIONS' ,
        'MANAGEMENT, PROFESSIONAL, AND RE' ,
        'PRODUCTION, TRANSPORTATION, AND' ,
        'NATURAL RESOURCES, CONSTRUCTION,' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -128524.7036;
      END;
    END;
  END;

********** LEAF    33  NODE   357 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             64561783 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -292008.2911;
      END;
    END;
  END;

********** LEAF    34  NODE   358 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                64561783 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
        'SERVICE OCCUPATIONS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 273015.53996;
      END;
    END;
  END;

********** LEAF    35  NODE   359 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                64561783 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 75887.903025;
      END;
    END;
  END;

********** LEAF    36  NODE   363 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             81989046 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'45 TO 64' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'45 TO 64' ,'65+' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -64518.48617;
      END;
    END;
  END;

********** LEAF    37  NODE   364 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             81989046 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -217566.3811;
      END;
    END;
  END;

********** LEAF    38  NODE   362 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                81989046 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 226213.40367;
    END;
  END;

********** LEAF    39  NODE   368 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             54607302 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -64993.64778;
      END;
    END;
  END;

********** LEAF    40  NODE   369 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             54607302 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -187930.0848;
      END;
    END;
  END;

********** LEAF    41  NODE   370 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                54607302 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
        'SERVICE OCCUPATIONS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 241700.36018;
      END;
    END;
  END;

********** LEAF    42  NODE   371 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                54607302 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 21195.448836;
      END;
    END;
  END;

********** LEAF    43  NODE   375 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           63459801.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
      'SERVICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'SERVICE OCCUPATIONS' ,
        'MANAGEMENT, PROFESSIONAL, AND RE' ,
        'PRODUCTION, TRANSPORTATION, AND' ,
        'NATURAL RESOURCES, CONSTRUCTION,' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -64742.92658;
      END;
    END;
  END;

********** LEAF    44  NODE   376 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           63459801.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -232403.9883;
      END;
    END;
  END;

********** LEAF    45  NODE   377 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
              63459801.5 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'PRODUCTION, TRANSPORTATION, AND' ,
        'NATURAL RESOURCES, CONSTRUCTION,' ,'SERVICE OCCUPATIONS' ,
        'MANAGEMENT, PROFESSIONAL, AND RE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -14020.25593;
      END;
    END;
  END;

********** LEAF    46  NODE   378 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
              63459801.5 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SERVICE OCCUPATIONS' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 448251.4314;
      END;
    END;
  END;

********** LEAF    47  NODE   382 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 118275.72716;
      END;
    END;
  END;

********** LEAF    48  NODE   383 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
        'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -78906.8788;
      END;
    END;
  END;

********** LEAF    49  NODE   381 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 408452.48294;
    END;
  END;

********** LEAF    50  NODE   387 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             54607302 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -64832.50449;
      END;
    END;
  END;

********** LEAF    51  NODE   388 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             54607302 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -175748.6452;
      END;
    END;
  END;

********** LEAF    52  NODE   389 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                54607302 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 443291.84035;
      END;
    END;
  END;

********** LEAF    53  NODE   390 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                54607302 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ,
        'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
        'NATURAL RESOURCES, CONSTRUCTION,' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -8381.959821;
      END;
    END;
  END;

********** LEAF    54  NODE   394 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             56775970 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
      'SERVICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'SERVICE OCCUPATIONS' ,
        'PRODUCTION, TRANSPORTATION, AND' ,
        'NATURAL RESOURCES, CONSTRUCTION,' ,
        'MANAGEMENT, PROFESSIONAL, AND RE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -67950.7777;
      END;
    END;
  END;

********** LEAF    55  NODE   395 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             56775970 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'NATURAL RESOURCES, CONSTRUCTION,' ,'MANAGEMENT, PROFESSIONAL, AND RE' )
       THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -189383.3274;
      END;
    END;
  END;

********** LEAF    56  NODE   396 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                56775970 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('45 TO 64' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '45 TO 64' ,'25 TO 44' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 6283.537468;
      END;
    END;
  END;

********** LEAF    57  NODE   397 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                56775970 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 90667.692058;
      END;
    END;
  END;

********** LEAF    58  NODE   401 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           82206173.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
      Population  <             54607302 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -99312.75766;
      END;
    END;
  END;

********** LEAF    59  NODE   402 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           82206173.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
                  54607302 <= Population  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 32842.263724;
      END;
    END;
  END;

********** LEAF    60  NODE   400 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
              82206173.5 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 288034.67862;
    END;
  END;

********** LEAF    61  NODE   406 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             81989046 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
      'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
        'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
        'MANAGEMENT, PROFESSIONAL, AND RE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -21145.44501;
      END;
    END;
  END;

********** LEAF    62  NODE   407 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             81989046 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -164769.746;
      END;
    END;
  END;

********** LEAF    63  NODE   408 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                81989046 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SERVICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SERVICE OCCUPATIONS' ,'SALES AND OFFICE OCCUPATIONS' ,
        'PRODUCTION, TRANSPORTATION, AND' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 139996.41611;
      END;
    END;
  END;

********** LEAF    64  NODE   409 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                81989046 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
      'PRODUCTION, TRANSPORTATION, AND' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 81483.174075;
      END;
    END;
  END;

********** LEAF    65  NODE   413 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
      Population  <             54607302 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -47907.898;
      END;
    END;
  END;

********** LEAF    66  NODE   414 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
                  54607302 <= Population  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 375739.04119;
      END;
    END;
  END;

********** LEAF    67  NODE   415 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
    'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ,
      'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
        'NATURAL RESOURCES, CONSTRUCTION,' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -61054.81196;
      END;
    END;
  END;

********** LEAF    68  NODE   416 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
    'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ,
      'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_111 IN ('NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -187512.2202;
      END;
    END;
  END;

********** LEAF    69  NODE   420 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,'SERVICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'SERVICE OCCUPATIONS' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
      Population  <           67762212.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -31585.8936;
      END;
    END;
  END;

********** LEAF    70  NODE   421 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,'SERVICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'SERVICE OCCUPATIONS' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
                67762212.5 <= Population  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 129928.03826;
      END;
    END;
  END;

********** LEAF    71  NODE   422 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
      Population  <           74176836.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -149162.3615;
      END;
    END;
  END;

********** LEAF    72  NODE   423 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
                74176836.5 <= Population  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -43241.17363;
      END;
    END;
  END;

********** LEAF    73  NODE   427 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
      Population  <             53828236 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -4392.741115;
      END;
    END;
  END;

********** LEAF    74  NODE   428 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
                  53828236 <= Population  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 192720.87109;
      END;
    END;
  END;

********** LEAF    75  NODE   429 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
    'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ,
      'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'25 TO 44' ,'65+' ,'45 TO 64' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 3823.3385144;
      END;
    END;
  END;

********** LEAF    76  NODE   430 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
    'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ,
      'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ,'45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -107539.4426;
      END;
    END;
  END;

********** LEAF    77  NODE   434 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'45 TO 64' ,'25 TO 44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'45 TO 64' ,'25 TO 44' ,'65+' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 85405.270947;
      END;
    END;
  END;

********** LEAF    78  NODE   435 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -105925.9903;
      END;
    END;
  END;

********** LEAF    79  NODE   433 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -157032.8808;
    END;
  END;

********** LEAF    80  NODE   439 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           82206173.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
      Population  <           63459801.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -101015.1602;
      END;
    END;
  END;

********** LEAF    81  NODE   440 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           82206173.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
                63459801.5 <= Population  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 4425.9756233;
      END;
    END;
  END;

********** LEAF    82  NODE   438 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
              82206173.5 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 156405.70007;
    END;
  END;

********** LEAF    83  NODE   444 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
      'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
        'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -19231.22493;
      END;
    END;
  END;

********** LEAF    84  NODE   445 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_111 IN ('NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -136120.5193;
      END;
    END;
  END;

********** LEAF    85  NODE   443 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 114449.60262;
    END;
  END;

********** LEAF    86  NODE   449 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'45 TO 64' ,'25 TO 44' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -10471.27662;
      END;
    END;
  END;

********** LEAF    87  NODE   450 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('45 TO 64' ,'25 TO 44' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 177066.32489;
      END;
    END;
  END;

********** LEAF    88  NODE   451 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
    'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ,
      'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
        'NATURAL RESOURCES, CONSTRUCTION,' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -19097.208;
      END;
    END;
  END;

********** LEAF    89  NODE   452 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
    'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ,
      'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_111 IN ('NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -134937.7646;
      END;
    END;
  END;

********** LEAF    90  NODE   456 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,'SERVICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'SERVICE OCCUPATIONS' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'45 TO 64' ,'25 TO 44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'45 TO 64' ,'25 TO 44' ,'65+' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 51831.279211;
      END;
    END;
  END;

********** LEAF    91  NODE   457 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,'SERVICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'SERVICE OCCUPATIONS' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -84756.3956;
      END;
    END;
  END;

********** LEAF    92  NODE   458 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -53436.48674;
      END;
    END;
  END;

********** LEAF    93  NODE   459 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_111 IN ('NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_111 NOTIN (
        'PRODUCTION, TRANSPORTATION, AND' ,
        'NATURAL RESOURCES, CONSTRUCTION,' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -122871.3104;
      END;
    END;
  END;

********** LEAF    94  NODE   463 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -900.6663264;
      END;
    END;
  END;

********** LEAF    95  NODE   464 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ,'45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'25 TO 44' ,'65+' ,'45 TO 64' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -77032.79538;
      END;
    END;
  END;

********** LEAF    96  NODE   462 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 279189.98459;
    END;
  END;

********** LEAF    97  NODE   468 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 41957.145416;
      END;
    END;
  END;

********** LEAF    98  NODE   469 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ,'45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'25 TO 44' ,'65+' ,'45 TO 64' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -65417.98254;
      END;
    END;
  END;

********** LEAF    99  NODE   467 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 128242.49519;
    END;
  END;

********** LEAF   100  NODE   473 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
      Population  <           38213264.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -91937.10443;
      END;
    END;
  END;

********** LEAF   101  NODE   474 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
                38213264.5 <= Population  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -13630.75009;
      END;
    END;
  END;

********** LEAF   102  NODE   472 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 156059.94187;
    END;
  END;

********** LEAF   103  NODE   478 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'45 TO 64' ,'25 TO 44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'45 TO 64' ,'25 TO 44' ,'65+' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 39721.471792;
      END;
    END;
  END;

********** LEAF   104  NODE   479 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -74466.8366;
      END;
    END;
  END;

********** LEAF   105  NODE   477 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -120737.8684;
    END;
  END;

********** LEAF   106  NODE   483 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             82807872 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
      Population  <             38926915 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -71223.66425;
      END;
    END;
  END;

********** LEAF   107  NODE   484 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             82807872 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
                  38926915 <= Population  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 510.6291821;
      END;
    END;
  END;

********** LEAF   108  NODE   482 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                82807872 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 150470.09309;
    END;
  END;

********** LEAF   109  NODE   488 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           82206173.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
      'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
        'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
        'MANAGEMENT, PROFESSIONAL, AND RE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 620.48121836;
      END;
    END;
  END;

********** LEAF   110  NODE   489 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           82206173.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -92270.11455;
      END;
    END;
  END;

********** LEAF   111  NODE   487 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
              82206173.5 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 165620.25535;
    END;
  END;

********** LEAF   112  NODE   493 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
      Population  <           40186450.5 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -2475.863226;
      END;
    END;
  END;

********** LEAF   113  NODE   494 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
                40186450.5 <= Population  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -53954.36416;
      END;
    END;
  END;

********** LEAF   114  NODE   492 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 194239.17989;
    END;
  END;

********** LEAF   115  NODE   496 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 86008.660456;
    END;
  END;

********** LEAF   116  NODE   498 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
    'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ,
      'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
      Population  <             80197204 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -32585.72375;
      END;
    END;
  END;

********** LEAF   117  NODE   499 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
    'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ,
      'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
                  80197204 <= Population  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -99082.16443;
      END;
    END;
  END;

********** LEAF   118  NODE   503 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '65+' ,'16 TO 24' ,'45 TO 64' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 85832.530235;
      END;
    END;
  END;

********** LEAF   119  NODE   504 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 95831.33213;
      END;
    END;
  END;

********** LEAF   120  NODE   505 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
    'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ,
      'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 4020.6234544;
      END;
    END;
  END;

********** LEAF   121  NODE   506 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
    'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ,
      'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ,'45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'25 TO 44' ,'65+' ,'45 TO 64' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -69677.25414;
      END;
    END;
  END;

********** LEAF   122  NODE   510 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
      Population  <           67762212.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -12744.53618;
      END;
    END;
  END;

********** LEAF   123  NODE   511 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
                67762212.5 <= Population  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 172915.47703;
      END;
    END;
  END;

********** LEAF   124  NODE   512 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
    'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ,
      'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -16036.77034;
      END;
    END;
  END;

********** LEAF   125  NODE   513 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
    'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ,
      'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_111 IN ('SERVICE OCCUPATIONS' ,
      'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_111 NOTIN (
        'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
        'NATURAL RESOURCES, CONSTRUCTION,' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -64193.65175;
      END;
    END;
  END;

********** LEAF   126  NODE   517 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
      Population  <           63459801.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -37563.21768;
      END;
    END;
  END;

********** LEAF   127  NODE   518 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
                63459801.5 <= Population  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 98566.302536;
      END;
    END;
  END;

********** LEAF   128  NODE   516 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -105340.1501;
    END;
  END;

********** LEAF   129  NODE   522 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'SERVICE OCCUPATIONS' ,
      'NATURAL RESOURCES, CONSTRUCTION,' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
      Population  <             66681637 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 14861.091552;
      END;
    END;
  END;

********** LEAF   130  NODE   523 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'SERVICE OCCUPATIONS' ,
      'NATURAL RESOURCES, CONSTRUCTION,' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
                  66681637 <= Population  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -82744.05405;
      END;
    END;
  END;

********** LEAF   131  NODE   521 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 85229.340309;
    END;
  END;

********** LEAF   132  NODE   527 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 89444.513424;
      END;
    END;
  END;

********** LEAF   133  NODE   528 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ,'45 TO 64' ,'25 TO 44' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -42093.53369;
      END;
    END;
  END;

********** LEAF   134  NODE   526 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 133534.60775;
    END;
  END;

********** LEAF   135  NODE   532 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -4155.372777;
      END;
    END;
  END;

********** LEAF   136  NODE   533 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ,'45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'25 TO 44' ,'65+' ,'45 TO 64' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -51056.5925;
      END;
    END;
  END;

********** LEAF   137  NODE   531 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 107234.425;
    END;
  END;

********** LEAF   138  NODE   537 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           82206173.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'SERVICE OCCUPATIONS' ,
        'NATURAL RESOURCES, CONSTRUCTION,' ,
        'PRODUCTION, TRANSPORTATION, AND' ,
        'MANAGEMENT, PROFESSIONAL, AND RE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 4543.3343315;
      END;
    END;
  END;

********** LEAF   139  NODE   538 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           82206173.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -118126.7721;
      END;
    END;
  END;

********** LEAF   140  NODE   536 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
              82206173.5 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 72167.604563;
    END;
  END;

********** LEAF   141  NODE   542 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
      Population  <           82848628.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -669.1845337;
      END;
    END;
  END;

********** LEAF   142  NODE   543 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
                82848628.5 <= Population  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -99527.93011;
      END;
    END;
  END;

********** LEAF   143  NODE   541 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 75414.849201;
    END;
  END;

********** LEAF   144  NODE   545 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             38926915 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -76839.42677;
    END;
  END;

********** LEAF   145  NODE   547 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                38926915 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
        'SALES AND OFFICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 39725.796745;
      END;
    END;
  END;

********** LEAF   146  NODE   548 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                38926915 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
      'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -45460.95633;
      END;
    END;
  END;

********** LEAF   147  NODE   552 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
      'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
      'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
        'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
        'MANAGEMENT, PROFESSIONAL, AND RE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -29139.15609;
      END;
    END;
  END;

********** LEAF   148  NODE   553 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -105155.5176;
      END;
    END;
  END;

********** LEAF   149  NODE   551 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 32132.861487;
    END;
  END;

********** LEAF   150  NODE   557 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           82206173.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
      'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
        'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
        'MANAGEMENT, PROFESSIONAL, AND RE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 13258.995162;
      END;
    END;
  END;

********** LEAF   151  NODE   558 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           82206173.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -94815.94112;
      END;
    END;
  END;

********** LEAF   152  NODE   556 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
              82206173.5 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 98410.450338;
    END;
  END;

********** LEAF   153  NODE   562 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           74176836.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'SERVICE OCCUPATIONS' ,
        'NATURAL RESOURCES, CONSTRUCTION,' ,
        'PRODUCTION, TRANSPORTATION, AND' ,
        'MANAGEMENT, PROFESSIONAL, AND RE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 16576.746434;
      END;
    END;
  END;

********** LEAF   154  NODE   563 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           74176836.5 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -115292.6679;
      END;
    END;
  END;

********** LEAF   155  NODE   564 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
              74176836.5 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
        'SERVICE OCCUPATIONS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 61853.398253;
      END;
    END;
  END;

********** LEAF   156  NODE   565 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
              74176836.5 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 6749.372719;
      END;
    END;
  END;

********** LEAF   157  NODE   569 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 72554.385946;
      END;
    END;
  END;

********** LEAF   158  NODE   570 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ,'45 TO 64' ,'25 TO 44' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -33846.66861;
      END;
    END;
  END;

********** LEAF   159  NODE   568 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 120093.55199;
    END;
  END;

********** LEAF   160  NODE   574 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           39867055.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'MANAGEMENT, PROFESSIONAL, AND RE' ,'SALES AND OFFICE OCCUPATIONS' ,
        'SERVICE OCCUPATIONS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -127733.754;
      END;
    END;
  END;

********** LEAF   161  NODE   575 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <           39867055.5 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
      'SERVICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 55162.766119;
      END;
    END;
  END;

********** LEAF   162  NODE   576 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
              39867055.5 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'SERVICE OCCUPATIONS' ,
        'NATURAL RESOURCES, CONSTRUCTION,' ,
        'PRODUCTION, TRANSPORTATION, AND' ,
        'MANAGEMENT, PROFESSIONAL, AND RE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -54789.10683;
      END;
    END;
  END;

********** LEAF   163  NODE   577 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
              39867055.5 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 191587.59083;
      END;
    END;
  END;

********** LEAF   164  NODE   581 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             42601197 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
      'SERVICE OCCUPATIONS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'SALES AND OFFICE OCCUPATIONS' ,'SERVICE OCCUPATIONS' ,
        'PRODUCTION, TRANSPORTATION, AND' ,
        'MANAGEMENT, PROFESSIONAL, AND RE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 38955.752027;
      END;
    END;
  END;

********** LEAF   165  NODE   582 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
    Population  <             42601197 THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -135124.5118;
      END;
    END;
  END;

********** LEAF   166  NODE   583 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                42601197 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Industry  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_111 NOTIN (
        'PRODUCTION, TRANSPORTATION, AND' ,'SALES AND OFFICE OCCUPATIONS' ,
        'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 204572.78142;
      END;
    END;
  END;

********** LEAF   167  NODE   584 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population ) AND 
                42601197 <= Population  THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_111 = PUT( Industry , $CHAR111.);
     %DMNORMIP( _ARBFMT_111);
      IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -37878.43769;
      END;
    END;
  END;

********** LEAF   168  NODE   588 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
      Population  <             81989046 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 6318.9762503;
      END;
    END;
  END;

********** LEAF   169  NODE   589 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
    'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'PRODUCTION, TRANSPORTATION, AND' ,
      'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ,
      'MANAGEMENT, PROFESSIONAL, AND RE' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
                  81989046 <= Population  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -76563.70378;
      END;
    END;
  END;

********** LEAF   170  NODE   587 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 126925.91113;
    END;
  END;

********** LEAF   171  NODE   593 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
      Population  <             52485458 THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -46590.37173;
      END;
    END;
  END;

********** LEAF   172  NODE   594 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('SALES AND OFFICE OCCUPATIONS' ,
    'MANAGEMENT, PROFESSIONAL, AND RE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
                  52485458 <= Population  THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 233506.36169;
      END;
    END;
  END;

********** LEAF   173  NODE   595 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
    'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ,
      'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
      Population  <             38877177 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 8473.0934286;
      END;
    END;
  END;

********** LEAF   174  NODE   596 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_111 = PUT( Industry , $CHAR111.);
   %DMNORMIP( _ARBFMT_111);
    IF _ARBFMT_111 IN ('PRODUCTION, TRANSPORTATION, AND' ,
    'SERVICE OCCUPATIONS' ,'NATURAL RESOURCES, CONSTRUCTION,' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Industry  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_111 NOTIN (
      'SALES AND OFFICE OCCUPATIONS' ,'MANAGEMENT, PROFESSIONAL, AND RE' ,
      'PRODUCTION, TRANSPORTATION, AND' ,'SERVICE OCCUPATIONS' ,
      'NATURAL RESOURCES, CONSTRUCTION,' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population ) AND 
                  38877177 <= Population  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -33036.34845;
      END;
    END;
  END;
P_Sum_Labor_Force_Pop  = _ARB_F_;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

