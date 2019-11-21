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
LENGTH _ARBFMT_19 $     19; DROP _ARBFMT_19; 
_ARBFMT_19 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_10 $     10; DROP _ARBFMT_10; 
_ARBFMT_10 = ' '; /* Initialize to avoid warning. */


 DROP _ARB_F_;
 DROP _ARB_BADF_;
     _ARB_F_ = 6872727.8912;
     _ARB_BADF_ = 0;
******             ASSIGN OBSERVATION TO NODE             ******;
 DROP _ARB_P_;
 _ARB_P_ = 0;
 DROP _ARB_PPATH_; _ARB_PPATH_ = 1;

********** LEAF     1  NODE   322 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

   DROP _BRANCH_;
  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -312211.6126;
      END;
    END;
  END;

********** LEAF     2  NODE   323 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
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
       _ARB_F_ + -578904.1022;
      END;
    END;
  END;

********** LEAF     3  NODE   324 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '25 TO 44' ,'45 TO 64' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 626788.38735;
      END;
    END;
  END;

********** LEAF     4  NODE   325 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 319834.35374;
      END;
    END;
  END;

********** LEAF     5  NODE   329 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -264208.9612;
      END;
    END;
  END;

********** LEAF     6  NODE   330 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
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
       _ARB_F_ + -522183.4098;
      END;
    END;
  END;

********** LEAF     7  NODE   331 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2004' ,'2005' ,'2006' ,'2007' ,'2010' ,
      '2013' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 267694.88335;
      END;
    END;
  END;

********** LEAF     8  NODE   332 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2001' ,'2002' ,'2003' ,'2008' ,'2009' ,'2011' ,
      '2012' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2004' ,'2005' ,'2006' ,'2007' ,'2010' ,'2013' ,'2001' ,
        '2002' ,'2003' ,'2008' ,'2009' ,'2011' ,'2012' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 497411.42508;
      END;
    END;
  END;

********** LEAF     9  NODE   336 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -248511.9817;
      END;
    END;
  END;

********** LEAF    10  NODE   337 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
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
       _ARB_F_ + -465556.511;
      END;
    END;
  END;

********** LEAF    11  NODE   338 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '25 TO 44' ,'45 TO 64' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 506091.47323;
      END;
    END;
  END;

********** LEAF    12  NODE   339 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 225221.03549;
      END;
    END;
  END;

********** LEAF    13  NODE   343 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -228234.4116;
      END;
    END;
  END;

********** LEAF    14  NODE   344 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
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
       _ARB_F_ + -425478.5017;
      END;
    END;
  END;

********** LEAF    15  NODE   345 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '25 TO 44' ,'45 TO 64' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 449842.45959;
      END;
    END;
  END;

********** LEAF    16  NODE   346 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 204284.36406;
      END;
    END;
  END;

********** LEAF    17  NODE   350 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -208056.0924;
      END;
    END;
  END;

********** LEAF    18  NODE   351 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
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
       _ARB_F_ + -372918.4314;
      END;
    END;
  END;

********** LEAF    19  NODE   352 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 401957.74288;
      END;
    END;
  END;

********** LEAF    20  NODE   353 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '25 TO 44' ,'45 TO 64' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 136366.80271;
      END;
    END;
  END;

********** LEAF    21  NODE   357 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
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
       _ARB_F_ + -193058.7185;
      END;
    END;
  END;

********** LEAF    22  NODE   358 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -346652.0268;
      END;
    END;
  END;

********** LEAF    23  NODE   359 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
      Population_in_thousands  <           41118.3015 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 1563.1398494;
      END;
    END;
  END;

********** LEAF    24  NODE   360 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
                41118.3015 <= Population_in_thousands  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 273549.85357;
      END;
    END;
  END;

********** LEAF    25  NODE   364 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -176482.7692;
      END;
    END;
  END;

********** LEAF    26  NODE   365 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
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
       _ARB_F_ + -302221.0732;
      END;
    END;
  END;

********** LEAF    27  NODE   366 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '25 TO 44' ,'45 TO 64' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 333760.93678;
      END;
    END;
  END;

********** LEAF    28  NODE   367 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 37405.931248;
      END;
    END;
  END;

********** LEAF    29  NODE   371 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -149269.4113;
      END;
    END;
  END;

********** LEAF    30  NODE   372 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
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
       _ARB_F_ + -277504.9129;
      END;
    END;
  END;

********** LEAF    31  NODE   373 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
      Population_in_thousands  <           41320.8695 THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 85657.677845;
      END;
    END;
  END;

********** LEAF    32  NODE   374 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
                41320.8695 <= Population_in_thousands  THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 317446.47945;
      END;
    END;
  END;

********** LEAF    33  NODE   378 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -157038.9055;
      END;
    END;
  END;

********** LEAF    34  NODE   379 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
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
       _ARB_F_ + -246560.8922;
      END;
    END;
  END;

********** LEAF    35  NODE   380 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2004' ,'2005' ,'2006' ,'2010' ,'2013' ,
      '2001' ,'2002' ,'2003' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2004' ,'2005' ,'2006' ,'2010' ,'2013' ,'2001' ,'2002' ,
        '2003' ,'2007' ,'2008' ,'2009' ,'2011' ,'2012' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 161235.59414;
      END;
    END;
  END;

********** LEAF    36  NODE   381 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2007' ,'2008' ,'2009' ,'2011' ,'2012' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 357709.53664;
      END;
    END;
  END;

********** LEAF    37  NODE   385 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population_in_thousands ) AND 
    Population_in_thousands  <           40523.9185 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
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
       _ARB_F_ + -77822.98735;
      END;
    END;
  END;

********** LEAF    38  NODE   386 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population_in_thousands ) AND 
    Population_in_thousands  <           40523.9185 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -232156.2463;
      END;
    END;
  END;

********** LEAF    39  NODE   387 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population_in_thousands ) AND 
              40523.9185 <= Population_in_thousands  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2007' ,'2013' ,'2001' ,'2003' ,'2012' ) THEN 
        DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 359303.23348;
      END;
    END;
  END;

********** LEAF    40  NODE   388 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population_in_thousands ) AND 
              40523.9185 <= Population_in_thousands  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2004' ,'2005' ,'2006' ,'2010' ,'2002' ,'2008' ,
      '2009' ,'2011' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2007' ,'2013' ,'2001' ,'2003' ,'2012' ,'2004' ,'2005' ,
        '2006' ,'2010' ,'2002' ,'2008' ,'2009' ,'2011' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 142654.31386;
      END;
    END;
  END;

********** LEAF    41  NODE   392 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2005' ,'2010' ,'2008' ,'2011' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -144212.5534;
      END;
    END;
  END;

********** LEAF    42  NODE   393 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2004' ,'2006' ,'2007' ,'2013' ,'2001' ,'2002' ,
      '2003' ,'2009' ,'2012' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2005' ,'2010' ,'2008' ,'2011' ,'2004' ,'2006' ,'2007' ,
        '2013' ,'2001' ,'2002' ,'2003' ,'2009' ,'2012' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -200381.7133;
      END;
    END;
  END;

********** LEAF    43  NODE   394 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '25 TO 44' ,'45 TO 64' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 274662.71817;
      END;
    END;
  END;

********** LEAF    44  NODE   395 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 41574.862604;
      END;
    END;
  END;

********** LEAF    45  NODE   399 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -94469.1326;
      END;
    END;
  END;

********** LEAF    46  NODE   400 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
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
       _ARB_F_ + -187236.7206;
      END;
    END;
  END;

********** LEAF    47  NODE   401 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2004' ,'2005' ,'2007' ,'2002' ,'2003' ,
      '2008' ,'2009' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2004' ,'2005' ,'2007' ,'2002' ,'2003' ,'2008' ,'2009' ,
        '2006' ,'2010' ,'2013' ,'2001' ,'2011' ,'2012' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 226316.26975;
      END;
    END;
  END;

********** LEAF    48  NODE   402 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2006' ,'2010' ,'2013' ,'2001' ,'2011' ,'2012' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 28964.879199;
      END;
    END;
  END;

********** LEAF    49  NODE   406 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -91703.41133;
      END;
    END;
  END;

********** LEAF    50  NODE   407 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
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
       _ARB_F_ + -167299.7087;
      END;
    END;
  END;

********** LEAF    51  NODE   408 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2004' ,'2007' ,'2013' ,'2001' ,'2003' ,
      '2011' ,'2012' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2004' ,'2007' ,'2013' ,'2001' ,'2003' ,'2011' ,'2012' ,
        '2005' ,'2006' ,'2010' ,'2002' ,'2008' ,'2009' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 257463.24105;
      END;
    END;
  END;

********** LEAF    52  NODE   409 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2005' ,'2006' ,'2010' ,'2002' ,'2008' ,'2009' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 27131.224142;
      END;
    END;
  END;

********** LEAF    53  NODE   413 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population_in_thousands ) AND 
    Population_in_thousands  <           41105.5765 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
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
       _ARB_F_ + -146843.737;
      END;
    END;
  END;

********** LEAF    54  NODE   414 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population_in_thousands ) AND 
    Population_in_thousands  <           41105.5765 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -46717.8437;
      END;
    END;
  END;

********** LEAF    55  NODE   415 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population_in_thousands ) AND 
              41105.5765 <= Population_in_thousands  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2005' ,'2013' ,'2001' ,'2002' ,'2011' ) THEN 
        DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2005' ,'2013' ,'2001' ,'2002' ,'2011' ,'2004' ,'2006' ,
        '2007' ,'2010' ,'2003' ,'2008' ,'2009' ,'2012' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 16940.51047;
      END;
    END;
  END;

********** LEAF    56  NODE   416 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population_in_thousands ) AND 
              41105.5765 <= Population_in_thousands  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2004' ,'2006' ,'2007' ,'2010' ,'2003' ,'2008' ,
      '2009' ,'2012' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 285735.24;
      END;
    END;
  END;

********** LEAF    57  NODE   420 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
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
       _ARB_F_ + -80364.69784;
      END;
    END;
  END;

********** LEAF    58  NODE   421 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -134294.6532;
      END;
    END;
  END;

********** LEAF    59  NODE   422 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2004' ,'2006' ,'2007' ,'2010' ,'2002' ,
      '2011' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2004' ,'2006' ,'2007' ,'2010' ,'2002' ,'2011' ,'2005' ,
        '2013' ,'2001' ,'2003' ,'2008' ,'2009' ,'2012' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 41430.511253;
      END;
    END;
  END;

********** LEAF    60  NODE   423 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2005' ,'2013' ,'2001' ,'2003' ,'2008' ,'2009' ,
      '2012' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 227158.11226;
      END;
    END;
  END;

********** LEAF    61  NODE   427 ***************;
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
      IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' ,'45 TO 64' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -91466.80351;
      END;
    END;
  END;

********** LEAF    62  NODE   428 ***************;
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
      IF _ARBFMT_19 IN ('45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 44527.279072;
      END;
    END;
  END;

********** LEAF    63  NODE   426 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 218378.32652;
    END;
  END;

********** LEAF    64  NODE   432 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population_in_thousands ) AND 
    Population_in_thousands  <           41118.3015 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2004' ,'2005' ,'2007' ,'2010' ,'2013' ,
      '2002' ,'2003' ,'2008' ,'2011' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2004' ,'2005' ,'2007' ,'2010' ,'2013' ,'2002' ,'2003' ,
        '2008' ,'2011' ,'2006' ,'2001' ,'2009' ,'2012' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -53564.22704;
      END;
    END;
  END;

********** LEAF    65  NODE   433 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population_in_thousands ) AND 
    Population_in_thousands  <           41118.3015 THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2006' ,'2001' ,'2009' ,'2012' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -152869.5536;
      END;
    END;
  END;

********** LEAF    66  NODE   434 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population_in_thousands ) AND 
              41118.3015 <= Population_in_thousands  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2004' ,'2005' ,'2010' ,'2008' ,'2009' ,'2011' ,
      '2012' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 240898.87435;
      END;
    END;
  END;

********** LEAF    67  NODE   435 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population_in_thousands ) AND 
              41118.3015 <= Population_in_thousands  THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2006' ,'2007' ,'2013' ,'2001' ,'2002' ,'2003' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2004' ,'2005' ,'2010' ,'2008' ,'2009' ,'2011' ,'2012' ,'2006' ,
        '2007' ,'2013' ,'2001' ,'2002' ,'2003' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 8044.3095984;
      END;
    END;
  END;

********** LEAF    68  NODE   439 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2004' ,'2005' ,'2006' ,'2007' ,'2010' ,
      '2013' ,'2011' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2004' ,'2005' ,'2006' ,'2007' ,'2010' ,'2013' ,'2011' ,
        '2001' ,'2002' ,'2003' ,'2008' ,'2009' ,'2012' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -116749.6835;
      END;
    END;
  END;

********** LEAF    69  NODE   440 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2001' ,'2002' ,'2003' ,'2008' ,'2009' ,'2012' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -73884.77498;
      END;
    END;
  END;

********** LEAF    70  NODE   441 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2006' ,'2010' ,'2013' ,'2001' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -72104.85093;
      END;
    END;
  END;

********** LEAF    71  NODE   442 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2004' ,'2005' ,'2007' ,'2002' ,'2003' ,'2008' ,
      '2009' ,'2011' ,'2012' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2006' ,'2010' ,'2013' ,'2001' ,'2004' ,'2005' ,'2007' ,
        '2002' ,'2003' ,'2008' ,'2009' ,'2011' ,'2012' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 124142.63077;
      END;
    END;
  END;

********** LEAF    72  NODE   446 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -60796.98537;
      END;
    END;
  END;

********** LEAF    73  NODE   447 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
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
       _ARB_F_ + -106295.8826;
      END;
    END;
  END;

********** LEAF    74  NODE   448 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2004' ,'2006' ,'2013' ,'2001' ,'2002' ,
      '2003' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2004' ,'2006' ,'2013' ,'2001' ,'2002' ,'2003' ,'2005' ,
        '2007' ,'2010' ,'2008' ,'2009' ,'2011' ,'2012' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 6316.0438229;
      END;
    END;
  END;

********** LEAF    75  NODE   449 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2005' ,'2007' ,'2010' ,'2008' ,'2009' ,'2011' ,
      '2012' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 164425.54517;
      END;
    END;
  END;
P_Sum_Labor_Force_Pop  = _ARB_F_;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

