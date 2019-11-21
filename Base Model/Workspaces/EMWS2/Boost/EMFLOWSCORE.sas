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
     _ARB_F_ = 6735625;
     _ARB_BADF_ = 0;
******             ASSIGN OBSERVATION TO NODE             ******;
 DROP _ARB_P_;
 _ARB_P_ = 0;
 DROP _ARB_PPATH_; _ARB_PPATH_ = 1;

********** LEAF     1  NODE   376 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2009' ,
        '2010' ,'2011' ,'2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2002' ,'2003' ,'2006' ,'2012' 
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

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -317201.1364;
      END;
    END;
  END;

********** LEAF     2  NODE   377 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2009' ,
        '2010' ,'2011' ,'2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2002' ,'2003' ,'2006' ,'2012' 
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
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -559721.822;
      END;
    END;
  END;

********** LEAF     3  NODE   378 ***************;
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
        IF _ARBFMT_10 IN ('2000' ,'2002' ,'2003' ,'2006' ,'2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,
        '2009' ,'2010' ,'2011' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2007' ,'2011' ,'2013' ,'2002' ,'2003' ,'2012' ) THEN 
        DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2007' ,'2011' ,'2013' ,'2002' ,'2003' ,'2012' ,'2004' ,'2009' ,
        '2010' ,'2000' ,'2006' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 482005.24194;
      END;
    END;
  END;

********** LEAF     4  NODE   379 ***************;
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
        IF _ARBFMT_10 IN ('2000' ,'2002' ,'2003' ,'2006' ,'2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,
        '2009' ,'2010' ,'2011' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2004' ,'2009' ,'2010' ,'2000' ,'2006' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 159269.93243;
      END;
    END;
  END;

********** LEAF     5  NODE   383 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2009' ,'2010' ,
        '2011' ,'2013' ,'2006' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2007' ,'2000' ,'2002' ,'2003' ,'2012' 
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
          IF _ARBFMT_10 IN ('2005' ,'2007' ,'2008' ,'2010' ,'2000' ,'2003' ,
          '2006' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2009' ,'2011' ,'2013' ,
          '2002' ,'2012' 
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
       _ARB_F_ + -285963.8149;
      END;
    END;
  END;

********** LEAF     6  NODE   384 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2009' ,'2010' ,
        '2011' ,'2013' ,'2006' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2007' ,'2000' ,'2002' ,'2003' ,'2012' 
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
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2009' ,'2011' ,'2013' ,'2002' ,
          '2012' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2005' ,'2007' ,'2008' ,'2010' ,'2000' ,
          '2003' ,'2006' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -510370.6749;
      END;
    END;
  END;

********** LEAF     7  NODE   385 ***************;
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
        IF _ARBFMT_10 IN ('2007' ,'2000' ,'2002' ,'2003' ,'2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2009' ,
        '2010' ,'2011' ,'2013' ,'2006' 
        ) THEN _BRANCH_ = 0; 
      END;
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
       _ARB_F_ + 440725.83741;
      END;
    END;
  END;

********** LEAF     8  NODE   386 ***************;
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
        IF _ARBFMT_10 IN ('2007' ,'2000' ,'2002' ,'2003' ,'2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2009' ,
        '2010' ,'2011' ,'2013' ,'2006' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('45 TO 64' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 248001.54546;
      END;
    END;
  END;

********** LEAF     9  NODE   390 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2009' ,
        '2010' ,'2011' ,'2013' ,'2006' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2002' ,'2003' ,'2012' 
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
          IF _ARBFMT_10 IN ('2005' ,'2010' ,'2000' ,'2003' ,'2012' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2007' ,'2008' ,'2009' ,
          '2011' ,'2013' ,'2002' ,'2006' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -273411.2223;
      END;
    END;
  END;

********** LEAF    10  NODE   391 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2009' ,
        '2010' ,'2011' ,'2013' ,'2006' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2002' ,'2003' ,'2012' 
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
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2007' ,'2008' ,'2009' ,'2011' ,
          '2013' ,'2002' ,'2006' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2005' ,'2010' ,'2000' ,'2003' ,'2012' 
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
       _ARB_F_ + -463105.7927;
      END;
    END;
  END;

********** LEAF    11  NODE   392 ***************;
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
        IF _ARBFMT_10 IN ('2000' ,'2002' ,'2003' ,'2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,
        '2009' ,'2010' ,'2011' ,'2013' ,'2006' 
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
          IF _ARBFMT_10 IN ('2005' ,'2007' ,'2013' ,'2000' ,'2002' ,'2006' ) 
           THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2004' ,'2008' ,'2009' ,'2010' ,'2011' ,
          '2003' ,'2012' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 597758.63533;
      END;
    END;
  END;

********** LEAF    12  NODE   393 ***************;
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
        IF _ARBFMT_10 IN ('2000' ,'2002' ,'2003' ,'2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,
        '2009' ,'2010' ,'2011' ,'2013' ,'2006' 
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
          IF _ARBFMT_10 IN ('2004' ,'2008' ,'2009' ,'2010' ,'2011' ,'2003' ,
          '2012' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2005' ,'2007' ,'2013' ,'2000' ,'2002' ,
          '2006' 
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
       _ARB_F_ + 217057.70426;
      END;
    END;
  END;

********** LEAF    13  NODE   397 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2009' ,'2010' ,'2013' ,
        '2000' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2004' ,'2007' ,'2011' ,'2002' ,'2003' ,
        '2006' ,'2012' 
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
          IF _ARBFMT_10 IN ('2005' ,'2008' ,'2013' ,'2000' ,'2003' ,'2012' ) 
           THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2007' ,'2009' ,'2010' ,'2011' ,
          '2002' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -219159.7846;
      END;
    END;
  END;

********** LEAF    14  NODE   398 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2009' ,'2010' ,'2013' ,
        '2000' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2004' ,'2007' ,'2011' ,'2002' ,'2003' ,
        '2006' ,'2012' 
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
          IF _ARBFMT_10 IN ('2001' ,'2007' ,'2009' ,'2010' ,'2011' ,'2002' ) 
           THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2005' ,'2008' ,'2013' ,'2000' ,'2003' ,
          '2012' 
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
       _ARB_F_ + -407106.822;
      END;
    END;
  END;

********** LEAF    15  NODE   399 ***************;
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
        IF _ARBFMT_10 IN ('2004' ,'2007' ,'2011' ,'2002' ,'2003' ,'2006' ,
        '2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2009' ,'2010' ,
        '2013' ,'2000' 
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
          IF _ARBFMT_10 IN ('2004' ,'2007' ,'2010' ,'2011' ,'2013' ,'2000' ,
          '2002' ,'2006' ,'2012' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2008' ,'2009' ,'2003' 
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
       _ARB_F_ + 393685.64442;
      END;
    END;
  END;

********** LEAF    16  NODE   400 ***************;
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
        IF _ARBFMT_10 IN ('2004' ,'2007' ,'2011' ,'2002' ,'2003' ,'2006' ,
        '2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2009' ,'2010' ,
        '2013' ,'2000' 
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
          IF _ARBFMT_10 IN ('2008' ,'2009' ,'2003' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2004' ,'2007' ,'2010' ,'2011' ,'2013' ,
          '2000' ,'2002' ,'2006' ,'2012' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 179883.28919;
      END;
    END;
  END;

********** LEAF    17  NODE   404 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2007' ,'2008' ,'2011' ,'2013' ,
        '2012' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2004' ,'2009' ,'2010' ,'2000' ,'2002' ,
        '2003' ,'2006' 
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
          IF _ARBFMT_10 IN ('2005' ,'2008' ,'2013' ,'2000' ,'2003' ,'2012' ) 
           THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2007' ,'2009' ,'2010' ,
          '2011' ,'2006' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -175033.135;
      END;
    END;
  END;

********** LEAF    18  NODE   405 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2007' ,'2008' ,'2011' ,'2013' ,
        '2012' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2004' ,'2009' ,'2010' ,'2000' ,'2002' ,
        '2003' ,'2006' 
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
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2007' ,'2009' ,'2010' ,'2011' ,
          '2006' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2005' ,'2008' ,'2013' ,'2000' ,'2003' ,
          '2012' 
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
       _ARB_F_ + -371588.1292;
      END;
    END;
  END;

********** LEAF    19  NODE   406 ***************;
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
        IF _ARBFMT_10 IN ('2004' ,'2009' ,'2010' ,'2000' ,'2002' ,'2003' ,
        '2006' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2007' ,'2008' ,'2011' ,
        '2013' ,'2012' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2004' ,'2009' ,'2010' ,'2011' ,'2002' ,'2006' ,
      '2012' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2004' ,'2009' ,'2010' ,'2011' ,'2002' ,'2006' ,'2012' ,'2001' ,
        '2007' ,'2013' ,'2000' ,'2003' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 186868.39954;
      END;
    END;
  END;

********** LEAF    20  NODE   407 ***************;
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
        IF _ARBFMT_10 IN ('2004' ,'2009' ,'2010' ,'2000' ,'2002' ,'2003' ,
        '2006' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2007' ,'2008' ,'2011' ,
        '2013' ,'2012' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2001' ,'2007' ,'2013' ,'2000' ,'2003' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 475143.49948;
      END;
    END;
  END;

********** LEAF    21  NODE   411 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2010' ,'2011' ,
        '2013' ,'2006' ,'2012' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2007' ,'2009' ,'2000' ,'2002' ,'2003' 
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
          IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2010' ,'2013' ,'2000' ,
          '2003' ,'2006' ,'2012' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2004' ,'2007' ,'2009' ,'2011' 
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
       _ARB_F_ + -178580.3275;
      END;
    END;
  END;

********** LEAF    22  NODE   412 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2010' ,'2011' ,
        '2013' ,'2006' ,'2012' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2007' ,'2009' ,'2000' ,'2002' ,'2003' 
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
          IF _ARBFMT_10 IN ('2004' ,'2007' ,'2009' ,'2011' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2010' ,'2013' ,
          '2000' ,'2003' ,'2006' ,'2012' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -347314.3524;
      END;
    END;
  END;

********** LEAF    23  NODE   413 ***************;
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
        IF _ARBFMT_10 IN ('2007' ,'2009' ,'2000' ,'2002' ,'2003' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2010' ,
        '2011' ,'2013' ,'2006' ,'2012' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2004' ,'2007' ,'2012' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2004' ,'2007' ,'2012' ,'2009' ,'2010' ,'2011' ,'2013' ,'2000' ,
        '2002' ,'2003' ,'2006' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 583274.23473;
      END;
    END;
  END;

********** LEAF    24  NODE   414 ***************;
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
        IF _ARBFMT_10 IN ('2007' ,'2009' ,'2000' ,'2002' ,'2003' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2010' ,
        '2011' ,'2013' ,'2006' ,'2012' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2009' ,'2010' ,'2011' ,'2013' ,'2000' ,'2002' ,
      '2003' ,'2006' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 167996.36151;
      END;
    END;
  END;

********** LEAF    25  NODE   418 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2009' ,'2010' ,
        '2011' ,'2013' ,'2006' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2007' ,'2000' ,'2002' ,'2003' ,'2012' 
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
          IF _ARBFMT_10 IN ('2005' ,'2013' ,'2000' ,'2003' ,'2012' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2004' ,'2008' ,'2009' ,'2010' ,'2011' ,
          '2002' ,'2006' 
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
       _ARB_F_ + -182835.2502;
      END;
    END;
  END;

********** LEAF    26  NODE   419 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2009' ,'2010' ,
        '2011' ,'2013' ,'2006' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2007' ,'2000' ,'2002' ,'2003' ,'2012' 
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
          IF _ARBFMT_10 IN ('2004' ,'2008' ,'2009' ,'2010' ,'2011' ,'2002' ,
          '2006' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2005' ,'2013' ,'2000' ,'2003' ,'2012' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -297545.5868;
      END;
    END;
  END;

********** LEAF    27  NODE   420 ***************;
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
        IF _ARBFMT_10 IN ('2007' ,'2000' ,'2002' ,'2003' ,'2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2009' ,
        '2010' ,'2011' ,'2013' ,'2006' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2007' ,'2008' ,'2011' ,'2012' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2007' ,'2008' ,'2011' ,'2012' ,'2004' ,'2009' ,'2010' ,'2013' ,
        '2000' ,'2002' ,'2003' ,'2006' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 418303.28422;
      END;
    END;
  END;

********** LEAF    28  NODE   421 ***************;
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
        IF _ARBFMT_10 IN ('2007' ,'2000' ,'2002' ,'2003' ,'2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2009' ,
        '2010' ,'2011' ,'2013' ,'2006' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2004' ,'2009' ,'2010' ,'2013' ,'2000' ,'2002' ,
      '2003' ,'2006' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 86555.117457;
      END;
    END;
  END;

********** LEAF    29  NODE   425 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2009' ,'2010' ,'2011' ,
        '2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2004' ,'2007' ,'2000' ,'2002' ,'2003' ,
        '2006' ,'2012' 
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
          IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2013' ,'2003' ,'2006' ,
          '2012' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2007' ,'2009' ,'2010' ,'2011' ,'2000' 
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
       _ARB_F_ + -136724.8021;
      END;
    END;
  END;

********** LEAF    30  NODE   426 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2009' ,'2010' ,'2011' ,
        '2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2004' ,'2007' ,'2000' ,'2002' ,'2003' ,
        '2006' ,'2012' 
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
          IF _ARBFMT_10 IN ('2007' ,'2009' ,'2010' ,'2011' ,'2000' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2013' ,'2003' ,
          '2006' ,'2012' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -274697.182;
      END;
    END;
  END;

********** LEAF    31  NODE   427 ***************;
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
        IF _ARBFMT_10 IN ('2004' ,'2007' ,'2000' ,'2002' ,'2003' ,'2006' ,
        '2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2009' ,'2010' ,
        '2011' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2009' ,'2010' ,'2000' ,
      '2002' ,'2006' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2001' ,'2004' ,'2005' ,'2009' ,'2010' ,'2000' ,'2002' ,'2006' ,
        '2007' ,'2008' ,'2011' ,'2013' ,'2003' ,'2012' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 73083.73408;
      END;
    END;
  END;

********** LEAF    32  NODE   428 ***************;
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
        IF _ARBFMT_10 IN ('2004' ,'2007' ,'2000' ,'2002' ,'2003' ,'2006' ,
        '2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2009' ,'2010' ,
        '2011' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2007' ,'2008' ,'2011' ,'2013' ,'2003' ,'2012' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 413886.15373;
      END;
    END;
  END;

********** LEAF    33  NODE   434 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2009' ,
        '2010' ,'2011' ,'2013' ,'2000' ,'2003' ,'2006' ,'2012' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2002' 
        ) THEN _BRANCH_ = 0; 
      END;
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
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'45 TO 64' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2009' ,
          '2010' ,'2011' ,'2013' ,'2000' ,'2002' ,'2003' ,'2012' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2006' 
          ) THEN _BRANCH_ = 0; 
        END;
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
        IF _ARBFMT_10 IN ('2013' ,'2003' ,'2012' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          '2013' ,'2003' ,'2012' ,'2001' ,'2004' ,'2005' ,'2007' ,'2009' ,
          '2010' ,'2011' ,'2000' ,'2002' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -16446.61787;
        END;
      END;
    END;
  END;

********** LEAF    34  NODE   435 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2009' ,
        '2010' ,'2011' ,'2013' ,'2000' ,'2003' ,'2006' ,'2012' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2002' 
        ) THEN _BRANCH_ = 0; 
      END;
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
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'45 TO 64' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2009' ,
          '2010' ,'2011' ,'2013' ,'2000' ,'2002' ,'2003' ,'2012' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2006' 
          ) THEN _BRANCH_ = 0; 
        END;
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
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2009' ,'2010' ,
        '2011' ,'2000' ,'2002' ) THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -159463.0596;
        END;
      END;
    END;
  END;

********** LEAF    35  NODE   433 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2009' ,
        '2010' ,'2011' ,'2013' ,'2000' ,'2003' ,'2006' ,'2012' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2002' 
        ) THEN _BRANCH_ = 0; 
      END;
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
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'45 TO 64' ,'65+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2006' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,
          '2009' ,'2010' ,'2011' ,'2013' ,'2000' ,'2002' ,'2003' ,'2012' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -241917.4638;
      END;
    END;
  END;

********** LEAF    36  NODE   431 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2002' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,
        '2009' ,'2010' ,'2011' ,'2013' ,'2000' ,'2003' ,'2006' ,'2012' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 348894.93857;
    END;
  END;

********** LEAF    37  NODE   439 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2009' ,'2010' ,
        '2011' ,'2013' ,'2000' ,'2006' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2007' ,'2002' ,'2003' ,'2012' 
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
          IF _ARBFMT_10 IN ('2005' ,'2008' ,'2010' ,'2013' ,'2000' ,'2012' ) 
           THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2007' ,'2009' ,'2011' ,
          '2003' ,'2006' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -112977.7077;
      END;
    END;
  END;

********** LEAF    38  NODE   440 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2009' ,'2010' ,
        '2011' ,'2013' ,'2000' ,'2006' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2007' ,'2002' ,'2003' ,'2012' 
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
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2007' ,'2009' ,'2011' ,'2003' ,
          '2006' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2005' ,'2008' ,'2010' ,'2013' ,'2000' ,
          '2012' 
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
       _ARB_F_ + -213418.9378;
      END;
    END;
  END;

********** LEAF    39  NODE   441 ***************;
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
        IF _ARBFMT_10 IN ('2007' ,'2002' ,'2003' ,'2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2009' ,
        '2010' ,'2011' ,'2013' ,'2000' ,'2006' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2001' ,'2004' ,'2007' ,'2009' ,'2011' ,'2000' ) THEN 
        DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2001' ,'2004' ,'2007' ,'2009' ,'2011' ,'2000' ,'2005' ,'2010' ,'2003' ,
      '2006' ,'2012' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('45 TO 64' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2001' ,'2004' ,'2007' ,'2009' ,'2011' ,'2000' ,'2005' ,'2010' ,
        '2003' ,'2006' ,'2012' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 474263.20352;
      END;
    END;
  END;

********** LEAF    40  NODE   442 ***************;
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
        IF _ARBFMT_10 IN ('2007' ,'2002' ,'2003' ,'2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2009' ,
        '2010' ,'2011' ,'2013' ,'2000' ,'2006' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2005' ,'2010' ,'2003' ,'2006' ,'2012' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2001' ,'2004' ,'2007' ,'2009' ,'2011' ,'2000' ,'2005' ,'2010' ,'2003' ,
      '2006' ,'2012' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('45 TO 64' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('25 TO 44' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 79157.330614;
      END;
    END;
  END;

********** LEAF    41  NODE   446 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2009' ,'2010' ,'2011' ,
        '2013' ,'2000' ,'2006' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2004' ,'2007' ,'2002' ,'2003' ,'2012' 
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
          IF _ARBFMT_10 IN ('2005' ,'2008' ,'2010' ,'2011' ,'2013' ,'2000' ,
          '2012' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2007' ,'2009' ,'2003' ,
          '2006' 
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
       _ARB_F_ + -119861.9917;
      END;
    END;
  END;

********** LEAF    42  NODE   447 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2009' ,'2010' ,'2011' ,
        '2013' ,'2000' ,'2006' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2004' ,'2007' ,'2002' ,'2003' ,'2012' 
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
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2007' ,'2009' ,'2003' ,'2006' ) 
           THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2005' ,'2008' ,'2010' ,'2011' ,'2013' ,
          '2000' ,'2012' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -200657.8236;
      END;
    END;
  END;

********** LEAF    43  NODE   448 ***************;
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
        IF _ARBFMT_10 IN ('2004' ,'2007' ,'2002' ,'2003' ,'2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2009' ,'2010' ,
        '2011' ,'2013' ,'2000' ,'2006' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2004' ,'2008' ,'2010' ,'2011' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2004' ,'2008' ,'2010' ,'2011' ,'2007' ,'2009' ,'2013' ,'2000' ,
        '2002' ,'2003' ,'2012' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 294597.16181;
      END;
    END;
  END;

********** LEAF    44  NODE   449 ***************;
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
        IF _ARBFMT_10 IN ('2004' ,'2007' ,'2002' ,'2003' ,'2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2009' ,'2010' ,
        '2011' ,'2013' ,'2000' ,'2006' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2007' ,'2009' ,'2013' ,'2000' ,'2002' ,'2003' ,
      '2012' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 123687.37;
      END;
    END;
  END;

********** LEAF    45  NODE   453 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2009' ,'2010' ,'2011' ,
        '2013' ,'2000' ,'2012' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2004' ,'2007' ,'2002' ,'2003' ,'2006' 
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
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2000' ,'2006' ,'2012' ) 
           THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2008' ,'2009' ,'2010' ,'2011' ,'2013' ,
          '2002' ,'2003' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -89075.94902;
      END;
    END;
  END;

********** LEAF    46  NODE   454 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2009' ,'2010' ,'2011' ,
        '2013' ,'2000' ,'2012' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2004' ,'2007' ,'2002' ,'2003' ,'2006' 
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
          IF _ARBFMT_10 IN ('2008' ,'2009' ,'2010' ,'2011' ,'2013' ,'2002' ,
          '2003' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2000' ,'2006' ,
          '2012' 
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
       _ARB_F_ + -175705.5413;
      END;
    END;
  END;

********** LEAF    47  NODE   455 ***************;
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
        IF _ARBFMT_10 IN ('2004' ,'2007' ,'2002' ,'2003' ,'2006' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2009' ,'2010' ,
        '2011' ,'2013' ,'2000' ,'2012' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2001' ,'2004' ,'2007' ,'2000' ,'2003' ,'2012' ) THEN 
        DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 286572.16524;
      END;
    END;
  END;

********** LEAF    48  NODE   456 ***************;
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
        IF _ARBFMT_10 IN ('2004' ,'2007' ,'2002' ,'2003' ,'2006' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2009' ,'2010' ,
        '2011' ,'2013' ,'2000' ,'2012' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2005' ,'2009' ,'2010' ,'2011' ,'2013' ,'2002' ,
      '2006' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2001' ,'2004' ,'2007' ,'2000' ,'2003' ,'2012' ,'2005' ,'2009' ,
        '2010' ,'2011' ,'2013' ,'2002' ,'2006' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 2092.6559952;
      END;
    END;
  END;

********** LEAF    49  NODE   460 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2007' ,'2008' ,'2009' ,'2010' ,
        '2011' ,'2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2004' ,'2000' ,'2002' ,'2003' ,'2006' ,
        '2012' 
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
          IF _ARBFMT_10 IN ('2005' ,'2008' ,'2010' ,'2000' ,'2003' ,'2012' ) 
           THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2007' ,'2009' ,'2011' ,
          '2013' ,'2006' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -79066.31576;
      END;
    END;
  END;

********** LEAF    50  NODE   461 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2007' ,'2008' ,'2009' ,'2010' ,
        '2011' ,'2013' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2004' ,'2000' ,'2002' ,'2003' ,'2006' ,
        '2012' 
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
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2007' ,'2009' ,'2011' ,'2013' ,
          '2006' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2005' ,'2008' ,'2010' ,'2000' ,'2003' ,
          '2012' 
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
       _ARB_F_ + -149901.0586;
      END;
    END;
  END;

********** LEAF    51  NODE   462 ***************;
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
        IF _ARBFMT_10 IN ('2004' ,'2000' ,'2002' ,'2003' ,'2006' ,'2012' ) 
         THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2007' ,'2008' ,'2009' ,
        '2010' ,'2011' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2004' ,'2005' ,'2009' ,'2011' ,'2013' ,'2003' ,
      '2012' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2004' ,'2005' ,'2009' ,'2011' ,'2013' ,'2003' ,'2012' ,'2007' ,'2008' ,
      '2010' ,'2000' ,'2002' ,'2006' 
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
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2004' ,'2005' ,'2009' ,'2011' ,'2013' ,'2003' ,'2012' ,'2007' ,
        '2008' ,'2010' ,'2000' ,'2002' ,'2006' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 7252.3171065;
      END;
    END;
  END;

********** LEAF    52  NODE   463 ***************;
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
        IF _ARBFMT_10 IN ('2004' ,'2000' ,'2002' ,'2003' ,'2006' ,'2012' ) 
         THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2007' ,'2008' ,'2009' ,
        '2010' ,'2011' ,'2013' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2007' ,'2008' ,'2010' ,'2000' ,'2002' ,'2006' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2004' ,'2005' ,'2009' ,'2011' ,'2013' ,'2003' ,'2012' ,'2007' ,'2008' ,
      '2010' ,'2000' ,'2002' ,'2006' 
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

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 270991.54495;
      END;
    END;
  END;

********** LEAF    53  NODE   469 ***************;
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
      IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2010' ,'2013' ,'2000' ,
      '2002' ,'2003' ,'2006' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2001' ,'2004' ,'2005' ,'2010' ,'2013' ,'2000' ,'2002' ,'2003' ,
        '2006' ,'2007' ,'2008' ,'2009' ,'2011' ,'2012' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('2001' ,'2010' ,'2000' ,'2002' ) THEN DO;
         _BRANCH_ =    1; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -194936.5071;
        END;
      END;
    END;
  END;

********** LEAF    54  NODE   470 ***************;
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
      IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2010' ,'2013' ,'2000' ,
      '2002' ,'2003' ,'2006' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2001' ,'2004' ,'2005' ,'2010' ,'2013' ,'2000' ,'2002' ,'2003' ,
        '2006' ,'2007' ,'2008' ,'2009' ,'2011' ,'2012' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('2004' ,'2005' ,'2013' ,'2003' ,'2006' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_10 NOTIN (
          '2001' ,'2010' ,'2000' ,'2002' ,'2004' ,'2005' ,'2013' ,'2003' ,
          '2006' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -104620.7309;
        END;
      END;
    END;
  END;

********** LEAF    55  NODE   468 ***************;
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
      IF _ARBFMT_10 IN ('2007' ,'2008' ,'2009' ,'2011' ,'2012' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 5907.4737056;
      END;
    END;
  END;

********** LEAF    56  NODE   466 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 287245.80109;
    END;
  END;

********** LEAF    57  NODE   476 ***************;
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
      IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2013' ,'2000' ,
      '2002' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2001' ,'2004' ,'2005' ,'2008' ,'2013' ,'2000' ,'2002' ,'2007' ,'2009' ,
      '2010' ,'2011' ,'2003' ,'2006' ,'2012' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
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
        IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' ,'45 TO 64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
            IF _ARBFMT_10 IN ('2005' ,'2008' ,'2013' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2000' ,'2002' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -58966.00176;
        END;
      END;
    END;
  END;

********** LEAF    58  NODE   477 ***************;
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
      IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2013' ,'2000' ,
      '2002' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2001' ,'2004' ,'2005' ,'2008' ,'2013' ,'2000' ,'2002' ,'2007' ,'2009' ,
      '2010' ,'2011' ,'2003' ,'2006' ,'2012' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
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
        IF _ARBFMT_19 IN ('65+' ,'45 TO 64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' ,'45 TO 64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
            IF _ARBFMT_10 IN ('2001' ,'2004' ,'2000' ,'2002' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('2005' ,'2008' ,'2013' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '16 TO 24' ,'65+' ,'45 TO 64' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -196127.57;
        END;
      END;
    END;
  END;

********** LEAF    59  NODE   478 ***************;
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
      IF _ARBFMT_10 IN ('2007' ,'2009' ,'2010' ,'2011' ,'2003' ,'2006' ,
      '2012' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2001' ,'2004' ,'2005' ,'2008' ,'2013' ,'2000' ,'2002' ,'2007' ,'2009' ,
      '2010' ,'2011' ,'2003' ,'2006' ,'2012' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('65+' ,'45 TO 64' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('16 TO 24' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2001' ,'2004' ,'2005' ,'2008' ,'2013' ,'2000' ,'2002' ,'2007' ,
        '2009' ,'2010' ,'2011' ,'2003' ,'2006' ,'2012' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('2007' ,'2009' ,'2003' ,'2006' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          '2007' ,'2009' ,'2003' ,'2006' ,'2010' ,'2011' ,'2012' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 8592.4714438;
        END;
      END;
    END;
  END;

********** LEAF    60  NODE   479 ***************;
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
      IF _ARBFMT_10 IN ('2007' ,'2009' ,'2010' ,'2011' ,'2003' ,'2006' ,
      '2012' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '2001' ,'2004' ,'2005' ,'2008' ,'2013' ,'2000' ,'2002' ,'2007' ,'2009' ,
      '2010' ,'2011' ,'2003' ,'2006' ,'2012' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('65+' ,'45 TO 64' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('16 TO 24' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2001' ,'2004' ,'2005' ,'2008' ,'2013' ,'2000' ,'2002' ,'2007' ,
        '2009' ,'2010' ,'2011' ,'2003' ,'2006' ,'2012' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('2010' ,'2011' ,'2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -54919.97275;
        END;
      END;
    END;
  END;

********** LEAF    61  NODE   473 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 214801.6257;
    END;
  END;

********** LEAF    62  NODE   483 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2013' ,'2000' ,'2006' ) 
         THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2004' ,'2007' ,'2009' ,'2010' ,'2011' ,
        '2002' ,'2003' ,'2012' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2010' ,'2013' ,'2003' ) THEN 
        DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2001' ,'2005' ,'2008' ,'2010' ,'2013' ,'2003' ,'2004' ,'2007' ,
        '2009' ,'2011' ,'2000' ,'2006' ,'2012' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -53203.19668;
      END;
    END;
  END;

********** LEAF    63  NODE   484 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2013' ,'2000' ,'2006' ) 
         THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2004' ,'2007' ,'2009' ,'2010' ,'2011' ,
        '2002' ,'2003' ,'2012' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2004' ,'2007' ,'2009' ,'2011' ,'2000' ,'2006' ,
      '2012' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -130066.6795;
      END;
    END;
  END;

********** LEAF    64  NODE   485 ***************;
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
        IF _ARBFMT_10 IN ('2004' ,'2007' ,'2009' ,'2010' ,'2011' ,'2002' ,
        '2003' ,'2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2013' ,'2000' ,
        '2006' 
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
      IF _ARBFMT_10 IN ('2001' ,'2005' ,'2009' ,'2011' ,'2002' ,'2003' ,
      '2012' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 21470.445789;
      END;
    END;
  END;

********** LEAF    65  NODE   486 ***************;
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
        IF _ARBFMT_10 IN ('2004' ,'2007' ,'2009' ,'2010' ,'2011' ,'2002' ,
        '2003' ,'2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2013' ,'2000' ,
        '2006' 
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
      IF _ARBFMT_10 IN ('2004' ,'2007' ,'2010' ,'2013' ,'2000' ,'2006' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2001' ,'2005' ,'2009' ,'2011' ,'2002' ,'2003' ,'2012' ,'2004' ,
        '2007' ,'2010' ,'2013' ,'2000' ,'2006' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 321392.51845;
      END;
    END;
  END;

********** LEAF    66  NODE   490 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2007' ,'2008' ,'2011' ,'2012' ) THEN DO;
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
          IF _ARBFMT_10 IN ('2007' ,'2008' ,'2011' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2012' 
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
       _ARB_F_ + -97525.95268;
      END;
    END;
  END;

********** LEAF    67  NODE   491 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2007' ,'2008' ,'2011' ,'2012' ) THEN DO;
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
          IF _ARBFMT_10 IN ('2001' ,'2012' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2007' ,'2008' ,'2011' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 331824.43249;
      END;
    END;
  END;

********** LEAF    68  NODE   494 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2004' ,'2005' ,'2009' ,'2010' ,'2013' ,'2000' ,'2002' ,
    '2003' ,'2006' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2007' ,'2008' ,'2011' ,'2012' ,'2004' ,'2005' ,'2009' ,'2010' ,
      '2013' ,'2000' ,'2002' ,'2003' ,'2006' 
       ) THEN _BRANCH_ = 2;
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
          IF _ARBFMT_10 IN ('2005' ,'2009' ,'2010' ,'2000' ,'2002' ,'2003' ) 
           THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2004' ,'2013' ,'2006' 
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

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('2005' ,'2009' ,'2000' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          '2005' ,'2009' ,'2000' ,'2010' ,'2013' ,'2002' ,'2003' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -94971.49574;
        END;
      END;
    END;
  END;

********** LEAF    69  NODE   495 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2004' ,'2005' ,'2009' ,'2010' ,'2013' ,'2000' ,'2002' ,
    '2003' ,'2006' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2007' ,'2008' ,'2011' ,'2012' ,'2004' ,'2005' ,'2009' ,'2010' ,
      '2013' ,'2000' ,'2002' ,'2003' ,'2006' 
       ) THEN _BRANCH_ = 2;
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
          IF _ARBFMT_10 IN ('2005' ,'2009' ,'2010' ,'2000' ,'2002' ,'2003' ) 
           THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2004' ,'2013' ,'2006' 
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

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('2010' ,'2013' ,'2002' ,'2003' ) THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 59693.540313;
        END;
      END;
    END;
  END;

********** LEAF    70  NODE   493 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2004' ,'2005' ,'2009' ,'2010' ,'2013' ,'2000' ,'2002' ,
    '2003' ,'2006' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2007' ,'2008' ,'2011' ,'2012' ,'2004' ,'2005' ,'2009' ,'2010' ,
      '2013' ,'2000' ,'2002' ,'2003' ,'2006' 
       ) THEN _BRANCH_ = 2;
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
          IF _ARBFMT_10 IN ('2004' ,'2013' ,'2006' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2005' ,'2009' ,'2010' ,'2000' ,'2002' ,
          '2003' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -137206.2335;
      END;
    END;
  END;

********** LEAF    71  NODE   499 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2010' ,'2013' ,'2002' ,'2006' )
     THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '2001' ,'2004' ,'2005' ,'2010' ,'2013' ,'2002' ,'2006' ,'2007' ,'2008' ,
    '2009' ,'2011' ,'2000' ,'2003' ,'2012' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_19 IN ('65+' ,'25 TO 44' ,'45 TO 64' 
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
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2010' ,'2013' ,'2006' ) 
           THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2002' 
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
       _ARB_F_ + -71435.509;
      END;
    END;
  END;

********** LEAF    72  NODE   500 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2010' ,'2013' ,'2002' ,'2006' )
     THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '2001' ,'2004' ,'2005' ,'2010' ,'2013' ,'2002' ,'2006' ,'2007' ,'2008' ,
    '2009' ,'2011' ,'2000' ,'2003' ,'2012' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_19 IN ('65+' ,'25 TO 44' ,'45 TO 64' 
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
          IF _ARBFMT_10 IN ('2002' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2010' ,'2013' ,
          '2006' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -169560.728;
      END;
    END;
  END;

********** LEAF    73  NODE   501 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2007' ,'2008' ,'2009' ,'2011' ,'2000' ,'2003' ,'2012' )
     THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '2001' ,'2004' ,'2005' ,'2010' ,'2013' ,'2002' ,'2006' ,'2007' ,'2008' ,
    '2009' ,'2011' ,'2000' ,'2003' ,'2012' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('65+' ,'25 TO 44' ,'45 TO 64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_19 IN ('16 TO 24' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2004' ,'2005' ,'2010' ,'2013' ,'2002' ,'2006' ,'2007' ,'2008' ,
      '2009' ,'2011' ,'2000' ,'2003' ,'2012' 
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
          IF _ARBFMT_10 IN ('2008' ,'2009' ,'2011' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2007' ,'2000' ,'2003' ,'2012' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -68280.66613;
      END;
    END;
  END;

********** LEAF    74  NODE   502 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2007' ,'2008' ,'2009' ,'2011' ,'2000' ,'2003' ,'2012' )
     THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '2001' ,'2004' ,'2005' ,'2010' ,'2013' ,'2002' ,'2006' ,'2007' ,'2008' ,
    '2009' ,'2011' ,'2000' ,'2003' ,'2012' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('65+' ,'25 TO 44' ,'45 TO 64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_19 IN ('16 TO 24' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2004' ,'2005' ,'2010' ,'2013' ,'2002' ,'2006' ,'2007' ,'2008' ,
      '2009' ,'2011' ,'2000' ,'2003' ,'2012' 
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
          IF _ARBFMT_10 IN ('2007' ,'2000' ,'2003' ,'2012' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2008' ,'2009' ,'2011' 
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
       _ARB_F_ + 105647.84939;
      END;
    END;
  END;

********** LEAF    75  NODE   506 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2009' ,'2011' ,'2013' ,
        '2006' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2004' ,'2007' ,'2010' ,'2000' ,'2002' ,
        '2003' ,'2012' 
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
      IF _ARBFMT_10 IN ('2001' ,'2004' ,'2010' ,'2011' ,'2006' ,'2012' ) THEN 
        DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -106582.0974;
      END;
    END;
  END;

********** LEAF    76  NODE   507 ***************;
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
        IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2009' ,'2011' ,'2013' ,
        '2006' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2004' ,'2007' ,'2010' ,'2000' ,'2002' ,
        '2003' ,'2012' 
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
      IF _ARBFMT_10 IN ('2005' ,'2007' ,'2008' ,'2009' ,'2013' ,'2000' ,
      '2003' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2001' ,'2004' ,'2010' ,'2011' ,'2006' ,'2012' ,'2005' ,'2007' ,
        '2008' ,'2009' ,'2013' ,'2000' ,'2003' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -42634.10117;
      END;
    END;
  END;

********** LEAF    77  NODE   508 ***************;
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
        IF _ARBFMT_10 IN ('2004' ,'2007' ,'2010' ,'2000' ,'2002' ,'2003' ,
        '2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2009' ,'2011' ,
        '2013' ,'2006' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2010' ,'2000' ,'2002' ,'2012' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2010' ,'2000' ,'2002' ,'2012' ,'2004' ,'2007' ,'2009' ,'2011' ,
        '2013' ,'2003' ,'2006' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 32408.855163;
      END;
    END;
  END;

********** LEAF    78  NODE   509 ***************;
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
        IF _ARBFMT_10 IN ('2004' ,'2007' ,'2010' ,'2000' ,'2002' ,'2003' ,
        '2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2008' ,'2009' ,'2011' ,
        '2013' ,'2006' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2004' ,'2007' ,'2009' ,'2011' ,'2013' ,'2003' ,
      '2006' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 165279.09337;
      END;
    END;
  END;

********** LEAF    79  NODE   515 ***************;
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
      IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2009' ,'2011' ,'2000' ,
      '2002' ,'2006' ,'2012' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2001' ,'2004' ,'2005' ,'2009' ,'2011' ,'2000' ,'2002' ,'2006' ,
        '2012' ,'2007' ,'2008' ,'2010' ,'2013' ,'2003' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2002' ,'2006' ) THEN DO;
         _BRANCH_ =    1; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -117129.5709;
        END;
      END;
    END;
  END;

********** LEAF    80  NODE   516 ***************;
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
      IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2009' ,'2011' ,'2000' ,
      '2002' ,'2006' ,'2012' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2001' ,'2004' ,'2005' ,'2009' ,'2011' ,'2000' ,'2002' ,'2006' ,
        '2012' ,'2007' ,'2008' ,'2010' ,'2013' ,'2003' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('2005' ,'2009' ,'2011' ,'2000' ,'2012' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_10 NOTIN (
          '2001' ,'2004' ,'2002' ,'2006' ,'2005' ,'2009' ,'2011' ,'2000' ,
          '2012' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -62279.35221;
        END;
      END;
    END;
  END;

********** LEAF    81  NODE   514 ***************;
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
      IF _ARBFMT_10 IN ('2007' ,'2008' ,'2010' ,'2013' ,'2003' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 49541.925629;
      END;
    END;
  END;

********** LEAF    82  NODE   512 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 124196.09216;
    END;
  END;

********** LEAF    83  NODE   520 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2007' ,'2010' ,'2002' ,'2006' ,'2012' ) THEN 
        DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'45 TO 64' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'45 TO 64' ,'65+' ,'25 TO 44' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('2001' ,'2006' ,'2012' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2007' ,'2010' ,'2002' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -7878.378593;
      END;
    END;
  END;

********** LEAF    84  NODE   521 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2007' ,'2010' ,'2002' ,'2006' ,'2012' ) THEN 
        DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('65+' ,'25 TO 44' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'45 TO 64' ,'65+' ,'25 TO 44' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('2007' ,'2010' ,'2002' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2006' ,'2012' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'45 TO 64' ,'65+' ,'25 TO 44' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -168382.0772;
      END;
    END;
  END;

********** LEAF    85  NODE   524 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2009' ,'2011' ,'2013' ,'2000' ,
    '2003' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2007' ,'2010' ,'2002' ,'2006' ,'2012' ,'2004' ,'2005' ,'2008' ,
      '2009' ,'2011' ,'2013' ,'2000' ,'2003' 
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
          IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2009' ,'2011' ,'2013' ,
          '2000' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2003' 
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
            IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2013' ,'2000' ,'2003' 
             ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('2009' ,'2011' 
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
         _ARB_F_ + -16538.06805;
        END;
      END;
    END;
  END;

********** LEAF    86  NODE   525 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2009' ,'2011' ,'2013' ,'2000' ,
    '2003' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2007' ,'2010' ,'2002' ,'2006' ,'2012' ,'2004' ,'2005' ,'2008' ,
      '2009' ,'2011' ,'2013' ,'2000' ,'2003' 
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
          IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2009' ,'2011' ,'2013' ,
          '2000' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2003' 
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
            IF _ARBFMT_10 IN ('2009' ,'2011' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2013' ,'2000' ,
            '2003' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -67133.27361;
        END;
      END;
    END;
  END;

********** LEAF    87  NODE   523 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2009' ,'2011' ,'2013' ,'2000' ,
    '2003' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2007' ,'2010' ,'2002' ,'2006' ,'2012' ,'2004' ,'2005' ,'2008' ,
      '2009' ,'2011' ,'2013' ,'2000' ,'2003' 
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
          IF _ARBFMT_10 IN ('2003' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2009' ,'2011' ,
          '2013' ,'2000' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 197934.6715;
      END;
    END;
  END;

********** LEAF    88  NODE   531 ***************;
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
      IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2010' ,'2000' ,
      '2002' ,'2003' ,'2006' ,'2012' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2001' ,'2004' ,'2005' ,'2007' ,'2010' ,'2000' ,'2002' ,'2003' ,
        '2006' ,'2012' ,'2008' ,'2009' ,'2011' ,'2013' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' ,'45 TO 64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
            IF _ARBFMT_10 IN ('2005' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2007' ,'2010' ,'2000' ,
            '2002' ,'2003' ,'2006' ,'2012' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -19611.14958;
        END;
      END;
    END;
  END;

********** LEAF    89  NODE   532 ***************;
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
      IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2010' ,'2000' ,
      '2002' ,'2003' ,'2006' ,'2012' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2001' ,'2004' ,'2005' ,'2007' ,'2010' ,'2000' ,'2002' ,'2003' ,
        '2006' ,'2012' ,'2008' ,'2009' ,'2011' ,'2013' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('65+' ,'45 TO 64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' ,'45 TO 64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
            IF _ARBFMT_10 IN ('2001' ,'2004' ,'2007' ,'2010' ,'2000' ,'2002' ,
            '2003' ,'2006' ,'2012' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('2005' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '16 TO 24' ,'65+' ,'45 TO 64' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -106714.3746;
        END;
      END;
    END;
  END;

********** LEAF    90  NODE   530 ***************;
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
      IF _ARBFMT_10 IN ('2008' ,'2009' ,'2011' ,'2013' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 56472.464472;
      END;
    END;
  END;

********** LEAF    91  NODE   528 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 162654.78162;
    END;
  END;

********** LEAF    92  NODE   538 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2010' ,'2011' ,
    '2002' ,'2003' ,'2006' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2010' ,'2011' ,'2002' ,'2003' ,
      '2006' ,'2009' ,'2013' ,'2000' ,'2012' 
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
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2002' ) THEN DO;
         _BRANCH_ =    1; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -102468.0873;
        END;
      END;
    END;
  END;

********** LEAF    93  NODE   539 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2010' ,'2011' ,
    '2002' ,'2003' ,'2006' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2010' ,'2011' ,'2002' ,'2003' ,
      '2006' ,'2009' ,'2013' ,'2000' ,'2012' 
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
        IF _ARBFMT_10 IN ('2008' ,'2010' ,'2011' ,'2003' ,'2006' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_10 NOTIN (
          '2001' ,'2004' ,'2005' ,'2007' ,'2002' ,'2008' ,'2010' ,'2011' ,
          '2003' ,'2006' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 44643.340027;
        END;
      END;
    END;
  END;

********** LEAF    94  NODE   537 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2010' ,'2011' ,
    '2002' ,'2003' ,'2006' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2010' ,'2011' ,'2002' ,'2003' ,
      '2006' ,'2009' ,'2013' ,'2000' ,'2012' 
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
       _ARB_F_ + 169830.49576;
      END;
    END;
  END;

********** LEAF    95  NODE   535 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2009' ,'2013' ,'2000' ,'2012' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -111266.209;
    END;
  END;

********** LEAF    96  NODE   543 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2010' ,'2011' ,'2013' ,'2002' ,'2006' ) THEN 
        DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '2001' ,'2010' ,'2011' ,'2013' ,'2002' ,'2006' ,'2004' ,'2005' ,'2007' ,
    '2008' ,'2009' ,'2000' ,'2003' ,'2012' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('65+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' ,'45 TO 64' 
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
          IF _ARBFMT_10 IN ('2001' ,'2010' ,'2011' ,'2013' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2002' ,'2006' 
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
       _ARB_F_ + -36725.09442;
      END;
    END;
  END;

********** LEAF    97  NODE   544 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2010' ,'2011' ,'2013' ,'2002' ,'2006' ) THEN 
        DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '2001' ,'2010' ,'2011' ,'2013' ,'2002' ,'2006' ,'2004' ,'2005' ,'2007' ,
    '2008' ,'2009' ,'2000' ,'2003' ,'2012' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('65+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' ,'45 TO 64' 
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
          IF _ARBFMT_10 IN ('2002' ,'2006' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2010' ,'2011' ,'2013' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 154997.48547;
      END;
    END;
  END;

********** LEAF    98  NODE   545 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2004' ,'2005' ,'2007' ,'2008' ,'2009' ,'2000' ,'2003' ,
    '2012' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '2001' ,'2010' ,'2011' ,'2013' ,'2002' ,'2006' ,'2004' ,'2005' ,'2007' ,
    '2008' ,'2009' ,'2000' ,'2003' ,'2012' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' ,'45 TO 64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_19 IN ('65+' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2010' ,'2011' ,'2013' ,'2002' ,'2006' ,'2004' ,'2005' ,'2007' ,
      '2008' ,'2009' ,'2000' ,'2003' ,'2012' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('2004' ,'2005' ,'2000' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -107493.6949;
      END;
    END;
  END;

********** LEAF    99  NODE   547 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2004' ,'2005' ,'2007' ,'2008' ,'2009' ,'2000' ,'2003' ,
    '2012' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '2001' ,'2010' ,'2011' ,'2013' ,'2002' ,'2006' ,'2004' ,'2005' ,'2007' ,
    '2008' ,'2009' ,'2000' ,'2003' ,'2012' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' ,'45 TO 64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_19 IN ('65+' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2010' ,'2011' ,'2013' ,'2002' ,'2006' ,'2004' ,'2005' ,'2007' ,
      '2008' ,'2009' ,'2000' ,'2003' ,'2012' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('2007' ,'2008' ,'2009' ,'2003' ,'2012' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2004' ,'2005' ,'2000' ,'2007' ,'2008' ,'2009' ,'2003' ,'2012' 
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
            IF _ARBFMT_10 IN ('2008' ,'2009' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('2007' ,'2003' ,'2012' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -93395.06856;
        END;
      END;
    END;
  END;

********** LEAF   100  NODE   548 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2004' ,'2005' ,'2007' ,'2008' ,'2009' ,'2000' ,'2003' ,
    '2012' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '2001' ,'2010' ,'2011' ,'2013' ,'2002' ,'2006' ,'2004' ,'2005' ,'2007' ,
    '2008' ,'2009' ,'2000' ,'2003' ,'2012' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' ,'45 TO 64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_19 IN ('65+' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2010' ,'2011' ,'2013' ,'2002' ,'2006' ,'2004' ,'2005' ,'2007' ,
      '2008' ,'2009' ,'2000' ,'2003' ,'2012' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('2007' ,'2008' ,'2009' ,'2003' ,'2012' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '2004' ,'2005' ,'2000' ,'2007' ,'2008' ,'2009' ,'2003' ,'2012' 
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
            IF _ARBFMT_10 IN ('2007' ,'2003' ,'2012' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('2008' ,'2009' 
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
         _ARB_F_ + -2151.641466;
        END;
      END;
    END;
  END;

********** LEAF   101  NODE   552 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2011' ,'2000' ,
    '2003' ,'2006' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2011' ,'2000' ,'2003' ,'2006' ,
      '2009' ,'2010' ,'2013' ,'2002' ,'2012' 
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
          IF _ARBFMT_10 IN ('2001' ,'2005' ,'2011' ,'2000' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2004' ,'2007' ,'2008' ,'2003' ,'2006' 
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
       _ARB_F_ + -50662.42467;
      END;
    END;
  END;

********** LEAF   102  NODE   553 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2011' ,'2000' ,
    '2003' ,'2006' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2011' ,'2000' ,'2003' ,'2006' ,
      '2009' ,'2010' ,'2013' ,'2002' ,'2012' 
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
          IF _ARBFMT_10 IN ('2004' ,'2007' ,'2008' ,'2003' ,'2006' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2005' ,'2011' ,'2000' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 101359.98863;
      END;
    END;
  END;

********** LEAF   103  NODE   554 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2009' ,'2010' ,'2013' ,'2002' ,'2012' ) THEN DO;
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
          IF _ARBFMT_10 IN ('2009' ,'2010' ,'2013' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2002' ,'2012' 
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
       _ARB_F_ + -60077.18018;
      END;
    END;
  END;

********** LEAF   104  NODE   555 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2009' ,'2010' ,'2013' ,'2002' ,'2012' ) THEN DO;
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
          IF _ARBFMT_10 IN ('2002' ,'2012' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2009' ,'2010' ,'2013' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -128931.5632;
      END;
    END;
  END;

********** LEAF   105  NODE   563 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2009' ,
        '2010' ,'2011' ,'2013' ,'2000' ,'2003' ,'2006' ,'2012' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2002' 
        ) THEN _BRANCH_ = 0; 
      END;
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
      IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2010' ,'2011' ,
      '2013' ,'2000' ,'2003' ,'2006' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2001' ,'2004' ,'2005' ,'2007' ,'2010' ,'2011' ,'2013' ,'2000' ,
        '2003' ,'2006' ,'2008' ,'2009' ,'2012' 
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
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2000' ,'2003' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_10 NOTIN (
          '2001' ,'2004' ,'2005' ,'2000' ,'2003' ,'2007' ,'2010' ,'2011' ,
          '2013' ,'2006' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
              IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
               _BRANCH_ =    1; 
              END; 
              ELSE IF _ARBFMT_19 IN ('65+' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;
        IF _BRANCH_ LT 0 THEN DO; 
           IF MISSING( Date  ) THEN _BRANCH_ = 1;
          ELSE IF _ARBFMT_10 NOTIN (
            '2001' ,'2004' ,'2005' ,'2000' ,'2003' ,'2007' ,'2010' ,'2011' ,
            '2013' ,'2006' 
             ) THEN _BRANCH_ = 1;
        END; 
        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + 19042.858478;
          END;
        END;
      END;
    END;
  END;

********** LEAF   106  NODE   564 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2009' ,
        '2010' ,'2011' ,'2013' ,'2000' ,'2003' ,'2006' ,'2012' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2002' 
        ) THEN _BRANCH_ = 0; 
      END;
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
      IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2010' ,'2011' ,
      '2013' ,'2000' ,'2003' ,'2006' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2001' ,'2004' ,'2005' ,'2007' ,'2010' ,'2011' ,'2013' ,'2000' ,
        '2003' ,'2006' ,'2008' ,'2009' ,'2012' 
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
          IF _ARBFMT_10 IN ('2007' ,'2010' ,'2011' ,'2013' ,'2006' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_10 NOTIN (
          '2001' ,'2004' ,'2005' ,'2000' ,'2003' ,'2007' ,'2010' ,'2011' ,
          '2013' ,'2006' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
              IF _ARBFMT_19 IN ('65+' ) THEN DO;
               _BRANCH_ =    2; 
              END; 
              ELSE IF _ARBFMT_19 IN ('16 TO 24' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;

        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -49801.54238;
          END;
        END;
      END;
    END;
  END;

********** LEAF   107  NODE   562 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2009' ,
        '2010' ,'2011' ,'2013' ,'2000' ,'2003' ,'2006' ,'2012' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2002' 
        ) THEN _BRANCH_ = 0; 
      END;
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
      IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2010' ,'2011' ,
      '2013' ,'2000' ,'2003' ,'2006' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2001' ,'2004' ,'2005' ,'2007' ,'2010' ,'2011' ,'2013' ,'2000' ,
        '2003' ,'2006' ,'2008' ,'2009' ,'2012' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('45 TO 64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -187050.8822;
        END;
      END;
    END;
  END;

********** LEAF   108  NODE   560 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,'2009' ,
        '2010' ,'2011' ,'2013' ,'2000' ,'2003' ,'2006' ,'2012' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2002' 
        ) THEN _BRANCH_ = 0; 
      END;
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
      IF _ARBFMT_10 IN ('2008' ,'2009' ,'2012' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 12361.402844;
      END;
    END;
  END;

********** LEAF   109  NODE   558 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2002' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2008' ,
        '2009' ,'2010' ,'2011' ,'2013' ,'2000' ,'2003' ,'2006' ,'2012' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 81286.028418;
    END;
  END;

********** LEAF   110  NODE   568 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2010' ,'2011' ,'2000' ,
    '2006' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2004' ,'2005' ,'2007' ,'2010' ,'2011' ,'2000' ,'2006' ,'2008' ,
      '2009' ,'2013' ,'2002' ,'2003' ,'2012' 
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
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2010' ,'2011' ,
          '2006' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' 
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
       _ARB_F_ + -18364.19371;
      END;
    END;
  END;

********** LEAF   111  NODE   569 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2010' ,'2011' ,'2000' ,
    '2006' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2004' ,'2005' ,'2007' ,'2010' ,'2011' ,'2000' ,'2006' ,'2008' ,
      '2009' ,'2013' ,'2002' ,'2003' ,'2012' 
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
          IF _ARBFMT_10 IN ('2000' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2007' ,'2010' ,
          '2011' ,'2006' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -134121.0152;
      END;
    END;
  END;

********** LEAF   112  NODE   570 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2008' ,'2009' ,'2013' ,'2002' ,'2003' ,'2012' ) THEN 
        DO;
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
          IF _ARBFMT_10 IN ('2008' ,'2013' ,'2012' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2009' ,'2002' ,'2003' 
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
       _ARB_F_ + -30107.68061;
      END;
    END;
  END;

********** LEAF   113  NODE   571 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2008' ,'2009' ,'2013' ,'2002' ,'2003' ,'2012' ) THEN 
        DO;
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
          IF _ARBFMT_10 IN ('2009' ,'2002' ,'2003' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2008' ,'2013' ,'2012' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 194765.77921;
      END;
    END;
  END;

********** LEAF   114  NODE   573 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2007' ,'2010' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + -110303.2654;
    END;
  END;

********** LEAF   115  NODE   579 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2009' ,'2011' ,'2013' ,'2000' ,
    '2002' ,'2003' ,'2006' ,'2012' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2007' ,'2010' ,'2004' ,'2005' ,'2008' ,'2009' ,'2011' ,'2013' ,
      '2000' ,'2002' ,'2003' ,'2006' ,'2012' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2009' ,'2011' ,'2013' ,
          '2000' ,'2003' ,'2006' ,'2012' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2002' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('2004' ,'2005' ,'2009' ,'2013' ,'2000' ,'2002' ,
        '2006' ,'2012' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          '2004' ,'2005' ,'2009' ,'2013' ,'2000' ,'2002' ,'2006' ,'2012' ,
          '2008' ,'2011' ,'2003' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
          IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_19 NOTIN (
          '16 TO 24' ,'65+' ,'45 TO 64' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
              IF _ARBFMT_10 IN ('2005' ) THEN DO;
               _BRANCH_ =    1; 
              END; 
              ELSE IF _ARBFMT_10 IN ('2004' ,'2009' ,'2013' ,'2000' ,'2002' ,
              '2006' ,'2012' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;

        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -16206.76561;
          END;
        END;
      END;
    END;
  END;

********** LEAF   116  NODE   580 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2009' ,'2011' ,'2013' ,'2000' ,
    '2002' ,'2003' ,'2006' ,'2012' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2007' ,'2010' ,'2004' ,'2005' ,'2008' ,'2009' ,'2011' ,'2013' ,
      '2000' ,'2002' ,'2003' ,'2006' ,'2012' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2009' ,'2011' ,'2013' ,
          '2000' ,'2003' ,'2006' ,'2012' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2002' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('2004' ,'2005' ,'2009' ,'2013' ,'2000' ,'2002' ,
        '2006' ,'2012' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          '2004' ,'2005' ,'2009' ,'2013' ,'2000' ,'2002' ,'2006' ,'2012' ,
          '2008' ,'2011' ,'2003' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
          IF _ARBFMT_19 IN ('65+' ,'45 TO 64' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_19 NOTIN (
          '16 TO 24' ,'65+' ,'45 TO 64' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
              IF _ARBFMT_10 IN ('2004' ,'2009' ,'2013' ,'2000' ,'2002' ,
              '2006' ,'2012' ) THEN DO;
               _BRANCH_ =    2; 
              END; 
              ELSE IF _ARBFMT_10 IN ('2005' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;
        IF _BRANCH_ LT 0 THEN DO; 
           IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
          ELSE IF _ARBFMT_19 NOTIN (
            '16 TO 24' ,'65+' ,'45 TO 64' 
             ) THEN _BRANCH_ = 2;
        END; 
        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -79005.49658;
          END;
        END;
      END;
    END;
  END;

********** LEAF   117  NODE   578 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2009' ,'2011' ,'2013' ,'2000' ,
    '2002' ,'2003' ,'2006' ,'2012' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2007' ,'2010' ,'2004' ,'2005' ,'2008' ,'2009' ,'2011' ,'2013' ,
      '2000' ,'2002' ,'2003' ,'2006' ,'2012' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2009' ,'2011' ,'2013' ,
          '2000' ,'2003' ,'2006' ,'2012' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2002' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('2008' ,'2011' ,'2003' ) THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 59803.408231;
        END;
      END;
    END;
  END;

********** LEAF   118  NODE   576 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2009' ,'2011' ,'2013' ,'2000' ,
    '2002' ,'2003' ,'2006' ,'2012' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2007' ,'2010' ,'2004' ,'2005' ,'2008' ,'2009' ,'2011' ,'2013' ,
      '2000' ,'2002' ,'2003' ,'2006' ,'2012' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('2002' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2004' ,'2005' ,'2008' ,'2009' ,'2011' ,
          '2013' ,'2000' ,'2003' ,'2006' ,'2012' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 86252.595802;
      END;
    END;
  END;

********** LEAF   119  NODE   584 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2009' ,'2010' ,'2002' )
     THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '2001' ,'2004' ,'2005' ,'2008' ,'2009' ,'2010' ,'2002' ,'2007' ,'2011' ,
    '2013' ,'2000' ,'2003' ,'2006' ,'2012' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('65+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' ,'45 TO 64' 
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
          IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2009' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2010' ,'2002' 
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
       _ARB_F_ + -10880.29967;
      END;
    END;
  END;

********** LEAF   120  NODE   585 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2009' ,'2010' ,'2002' )
     THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '2001' ,'2004' ,'2005' ,'2008' ,'2009' ,'2010' ,'2002' ,'2007' ,'2011' ,
    '2013' ,'2000' ,'2003' ,'2006' ,'2012' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('65+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' ,'45 TO 64' 
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
          IF _ARBFMT_10 IN ('2010' ,'2002' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2009' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 77557.719712;
      END;
    END;
  END;

********** LEAF   121  NODE   586 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2007' ,'2011' ,'2013' ,'2000' ,'2003' ,'2006' ,'2012' )
     THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '2001' ,'2004' ,'2005' ,'2008' ,'2009' ,'2010' ,'2002' ,'2007' ,'2011' ,
    '2013' ,'2000' ,'2003' ,'2006' ,'2012' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' ,'45 TO 64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_19 IN ('65+' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2004' ,'2005' ,'2008' ,'2009' ,'2010' ,'2002' ,'2007' ,'2011' ,
      '2013' ,'2000' ,'2003' ,'2006' ,'2012' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('2007' ,'2011' ,'2000' ,'2012' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2007' ,'2011' ,'2000' ,'2012' ,'2013' ,'2003' ,'2006' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -41811.67635;
      END;
    END;
  END;

********** LEAF   122  NODE   587 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2007' ,'2011' ,'2013' ,'2000' ,'2003' ,'2006' ,'2012' )
     THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '2001' ,'2004' ,'2005' ,'2008' ,'2009' ,'2010' ,'2002' ,'2007' ,'2011' ,
    '2013' ,'2000' ,'2003' ,'2006' ,'2012' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('16 TO 24' ,'25 TO 44' ,'45 TO 64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_19 IN ('65+' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '2001' ,'2004' ,'2005' ,'2008' ,'2009' ,'2010' ,'2002' ,'2007' ,'2011' ,
      '2013' ,'2000' ,'2003' ,'2006' ,'2012' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('2013' ,'2003' ,'2006' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -80029.5659;
      END;
    END;
  END;

********** LEAF   123  NODE   593 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2009' ,'2010' ,
        '2011' ,'2013' ,'2000' ,'2002' ,'2003' ,'2006' ,'2012' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2007' 
        ) THEN _BRANCH_ = 0; 
      END;
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
      IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2009' ,'2010' ,'2013' ,
      '2000' ,'2002' ,'2006' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2001' ,'2004' ,'2005' ,'2009' ,'2010' ,'2013' ,'2000' ,'2002' ,
        '2006' ,'2007' ,'2008' ,'2011' ,'2003' ,'2012' 
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
         _ARB_F_ + -86310.19909;
        END;
      END;
    END;
  END;

********** LEAF   124  NODE   594 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2009' ,'2010' ,
        '2011' ,'2013' ,'2000' ,'2002' ,'2003' ,'2006' ,'2012' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2007' 
        ) THEN _BRANCH_ = 0; 
      END;
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
      IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2009' ,'2010' ,'2013' ,
      '2000' ,'2002' ,'2006' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '2001' ,'2004' ,'2005' ,'2009' ,'2010' ,'2013' ,'2000' ,'2002' ,
        '2006' ,'2007' ,'2008' ,'2011' ,'2003' ,'2012' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('65+' ) THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -31441.18607;
        END;
      END;
    END;
  END;

********** LEAF   125  NODE   592 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ,'45 TO 64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2009' ,'2010' ,
        '2011' ,'2013' ,'2000' ,'2002' ,'2003' ,'2006' ,'2012' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2007' 
        ) THEN _BRANCH_ = 0; 
      END;
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
      IF _ARBFMT_10 IN ('2007' ,'2008' ,'2011' ,'2003' ,'2012' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 32127.779519;
      END;
    END;
  END;

********** LEAF   126  NODE   590 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('25 TO 44' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '16 TO 24' ,'65+' ,'45 TO 64' ,'25 TO 44' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2007' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2001' ,'2004' ,'2005' ,'2008' ,'2009' ,
        '2010' ,'2011' ,'2013' ,'2000' ,'2002' ,'2003' ,'2006' ,'2012' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 102536.39144;
    END;
  END;
P_Sum_Labor_Force_Pop  = _ARB_F_;

*****  RESIDUALS R_ *************;
IF MISSING( Sum_Labor_Force_Pop ) THEN R_Sum_Labor_Force_Pop  = .;
ELSE R_Sum_Labor_Force_Pop  = Sum_Labor_Force_Pop  - P_Sum_Labor_Force_Pop ;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

