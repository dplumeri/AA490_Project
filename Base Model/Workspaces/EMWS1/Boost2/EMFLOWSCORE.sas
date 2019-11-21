****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH _WARN_  $    4; 

******              LABELS FOR NEW VARIABLES              ******;
label P_Sum_Labor_Force_Pop = 'Predicted: Sum_Labor_Force_Pop' ;
      P_Sum_Labor_Force_Pop  = 0;
label R_Sum_Labor_Force_Pop = 'Residual: Sum_Labor_Force_Pop' ;
label _WARN_ = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_19 $     19; DROP _ARBFMT_19; 
_ARBFMT_19 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_10 $     10; DROP _ARBFMT_10; 
_ARBFMT_10 = ' '; /* Initialize to avoid warning. */


 DROP _ARB_F_;
 DROP _ARB_BADF_;
     _ARB_F_ = 6927309.5238;
     _ARB_BADF_ = 0;
******             ASSIGN OBSERVATION TO NODE             ******;
 DROP _ARB_P_;
 _ARB_P_ = 0;
 DROP _ARB_PPATH_; _ARB_PPATH_ = 1;

********** LEAF     1  NODE   370 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

   DROP _BRANCH_;
  _BRANCH_ = -1;
   DROP _ARB_SURR_;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2008' ,'2012' ) 
         THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2002' ,'2003' ,'2006' ,'2007' ,'2009' ,
        '2010' ,'2011' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2000' ,'2005' ,'2012' ,'2003' ,'2006' ,'2010' ,
          '2013' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2008' ,'2002' ,'2007' ,
          '2009' ,'2011' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('BOTH SEXES' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -334332.2857;
      END;
    END;
  END;

********** LEAF     2  NODE   371 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2008' ,'2012' ) 
         THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2002' ,'2003' ,'2006' ,'2007' ,'2009' ,
        '2010' ,'2011' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2008' ,'2002' ,'2007' ,'2009' ,
          '2011' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'2005' ,'2012' ,'2003' ,'2006' ,
          '2010' ,'2013' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('BOTH SEXES' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -578690.9524;
      END;
    END;
  END;

********** LEAF     3  NODE   372 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2002' ,'2003' ,'2006' ,'2007' ,'2009' ,'2010' ,
        '2011' ,'2013' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2008' ,
        '2012' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' 
        ) THEN _BRANCH_ = 0; 
      END;
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
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '25 TO 44' ,'45 TO 64' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2012' ,'2002' ,'2006' ,
          '2007' ,'2009' ,'2013' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'2008' ,'2003' ,'2010' ,'2011' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '25 TO 44' ,'45 TO 64' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 604189.04762;
      END;
    END;
  END;

********** LEAF     4  NODE   373 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2002' ,'2003' ,'2006' ,'2007' ,'2009' ,'2010' ,
        '2011' ,'2013' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2008' ,
        '2012' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' 
        ) THEN _BRANCH_ = 0; 
      END;
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
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '25 TO 44' ,'45 TO 64' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2000' ,'2008' ,'2003' ,'2010' ,'2011' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2012' ,'2002' ,
          '2006' ,'2007' ,'2009' ,'2013' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('MALE' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 288134.3254;
      END;
    END;
  END;

********** LEAF     5  NODE   377 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2012' ,'2006' ,'2007' ,'2009' ,
        '2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2004' ,'2008' ,'2002' ,'2003' ,
        '2010' ,'2011' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('BOTH SEXES' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2000' ,'2004' ,'2005' ,'2008' ,'2012' ,'2002' ,
          '2006' ,'2013' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2003' ,'2007' ,'2009' ,'2010' ,
          '2011' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -289175.1886;
      END;
    END;
  END;

********** LEAF     6  NODE   378 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2012' ,'2006' ,'2007' ,'2009' ,
        '2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2004' ,'2008' ,'2002' ,'2003' ,
        '2010' ,'2011' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('BOTH SEXES' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2001' ,'2003' ,'2007' ,'2009' ,'2010' ,'2011' ) 
           THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'2004' ,'2005' ,'2008' ,'2012' ,
          '2002' ,'2006' ,'2013' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -530055.4469;
      END;
    END;
  END;

********** LEAF     7  NODE   379 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2004' ,'2008' ,'2002' ,'2003' ,'2010' ,
        '2011' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2012' ,'2006' ,'2007' ,
        '2009' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('BOTH SEXES' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
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
      IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2006' ,'2010' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 197047.88971;
      END;
    END;
  END;

********** LEAF     8  NODE   380 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2004' ,'2008' ,'2002' ,'2003' ,'2010' ,
        '2011' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2012' ,'2006' ,'2007' ,
        '2009' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('BOTH SEXES' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
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
      IF _ARBFMT_10 IN ('2005' ,'2008' ,'2012' ,'2002' ,'2003' ,'2007' ,
      '2009' ,'2011' ,'2013' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2004' ,'2006' ,'2010' ,'2005' ,'2008' ,'2012' ,
        '2002' ,'2003' ,'2007' ,'2009' ,'2011' ,'2013' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 525483.7148;
      END;
    END;
  END;

********** LEAF     9  NODE   384 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2008' ,'2012' ,'2002' ,'2003' ,
        '2006' ,'2010' ,'2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2005' ,'2007' ,'2009' ,'2011' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('BOTH SEXES' 
        ) THEN _BRANCH_ = 0; 
      END;
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
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2000' ,'2008' ,'2006' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2012' ,'2002' ,
          '2003' ,'2007' ,'2009' ,'2010' ,'2011' ,'2013' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -275693.2484;
      END;
    END;
  END;

********** LEAF    10  NODE   385 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2008' ,'2012' ,'2002' ,'2003' ,
        '2006' ,'2010' ,'2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2005' ,'2007' ,'2009' ,'2011' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('BOTH SEXES' 
        ) THEN _BRANCH_ = 0; 
      END;
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
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2012' ,'2002' ,'2003' ,
          '2007' ,'2009' ,'2010' ,'2011' ,'2013' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'2008' ,'2006' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -471137.9216;
      END;
    END;
  END;

********** LEAF    11  NODE   386 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2005' ,'2007' ,'2009' ,'2011' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2008' ,'2012' ,'2002' ,
        '2003' ,'2006' ,'2010' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('BOTH SEXES' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '25 TO 44' ,'45 TO 64' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2000' ,'2005' ,'2008' ,'2006' ,'2007' ,'2009' ,
          '2011' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2012' ,'2002' ,'2003' ,
          '2010' ,'2013' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 447325.13497;
      END;
    END;
  END;

********** LEAF    12  NODE   387 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2005' ,'2007' ,'2009' ,'2011' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2008' ,'2012' ,'2002' ,
        '2003' ,'2006' ,'2010' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('BOTH SEXES' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '25 TO 44' ,'45 TO 64' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2012' ,'2002' ,'2003' ,'2010' ,
          '2013' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'2005' ,'2008' ,'2006' ,'2007' ,
          '2009' ,'2011' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '25 TO 44' ,'45 TO 64' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 150144.43777;
      END;
    END;
  END;

********** LEAF    13  NODE   391 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2005' ,'2008' ,'2012' ,'2003' ,
        '2006' ,'2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2004' ,'2002' ,'2007' ,'2009' ,'2010' ,
        '2011' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2000' ,'2008' ,'2012' ,'2002' ,'2006' ,'2010' ,
          '2011' ,'2013' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2003' ,'2007' ,
          '2009' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -245946.4965;
      END;
    END;
  END;

********** LEAF    14  NODE   392 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2005' ,'2008' ,'2012' ,'2003' ,
        '2006' ,'2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2004' ,'2002' ,'2007' ,'2009' ,'2010' ,
        '2011' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2003' ,'2007' ,'2009' ) 
           THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'2008' ,'2012' ,'2002' ,'2006' ,
          '2010' ,'2011' ,'2013' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('MALE' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -421856.0338;
      END;
    END;
  END;

********** LEAF    15  NODE   393 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2004' ,'2002' ,'2007' ,'2009' ,'2010' ,'2011' ) 
         THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2005' ,'2008' ,'2012' ,
        '2003' ,'2006' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
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
      IF _ARBFMT_10 IN ('2000' ,'2004' ,'2012' ,'2002' ,'2006' ,'2010' ) THEN 
        DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2000' ,'2004' ,'2012' ,'2002' ,'2006' ,'2010' ,'2001' ,'2005' ,'2008' ,
      '2003' ,'2007' ,'2009' ,'2011' ,'2013' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('45 TO 64' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('25 TO 44' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 214909.53268;
      END;
    END;
  END;

********** LEAF    16  NODE   394 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2004' ,'2002' ,'2007' ,'2009' ,'2010' ,'2011' ) 
         THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2005' ,'2008' ,'2012' ,
        '2003' ,'2006' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
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
      IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2003' ,'2007' ,'2009' ,
      '2011' ,'2013' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2000' ,'2004' ,'2012' ,'2002' ,'2006' ,'2010' ,'2001' ,'2005' ,'2008' ,
      '2003' ,'2007' ,'2009' ,'2011' ,'2013' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('45 TO 64' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2004' ,'2012' ,'2002' ,'2006' ,'2010' ,'2001' ,'2005' ,
        '2008' ,'2003' ,'2007' ,'2009' ,'2011' ,'2013' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 497213.73706;
      END;
    END;
  END;

********** LEAF    17  NODE   398 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2012' ,'2003' ,
        '2006' ,'2010' ,'2011' ,'2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2005' ,'2002' ,'2007' ,'2009' 
        ) THEN _BRANCH_ = 0; 
      END;
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
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2000' ,'2004' ,'2008' ,'2012' ,'2003' ,'2010' ) 
           THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2002' ,'2006' ,'2007' ,
          '2009' ,'2011' ,'2013' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -191210.8971;
      END;
    END;
  END;

********** LEAF    18  NODE   399 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2012' ,'2003' ,
        '2006' ,'2010' ,'2011' ,'2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2005' ,'2002' ,'2007' ,'2009' 
        ) THEN _BRANCH_ = 0; 
      END;
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
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2001' ,'2005' ,'2002' ,'2006' ,'2007' ,'2009' ,
          '2011' ,'2013' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'2004' ,'2008' ,'2012' ,'2003' ,
          '2010' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -380533.4601;
      END;
    END;
  END;

********** LEAF    19  NODE   400 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2005' ,'2002' ,'2007' ,'2009' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2012' ,
        '2003' ,'2006' ,'2010' ,'2011' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '25 TO 44' ,'45 TO 64' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2000' ,'2005' ,'2002' ,'2007' ,'2009' ,'2011' ,
          '2013' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2008' ,'2012' ,'2003' ,
          '2006' ,'2010' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 441506.18175;
      END;
    END;
  END;

********** LEAF    20  NODE   401 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2005' ,'2002' ,'2007' ,'2009' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2012' ,
        '2003' ,'2006' ,'2010' ,'2011' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '25 TO 44' ,'45 TO 64' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2008' ,'2012' ,'2003' ,'2006' ,
          '2010' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'2005' ,'2002' ,'2007' ,'2009' ,
          '2011' ,'2013' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '25 TO 44' ,'45 TO 64' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 156293.96351;
      END;
    END;
  END;

********** LEAF    21  NODE   405 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2008' ,'2012' ,
        '2002' ,'2006' ,'2007' ,'2010' ,'2011' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2003' ,'2009' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
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
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2000' ,'2004' ,'2005' ,'2008' ,'2012' ,'2002' ,
          '2003' ,'2007' ,'2013' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2006' ,'2009' ,'2010' ,'2011' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('BOTH SEXES' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -173685.8074;
      END;
    END;
  END;

********** LEAF    22  NODE   406 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2008' ,'2012' ,
        '2002' ,'2006' ,'2007' ,'2010' ,'2011' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2003' ,'2009' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
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
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2001' ,'2006' ,'2009' ,'2010' ,'2011' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'2004' ,'2005' ,'2008' ,'2012' ,
          '2002' ,'2003' ,'2007' ,'2013' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('BOTH SEXES' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -340278.5709;
      END;
    END;
  END;

********** LEAF    23  NODE   407 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2003' ,'2009' ,'2013' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2008' ,
        '2012' ,'2002' ,'2006' ,'2007' ,'2010' ,'2011' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2002' ,'2003' ,
      '2006' ,'2010' ,'2011' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2004' ,'2005' ,'2002' ,'2003' ,'2006' ,'2010' ,
        '2011' ,'2008' ,'2012' ,'2007' ,'2009' ,'2013' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 161634.09199;
      END;
    END;
  END;

********** LEAF    24  NODE   408 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2003' ,'2009' ,'2013' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2008' ,
        '2012' ,'2002' ,'2006' ,'2007' ,'2010' ,'2011' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2008' ,'2012' ,'2007' ,'2009' ,'2013' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 509098.91267;
      END;
    END;
  END;

********** LEAF    25  NODE   412 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2012' ,'2006' ,
        '2009' ,'2010' ,'2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2008' ,'2002' ,'2003' ,'2007' ,'2011' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' 
        ) THEN _BRANCH_ = 0; 
      END;
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
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2005' ,'2012' ,'2002' ,'2009' ,'2010' ,'2013' ) 
           THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2003' ,
          '2006' ,'2007' ,'2011' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -181018.2267;
      END;
    END;
  END;

********** LEAF    26  NODE   413 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2012' ,'2006' ,
        '2009' ,'2010' ,'2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2008' ,'2002' ,'2003' ,'2007' ,'2011' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' 
        ) THEN _BRANCH_ = 0; 
      END;
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
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2003' ,'2006' ,
          '2007' ,'2011' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2005' ,'2012' ,'2002' ,'2009' ,'2010' ,
          '2013' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -313455.4757;
      END;
    END;
  END;

********** LEAF    27  NODE   414 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2008' ,'2002' ,'2003' ,'2007' ,'2011' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2012' ,
        '2006' ,'2009' ,'2010' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2002' ,'2003' ,
      '2006' ,'2010' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2004' ,'2005' ,'2002' ,'2003' ,'2006' ,'2010' ,'2008' ,
      '2012' ,'2007' ,'2009' ,'2011' ,'2013' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2004' ,'2005' ,'2002' ,'2003' ,'2006' ,'2010' ,
        '2008' ,'2012' ,'2007' ,'2009' ,'2011' ,'2013' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 101294.62088;
      END;
    END;
  END;

********** LEAF    28  NODE   415 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2008' ,'2002' ,'2003' ,'2007' ,'2011' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2012' ,
        '2006' ,'2009' ,'2010' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2008' ,'2012' ,'2007' ,'2009' ,'2011' ,'2013' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2004' ,'2005' ,'2002' ,'2003' ,'2006' ,'2010' ,'2008' ,
      '2012' ,'2007' ,'2009' ,'2011' ,'2013' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 387104.22347;
      END;
    END;
  END;

********** LEAF    29  NODE   419 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2012' ,'2006' ,'2007' ,
        '2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2004' ,'2002' ,'2003' ,'2009' ,
        '2010' ,'2011' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('BOTH SEXES' 
        ) THEN _BRANCH_ = 0; 
      END;
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
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2000' ,'2012' ,'2003' ,'2011' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2002' ,
          '2006' ,'2007' ,'2009' ,'2010' ,'2013' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -154023.1748;
      END;
    END;
  END;

********** LEAF    30  NODE   420 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2012' ,'2006' ,'2007' ,
        '2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2004' ,'2002' ,'2003' ,'2009' ,
        '2010' ,'2011' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('BOTH SEXES' 
        ) THEN _BRANCH_ = 0; 
      END;
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
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2002' ,'2006' ,
          '2007' ,'2009' ,'2010' ,'2013' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'2012' ,'2003' ,'2011' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -276648.557;
      END;
    END;
  END;

********** LEAF    31  NODE   421 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2004' ,'2002' ,'2003' ,'2009' ,'2010' ,
        '2011' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2012' ,'2006' ,
        '2007' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('BOTH SEXES' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '25 TO 44' ,'45 TO 64' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2002' ,'2006' ,'2007' ,
          '2009' ,'2013' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'2008' ,'2012' ,'2003' ,'2010' ,
          '2011' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('BOTH SEXES' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '25 TO 44' ,'45 TO 64' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 411973.36761;
      END;
    END;
  END;

********** LEAF    32  NODE   422 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2004' ,'2002' ,'2003' ,'2009' ,'2010' ,
        '2011' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2012' ,'2006' ,
        '2007' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('BOTH SEXES' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '25 TO 44' ,'45 TO 64' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2000' ,'2008' ,'2012' ,'2003' ,'2010' ,'2011' ) 
           THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2002' ,'2006' ,
          '2007' ,'2009' ,'2013' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('BOTH SEXES' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 107992.22538;
      END;
    END;
  END;

********** LEAF    33  NODE   426 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2012' ,'2006' ,'2011' ,'2013' ) 
         THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2004' ,'2008' ,'2002' ,'2003' ,
        '2007' ,'2009' ,'2010' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2000' ,'2005' ,'2008' ,'2012' ,'2006' ,'2010' ) 
           THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2002' ,'2003' ,'2007' ,
          '2009' ,'2011' ,'2013' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -151879.9956;
      END;
    END;
  END;

********** LEAF    34  NODE   427 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2012' ,'2006' ,'2011' ,'2013' ) 
         THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2004' ,'2008' ,'2002' ,'2003' ,
        '2007' ,'2009' ,'2010' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2002' ,'2003' ,'2007' ,'2009' ,
          '2011' ,'2013' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'2005' ,'2008' ,'2012' ,'2006' ,
          '2010' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -255643.7915;
      END;
    END;
  END;

********** LEAF    35  NODE   428 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2004' ,'2008' ,'2002' ,'2003' ,'2007' ,
        '2009' ,'2010' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2012' ,'2006' ,'2011' ,
        '2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
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
      IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2002' ,'2006' ,
      '2007' ,'2010' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2004' ,'2008' ,'2002' ,'2006' ,'2007' ,'2010' ,
        '2005' ,'2012' ,'2003' ,'2009' ,'2011' ,'2013' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 117748.34383;
      END;
    END;
  END;

********** LEAF    36  NODE   429 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2004' ,'2008' ,'2002' ,'2003' ,'2007' ,
        '2009' ,'2010' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2012' ,'2006' ,'2011' ,
        '2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
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
      IF _ARBFMT_10 IN ('2005' ,'2012' ,'2003' ,'2009' ,'2011' ,'2013' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 339617.15176;
      END;
    END;
  END;

********** LEAF    37  NODE   435 ***************;
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

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('2000' ,'2005' ,'2008' ,'2012' ,'2002' ,'2003' ,
            '2006' ,'2010' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2007' ,'2009' ,'2011' ,
            '2013' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -127992.3913;
        END;
      END;
    END;
  END;

********** LEAF    38  NODE   436 ***************;
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

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('65+' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('2001' ,'2004' ,'2007' ,'2009' ,'2011' ,'2013' 
             ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('2000' ,'2005' ,'2008' ,'2012' ,'2002' ,
            '2003' ,'2006' ,'2010' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '16 TO 24' ,'65+' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -226251.5487;
        END;
      END;
    END;
  END;

********** LEAF    39  NODE   434 ***************;
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
       _ARB_F_ + 45698.149889;
      END;
    END;
  END;

********** LEAF    40  NODE   432 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 344058.82255;
    END;
  END;

********** LEAF    41  NODE   442 ***************;
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

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2012' ,'2006' ,'2010' ) 
         THEN DO;
         _BRANCH_ =    1; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -165773.4661;
        END;
      END;
    END;
  END;

********** LEAF    42  NODE   443 ***************;
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

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2005' ,'2008' ,'2002' ,'2003' ,'2007' ,'2009' ,
        '2011' ,'2013' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_10 NOTIN (
          '2000' ,'2001' ,'2004' ,'2012' ,'2006' ,'2010' ,'2005' ,'2008' ,
          '2002' ,'2003' ,'2007' ,'2009' ,'2011' ,'2013' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 25327.034127;
        END;
      END;
    END;
  END;

********** LEAF    43  NODE   441 ***************;
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
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -193719.1976;
      END;
    END;
  END;

********** LEAF    44  NODE   439 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 234612.35391;
    END;
  END;

********** LEAF    45  NODE   447 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2012' ,'2007' ,
        '2009' ,'2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2005' ,'2002' ,'2003' ,'2006' ,'2010' ,
        '2011' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2012' ,'2003' ,'2006' ,
          '2010' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2002' ,'2007' ,'2009' ,
          '2011' ,'2013' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -78415.00599;
      END;
    END;
  END;

********** LEAF    46  NODE   448 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2012' ,'2007' ,
        '2009' ,'2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2005' ,'2002' ,'2003' ,'2006' ,'2010' ,
        '2011' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('65+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2000' ,'2001' ,'2002' ,'2007' ,'2009' ,'2011' ,
          '2013' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2012' ,'2003' ,
          '2006' ,'2010' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -182805.1068;
      END;
    END;
  END;

********** LEAF    47  NODE   449 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2005' ,'2002' ,'2003' ,'2006' ,'2010' ,'2011' ) 
         THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2012' ,
        '2007' ,'2009' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
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
      IF _ARBFMT_10 IN ('2000' ,'2005' ,'2008' ,'2003' ,'2009' ,'2011' ) THEN 
        DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 276324.65468;
      END;
    END;
  END;

********** LEAF    48  NODE   450 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2005' ,'2002' ,'2003' ,'2006' ,'2010' ,'2011' ) 
         THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2012' ,
        '2007' ,'2009' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
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
      IF _ARBFMT_10 IN ('2001' ,'2004' ,'2012' ,'2002' ,'2006' ,'2007' ,
      '2010' ,'2013' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2005' ,'2008' ,'2003' ,'2009' ,'2011' ,'2001' ,'2004' ,
        '2012' ,'2002' ,'2006' ,'2007' ,'2010' ,'2013' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 86729.361282;
      END;
    END;
  END;

********** LEAF    49  NODE   456 ***************;
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

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2012' ,'2002' ,'2006' ,'2007' ,
        '2009' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2012' ,'2002' ,'2006' ,'2007' ,'2009' ,'2004' ,
        '2005' ,'2008' ,'2003' ,'2010' ,'2011' ,'2013' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('65+' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_19 IN ('16 TO 24' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('BOTH SEXES' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -168502.3033;
        END;
      END;
    END;
  END;

********** LEAF    50  NODE   457 ***************;
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

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2003' ,'2010' ,'2011' ,
        '2013' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2012' ,'2002' ,'2006' ,'2007' ,'2009' ,'2004' ,
        '2005' ,'2008' ,'2003' ,'2010' ,'2011' ,'2013' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_19 IN ('65+' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('BOTH SEXES' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
         IF MISSING( Date  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_10 NOTIN (
          '2000' ,'2001' ,'2012' ,'2002' ,'2006' ,'2007' ,'2009' ,'2004' ,
          '2005' ,'2008' ,'2003' ,'2010' ,'2011' ,'2013' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -98780.43324;
        END;
      END;
    END;
  END;

********** LEAF    51  NODE   455 ***************;
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
       _ARB_F_ + 5407.2395062;
      END;
    END;
  END;

********** LEAF    52  NODE   453 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 185000.41584;
    END;
  END;

********** LEAF    53  NODE   463 ***************;
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

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('2005' ,'2008' ,'2003' ,'2006' ,'2009' ,'2010' ,
            '2013' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2012' ,'2002' ,
            '2007' ,'2011' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -63957.03874;
        END;
      END;
    END;
  END;

********** LEAF    54  NODE   464 ***************;
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

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('65+' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2012' ,'2002' ,'2007' ,
            '2011' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('2005' ,'2008' ,'2003' ,'2006' ,'2009' ,
            '2010' ,'2013' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '16 TO 24' ,'65+' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -145830.4289;
        END;
      END;
    END;
  END;

********** LEAF    55  NODE   462 ***************;
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
       _ARB_F_ + 47774.377772;
      END;
    END;
  END;

********** LEAF    56  NODE   460 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 226470.65762;
    END;
  END;

********** LEAF    57  NODE   468 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2012' ,'2006' ,
        '2007' ,'2009' ,'2010' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2005' ,'2002' ,'2003' ,'2011' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2002' ,'2006' ,
      '2007' ,'2009' ,'2013' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2004' ,'2005' ,'2002' ,'2006' ,'2007' ,'2009' ,
        '2013' ,'2008' ,'2012' ,'2003' ,'2010' ,'2011' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -132218.0671;
      END;
    END;
  END;

********** LEAF    58  NODE   469 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2012' ,'2006' ,
        '2007' ,'2009' ,'2010' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2005' ,'2002' ,'2003' ,'2011' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2008' ,'2012' ,'2003' ,'2010' ,'2011' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -67534.95799;
      END;
    END;
  END;

********** LEAF    59  NODE   470 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2005' ,'2002' ,'2003' ,'2011' ,'2013' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2012' ,
        '2006' ,'2007' ,'2009' ,'2010' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2001' ,'2003' ,'2006' ,'2009' ,'2010' ) THEN 
        DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -42225.57576;
      END;
    END;
  END;

********** LEAF    60  NODE   471 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2005' ,'2002' ,'2003' ,'2011' ,'2013' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2012' ,
        '2006' ,'2007' ,'2009' ,'2010' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2012' ,'2002' ,'2007' ,
      '2011' ,'2013' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2003' ,'2006' ,'2009' ,'2010' ,'2004' ,'2005' ,
        '2008' ,'2012' ,'2002' ,'2007' ,'2011' ,'2013' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 124111.28005;
      END;
    END;
  END;

********** LEAF    61  NODE   477 ***************;
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
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2012' ,'2003' ,
      '2009' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2004' ,'2005' ,'2012' ,'2003' ,'2009' ,'2008' ,'2002' ,
      '2006' ,'2007' ,'2010' ,'2011' ,'2013' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('16 TO 24' ,'45 TO 64' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('65+' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2004' ,'2005' ,'2012' ,'2003' ,'2009' ,'2008' ,
        '2002' ,'2006' ,'2007' ,'2010' ,'2011' ,'2013' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2009' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2004' ,'2009' ,'2005' ,'2012' ,'2003' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('65+' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_19 IN ('16 TO 24' ,'45 TO 64' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
         IF MISSING( Date  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          '2000' ,'2001' ,'2004' ,'2009' ,'2005' ,'2012' ,'2003' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -140403.2026;
        END;
      END;
    END;
  END;

********** LEAF    62  NODE   478 ***************;
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
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2012' ,'2003' ,
      '2009' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2004' ,'2005' ,'2012' ,'2003' ,'2009' ,'2008' ,'2002' ,
      '2006' ,'2007' ,'2010' ,'2011' ,'2013' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('16 TO 24' ,'45 TO 64' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('65+' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2004' ,'2005' ,'2012' ,'2003' ,'2009' ,'2008' ,
        '2002' ,'2006' ,'2007' ,'2010' ,'2011' ,'2013' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('2005' ,'2012' ,'2003' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2004' ,'2009' ,'2005' ,'2012' ,'2003' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('16 TO 24' ,'45 TO 64' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_19 IN ('65+' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -77814.34752;
        END;
      END;
    END;
  END;

********** LEAF    63  NODE   476 ***************;
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
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2008' ,'2002' ,'2006' ,'2007' ,'2010' ,'2011' ,
      '2013' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2004' ,'2005' ,'2012' ,'2003' ,'2009' ,'2008' ,'2002' ,
      '2006' ,'2007' ,'2010' ,'2011' ,'2013' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('65+' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('16 TO 24' ,'45 TO 64' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -3966.216085;
      END;
    END;
  END;

********** LEAF    64  NODE   474 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 116053.47396;
    END;
  END;

********** LEAF    65  NODE   482 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2008' ,'2012' ,
        '2002' ,'2003' ,'2006' ,'2009' ,'2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2007' ,'2010' ,'2011' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
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
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2000' ,'2004' ,'2005' ,'2008' ,'2012' ,'2009' ,
          '2010' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2002' ,'2003' ,'2006' ,'2007' ,
          '2011' ,'2013' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -63009.10647;
      END;
    END;
  END;

********** LEAF    66  NODE   483 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2008' ,'2012' ,
        '2002' ,'2003' ,'2006' ,'2009' ,'2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2007' ,'2010' ,'2011' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
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
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2001' ,'2002' ,'2003' ,'2006' ,'2007' ,'2011' ,
          '2013' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'2004' ,'2005' ,'2008' ,'2012' ,
          '2009' ,'2010' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('MALE' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -122501.5985;
      END;
    END;
  END;

********** LEAF    67  NODE   484 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2007' ,'2010' ,'2011' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2008' ,
        '2012' ,'2002' ,'2003' ,'2006' ,'2009' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('MALE' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2012' ,'2002' ,
      '2009' ,'2010' ,'2013' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2004' ,'2005' ,'2012' ,'2002' ,'2009' ,'2010' ,
        '2013' ,'2008' ,'2003' ,'2006' ,'2007' ,'2011' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -51885.14386;
      END;
    END;
  END;

********** LEAF    68  NODE   485 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2007' ,'2010' ,'2011' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2008' ,
        '2012' ,'2002' ,'2003' ,'2006' ,'2009' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('MALE' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2008' ,'2003' ,'2006' ,'2007' ,'2011' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 152838.37738;
      END;
    END;
  END;

********** LEAF    69  NODE   489 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2007' ,'2010' ,
        '2011' ,'2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2005' ,'2012' ,'2002' ,'2003' ,'2006' ,
        '2009' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2012' ,'2009' ,
      '2013' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2004' ,'2008' ,'2012' ,'2009' ,'2013' ,'2005' ,'2002' ,
      '2003' ,'2006' ,'2007' ,'2010' ,'2011' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2004' ,'2008' ,'2012' ,'2009' ,'2013' ,'2005' ,
        '2002' ,'2003' ,'2006' ,'2007' ,'2010' ,'2011' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -56238.46164;
      END;
    END;
  END;

********** LEAF    70  NODE   490 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2007' ,'2010' ,
        '2011' ,'2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2005' ,'2012' ,'2002' ,'2003' ,'2006' ,
        '2009' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2005' ,'2002' ,'2003' ,'2006' ,'2007' ,'2010' ,
      '2011' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2004' ,'2008' ,'2012' ,'2009' ,'2013' ,'2005' ,'2002' ,
      '2003' ,'2006' ,'2007' ,'2010' ,'2011' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('MALE' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -111547.7796;
      END;
    END;
  END;

********** LEAF    71  NODE   491 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2005' ,'2012' ,'2002' ,'2003' ,'2006' ,'2009' ) 
         THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2007' ,
        '2010' ,'2011' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('MALE' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' 
        ) THEN _BRANCH_ = 0; 
      END;
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
      IF _ARBFMT_10 IN ('2000' ,'2005' ,'2006' ,'2010' ,'2013' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -5219.69957;
      END;
    END;
  END;

********** LEAF    72  NODE   492 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2005' ,'2012' ,'2002' ,'2003' ,'2006' ,'2009' ) 
         THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2007' ,
        '2010' ,'2011' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('MALE' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' 
        ) THEN _BRANCH_ = 0; 
      END;
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
      IF _ARBFMT_10 IN ('2001' ,'2004' ,'2008' ,'2012' ,'2002' ,'2003' ,
      '2007' ,'2009' ,'2011' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2005' ,'2006' ,'2010' ,'2013' ,'2001' ,'2004' ,'2008' ,
        '2012' ,'2002' ,'2003' ,'2007' ,'2009' ,'2011' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 124279.19654;
      END;
    END;
  END;

********** LEAF    73  NODE   496 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2012' ,'2003' ,
        '2010' ,'2011' ,'2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2005' ,'2002' ,'2006' ,'2007' ,'2009' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('BOTH SEXES' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2004' ,'2003' ,'2010' ,'2011' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -33673.466;
      END;
    END;
  END;

********** LEAF    74  NODE   497 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2012' ,'2003' ,
        '2010' ,'2011' ,'2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2005' ,'2002' ,'2006' ,'2007' ,'2009' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('BOTH SEXES' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2012' ,'2002' ,'2006' ,
      '2007' ,'2009' ,'2013' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2004' ,'2003' ,'2010' ,'2011' ,'2001' ,'2005' ,'2008' ,
        '2012' ,'2002' ,'2006' ,'2007' ,'2009' ,'2013' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -96823.28073;
      END;
    END;
  END;

********** LEAF    75  NODE   498 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2005' ,'2002' ,'2006' ,'2007' ,'2009' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2012' ,
        '2003' ,'2010' ,'2011' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('BOTH SEXES' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2002' ,'2006' ,'2007' ,
      '2009' ,'2010' ,'2011' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2004' ,'2002' ,'2006' ,'2007' ,'2009' ,'2010' ,
        '2011' ,'2005' ,'2008' ,'2012' ,'2003' ,'2013' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 18791.069407;
      END;
    END;
  END;

********** LEAF    76  NODE   499 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2005' ,'2002' ,'2006' ,'2007' ,'2009' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2012' ,
        '2003' ,'2010' ,'2011' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('BOTH SEXES' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2005' ,'2008' ,'2012' ,'2003' ,'2013' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 228946.9022;
      END;
    END;
  END;

********** LEAF    77  NODE   503 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2008' ,'2003' ,
        '2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2012' ,'2002' ,'2006' ,'2007' ,'2009' ,
        '2010' ,'2011' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2005' ,'2002' ,'2003' ,'2006' ,'2007' ,
      '2010' ,'2013' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2005' ,'2002' ,'2003' ,'2006' ,'2007' ,'2010' ,'2013' ,
        '2001' ,'2004' ,'2008' ,'2012' ,'2009' ,'2011' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -91190.47597;
      END;
    END;
  END;

********** LEAF    78  NODE   504 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2008' ,'2003' ,
        '2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2012' ,'2002' ,'2006' ,'2007' ,'2009' ,
        '2010' ,'2011' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2001' ,'2004' ,'2008' ,'2012' ,'2009' ,'2011' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -31442.6708;
      END;
    END;
  END;

********** LEAF    79  NODE   505 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2012' ,'2002' ,'2006' ,'2007' ,'2009' ,'2010' ,
        '2011' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2008' ,
        '2003' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' 
        ) THEN _BRANCH_ = 0; 
      END;
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
      IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2002' ,'2003' ,
      '2006' ,'2010' ,'2013' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2004' ,'2005' ,'2002' ,'2003' ,'2006' ,'2010' ,
        '2013' ,'2008' ,'2012' ,'2007' ,'2009' ,'2011' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -10400.73757;
      END;
    END;
  END;

********** LEAF    80  NODE   506 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2012' ,'2002' ,'2006' ,'2007' ,'2009' ,'2010' ,
        '2011' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2008' ,
        '2003' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' 
        ) THEN _BRANCH_ = 0; 
      END;
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
      IF _ARBFMT_10 IN ('2008' ,'2012' ,'2007' ,'2009' ,'2011' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 162328.59051;
      END;
    END;
  END;

********** LEAF    81  NODE   512 ***************;
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
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2008' ,'2012' ,
      '2002' ,'2003' ,'2006' ,'2011' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2004' ,'2005' ,'2008' ,'2012' ,'2002' ,'2003' ,
        '2006' ,'2011' ,'2007' ,'2009' ,'2010' ,'2013' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('2000' ,'2001' ,'2005' ,'2008' ,'2012' ,'2002' ) 
         THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          '2000' ,'2001' ,'2005' ,'2008' ,'2012' ,'2002' ,'2004' ,'2003' ,
          '2006' ,'2011' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -55673.05318;
        END;
      END;
    END;
  END;

********** LEAF    82  NODE   513 ***************;
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
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2008' ,'2012' ,
      '2002' ,'2003' ,'2006' ,'2011' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2004' ,'2005' ,'2008' ,'2012' ,'2002' ,'2003' ,
        '2006' ,'2011' ,'2007' ,'2009' ,'2010' ,'2013' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('2004' ,'2003' ,'2006' ,'2011' ) THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -104353.4555;
        END;
      END;
    END;
  END;

********** LEAF    83  NODE   511 ***************;
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
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2007' ,'2009' ,'2010' ,'2013' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 32782.911661;
      END;
    END;
  END;

********** LEAF    84  NODE   509 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 130141.44265;
    END;
  END;

********** LEAF    85  NODE   519 ***************;
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
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2012' ,'2003' ,'2006' ) THEN 
        DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2004' ,'2012' ,'2003' ,'2006' ,'2005' ,'2008' ,'2002' ,
      '2007' ,'2009' ,'2010' ,'2011' ,'2013' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('65+' ,'45 TO 64' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2004' ,'2006' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        '2000' ,'2004' ,'2006' ,'2001' ,'2012' ,'2003' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('45 TO 64' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_19 IN ('16 TO 24' ,'65+' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -69838.58639;
        END;
      END;
    END;
  END;

********** LEAF    86  NODE   520 ***************;
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
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2012' ,'2003' ,'2006' ) THEN 
        DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2004' ,'2012' ,'2003' ,'2006' ,'2005' ,'2008' ,'2002' ,
      '2007' ,'2009' ,'2010' ,'2011' ,'2013' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('65+' ,'45 TO 64' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2012' ,'2003' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        '2000' ,'2004' ,'2006' ,'2001' ,'2012' ,'2003' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_19 IN ('45 TO 64' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
         IF MISSING( Date  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_10 NOTIN (
          '2000' ,'2004' ,'2006' ,'2001' ,'2012' ,'2003' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -106552.2241;
        END;
      END;
    END;
  END;

********** LEAF    87  NODE   521 ***************;
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
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2005' ,'2008' ,'2002' ,'2007' ,'2009' ,'2010' ,
      '2011' ,'2013' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2004' ,'2012' ,'2003' ,'2006' ,'2005' ,'2008' ,'2002' ,
      '2007' ,'2009' ,'2010' ,'2011' ,'2013' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('65+' ,'45 TO 64' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('16 TO 24' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2004' ,'2012' ,'2003' ,'2006' ,'2005' ,'2008' ,
        '2002' ,'2007' ,'2009' ,'2010' ,'2011' ,'2013' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('2005' ,'2002' ,'2007' ,'2010' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        '2005' ,'2002' ,'2007' ,'2010' ,'2008' ,'2009' ,'2011' ,'2013' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -4871.665688;
        END;
      END;
    END;
  END;

********** LEAF    88  NODE   522 ***************;
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
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2005' ,'2008' ,'2002' ,'2007' ,'2009' ,'2010' ,
      '2011' ,'2013' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2004' ,'2012' ,'2003' ,'2006' ,'2005' ,'2008' ,'2002' ,
      '2007' ,'2009' ,'2010' ,'2011' ,'2013' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('65+' ,'45 TO 64' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('16 TO 24' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2004' ,'2012' ,'2003' ,'2006' ,'2005' ,'2008' ,
        '2002' ,'2007' ,'2009' ,'2010' ,'2011' ,'2013' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('2008' ,'2009' ,'2011' ,'2013' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        '2005' ,'2002' ,'2007' ,'2010' ,'2008' ,'2009' ,'2011' ,'2013' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
         IF MISSING( Date  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_10 NOTIN (
          '2005' ,'2002' ,'2007' ,'2010' ,'2008' ,'2009' ,'2011' ,'2013' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 80333.708481;
        END;
      END;
    END;
  END;

********** LEAF    89  NODE   516 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 174880.41192;
    END;
  END;

********** LEAF    90  NODE   524 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2000' ,'2001' ,'2003' ,'2007' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 44712.799587;
    END;
  END;

********** LEAF    91  NODE   528 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2012' ,'2002' ,'2006' ,'2009' ,
    '2010' ,'2011' ,'2013' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2003' ,'2007' ,'2004' ,'2005' ,'2008' ,'2012' ,'2002' ,
      '2006' ,'2009' ,'2010' ,'2011' ,'2013' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'25 TO 44' ) THEN DO;
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
        IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2012' ,'2006' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          '2004' ,'2005' ,'2008' ,'2012' ,'2006' ,'2002' ,'2009' ,'2010' ,
          '2011' ,'2013' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -10378.69918;
        END;
      END;
    END;
  END;

********** LEAF    92  NODE   529 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2012' ,'2002' ,'2006' ,'2009' ,
    '2010' ,'2011' ,'2013' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2003' ,'2007' ,'2004' ,'2005' ,'2008' ,'2012' ,'2002' ,
      '2006' ,'2009' ,'2010' ,'2011' ,'2013' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'25 TO 44' ) THEN DO;
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
        IF _ARBFMT_10 IN ('2002' ,'2009' ,'2010' ,'2011' ,'2013' ) THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -145752.7934;
        END;
      END;
    END;
  END;

********** LEAF    93  NODE   527 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2012' ,'2002' ,'2006' ,'2009' ,
    '2010' ,'2011' ,'2013' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2003' ,'2007' ,'2004' ,'2005' ,'2008' ,'2012' ,'2002' ,
      '2006' ,'2009' ,'2010' ,'2011' ,'2013' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 32688.729636;
      END;
    END;
  END;

********** LEAF    94  NODE   533 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2008' ,'2012' ,'2011' ,'2013' ) 
         THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2005' ,'2002' ,'2003' ,'2006' ,
        '2007' ,'2009' ,'2010' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2006' ,'2011' ,'2013' ) THEN 
        DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2004' ,'2006' ,'2011' ,'2013' ,'2005' ,'2008' ,'2012' ,
      '2003' ,'2007' ,'2009' ,'2010' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('65+' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('16 TO 24' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2004' ,'2006' ,'2011' ,'2013' ,'2005' ,'2008' ,
        '2012' ,'2003' ,'2007' ,'2009' ,'2010' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -72439.4445;
      END;
    END;
  END;

********** LEAF    95  NODE   534 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2008' ,'2012' ,'2011' ,'2013' ) 
         THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2005' ,'2002' ,'2003' ,'2006' ,
        '2007' ,'2009' ,'2010' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2005' ,'2008' ,'2012' ,'2003' ,'2007' ,'2009' ,
      '2010' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2004' ,'2006' ,'2011' ,'2013' ,'2005' ,'2008' ,'2012' ,
      '2003' ,'2007' ,'2009' ,'2010' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('65+' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -29229.7711;
      END;
    END;
  END;

********** LEAF    96  NODE   535 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2005' ,'2002' ,'2003' ,'2006' ,'2007' ,
        '2009' ,'2010' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2008' ,'2012' ,'2011' ,
        '2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' 
        ) THEN _BRANCH_ = 0; 
      END;
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
      IF _ARBFMT_10 IN ('2000' ,'2004' ,'2005' ,'2002' ,'2006' ,'2007' ,
      '2009' ,'2010' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2004' ,'2005' ,'2002' ,'2006' ,'2007' ,'2009' ,'2010' ,
        '2001' ,'2008' ,'2012' ,'2003' ,'2011' ,'2013' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 38037.883831;
      END;
    END;
  END;

********** LEAF    97  NODE   536 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2005' ,'2002' ,'2003' ,'2006' ,'2007' ,
        '2009' ,'2010' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2008' ,'2012' ,'2011' ,
        '2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' 
        ) THEN _BRANCH_ = 0; 
      END;
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
      IF _ARBFMT_10 IN ('2001' ,'2008' ,'2012' ,'2003' ,'2011' ,'2013' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 192575.62259;
      END;
    END;
  END;

********** LEAF    98  NODE   540 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2000' ,'2005' ,'2008' ,'2002' ,'2006' ,'2011' ,'2013' )
     THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '2000' ,'2005' ,'2008' ,'2002' ,'2006' ,'2011' ,'2013' ,'2001' ,'2004' ,
    '2012' ,'2003' ,'2007' ,'2009' ,'2010' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_19 IN ('25 TO 44' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2005' ,'2008' ,'2002' ,'2006' ,'2011' ,'2013' ,'2001' ,'2004' ,
      '2012' ,'2003' ,'2007' ,'2009' ,'2010' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('2000' ,'2005' ,'2008' ,'2006' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2000' ,'2005' ,'2008' ,'2006' ,'2002' ,'2011' ,'2013' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('65+' ,'45 TO 64' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2005' ,'2008' ,'2006' ,'2002' ,'2011' ,'2013' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -56569.10646;
      END;
    END;
  END;

********** LEAF    99  NODE   541 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2000' ,'2005' ,'2008' ,'2002' ,'2006' ,'2011' ,'2013' )
     THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '2000' ,'2005' ,'2008' ,'2002' ,'2006' ,'2011' ,'2013' ,'2001' ,'2004' ,
    '2012' ,'2003' ,'2007' ,'2009' ,'2010' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_19 IN ('25 TO 44' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2005' ,'2008' ,'2002' ,'2006' ,'2011' ,'2013' ,'2001' ,'2004' ,
      '2012' ,'2003' ,'2007' ,'2009' ,'2010' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('2002' ,'2011' ,'2013' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2000' ,'2005' ,'2008' ,'2006' ,'2002' ,'2011' ,'2013' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('65+' ,'45 TO 64' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -98608.0694;
      END;
    END;
  END;

********** LEAF   100  NODE   542 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2004' ,'2012' ,'2003' ,'2007' ,'2009' ,'2010' )
     THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '2000' ,'2005' ,'2008' ,'2002' ,'2006' ,'2011' ,'2013' ,'2001' ,'2004' ,
    '2012' ,'2003' ,'2007' ,'2009' ,'2010' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2004' ,'2012' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2003' ,'2007' ,'2009' ,'2010' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -47011.1938;
      END;
    END;
  END;

********** LEAF   101  NODE   543 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2004' ,'2012' ,'2003' ,'2007' ,'2009' ,'2010' )
     THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '2000' ,'2005' ,'2008' ,'2002' ,'2006' ,'2011' ,'2013' ,'2001' ,'2004' ,
    '2012' ,'2003' ,'2007' ,'2009' ,'2010' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2001' ,'2003' ,'2007' ,'2009' ,'2010' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2004' ,'2012' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('MALE' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 118583.11727;
      END;
    END;
  END;

********** LEAF   102  NODE   549 ***************;
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
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2012' ,'2002' ,
      '2003' ,'2006' ,'2013' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2004' ,'2005' ,'2012' ,'2002' ,'2003' ,'2006' ,
        '2013' ,'2008' ,'2007' ,'2009' ,'2010' ,'2011' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -24584.35636;
        END;
      END;
    END;
  END;

********** LEAF   103  NODE   550 ***************;
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
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2005' ,'2012' ,'2002' ,
      '2003' ,'2006' ,'2013' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2004' ,'2005' ,'2012' ,'2002' ,'2003' ,'2006' ,
        '2013' ,'2008' ,'2007' ,'2009' ,'2010' ,'2011' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('65+' ,'45 TO 64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '16 TO 24' ,'65+' ,'45 TO 64' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -87728.10229;
        END;
      END;
    END;
  END;

********** LEAF   104  NODE   548 ***************;
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
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2008' ,'2007' ,'2009' ,'2010' ,'2011' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 35298.288337;
      END;
    END;
  END;

********** LEAF   105  NODE   546 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 137411.49838;
    END;
  END;

********** LEAF   106  NODE   554 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2008' ,'2006' ,'2009' ,'2013' ) 
         THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2005' ,'2012' ,'2002' ,'2003' ,
        '2007' ,'2010' ,'2011' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2004' ,'2003' ,'2006' ,'2009' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -78326.0601;
      END;
    END;
  END;

********** LEAF   107  NODE   555 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2008' ,'2006' ,'2009' ,'2013' ) 
         THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2005' ,'2012' ,'2002' ,'2003' ,
        '2007' ,'2010' ,'2011' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2012' ,'2002' ,'2007' ,
      '2010' ,'2011' ,'2013' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2004' ,'2003' ,'2006' ,'2009' ,'2001' ,'2005' ,'2008' ,
        '2012' ,'2002' ,'2007' ,'2010' ,'2011' ,'2013' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -34493.79136;
      END;
    END;
  END;

********** LEAF   108  NODE   556 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2005' ,'2012' ,'2002' ,'2003' ,'2007' ,
        '2010' ,'2011' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2008' ,'2006' ,'2009' ,
        '2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2005' ,'2008' ,'2006' ,'2009' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 172364.83968;
      END;
    END;
  END;

********** LEAF   109  NODE   557 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2005' ,'2012' ,'2002' ,'2003' ,'2007' ,
        '2010' ,'2011' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2008' ,'2006' ,'2009' ,
        '2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2001' ,'2004' ,'2012' ,'2002' ,'2003' ,'2007' ,
      '2010' ,'2011' ,'2013' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2005' ,'2008' ,'2006' ,'2009' ,'2001' ,'2004' ,'2012' ,
        '2002' ,'2003' ,'2007' ,'2010' ,'2011' ,'2013' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -207.9030509;
      END;
    END;
  END;

********** LEAF   110  NODE   563 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'25 TO 44' ,'45 TO 64' ,'65+' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2001' ,'2008' ,'2002' ,'2003' ,'2010' ,
      '2011' ,'2013' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2008' ,'2002' ,'2003' ,'2010' ,'2011' ,'2013' ,
        '2004' ,'2005' ,'2012' ,'2006' ,'2007' ,'2009' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('2000' ,'2003' ,'2010' ) THEN DO;
         _BRANCH_ =    1; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 34013.598749;
        END;
      END;
    END;
  END;

********** LEAF   111  NODE   564 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'25 TO 44' ,'45 TO 64' ,'65+' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2001' ,'2008' ,'2002' ,'2003' ,'2010' ,
      '2011' ,'2013' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2001' ,'2008' ,'2002' ,'2003' ,'2010' ,'2011' ,'2013' ,
        '2004' ,'2005' ,'2012' ,'2006' ,'2007' ,'2009' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('2001' ,'2008' ,'2002' ,'2011' ,'2013' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_10 NOTIN (
          '2000' ,'2003' ,'2010' ,'2001' ,'2008' ,'2002' ,'2011' ,'2013' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 87001.443662;
        END;
      END;
    END;
  END;

********** LEAF   112  NODE   562 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'25 TO 44' ,'45 TO 64' ,'65+' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2004' ,'2005' ,'2012' ,'2006' ,'2007' ,'2009' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -17534.46429;
      END;
    END;
  END;

********** LEAF   113  NODE   560 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('65+' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -69393.42413;
    END;
  END;

********** LEAF   114  NODE   566 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2000' ,'2004' ,'2012' ,'2011' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -85707.68175;
    END;
  END;

********** LEAF   115  NODE   570 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2002' ,'2003' ,'2006' ,'2007' ,
    '2009' ,'2010' ,'2013' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2004' ,'2012' ,'2011' ,'2001' ,'2005' ,'2008' ,'2002' ,'2003' ,
      '2006' ,'2007' ,'2009' ,'2010' ,'2013' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

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
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2002' ,'2007' ) THEN DO;
         _BRANCH_ =    1; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -94811.38739;
        END;
      END;
    END;
  END;

********** LEAF   116  NODE   571 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2002' ,'2003' ,'2006' ,'2007' ,
    '2009' ,'2010' ,'2013' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2004' ,'2012' ,'2011' ,'2001' ,'2005' ,'2008' ,'2002' ,'2003' ,
      '2006' ,'2007' ,'2009' ,'2010' ,'2013' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

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
        IF _ARBFMT_10 IN ('2008' ,'2003' ,'2006' ,'2009' ,'2010' ,'2013' ) 
         THEN DO;
         _BRANCH_ =    2; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_10 NOTIN (
          '2001' ,'2005' ,'2002' ,'2007' ,'2008' ,'2003' ,'2006' ,'2009' ,
          '2010' ,'2013' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 31147.524631;
        END;
      END;
    END;
  END;

********** LEAF   117  NODE   569 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2002' ,'2003' ,'2006' ,'2007' ,
    '2009' ,'2010' ,'2013' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2004' ,'2012' ,'2011' ,'2001' ,'2005' ,'2008' ,'2002' ,'2003' ,
      '2006' ,'2007' ,'2009' ,'2010' ,'2013' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 150190.67061;
      END;
    END;
  END;

********** LEAF   118  NODE   575 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2012' ,'2002' ,'2003' ,'2006' ,
    '2007' ,'2009' ,'2011' ,'2013' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2004' ,'2012' ,'2002' ,'2003' ,'2006' ,'2007' ,'2009' ,
      '2011' ,'2013' ,'2005' ,'2008' ,'2010' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('2000' ,'2004' ,'2002' ,'2003' ,'2013' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -39282.38122;
      END;
    END;
  END;

********** LEAF   119  NODE   577 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2012' ,'2002' ,'2003' ,'2006' ,
    '2007' ,'2009' ,'2011' ,'2013' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2004' ,'2012' ,'2002' ,'2003' ,'2006' ,'2007' ,'2009' ,
      '2011' ,'2013' ,'2005' ,'2008' ,'2010' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('2001' ,'2012' ,'2006' ,'2007' ,'2009' ,'2011' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2004' ,'2002' ,'2003' ,'2013' ,'2001' ,'2012' ,'2006' ,
        '2007' ,'2009' ,'2011' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
            IF _ARBFMT_10 IN ('2001' ,'2012' ,'2006' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('2007' ,'2009' ,'2011' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('BOTH SEXES' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -27957.00274;
        END;
      END;
    END;
  END;

********** LEAF   120  NODE   578 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2012' ,'2002' ,'2003' ,'2006' ,
    '2007' ,'2009' ,'2011' ,'2013' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2004' ,'2012' ,'2002' ,'2003' ,'2006' ,'2007' ,'2009' ,
      '2011' ,'2013' ,'2005' ,'2008' ,'2010' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('2001' ,'2012' ,'2006' ,'2007' ,'2009' ,'2011' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2000' ,'2004' ,'2002' ,'2003' ,'2013' ,'2001' ,'2012' ,'2006' ,
        '2007' ,'2009' ,'2011' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
            IF _ARBFMT_10 IN ('2007' ,'2009' ,'2011' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('2001' ,'2012' ,'2006' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('BOTH SEXES' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 51295.061633;
        END;
      END;
    END;
  END;

********** LEAF   121  NODE   574 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2005' ,'2008' ,'2010' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 78288.978901;
    END;
  END;

********** LEAF   122  NODE   582 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2000' ,'2012' ,'2003' ,'2007' ,'2010' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('2012' ,'2003' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'2007' ,'2010' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -19345.06349;
      END;
    END;
  END;

********** LEAF   123  NODE   583 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2000' ,'2012' ,'2003' ,'2007' ,'2010' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('2000' ,'2007' ,'2010' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2012' ,'2003' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 164818.46723;
      END;
    END;
  END;

********** LEAF   124  NODE   584 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2002' ,'2006' ,'2009' ,
    '2011' ,'2013' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2012' ,'2003' ,'2007' ,'2010' ,'2001' ,'2004' ,'2005' ,'2008' ,
      '2002' ,'2006' ,'2009' ,'2011' ,'2013' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 16171.177277;
      END;
    END;
  END;

********** LEAF   125  NODE   586 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2002' ,'2006' ,'2009' ,
    '2011' ,'2013' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2012' ,'2003' ,'2007' ,'2010' ,'2001' ,'2004' ,'2005' ,'2008' ,
      '2002' ,'2006' ,'2009' ,'2011' ,'2013' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Gender  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'BOTH SEXES' ,'MALE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('2006' ,'2011' ,'2013' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2002' ,
            '2009' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -17300.00473;
        END;
      END;
    END;
  END;

********** LEAF   126  NODE   587 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2002' ,'2006' ,'2009' ,
    '2011' ,'2013' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2012' ,'2003' ,'2007' ,'2010' ,'2001' ,'2004' ,'2005' ,'2008' ,
      '2002' ,'2006' ,'2009' ,'2011' ,'2013' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Gender  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'BOTH SEXES' ,'MALE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2002' ,'2009' 
             ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('2006' ,'2011' ,'2013' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -129367.5572;
        END;
      END;
    END;
  END;

********** LEAF   127  NODE   593 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2000' ,'2004' ,'2005' ,'2008' ,'2002' ,'2003' ,'2006' ,
    '2009' ,'2011' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2004' ,'2005' ,'2008' ,'2002' ,'2003' ,'2006' ,'2009' ,'2011' ,
      '2001' ,'2012' ,'2007' ,'2010' ,'2013' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

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
        IF _ARBFMT_10 IN ('2000' ,'2005' ,'2008' ,'2002' ) THEN DO;
         _BRANCH_ =    1; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 15748.599125;
        END;
      END;
    END;
  END;

********** LEAF   128  NODE   594 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2000' ,'2004' ,'2005' ,'2008' ,'2002' ,'2003' ,'2006' ,
    '2009' ,'2011' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2004' ,'2005' ,'2008' ,'2002' ,'2003' ,'2006' ,'2009' ,'2011' ,
      '2001' ,'2012' ,'2007' ,'2010' ,'2013' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

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
        IF _ARBFMT_10 IN ('2004' ,'2003' ,'2006' ,'2009' ,'2011' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_10 NOTIN (
          '2000' ,'2005' ,'2008' ,'2002' ,'2004' ,'2003' ,'2006' ,'2009' ,
          '2011' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -41003.69348;
        END;
      END;
    END;
  END;

********** LEAF   129  NODE   592 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2000' ,'2004' ,'2005' ,'2008' ,'2002' ,'2003' ,'2006' ,
    '2009' ,'2011' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2004' ,'2005' ,'2008' ,'2002' ,'2003' ,'2006' ,'2009' ,'2011' ,
      '2001' ,'2012' ,'2007' ,'2010' ,'2013' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 128268.91325;
      END;
    END;
  END;

********** LEAF   130  NODE   590 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2012' ,'2007' ,'2010' ,'2013' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -91449.68865;
    END;
  END;

********** LEAF   131  NODE   598 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2000' ,'2001' ,'2003' ,'2006' ,'2007' ,'2010' ,'2011' )
     THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '2000' ,'2001' ,'2003' ,'2006' ,'2007' ,'2010' ,'2011' ,'2004' ,'2005' ,
    '2008' ,'2012' ,'2002' ,'2009' ,'2013' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2003' ,'2006' ,'2007' ,'2010' ,'2011' ,'2004' ,'2005' ,
      '2008' ,'2012' ,'2002' ,'2009' ,'2013' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('2000' ,'2001' ,'2007' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2003' ,'2006' ,'2010' ,'2011' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -13699.69585;
      END;
    END;
  END;

********** LEAF   132  NODE   599 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2000' ,'2001' ,'2003' ,'2006' ,'2007' ,'2010' ,'2011' )
     THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '2000' ,'2001' ,'2003' ,'2006' ,'2007' ,'2010' ,'2011' ,'2004' ,'2005' ,
    '2008' ,'2012' ,'2002' ,'2009' ,'2013' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('FEMALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2003' ,'2006' ,'2007' ,'2010' ,'2011' ,'2004' ,'2005' ,
      '2008' ,'2012' ,'2002' ,'2009' ,'2013' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('2003' ,'2006' ,'2010' ,'2011' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2007' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 102851.89138;
      END;
    END;
  END;

********** LEAF   133  NODE   600 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2012' ,'2002' ,'2009' ,'2013' )
     THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '2000' ,'2001' ,'2003' ,'2006' ,'2007' ,'2010' ,'2011' ,'2004' ,'2005' ,
    '2008' ,'2012' ,'2002' ,'2009' ,'2013' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_19 IN ('16 TO 24' ,'65+' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2004' ,'2012' ,'2002' ,'2013' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2004' ,'2012' ,'2002' ,'2013' ,'2005' ,'2008' ,'2009' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('25 TO 44' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('BOTH SEXES' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2004' ,'2012' ,'2002' ,'2013' ,'2005' ,'2008' ,'2009' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -23688.94315;
      END;
    END;
  END;

********** LEAF   134  NODE   601 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2012' ,'2002' ,'2009' ,'2013' )
     THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '2000' ,'2001' ,'2003' ,'2006' ,'2007' ,'2010' ,'2011' ,'2004' ,'2005' ,
    '2008' ,'2012' ,'2002' ,'2009' ,'2013' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_19 IN ('16 TO 24' ,'65+' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2005' ,'2008' ,'2009' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2004' ,'2012' ,'2002' ,'2013' ,'2005' ,'2008' ,'2009' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('BOTH SEXES' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -85336.85657;
      END;
    END;
  END;

********** LEAF   135  NODE   605 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2002' ,'2003' ,'2006' ,
    '2007' ,'2013' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2004' ,'2008' ,'2002' ,'2003' ,'2006' ,'2007' ,'2013' ,
      '2005' ,'2012' ,'2009' ,'2010' ,'2011' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2006' ,'2007' ,
          '2013' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2002' ,'2003' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 3696.9630853;
      END;
    END;
  END;

********** LEAF   136  NODE   606 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2002' ,'2003' ,'2006' ,
    '2007' ,'2013' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2004' ,'2008' ,'2002' ,'2003' ,'2006' ,'2007' ,'2013' ,
      '2005' ,'2012' ,'2009' ,'2010' ,'2011' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('2002' ,'2003' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2006' ,
          '2007' ,'2013' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('BOTH SEXES' ,'MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 116940.90226;
      END;
    END;
  END;

********** LEAF   137  NODE   607 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2005' ,'2012' ,'2009' ,'2010' ,'2011' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('2005' ,'2010' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2005' ,'2010' ,'2012' ,'2009' ,'2011' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('65+' ,'45 TO 64' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -16652.91099;
      END;
    END;
  END;

********** LEAF   138  NODE   608 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2005' ,'2012' ,'2009' ,'2010' ,'2011' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('2012' ,'2009' ,'2011' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2005' ,'2010' ,'2012' ,'2009' ,'2011' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('65+' ,'45 TO 64' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'BOTH SEXES' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2005' ,'2010' ,'2012' ,'2009' ,'2011' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -84341.77111;
      END;
    END;
  END;

********** LEAF   139  NODE   612 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2000' ,'2001' ,'2005' ,'2008' ,'2002' ,'2003' ,'2007' ,
    '2009' ,'2013' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2005' ,'2008' ,'2002' ,'2003' ,'2007' ,'2009' ,'2013' ,
      '2004' ,'2012' ,'2006' ,'2010' ,'2011' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'25 TO 44' ,'65+' ,'45 TO 64' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2002' ,'2009' ,'2013' ) 
           THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'2003' ,'2007' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('BOTH SEXES' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'25 TO 44' ,'65+' ,'45 TO 64' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 16897.53743;
      END;
    END;
  END;

********** LEAF   140  NODE   613 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2000' ,'2001' ,'2005' ,'2008' ,'2002' ,'2003' ,'2007' ,
    '2009' ,'2013' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '2000' ,'2001' ,'2005' ,'2008' ,'2002' ,'2003' ,'2007' ,'2009' ,'2013' ,
      '2004' ,'2012' ,'2006' ,'2010' ,'2011' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ,'45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'25 TO 44' ,'65+' ,'45 TO 64' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('2000' ,'2003' ,'2007' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2002' ,'2009' ,
          '2013' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('BOTH SEXES' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -90087.0394;
      END;
    END;
  END;

********** LEAF   141  NODE   614 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2004' ,'2012' ,'2006' ,'2010' ,'2011' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('2004' ,'2012' ,'2010' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2006' ,'2011' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('BOTH SEXES' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 5815.6423296;
      END;
    END;
  END;

********** LEAF   142  NODE   615 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2004' ,'2012' ,'2006' ,'2010' ,'2011' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'25 TO 44' ,'45 TO 64' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('2006' ,'2011' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2004' ,'2012' ,'2010' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('BOTH SEXES' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 192338.2185;
      END;
    END;
  END;
P_Sum_Labor_Force_Pop  = _ARB_F_;

*****  RESIDUALS R_ *************;
IF MISSING( Sum_Labor_Force_Pop ) THEN R_Sum_Labor_Force_Pop  = .;
ELSE R_Sum_Labor_Force_Pop  = Sum_Labor_Force_Pop  - P_Sum_Labor_Force_Pop ;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

