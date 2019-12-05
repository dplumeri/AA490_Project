****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH _WARN_  $    4; 

******              LABELS FOR NEW VARIABLES              ******;
label P_Cases_in_1000s = 'Predicted: Cases_in_1000s' ;
      P_Cases_in_1000s  = 0;
label _WARN_ = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_32 $     32; DROP _ARBFMT_32; 
_ARBFMT_32 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_19 $     19; DROP _ARBFMT_19; 
_ARBFMT_19 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_10 $     10; DROP _ARBFMT_10; 
_ARBFMT_10 = ' '; /* Initialize to avoid warning. */


 DROP _ARB_F_;
 DROP _ARB_BADF_;
     _ARB_F_ = 22.435483871;
     _ARB_BADF_ = 0;
******             ASSIGN OBSERVATION TO NODE             ******;
 DROP _ARB_P_;
 _ARB_P_ = 0;
 DROP _ARB_PPATH_; _ARB_PPATH_ = 1;

********** LEAF     1  NODE   388 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

   DROP _BRANCH_;
  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'85+' ,'25-44' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'25-44' ,'18-24' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
     DROP _ARB_SURR_;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
          '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,
          '2010' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1997' ,'1999' ,'2005' ,'2007' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1993' ,'2004' ,'2006' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          '1993' ,'2004' ,'2006' ,'1990' ,'1994' ,'1998' ,'2001' ,'2003' ,
          '2008' ,'2009' ,'2010' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 2.7364516129;
        END;
      END;
    END;
  END;

********** LEAF     2  NODE   389 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'85+' ,'25-44' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'25-44' ,'18-24' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
          '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,
          '2010' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1997' ,'1999' ,'2005' ,'2007' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1994' ,'1998' ,'2001' ,'2003' ,'2008' ,
        '2009' ,'2010' ) THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 1.3699131514;
        END;
      END;
    END;
  END;

********** LEAF     3  NODE   385 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'85+' ,'25-44' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'25-44' ,'18-24' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1997' ,'1999' ,'2005' ,'2007' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,
          '1998' ,'2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,
          '2009' ,'2010' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.047803706;
      END;
    END;
  END;

********** LEAF     4  NODE   386 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('MALE' ,'ALL' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.235440279;
      END;
    END;
  END;

********** LEAF     5  NODE   387 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('MALE' ,'ALL' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -2.17688172;
      END;
    END;
  END;

********** LEAF     6  NODE   391 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 1.6466679738;
    END;
  END;

********** LEAF     7  NODE   393 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '85+' ,'0-17' ,'18-24' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 1.2142726918;
      END;
    END;
  END;

********** LEAF     8  NODE   395 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Disease  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_32 NOTIN (
          'CANCER, ALL' ,'SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'OSTEOARTHRITIS' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.552215766;
        END;
      END;
    END;
  END;

********** LEAF     9  NODE   396 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -2.07677942;
        END;
      END;
    END;
  END;

********** LEAF    10  NODE   404 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'1997' ,
        '1999' ,'1991' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2002' ,'2010' ,'2005' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'18-24' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,'2001' ,
          '2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'1997' ,'1992' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'1999' ,'2005' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('MALE' ,'ALL' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 2.021972093;
        END;
      END;
    END;
  END;

********** LEAF    11  NODE   405 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'1997' ,
        '1999' ,'1991' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2002' ,'2010' ,'2005' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'18-24' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,'2001' ,
          '2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'1997' ,'1992' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'1999' ,'2005' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('85+' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('MALE' ,'ALL' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'85+' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 1.2893356103;
        END;
      END;
    END;
  END;

********** LEAF    12  NODE   403 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'1997' ,
        '1999' ,'1991' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2002' ,'2010' ,'2005' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'18-24' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2000' ,'1999' ,'2005' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,
          '2001' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'1997' ,'1992' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.075852195;
      END;
    END;
  END;

********** LEAF    13  NODE   400 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2002' ,'2010' ,'2005' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,
        '1998' ,'2000' ,'2001' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,
        '1997' ,'1999' ,'1991' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('1990' ,'1996' ,'1998' ,'2002' ,'2010' ,'2005' ) THEN 
        DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.397858643;
      END;
    END;
  END;

********** LEAF    14  NODE   401 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2002' ,'2010' ,'2005' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,
        '1998' ,'2000' ,'2001' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,
        '1997' ,'1999' ,'1991' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
    _BRANCH_ = -1;
    IF MISSING( Date ) THEN _BRANCH_ = 2;
    ELSE DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 NOTIN (
        '1990' ,'1996' ,'1998' ,'2002' ,'2010' ,'2005' 
         ) THEN _BRANCH_ = 2;
    END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.44796121;
      END;
    END;
  END;

********** LEAF    15  NODE   407 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 2.2531117401;
    END;
  END;

********** LEAF    16  NODE   409 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '85+' ,'0-17' ,'18-24' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 1.1240971457;
      END;
    END;
  END;

********** LEAF    17  NODE   411 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Disease  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_32 NOTIN (
          'CANCER, ALL' ,'SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'OSTEOARTHRITIS' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.365958499;
        END;
      END;
    END;
  END;

********** LEAF    18  NODE   412 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.751239728;
        END;
      END;
    END;
  END;

********** LEAF    19  NODE   414 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 2.3773996732;
    END;
  END;

********** LEAF    20  NODE   416 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '85+' ,'0-17' ,'18-24' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 1.4671587031;
      END;
    END;
  END;

********** LEAF    21  NODE   418 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'CANCER, ALL' ,'SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('1990' ,'1996' ,'2000' ,'2004' ,'2006' ,'2008' ,
            '2009' ,'1992' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('1994' ,'1998' ,'2002' ,'2003' ,'1997' ,
            '1999' ,'2005' ,'2007' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('ALL' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Disease  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_32 NOTIN (
          'CANCER, ALL' ,'SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'OSTEOARTHRITIS' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.152112115;
        END;
      END;
    END;
  END;

********** LEAF    22  NODE   419 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'CANCER, ALL' ,'SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('1994' ,'1998' ,'2002' ,'2003' ,'1997' ,'1999' ,
            '2005' ,'2007' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('1990' ,'1996' ,'2000' ,'2004' ,'2006' ,
            '2008' ,'2009' ,'1992' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('ALL' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.570777426;
        END;
      END;
    END;
  END;

********** LEAF    23  NODE   427 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2001' ,
        '2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,'2007' ,
        '1991' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1995' ,'1996' ,'2002' ,'1999' ,'2005' ,
        '1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'18-24' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,'2000' ,
          '2001' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,
          '2005' ,'1992' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2007' ,'1991' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
       IF MISSING( Gender  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' ,'ALL' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
            IF _ARBFMT_10 IN ('MALE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('85+' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_19 IN ('0-17' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Disease  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_32 NOTIN (
          'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
          'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.2922277856;
        END;
      END;
    END;
  END;

********** LEAF    24  NODE   428 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2001' ,
        '2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,'2007' ,
        '1991' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1995' ,'1996' ,'2002' ,'1999' ,'2005' ,
        '1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'18-24' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,'2000' ,
          '2001' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,
          '2005' ,'1992' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2007' ,'1991' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
       IF MISSING( Gender  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' ,'ALL' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
            IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('MALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('0-17' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_19 IN ('85+' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.082888958;
        END;
      END;
    END;
  END;

********** LEAF    25  NODE   424 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2001' ,
        '2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,'2007' ,
        '1991' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1995' ,'1996' ,'2002' ,'1999' ,'2005' ,
        '1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'18-24' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('ALL' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2007' ,'1991' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,
          '2000' ,'2001' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,
          '1997' ,'2005' ,'1992' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 2.3503295813;
      END;
    END;
  END;

********** LEAF    26  NODE   425 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1995' ,'1996' ,'2002' ,'1999' ,'2005' ,'1992' ) 
         THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1998' ,'2000' ,
        '2001' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,
        '2007' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('ALL' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.088309315;
      END;
    END;
  END;

********** LEAF    27  NODE   426 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1995' ,'1996' ,'2002' ,'1999' ,'2005' ,'1992' ) 
         THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1998' ,'2000' ,
        '2001' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,
        '2007' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('ALL' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.345200936;
      END;
    END;
  END;

********** LEAF    28  NODE   430 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 2.2108331972;
    END;
  END;

********** LEAF    29  NODE   432 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '85+' ,'0-17' ,'18-24' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 1.3381281704;
      END;
    END;
  END;

********** LEAF    30  NODE   434 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Disease  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_32 NOTIN (
          'CANCER, ALL' ,'SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'OSTEOARTHRITIS' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.038550925;
        END;
      END;
    END;
  END;

********** LEAF    31  NODE   435 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.354507158;
        END;
      END;
    END;
  END;

********** LEAF    32  NODE   437 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 1.772181158;
    END;
  END;

********** LEAF    33  NODE   439 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '85+' ,'0-17' ,'18-24' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1993' ,'1994' ,'2001' ,'2003' ,'2004' ,'2009' ) 
           THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1990' ,'1996' ,'1998' ,'2000' ,'2002' ,
          '2006' ,'2008' ,'2010' ,'1997' ,'1999' ,'2005' ,'2007' ,'1992' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '85+' ,'0-17' ,'18-24' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.9702810166;
      END;
    END;
  END;

********** LEAF    34  NODE   441 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '85+' ,'0-17' ,'18-24' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1996' ,'1998' ,'2000' ,'2002' ,'2006' ,
          '2008' ,'2010' ,'1997' ,'1999' ,'2005' ,'2007' ,'1992' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1993' ,'1994' ,'2001' ,'2003' ,'2004' ,
          '2009' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Disease  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_32 NOTIN (
          'CANCER, ALL' ,'SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'OSTEOARTHRITIS' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.825747692;
        END;
      END;
    END;
  END;

********** LEAF    35  NODE   442 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '85+' ,'0-17' ,'18-24' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1996' ,'1998' ,'2000' ,'2002' ,'2006' ,
          '2008' ,'2010' ,'1997' ,'1999' ,'2005' ,'2007' ,'1992' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1993' ,'1994' ,'2001' ,'2003' ,'2004' ,
          '2009' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.241662797;
        END;
      END;
    END;
  END;

********** LEAF    36  NODE   444 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'25-44' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'25-44' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2010' ,'1991' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,
        '1998' ,'2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,
        '2009' ,'1997' ,'1999' ,'2005' ,'2007' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 1.1712015063;
    END;
  END;

********** LEAF    37  NODE   446 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'25-44' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,
        '1997' ,'1999' ,'2005' ,'2007' ,'1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2010' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'25-44' ,'85+' ,'18-24' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1993' ,'2000' ,'2006' ,'2010' ,'1997' ,'2007' ) 
           THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1996' ,'1998' ,
          '2002' ,'2003' ,'2004' ,'2008' ,'2009' ,'1999' ,'2005' ,'1992' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.60747842;
      END;
    END;
  END;

********** LEAF    38  NODE   448 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'25-44' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,
        '1997' ,'1999' ,'2005' ,'2007' ,'1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2010' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'25-44' ,'85+' ,'18-24' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1996' ,'1998' ,'2002' ,
          '2003' ,'2004' ,'2008' ,'2009' ,'1999' ,'2005' ,'1992' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1993' ,'2000' ,'2006' ,'2010' ,'1997' ,
          '2007' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'2003' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          '1990' ,'2003' ,'1994' ,'1996' ,'2008' ,'2009' ,'1999' ,'2005' ,
          '1992' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.5311616537;
        END;
      END;
    END;
  END;

********** LEAF    39  NODE   449 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'25-44' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,
        '1997' ,'1999' ,'2005' ,'2007' ,'1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2010' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'25-44' ,'85+' ,'18-24' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1996' ,'1998' ,'2002' ,
          '2003' ,'2004' ,'2008' ,'2009' ,'1999' ,'2005' ,'1992' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1993' ,'2000' ,'2006' ,'2010' ,'1997' ,
          '2007' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1994' ,'1996' ,'2008' ,'2009' ,'1999' ,'2005' ,
        '1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.521035611;
        END;
      END;
    END;
  END;

********** LEAF    40  NODE   457 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Gender , $CHAR10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    'FEMALE' ,'MALE' ,'ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,
        '2005' ,'2007' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2002' ,'2003' ,'1999' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'85+' ,'18-24' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('85+' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_19 IN ('0-17' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.124516264;
        END;
      END;
    END;
  END;

********** LEAF    41  NODE   458 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Gender , $CHAR10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    'FEMALE' ,'MALE' ,'ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,
        '2005' ,'2007' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2002' ,'2003' ,'1999' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'85+' ,'18-24' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('0-17' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_19 IN ('85+' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Disease  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_32 NOTIN (
          'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
          'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.905738194;
        END;
      END;
    END;
  END;

********** LEAF    42  NODE   456 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Gender , $CHAR10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    'FEMALE' ,'MALE' ,'ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,
        '2005' ,'2007' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2002' ,'2003' ,'1999' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.079961836;
      END;
    END;
  END;

********** LEAF    43  NODE   453 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Gender , $CHAR10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('ALL' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    'FEMALE' ,'MALE' ,'ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2002' ,'2003' ,'1999' ,'1991' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,
        '1998' ,'2000' ,'2001' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,
        '1997' ,'2005' ,'2007' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('1996' ,'2002' ,'2003' ,'2004' ,'2008' ,'1999' ,
      '2007' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 1.0224172743;
      END;
    END;
  END;

********** LEAF    44  NODE   454 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Gender , $CHAR10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('ALL' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    'FEMALE' ,'MALE' ,'ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2002' ,'2003' ,'1999' ,'1991' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,
        '1998' ,'2000' ,'2001' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,
        '1997' ,'2005' ,'2007' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
    _BRANCH_ = -1;
    IF MISSING( Date ) THEN _BRANCH_ = 2;
    ELSE DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 NOTIN (
        '1996' ,'2002' ,'2003' ,'2004' ,'2008' ,'1999' ,'2007' 
         ) THEN _BRANCH_ = 2;
    END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.1662690381;
      END;
    END;
  END;

********** LEAF    45  NODE   462 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1995' ,'2003' ,'2004' ,'2008' ,'2009' ,'2010' ) 
         THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2006' ,'1997' ,'1999' ,'2005' ,'2007' ,
        '1991' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('ALL' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 1.5157300571;
      END;
    END;
  END;

********** LEAF    46  NODE   463 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1995' ,'2003' ,'2004' ,'2008' ,'2009' ,'2010' ) 
         THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2006' ,'1997' ,'1999' ,'2005' ,'2007' ,
        '1991' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('ALL' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.4926597929;
      END;
    END;
  END;

********** LEAF    47  NODE   464 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,'2000' ,
        '2001' ,'2002' ,'2006' ,'1997' ,'1999' ,'2005' ,'2007' ,'1991' ,
        '1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1995' ,'2003' ,'2004' ,'2008' ,'2009' ,
        '2010' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '85+' ,'0-17' ,'18-24' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.4955270703;
      END;
    END;
  END;

********** LEAF    48  NODE   466 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,'2000' ,
        '2001' ,'2002' ,'2006' ,'1997' ,'1999' ,'2005' ,'2007' ,'1991' ,
        '1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1995' ,'2003' ,'2004' ,'2008' ,'2009' ,
        '2010' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('SEPTICEMIA' ,'OSTEOARTHRITIS' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.290463962;
        END;
      END;
    END;
  END;

********** LEAF    49  NODE   467 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,'2000' ,
        '2001' ,'2002' ,'2006' ,'1997' ,'1999' ,'2005' ,'2007' ,'1991' ,
        '1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1995' ,'2003' ,'2004' ,'2008' ,'2009' ,
        '2010' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' ,'OSTEOARTHRITIS' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.911070429;
        END;
      END;
    END;
  END;

********** LEAF    50  NODE   471 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2006' ,'2010' ,'1997' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2008' ,'2009' ,'1999' ,
        '2005' ,'2007' ,'1991' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'18-24' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 4.3783499961;
      END;
    END;
  END;

********** LEAF    51  NODE   472 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2006' ,'2010' ,'1997' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2008' ,'2009' ,'1999' ,
        '2005' ,'2007' ,'1991' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'18-24' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.111185392;
      END;
    END;
  END;

********** LEAF    52  NODE   475 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,'2000' ,
        '2001' ,'2002' ,'2003' ,'2004' ,'2008' ,'2009' ,'1999' ,'2005' ,
        '2007' ,'1991' ,'1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2006' ,'2010' ,'1997' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
        'CANCER, ALL' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
         _BRANCH_ =    1; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.997480955;
        END;
      END;
    END;
  END;

********** LEAF    53  NODE   476 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,'2000' ,
        '2001' ,'2002' ,'2003' ,'2004' ,'2008' ,'2009' ,'1999' ,'2005' ,
        '2007' ,'1991' ,'1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2006' ,'2010' ,'1997' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
        'CANCER, ALL' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Disease  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_32 NOTIN (
          'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.596289302;
        END;
      END;
    END;
  END;

********** LEAF    54  NODE   474 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,'2000' ,
        '2001' ,'2002' ,'2003' ,'2004' ,'2008' ,'2009' ,'1999' ,'2005' ,
        '2007' ,'1991' ,'1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2006' ,'2010' ,'1997' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.706224875;
      END;
    END;
  END;

********** LEAF    55  NODE   480 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '85+' ,'18-24' ,'0-17' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2008' ,'2010' ,'1997' ,
        '1999' ,'2005' ,'2007' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2006' ,'2009' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '85+' ,'18-24' ,'0-17' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.344275979;
      END;
    END;
  END;

********** LEAF    56  NODE   482 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '85+' ,'18-24' ,'0-17' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2008' ,'2010' ,'1997' ,
        '1999' ,'2005' ,'2007' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2006' ,'2009' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '85+' ,'18-24' ,'0-17' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('ALL' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '85+' ,'18-24' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 1.1009402879;
        END;
      END;
    END;
  END;

********** LEAF    57  NODE   483 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '85+' ,'18-24' ,'0-17' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2008' ,'2010' ,'1997' ,
        '1999' ,'2005' ,'2007' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2006' ,'2009' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '85+' ,'18-24' ,'0-17' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('ALL' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.781637981;
        END;
      END;
    END;
  END;

********** LEAF    58  NODE   479 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '85+' ,'18-24' ,'0-17' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2006' ,'2009' ,'1991' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,
        '1998' ,'2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2008' ,'2010' ,
        '1997' ,'1999' ,'2005' ,'2007' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 1.2936140543;
    END;
  END;

********** LEAF    59  NODE   491 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Gender , $CHAR10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    'FEMALE' ,'MALE' ,'ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,
        '1997' ,'1999' ,'2005' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2010' ,'2007' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'2000' ,
      '2003' ,'2009' ,'1999' ,'2005' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'2000' ,'2003' ,'2009' ,
        '1999' ,'2005' ,'1998' ,'2001' ,'2002' ,'2004' ,'2006' ,'1997' ,
        '1992' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          _ARBFMT_19 = PUT( Age_group , $19.);
           %DMNORMIP( _ARBFMT_19);
            IF _ARBFMT_19 IN ('0-17' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_19 IN ('85+' ,'18-24' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('1990' ,'1994' ,'1996' ,'1999' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('1993' ,'1995' ,'2000' ,'2003' ,'2009' ,
            '2005' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.428537747;
        END;
      END;
    END;
  END;

********** LEAF    60  NODE   492 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Gender , $CHAR10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    'FEMALE' ,'MALE' ,'ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,
        '1997' ,'1999' ,'2005' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2010' ,'2007' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'2000' ,
      '2003' ,'2009' ,'1999' ,'2005' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'2000' ,'2003' ,'2009' ,
        '1999' ,'2005' ,'1998' ,'2001' ,'2002' ,'2004' ,'2006' ,'1997' ,
        '1992' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('MALE' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          _ARBFMT_19 = PUT( Age_group , $19.);
           %DMNORMIP( _ARBFMT_19);
            IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_19 IN ('0-17' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('1993' ,'1995' ,'2000' ,'2003' ,'2009' ,'2005' 
             ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('1990' ,'1994' ,'1996' ,'1999' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
         IF MISSING( Gender  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_10 NOTIN (
          'FEMALE' ,'MALE' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.259948119;
        END;
      END;
    END;
  END;

********** LEAF    61  NODE   488 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Gender , $CHAR10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    'FEMALE' ,'MALE' ,'ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,
        '1997' ,'1999' ,'2005' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2010' ,'2007' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('1998' ,'2001' ,'2002' ,'2004' ,'2006' ,'1997' ,
      '1992' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.316766403;
      END;
    END;
  END;

********** LEAF    62  NODE   489 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Gender , $CHAR10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('ALL' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    'FEMALE' ,'MALE' ,'ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2010' ,'2007' ,'1991' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,
        '1998' ,'2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,
        '2009' ,'1997' ,'1999' ,'2005' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 2.6664822761;
      END;
    END;
  END;

********** LEAF    63  NODE   490 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Gender , $CHAR10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('ALL' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    'FEMALE' ,'MALE' ,'ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2010' ,'2007' ,'1991' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,
        '1998' ,'2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,
        '2009' ,'1997' ,'1999' ,'2005' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.155821727;
      END;
    END;
  END;

********** LEAF    64  NODE   500 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1998' ,'2002' ,'2008' ,'2010' ,
    '1997' ,'1999' ,'2005' ,'1991' ,'1992' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '1990' ,'1994' ,'1995' ,'1998' ,'2002' ,'2008' ,'2010' ,'1997' ,'1999' ,
    '2005' ,'1991' ,'1992' ,'1993' ,'1996' ,'2000' ,'2001' ,'2003' ,'2004' ,
    '2006' ,'2009' ,'2007' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_32 IN ('ASTHMA' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1994' ,'1995' ,'1998' ,'2002' ,'2008' ,'2010' ,'1997' ,'1999' ,
      '2005' ,'1991' ,'1992' ,'1993' ,'1996' ,'2000' ,'2001' ,'2003' ,'2004' ,
      '2006' ,'2009' ,'2007' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'CANCER, ALL' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1998' ,'2002' ,'2010' ,
          '1997' ,'1999' ,'2005' ,'1991' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2008' ,'1992' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
        'CANCER, ALL' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('1990' ,'2008' ,'2005' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        '1990' ,'2008' ,'2005' ,'1992' ,'1994' ,'1998' ,'2002' ,'2010' ,
        '1997' ,'1999' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('MALE' ,'ALL' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
         IF MISSING( Date  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          '1990' ,'2008' ,'2005' ,'1992' ,'1994' ,'1998' ,'2002' ,'2010' ,
          '1997' ,'1999' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.22089337;
        END;
      END;
    END;
  END;

********** LEAF    65  NODE   501 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1998' ,'2002' ,'2008' ,'2010' ,
    '1997' ,'1999' ,'2005' ,'1991' ,'1992' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '1990' ,'1994' ,'1995' ,'1998' ,'2002' ,'2008' ,'2010' ,'1997' ,'1999' ,
    '2005' ,'1991' ,'1992' ,'1993' ,'1996' ,'2000' ,'2001' ,'2003' ,'2004' ,
    '2006' ,'2009' ,'2007' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_32 IN ('ASTHMA' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1994' ,'1995' ,'1998' ,'2002' ,'2008' ,'2010' ,'1997' ,'1999' ,
      '2005' ,'1991' ,'1992' ,'1993' ,'1996' ,'2000' ,'2001' ,'2003' ,'2004' ,
      '2006' ,'2009' ,'2007' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'CANCER, ALL' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1998' ,'2002' ,'2010' ,
          '1997' ,'1999' ,'2005' ,'1991' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2008' ,'1992' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
        'CANCER, ALL' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('1994' ,'1998' ,'2002' ,'2010' ,'1997' ,'1999' ) 
         THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        '1990' ,'2008' ,'2005' ,'1992' ,'1994' ,'1998' ,'2002' ,'2010' ,
        '1997' ,'1999' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('MALE' ,'ALL' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.193811774;
        END;
      END;
    END;
  END;

********** LEAF    66  NODE   497 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1998' ,'2002' ,'2008' ,'2010' ,
    '1997' ,'1999' ,'2005' ,'1991' ,'1992' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '1990' ,'1994' ,'1995' ,'1998' ,'2002' ,'2008' ,'2010' ,'1997' ,'1999' ,
    '2005' ,'1991' ,'1992' ,'1993' ,'1996' ,'2000' ,'2001' ,'2003' ,'2004' ,
    '2006' ,'2009' ,'2007' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_32 IN ('ASTHMA' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1994' ,'1995' ,'1998' ,'2002' ,'2008' ,'2010' ,'1997' ,'1999' ,
      '2005' ,'1991' ,'1992' ,'1993' ,'1996' ,'2000' ,'2001' ,'2003' ,'2004' ,
      '2006' ,'2009' ,'2007' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'CANCER, ALL' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('2008' ,'1992' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1998' ,'2002' ,
          '2010' ,'1997' ,'1999' ,'2005' ,'1991' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.192992159;
      END;
    END;
  END;

********** LEAF    67  NODE   498 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1993' ,'1996' ,'2000' ,'2001' ,'2003' ,'2004' ,'2006' ,
    '2009' ,'2007' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '1990' ,'1994' ,'1995' ,'1998' ,'2002' ,'2008' ,'2010' ,'1997' ,'1999' ,
    '2005' ,'1991' ,'1992' ,'1993' ,'1996' ,'2000' ,'2001' ,'2003' ,'2004' ,
    '2006' ,'2009' ,'2007' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1993' ,'1996' ,'2000' ,'2001' ,'2004' ,'2006' ,
          '2009' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2003' ,'2007' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
       IF MISSING( Gender  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' ,'ALL' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.499799499;
      END;
    END;
  END;

********** LEAF    68  NODE   499 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1993' ,'1996' ,'2000' ,'2001' ,'2003' ,'2004' ,'2006' ,
    '2009' ,'2007' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '1990' ,'1994' ,'1995' ,'1998' ,'2002' ,'2008' ,'2010' ,'1997' ,'1999' ,
    '2005' ,'1991' ,'1992' ,'1993' ,'1996' ,'2000' ,'2001' ,'2003' ,'2004' ,
    '2006' ,'2009' ,'2007' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('ALL' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2003' ,'2007' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1993' ,'1996' ,'2000' ,'2001' ,'2004' ,
          '2006' ,'2009' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 3.173266654;
      END;
    END;
  END;

********** LEAF    69  NODE   503 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 1.1772008626;
    END;
  END;

********** LEAF    70  NODE   507 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'85+' ,'25-44' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1993' ,'1995' ,'1996' ,'1998' ,'2000' ,
          '2001' ,'2002' ,'2003' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,
          '1999' ,'2005' ,'2007' ,'1991' ,'1992' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1994' ,'2004' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'85+' ,'25-44' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('SEPTICEMIA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('CANCER, ALL' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('MALE' ,'ALL' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.110700981;
        END;
      END;
    END;
  END;

********** LEAF    71  NODE   508 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'85+' ,'25-44' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1993' ,'1995' ,'1996' ,'1998' ,'2000' ,
          '2001' ,'2002' ,'2003' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,
          '1999' ,'2005' ,'2007' ,'1991' ,'1992' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1994' ,'2004' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'85+' ,'25-44' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('MALE' ,'ALL' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.668446257;
        END;
      END;
    END;
  END;

********** LEAF    72  NODE   506 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ,'25-44' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'85+' ,'25-44' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1994' ,'2004' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1995' ,'1996' ,'1998' ,
          '2000' ,'2001' ,'2002' ,'2003' ,'2006' ,'2008' ,'2009' ,'2010' ,
          '1997' ,'1999' ,'2005' ,'2007' ,'1991' ,'1992' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.6280988868;
      END;
    END;
  END;

********** LEAF    73  NODE   510 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'25-44' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'25-44' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2009' ,'2010' ,'2007' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,
        '1998' ,'2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,
        '1999' ,'2005' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 1.1496040712;
    END;
  END;

********** LEAF    74  NODE   512 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'25-44' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'1999' ,
        '2005' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2009' ,'2010' ,'2007' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'25-44' ,'85+' ,'18-24' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.390038679;
      END;
    END;
  END;

********** LEAF    75  NODE   514 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'25-44' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'1999' ,
        '2005' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2009' ,'2010' ,'2007' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'25-44' ,'85+' ,'18-24' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('SEPTICEMIA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('CANCER, ALL' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.8225651198;
        END;
      END;
    END;
  END;

********** LEAF    76  NODE   515 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'25-44' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'1999' ,
        '2005' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2009' ,'2010' ,'2007' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'25-44' ,'85+' ,'18-24' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '85+' ,'18-24' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.70409862;
        END;
      END;
    END;
  END;

********** LEAF    77  NODE   517 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'25-44' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'25-44' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2003' ,'2010' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2004' ,'2006' ,'2008' ,'2009' ,'1997' ,
        '1999' ,'2005' ,'2007' ,'1991' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.6953508713;
    END;
  END;

********** LEAF    78  NODE   519 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'25-44' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,'2000' ,
        '2001' ,'2002' ,'2004' ,'2006' ,'2008' ,'2009' ,'1997' ,'1999' ,
        '2005' ,'2007' ,'1991' ,'1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2003' ,'2010' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'25-44' ,'85+' ,'18-24' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN 
        DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'CANCER, ALL' ,
      'SEPTICEMIA' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1993' ,'1998' ,'2000' ,'2002' ,'2003' ,'2006' ,
          '2008' ,'1997' ,'2005' ,'2007' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1990' ,'1994' ,'1996' ,'2004' ,'2009' ,
          '2010' ,'1999' ,'1992' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.293630271;
      END;
    END;
  END;

********** LEAF    79  NODE   520 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'25-44' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,'2000' ,
        '2001' ,'2002' ,'2004' ,'2006' ,'2008' ,'2009' ,'1997' ,'1999' ,
        '2005' ,'2007' ,'1991' ,'1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2003' ,'2010' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'25-44' ,'85+' ,'18-24' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,'OSTEOARTHRITIS' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'CANCER, ALL' ,
      'SEPTICEMIA' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1994' ,'1996' ,'2004' ,'2009' ,'2010' ,
          '1999' ,'1992' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1993' ,'1998' ,'2000' ,'2002' ,'2003' ,
          '2006' ,'2008' ,'1997' ,'2005' ,'2007' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'CANCER, ALL' ,
        'SEPTICEMIA' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0535900869;
      END;
    END;
  END;

********** LEAF    80  NODE   524 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2002' ,
    '2003' ,'2006' ,'2008' ,'2010' ,'1999' ,'2005' ,'1991' ,'1992' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2002' ,'2003' ,'2006' ,
      '2008' ,'2010' ,'1999' ,'2005' ,'1991' ,'1992' ,'1993' ,'1996' ,'2004' ,
      '2009' ,'1997' ,'2007' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('1994' ,'2001' ,'2010' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1990' ,'1995' ,'1998' ,'2000' ,'2002' ,
          '2003' ,'2006' ,'2008' ,'1999' ,'2005' ,'1991' ,'1992' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.127299528;
      END;
    END;
  END;

********** LEAF    81  NODE   526 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2002' ,
    '2003' ,'2006' ,'2008' ,'2010' ,'1999' ,'2005' ,'1991' ,'1992' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2002' ,'2003' ,'2006' ,
      '2008' ,'2010' ,'1999' ,'2005' ,'1991' ,'1992' ,'1993' ,'1996' ,'2004' ,
      '2009' ,'1997' ,'2007' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('1990' ,'1995' ,'1998' ,'2000' ,'2002' ,'2003' ,
          '2006' ,'2008' ,'1999' ,'2005' ,'1991' ,'1992' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1994' ,'2001' ,'2010' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('1994' ,'1998' ,'2002' ,'2008' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          '1994' ,'1998' ,'2002' ,'2008' ,'1992' ,'1990' ,'2000' ,'2003' ,
          '2006' ,'1999' ,'2005' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.527070399;
        END;
      END;
    END;
  END;

********** LEAF    82  NODE   527 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2002' ,
    '2003' ,'2006' ,'2008' ,'2010' ,'1999' ,'2005' ,'1991' ,'1992' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2002' ,'2003' ,'2006' ,
      '2008' ,'2010' ,'1999' ,'2005' ,'1991' ,'1992' ,'1993' ,'1996' ,'2004' ,
      '2009' ,'1997' ,'2007' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('1990' ,'1995' ,'1998' ,'2000' ,'2002' ,'2003' ,
          '2006' ,'2008' ,'1999' ,'2005' ,'1991' ,'1992' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1994' ,'2001' ,'2010' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('1990' ,'2000' ,'2003' ,'2006' ,'1999' ,'2005' ) 
         THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.062093854;
        END;
      END;
    END;
  END;

********** LEAF    83  NODE   523 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1993' ,'1996' ,'2004' ,'2009' ,'1997' ,'2007' ) THEN 
        DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.6626872278;
    END;
  END;

********** LEAF    84  NODE   535 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'2000' ,'2001' ,'2002' ,'2003' ,
    '2008' ,'2009' ,'2010' ,'1999' ,'2005' ,'1991' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'2000' ,'2001' ,'2002' ,'2003' ,'2008' ,'2009' ,
      '2010' ,'1999' ,'2005' ,'1991' ,'1995' ,'1996' ,'1998' ,'2004' ,'2006' ,
      '1997' ,'2007' ,'1992' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'CANCER, ALL' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'2000' ,'2001' ,'2002' ,
          '2008' ,'2009' ,'2010' ,'1999' ,'1991' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2003' ,'2005' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
        'CANCER, ALL' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('1990' ,'2001' ,'2009' ,'1999' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          '1990' ,'2001' ,'2009' ,'1999' ,'1993' ,'1994' ,'2000' ,'2003' ,
          '2010' ,'2005' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.547456021;
        END;
      END;
    END;
  END;

********** LEAF    85  NODE   536 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'2000' ,'2001' ,'2002' ,'2003' ,
    '2008' ,'2009' ,'2010' ,'1999' ,'2005' ,'1991' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'2000' ,'2001' ,'2002' ,'2003' ,'2008' ,'2009' ,
      '2010' ,'1999' ,'2005' ,'1991' ,'1995' ,'1996' ,'1998' ,'2004' ,'2006' ,
      '1997' ,'2007' ,'1992' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'CANCER, ALL' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'2000' ,'2001' ,'2002' ,
          '2008' ,'2009' ,'2010' ,'1999' ,'1991' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2003' ,'2005' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
        'CANCER, ALL' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('1993' ,'1994' ,'2000' ,'2003' ,'2010' ,'2005' ) 
         THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.072566522;
        END;
      END;
    END;
  END;

********** LEAF    86  NODE   532 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'2000' ,'2001' ,'2002' ,'2003' ,
    '2008' ,'2009' ,'2010' ,'1999' ,'2005' ,'1991' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'2000' ,'2001' ,'2002' ,'2003' ,'2008' ,'2009' ,
      '2010' ,'1999' ,'2005' ,'1991' ,'1995' ,'1996' ,'1998' ,'2004' ,'2006' ,
      '1997' ,'2007' ,'1992' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'CANCER, ALL' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('2003' ,'2005' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'2000' ,'2001' ,
          '2002' ,'2008' ,'2009' ,'2010' ,'1999' ,'1991' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.050639579;
      END;
    END;
  END;

********** LEAF    87  NODE   533 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1995' ,'1996' ,'1998' ,'2004' ,'2006' ,'1997' ,'2007' ,
    '1992' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('1995' ,'1998' ,'2006' ,'1997' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1996' ,'2004' ,'2007' ,'1992' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('ALL' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.9783708936;
      END;
    END;
  END;

********** LEAF    88  NODE   534 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1995' ,'1996' ,'1998' ,'2004' ,'2006' ,'1997' ,'2007' ,
    '1992' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('1996' ,'2004' ,'2007' ,'1992' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1995' ,'1998' ,'2006' ,'1997' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('ALL' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.364665067;
      END;
    END;
  END;

********** LEAF    89  NODE   538 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 1.4836304264;
    END;
  END;

********** LEAF    90  NODE   540 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '85+' ,'0-17' ,'18-24' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1993' ,'2001' ,'2004' ,'2009' ,'1997' ,'1999' ,
          '1991' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1990' ,'1994' ,'1996' ,'1998' ,'2000' ,
          '2002' ,'2003' ,'2006' ,'2008' ,'2010' ,'2005' ,'2007' ,'1992' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '85+' ,'0-17' ,'18-24' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.6152401121;
      END;
    END;
  END;

********** LEAF    91  NODE   542 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '85+' ,'0-17' ,'18-24' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1994' ,'1996' ,'1998' ,'2000' ,'2002' ,
          '2003' ,'2006' ,'2008' ,'2010' ,'2005' ,'2007' ,'1992' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1993' ,'2001' ,'2004' ,'2009' ,'1997' ,
          '1999' ,'1991' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '18-24' ,'0-17' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('ALL' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('SEPTICEMIA' ,'OSTEOARTHRITIS' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '18-24' ,'0-17' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.395120857;
        END;
      END;
    END;
  END;

********** LEAF    92  NODE   543 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '85+' ,'0-17' ,'18-24' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1994' ,'1996' ,'1998' ,'2000' ,'2002' ,
          '2003' ,'2006' ,'2008' ,'2010' ,'2005' ,'2007' ,'1992' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1993' ,'2001' ,'2004' ,'2009' ,'1997' ,
          '1999' ,'1991' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '18-24' ,'0-17' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('ALL' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('CANCER, ALL' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' ,'OSTEOARTHRITIS' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.027962504;
        END;
      END;
    END;
  END;

********** LEAF    93  NODE   549 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,'2000' ,
    '2002' ,'2004' ,'2006' ,'2008' ,'2010' ,'1999' ,'2005' ,'2007' ,'1991' )
     THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'2000' ,
      '2002' ,'2010' ,'2005' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'2000' ,'2002' ,'2010' ,'2005' ,
      '1998' ,'2004' ,'2006' ,'2008' ,'1999' ,'2007' ,'1991' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('ALL' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'2000' ,'2002' ,'2010' ,
        '2005' ,'1998' ,'2004' ,'2006' ,'2008' ,'1999' ,'2007' ,'1991' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'CANCER, ALL' ,'OSTEOARTHRITIS' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
            IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'2000' ,'2002' ,
            '2010' ,'2005' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('1995' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Disease  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_32 NOTIN (
          'ASTHMA' ,'SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'CANCER, ALL' ,'OSTEOARTHRITIS' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.76057174;
        END;
      END;
    END;
  END;

********** LEAF    94  NODE   550 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,'2000' ,
    '2002' ,'2004' ,'2006' ,'2008' ,'2010' ,'1999' ,'2005' ,'2007' ,'1991' )
     THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'2000' ,
      '2002' ,'2010' ,'2005' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'2000' ,'2002' ,'2010' ,'2005' ,
      '1998' ,'2004' ,'2006' ,'2008' ,'1999' ,'2007' ,'1991' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('ALL' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'2000' ,'2002' ,'2010' ,
        '2005' ,'1998' ,'2004' ,'2006' ,'2008' ,'1999' ,'2007' ,'1991' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'CANCER, ALL' ,'OSTEOARTHRITIS' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
            IF _ARBFMT_10 IN ('1995' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'2000' ,
            '2002' ,'2010' ,'2005' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.21961533;
        END;
      END;
    END;
  END;

********** LEAF    95  NODE   548 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,'2000' ,
    '2002' ,'2004' ,'2006' ,'2008' ,'2010' ,'1999' ,'2005' ,'2007' ,'1991' )
     THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('1998' ,'2004' ,'2006' ,'2008' ,'1999' ,'2007' ,
      '1991' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'2000' ,'2002' ,'2010' ,'2005' ,
      '1998' ,'2004' ,'2006' ,'2008' ,'1999' ,'2007' ,'1991' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('ALL' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.070427547;
      END;
    END;
  END;

********** LEAF    96  NODE   546 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2003' ,'2009' ,'1997' ,'1992' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,'2000' ,'2002' ,'2004' ,
      '2006' ,'2008' ,'2010' ,'1999' ,'2005' ,'2007' ,'1991' ,'2003' ,'2009' ,
      '1997' ,'1992' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.6523290357;
    END;
  END;

********** LEAF    97  NODE   552 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'18-24' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.5370664942;
    END;
  END;

********** LEAF    98  NODE   554 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.828806839;
      END;
    END;
  END;

********** LEAF    99  NODE   556 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('SEPTICEMIA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('1993' ,'1994' ,'1995' ,'2004' ,'2006' ,'1999' 
             ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('1990' ,'1996' ,'1998' ,'2002' ,'2008' ,
            '2009' ,'2005' ,'1992' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.5523065136;
        END;
      END;
    END;
  END;

********** LEAF   100  NODE   557 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('1990' ,'1996' ,'1998' ,'2002' ,'2008' ,'2009' ,
            '2005' ,'1992' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('1993' ,'1994' ,'1995' ,'2004' ,'2006' ,
            '1999' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '85+' ,'18-24' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.365030874;
        END;
      END;
    END;
  END;

********** LEAF   101  NODE   559 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.8623805562;
    END;
  END;

********** LEAF   102  NODE   561 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '85+' ,'0-17' ,'18-24' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1993' ,'2001' ,'2006' ,'1997' ,'1999' ,'1991' ) 
           THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1990' ,'1994' ,'1996' ,'1998' ,'2000' ,
          '2002' ,'2003' ,'2004' ,'2008' ,'2009' ,'2010' ,'2005' ,'2007' ,
          '1992' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '85+' ,'0-17' ,'18-24' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.5536364159;
      END;
    END;
  END;

********** LEAF   103  NODE   563 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '85+' ,'0-17' ,'18-24' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1994' ,'1996' ,'1998' ,'2000' ,'2002' ,
          '2003' ,'2004' ,'2008' ,'2009' ,'2010' ,'2005' ,'2007' ,'1992' ) 
           THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1993' ,'2001' ,'2006' ,'1997' ,'1999' ,
          '1991' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '18-24' ,'0-17' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('ALL' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
            'OSTEOARTHRITIS' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '18-24' ,'0-17' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.422843775;
        END;
      END;
    END;
  END;

********** LEAF   104  NODE   564 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '85+' ,'0-17' ,'18-24' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1994' ,'1996' ,'1998' ,'2000' ,'2002' ,
          '2003' ,'2004' ,'2008' ,'2009' ,'2010' ,'2005' ,'2007' ,'1992' ) 
           THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1993' ,'2001' ,'2006' ,'1997' ,'1999' ,
          '1991' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '18-24' ,'0-17' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('ALL' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
            'OSTEOARTHRITIS' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.121190356;
        END;
      END;
    END;
  END;

********** LEAF   105  NODE   568 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1996' ,'2006' ,'2008' ,'2009' ,'1999' ,
    '2007' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '1990' ,'1993' ,'1996' ,'2006' ,'2008' ,'2009' ,'1999' ,'2007' ,'1994' ,
    '1995' ,'1998' ,'2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2010' ,'1997' ,
    '2005' ,'1992' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('SEPTICEMIA' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1993' ,'1996' ,'2006' ,'2008' ,'2009' ,
          '1999' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2007' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
       IF MISSING( Gender  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' ,'ALL' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.379947336;
      END;
    END;
  END;

********** LEAF   106  NODE   569 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1996' ,'2006' ,'2008' ,'2009' ,'1999' ,
    '2007' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '1990' ,'1993' ,'1996' ,'2006' ,'2008' ,'2009' ,'1999' ,'2007' ,'1994' ,
    '1995' ,'1998' ,'2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2010' ,'1997' ,
    '2005' ,'1992' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('SEPTICEMIA' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('ALL' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2007' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1996' ,'2006' ,'2008' ,
          '2009' ,'1999' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.9033105328;
      END;
    END;
  END;

********** LEAF   107  NODE   570 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2002' ,'2003' ,
    '2004' ,'2010' ,'1997' ,'2005' ,'1992' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '1990' ,'1993' ,'1996' ,'2006' ,'2008' ,'2009' ,'1999' ,'2007' ,'1994' ,
    '1995' ,'1998' ,'2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2010' ,'1997' ,
    '2005' ,'1992' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1996' ,'2006' ,'2008' ,'2009' ,'1999' ,'2007' ,'1994' ,
      '1995' ,'1998' ,'2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2010' ,'1997' ,
      '2005' ,'1992' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN 
        DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'CANCER, ALL' ,
      'SEPTICEMIA' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('MALE' ,'ALL' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('85+' ,'25-44' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('0-17' ,'18-24' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.877028472;
      END;
    END;
  END;

********** LEAF   108  NODE   571 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2002' ,'2003' ,
    '2004' ,'2010' ,'1997' ,'2005' ,'1992' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '1990' ,'1993' ,'1996' ,'2006' ,'2008' ,'2009' ,'1999' ,'2007' ,'1994' ,
    '1995' ,'1998' ,'2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2010' ,'1997' ,
    '2005' ,'1992' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1996' ,'2006' ,'2008' ,'2009' ,'1999' ,'2007' ,'1994' ,
      '1995' ,'1998' ,'2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2010' ,'1997' ,
      '2005' ,'1992' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,'OSTEOARTHRITIS' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'CANCER, ALL' ,
      'SEPTICEMIA' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('MALE' ,'ALL' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('85+' ,'25-44' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'CANCER, ALL' ,
        'SEPTICEMIA' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.270905537;
      END;
    END;
  END;

********** LEAF   109  NODE   573 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 1.4658755871;
    END;
  END;

********** LEAF   110  NODE   575 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'18-24' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2000' ,'2010' ,'1997' ,'2007' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,
          '1998' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,
          '1999' ,'2005' ,'1992' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'85+' ,'18-24' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.047823534;
      END;
    END;
  END;

********** LEAF   111  NODE   577 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'18-24' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
          '2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'1999' ,
          '2005' ,'1992' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'2010' ,'1997' ,'2007' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'ALL' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Gender  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          'FEMALE' ,'ALL' ,'MALE' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.3101877378;
        END;
      END;
    END;
  END;

********** LEAF   112  NODE   578 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'18-24' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
          '2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'1999' ,
          '2005' ,'1992' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2000' ,'2010' ,'1997' ,'2007' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('MALE' ) THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.433312914;
        END;
      END;
    END;
  END;

********** LEAF   113  NODE   582 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2004' ,'2008' ,
    '1999' ,'2005' ,'1991' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2004' ,'2008' ,'1999' ,'2005' ,
    '1991' ,'1995' ,'1996' ,'2001' ,'2002' ,'2003' ,'2006' ,'2009' ,'2010' ,
    '1997' ,'2007' ,'1992' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_19 IN ('0-17' ,'25-44' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' )
         THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ,'OSTEOARTHRITIS' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2004' ,
          '2008' ,'1999' ,'2005' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1991' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
       IF MISSING( Gender  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' ,'ALL' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.732426384;
      END;
    END;
  END;

********** LEAF   114  NODE   583 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2004' ,'2008' ,
    '1999' ,'2005' ,'1991' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2004' ,'2008' ,'1999' ,'2005' ,
    '1991' ,'1995' ,'1996' ,'2001' ,'2002' ,'2003' ,'2006' ,'2009' ,'2010' ,
    '1997' ,'2007' ,'1992' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_19 IN ('0-17' ,'25-44' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' )
         THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ,'OSTEOARTHRITIS' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('ALL' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1991' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1998' ,'2000' ,
          '2004' ,'2008' ,'1999' ,'2005' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.019891482;
      END;
    END;
  END;

********** LEAF   115  NODE   584 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1995' ,'1996' ,'2001' ,'2002' ,'2003' ,'2006' ,'2009' ,
    '2010' ,'1997' ,'2007' ,'1992' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2004' ,'2008' ,'1999' ,'2005' ,
    '1991' ,'1995' ,'1996' ,'2001' ,'2002' ,'2003' ,'2006' ,'2009' ,'2010' ,
    '1997' ,'2007' ,'1992' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('0-17' ,'25-44' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_19 IN ('85+' ,'18-24' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ,'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2004' ,'2008' ,'1999' ,'2005' ,
      '1991' ,'1995' ,'1996' ,'2001' ,'2002' ,'2003' ,'2006' ,'2009' ,'2010' ,
      '1997' ,'2007' ,'1992' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'SEPTICEMIA' ,'CANCER, ALL' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('2010' ,'1997' ,'2007' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1995' ,'1996' ,'2001' ,'2002' ,'2003' ,
          '2006' ,'2009' ,'1992' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('0-17' ,'25-44' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('85+' ,'18-24' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.8973956302;
      END;
    END;
  END;

********** LEAF   116  NODE   585 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1995' ,'1996' ,'2001' ,'2002' ,'2003' ,'2006' ,'2009' ,
    '2010' ,'1997' ,'2007' ,'1992' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2004' ,'2008' ,'1999' ,'2005' ,
    '1991' ,'1995' ,'1996' ,'2001' ,'2002' ,'2003' ,'2006' ,'2009' ,'2010' ,
    '1997' ,'2007' ,'1992' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('0-17' ,'25-44' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_19 IN ('85+' ,'18-24' 
        ) THEN _BRANCH_ = 0; 
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ,'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2004' ,'2008' ,'1999' ,'2005' ,
      '1991' ,'1995' ,'1996' ,'2001' ,'2002' ,'2003' ,'2006' ,'2009' ,'2010' ,
      '1997' ,'2007' ,'1992' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'SEPTICEMIA' ,'CANCER, ALL' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('1995' ,'1996' ,'2001' ,'2002' ,'2003' ,'2006' ,
          '2009' ,'1992' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2010' ,'1997' ,'2007' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('0-17' ,'25-44' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'SEPTICEMIA' ,'CANCER, ALL' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.232045408;
      END;
    END;
  END;

********** LEAF   117  NODE   589 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'25-44' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'25-44' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1993' ,'2004' ,'2006' ,'2010' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2008' ,'2009' ,'1997' ,'1999' ,
        '2005' ,'2007' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('MALE' ,'ALL' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('25-44' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('0-17' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 2.3734487642;
      END;
    END;
  END;

********** LEAF   118  NODE   590 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'25-44' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'25-44' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1993' ,'2004' ,'2006' ,'2010' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2008' ,'2009' ,'1997' ,'1999' ,
        '2005' ,'2007' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('MALE' ,'ALL' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('0-17' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('25-44' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.745104489;
      END;
    END;
  END;

********** LEAF   119  NODE   591 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'25-44' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1996' ,'1998' ,'2000' ,
        '2001' ,'2002' ,'2003' ,'2008' ,'2009' ,'1997' ,'1999' ,'2005' ,
        '2007' ,'1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1993' ,'2004' ,'2006' ,'2010' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'25-44' ,'85+' ,'18-24' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'ALL' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1993' ,'1994' ,'1995' ,'1996' ,'2000' ,'2002' ,
          '2007' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1990' ,'1998' ,'2001' ,'2003' ,'2008' ,
          '2009' ,'1997' ,'1999' ,'2005' ,'1992' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.959353545;
      END;
    END;
  END;

********** LEAF   120  NODE   592 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'25-44' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1996' ,'1998' ,'2000' ,
        '2001' ,'2002' ,'2003' ,'2008' ,'2009' ,'1997' ,'1999' ,'2005' ,
        '2007' ,'1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1993' ,'2004' ,'2006' ,'2010' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'25-44' ,'85+' ,'18-24' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'ALL' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1998' ,'2001' ,'2003' ,'2008' ,'2009' ,
          '1997' ,'1999' ,'2005' ,'1992' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1993' ,'1994' ,'1995' ,'1996' ,'2000' ,
          '2002' ,'2007' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0988310237;
      END;
    END;
  END;

********** LEAF   121  NODE   596 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '85+' ,'18-24' ,'0-17' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.636489683;
      END;
    END;
  END;

********** LEAF   122  NODE   598 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '85+' ,'18-24' ,'0-17' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('1993' ,'1994' ,'1996' ,'2000' ,'2001' ,'2003' ,
            '2004' ,'2006' ,'1999' ,'2007' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('1990' ,'2008' ,'2009' ,'2005' ,'1992' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '85+' ,'18-24' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.5588263303;
        END;
      END;
    END;
  END;

********** LEAF   123  NODE   599 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '85+' ,'18-24' ,'0-17' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('1990' ,'2008' ,'2009' ,'2005' ,'1992' ) THEN 
             DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('1993' ,'1994' ,'1996' ,'2000' ,'2001' ,
            '2003' ,'2004' ,'2006' ,'1999' ,'2007' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.3062954;
        END;
      END;
    END;
  END;

********** LEAF   124  NODE   595 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 1.1666213438;
    END;
  END;

********** LEAF   125  NODE   607 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,'2001' ,
    '2002' ,'2003' ,'2008' ,'2009' ,'2010' ,'1999' ,'2005' ,'1992' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,'2001' ,'2002' ,'2003' ,
      '2008' ,'2009' ,'2010' ,'1999' ,'2005' ,'1992' ,'2000' ,'2004' ,'2006' ,
      '1997' ,'2007' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'2002' ,'2003' ,'2008' ,
      '2009' ,'2010' ,'2005' ,'1992' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '1990' ,'1994' ,'1995' ,'2002' ,'2003' ,'2008' ,'2009' ,'2010' ,
        '2005' ,'1992' ,'1993' ,'1996' ,'1998' ,'2001' ,'1999' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' ,'ALL' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
          _ARBFMT_32 = PUT( Disease , $32.);
           %DMNORMIP( _ARBFMT_32);
            IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('1990' ,'1994' ,'2002' ,'2003' ,'2008' ,'2009' ,
            '2010' ,'2005' ,'1992' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('1995' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
         IF MISSING( Gender  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          'FEMALE' ,'MALE' ,'ALL' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'2008' ,'2009' ,'2010' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_10 NOTIN (
          '1990' ,'2008' ,'2009' ,'2010' ,'1994' ,'2002' ,'2003' ,'2005' ,
          '1992' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            _ARBFMT_32 = PUT( Disease , $32.);
             %DMNORMIP( _ARBFMT_32);
              IF _ARBFMT_32 IN ('CANCER, ALL' ,
              'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
               _BRANCH_ =    1; 
              END; 
              ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ,
              'OSTEOARTHRITIS' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;
        IF _BRANCH_ LT 0 THEN DO; 
           IF MISSING( Date  ) THEN _BRANCH_ = 1;
          ELSE IF _ARBFMT_10 NOTIN (
            '1990' ,'2008' ,'2009' ,'2010' ,'1994' ,'2002' ,'2003' ,'2005' ,
            '1992' 
             ) THEN _BRANCH_ = 1;
        END; 
        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -0.544338746;
          END;
        END;
      END;
    END;
  END;

********** LEAF   126  NODE   608 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,'2001' ,
    '2002' ,'2003' ,'2008' ,'2009' ,'2010' ,'1999' ,'2005' ,'1992' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,'2001' ,'2002' ,'2003' ,
      '2008' ,'2009' ,'2010' ,'1999' ,'2005' ,'1992' ,'2000' ,'2004' ,'2006' ,
      '1997' ,'2007' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'2002' ,'2003' ,'2008' ,
      '2009' ,'2010' ,'2005' ,'1992' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '1990' ,'1994' ,'1995' ,'2002' ,'2003' ,'2008' ,'2009' ,'2010' ,
        '2005' ,'1992' ,'1993' ,'1996' ,'1998' ,'2001' ,'1999' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' ,'ALL' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
          _ARBFMT_32 = PUT( Disease , $32.);
           %DMNORMIP( _ARBFMT_32);
            IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('1990' ,'1994' ,'2002' ,'2003' ,'2008' ,'2009' ,
            '2010' ,'2005' ,'1992' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('1995' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
         IF MISSING( Gender  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          'FEMALE' ,'MALE' ,'ALL' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1994' ,'2002' ,'2003' ,'2005' ,'1992' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_10 NOTIN (
          '1990' ,'2008' ,'2009' ,'2010' ,'1994' ,'2002' ,'2003' ,'2005' ,
          '1992' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            _ARBFMT_32 = PUT( Disease , $32.);
             %DMNORMIP( _ARBFMT_32);
              IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ,'OSTEOARTHRITIS' ) 
               THEN DO;
               _BRANCH_ =    2; 
              END; 
              ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,
              'DEMENTIA AND ALZHEIMER''S DISEASE' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;

        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -0.200781726;
          END;
        END;
      END;
    END;
  END;

********** LEAF   127  NODE   606 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,'2001' ,
    '2002' ,'2003' ,'2008' ,'2009' ,'2010' ,'1999' ,'2005' ,'1992' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,'2001' ,'2002' ,'2003' ,
      '2008' ,'2009' ,'2010' ,'1999' ,'2005' ,'1992' ,'2000' ,'2004' ,'2006' ,
      '1997' ,'2007' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'2002' ,'2003' ,'2008' ,
      '2009' ,'2010' ,'2005' ,'1992' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '1990' ,'1994' ,'1995' ,'2002' ,'2003' ,'2008' ,'2009' ,'2010' ,
        '2005' ,'1992' ,'1993' ,'1996' ,'1998' ,'2001' ,'1999' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('ALL' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' ,'ALL' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
          _ARBFMT_32 = PUT( Disease , $32.);
           %DMNORMIP( _ARBFMT_32);
            IF _ARBFMT_32 IN ('SEPTICEMIA' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('1995' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('1990' ,'1994' ,'2002' ,'2003' ,'2008' ,
            '2009' ,'2010' ,'2005' ,'1992' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.2141272039;
        END;
      END;
    END;
  END;

********** LEAF   128  NODE   604 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,'2001' ,
    '2002' ,'2003' ,'2008' ,'2009' ,'2010' ,'1999' ,'2005' ,'1992' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,'2001' ,'2002' ,'2003' ,
      '2008' ,'2009' ,'2010' ,'1999' ,'2005' ,'1992' ,'2000' ,'2004' ,'2006' ,
      '1997' ,'2007' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('1993' ,'1996' ,'1998' ,'2001' ,'1999' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.790230845;
      END;
    END;
  END;

********** LEAF   129  NODE   602 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2000' ,'2004' ,'2006' ,'1997' ,'2007' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.758909367;
    END;
  END;

********** LEAF   130  NODE   610 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 1.31951489;
    END;
  END;

********** LEAF   131  NODE   612 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '85+' ,'0-17' ,'18-24' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.7887348798;
      END;
    END;
  END;

********** LEAF   132  NODE   614 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('MALE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' ,'ALL' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('OSTEOARTHRITIS' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.943484482;
        END;
      END;
    END;
  END;

********** LEAF   133  NODE   615 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ,'ALL' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('MALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('OSTEOARTHRITIS' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.23275153;
        END;
      END;
    END;
  END;

********** LEAF   134  NODE   619 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '85+' ,'18-24' ,'0-17' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1996' ,'1998' ,'2000' ,
        '2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'1997' ,
        '1999' ,'2005' ,'2007' ,'1991' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1993' ,'2010' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '85+' ,'18-24' ,'0-17' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.557832605;
      END;
    END;
  END;

********** LEAF   135  NODE   623 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '85+' ,'18-24' ,'0-17' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1996' ,'1998' ,'2000' ,
        '2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'1997' ,
        '1999' ,'2005' ,'2007' ,'1991' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1993' ,'2010' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '85+' ,'18-24' ,'0-17' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'ALL' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Gender  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          'FEMALE' ,'ALL' ,'MALE' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
          IF _ARBFMT_19 IN ('85+' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_19 NOTIN (
          '85+' ,'18-24' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
              IF _ARBFMT_32 IN ('SEPTICEMIA' ,
              'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
               _BRANCH_ =    1; 
              END; 
              ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;

        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + 1.2293550022;
          END;
        END;
      END;
    END;
  END;

********** LEAF   136  NODE   624 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '85+' ,'18-24' ,'0-17' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1996' ,'1998' ,'2000' ,
        '2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'1997' ,
        '1999' ,'2005' ,'2007' ,'1991' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1993' ,'2010' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '85+' ,'18-24' ,'0-17' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'ALL' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Gender  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          'FEMALE' ,'ALL' ,'MALE' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
          IF _ARBFMT_19 IN ('18-24' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_19 NOTIN (
          '85+' ,'18-24' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
              IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
               _BRANCH_ =    2; 
              END; 
              ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' ,
              'DEMENTIA AND ALZHEIMER''S DISEASE' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;
        IF _BRANCH_ LT 0 THEN DO; 
           IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
          ELSE IF _ARBFMT_19 NOTIN (
            '85+' ,'18-24' 
             ) THEN _BRANCH_ = 2;
        END; 
        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -0.332121934;
          END;
        END;
      END;
    END;
  END;

********** LEAF   137  NODE   622 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '85+' ,'18-24' ,'0-17' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1996' ,'1998' ,'2000' ,
        '2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'1997' ,
        '1999' ,'2005' ,'2007' ,'1991' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1993' ,'2010' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '85+' ,'18-24' ,'0-17' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('MALE' ) THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.444056015;
        END;
      END;
    END;
  END;

********** LEAF   138  NODE   618 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '85+' ,'18-24' ,'0-17' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1993' ,'2010' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,
        '1997' ,'1999' ,'2005' ,'2007' ,'1991' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 1.2753018764;
    END;
  END;

********** LEAF   139  NODE   626 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1995' ,'2000' ,'2004' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.7260783624;
    END;
  END;

********** LEAF   140  NODE   628 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1993' ,'1994' ,'1996' ,'1998' ,'2001' ,'2002' ,'2003' ,
    '2006' ,'2008' ,'2009' ,'2010' ,'1997' ,'1999' ,'2005' ,'2007' ,'1992' )
     THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1995' ,'2000' ,'2004' ,'1993' ,'1994' ,'1996' ,'1998' ,'2001' ,
      '2002' ,'2003' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,'1999' ,'2005' ,
      '2007' ,'1992' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('1993' ,'1996' ,'2003' ,'2010' ,'1997' ,'1999' ,
      '1992' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.606991106;
      END;
    END;
  END;

********** LEAF   141  NODE   630 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1993' ,'1994' ,'1996' ,'1998' ,'2001' ,'2002' ,'2003' ,
    '2006' ,'2008' ,'2009' ,'2010' ,'1997' ,'1999' ,'2005' ,'2007' ,'1992' )
     THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1995' ,'2000' ,'2004' ,'1993' ,'1994' ,'1996' ,'1998' ,'2001' ,
      '2002' ,'2003' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,'1999' ,'2005' ,
      '2007' ,'1992' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('1994' ,'1998' ,'2001' ,'2002' ,'2006' ,'2008' ,
      '2009' ,'2005' ,'2007' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '1993' ,'1996' ,'2003' ,'2010' ,'1997' ,'1999' ,'1992' ,'1994' ,
        '1998' ,'2001' ,'2002' ,'2006' ,'2008' ,'2009' ,'2005' ,'2007' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' ,'ALL' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('1994' ,'1998' ,'2001' ,'2006' ,'2008' ,'2009' ,
            '2005' ,'2007' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('2002' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
         IF MISSING( Gender  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          'FEMALE' ,'MALE' ,'ALL' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.281612493;
        END;
      END;
    END;
  END;

********** LEAF   142  NODE   631 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1993' ,'1994' ,'1996' ,'1998' ,'2001' ,'2002' ,'2003' ,
    '2006' ,'2008' ,'2009' ,'2010' ,'1997' ,'1999' ,'2005' ,'2007' ,'1992' )
     THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1995' ,'2000' ,'2004' ,'1993' ,'1994' ,'1996' ,'1998' ,'2001' ,
      '2002' ,'2003' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,'1999' ,'2005' ,
      '2007' ,'1992' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('1994' ,'1998' ,'2001' ,'2002' ,'2006' ,'2008' ,
      '2009' ,'2005' ,'2007' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '1993' ,'1996' ,'2003' ,'2010' ,'1997' ,'1999' ,'1992' ,'1994' ,
        '1998' ,'2001' ,'2002' ,'2006' ,'2008' ,'2009' ,'2005' ,'2007' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('ALL' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' ,'ALL' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('2002' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('1994' ,'1998' ,'2001' ,'2006' ,'2008' ,
            '2009' ,'2005' ,'2007' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.4122039782;
        END;
      END;
    END;
  END;

********** LEAF   143  NODE   639 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2001' ,'2002' ,
    '2004' ,'2006' ,'2010' ,'1997' ,'1999' ,'2005' ,'2007' ,'1991' ,'1992' )
     THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2001' ,'2002' ,'2004' ,'2006' ,
      '2010' ,'1997' ,'1999' ,'2005' ,'2007' ,'1991' ,'1992' ,'1995' ,'1996' ,
      '2003' ,'2008' ,'2009' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('FEMALE' ,'ALL' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'ALL' ,'MALE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2001' ,
          '2002' ,'2006' ,'2010' ,'1997' ,'1999' ,'2005' ,'2007' ,'1991' ,
          '1992' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2004' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
       IF MISSING( Gender  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'ALL' ,'MALE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1998' ,'2000' ,'2001' ,'2002' ,'2004' ,
        '2006' ,'1997' ,'1999' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          '1990' ,'1998' ,'2000' ,'2001' ,'2002' ,'2004' ,'2006' ,'1997' ,
          '1999' ,'1992' ,'1993' ,'1994' ,'2010' ,'2005' ,'2007' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_10 NOTIN (
          'FEMALE' ,'ALL' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
            _ARBFMT_10 = PUT( Date , $10.);
             %DMNORMIP( _ARBFMT_10);
              IF _ARBFMT_10 IN ('1990' ,'1998' ,'2004' ,'1997' ,'1992' ) THEN 
               DO;
               _BRANCH_ =    1; 
              END; 
              ELSE IF _ARBFMT_10 IN ('2000' ,'2001' ,'2002' ,'2006' ,'1999' 
              ) THEN _BRANCH_ = 0; 
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            _ARBFMT_32 = PUT( Disease , $32.);
             %DMNORMIP( _ARBFMT_32);
              IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,'OSTEOARTHRITIS' ) 
               THEN DO;
               _BRANCH_ =    1; 
              END; 
              ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' ,
              'DEMENTIA AND ALZHEIMER''S DISEASE' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;

        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -0.163739619;
          END;
        END;
      END;
    END;
  END;

********** LEAF   144  NODE   640 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2001' ,'2002' ,
    '2004' ,'2006' ,'2010' ,'1997' ,'1999' ,'2005' ,'2007' ,'1991' ,'1992' )
     THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2001' ,'2002' ,'2004' ,'2006' ,
      '2010' ,'1997' ,'1999' ,'2005' ,'2007' ,'1991' ,'1992' ,'1995' ,'1996' ,
      '2003' ,'2008' ,'2009' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('FEMALE' ,'ALL' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'ALL' ,'MALE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2001' ,
          '2002' ,'2006' ,'2010' ,'1997' ,'1999' ,'2005' ,'2007' ,'1991' ,
          '1992' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2004' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
       IF MISSING( Gender  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'ALL' ,'MALE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1998' ,'2000' ,'2001' ,'2002' ,'2004' ,
        '2006' ,'1997' ,'1999' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          '1990' ,'1998' ,'2000' ,'2001' ,'2002' ,'2004' ,'2006' ,'1997' ,
          '1999' ,'1992' ,'1993' ,'1994' ,'2010' ,'2005' ,'2007' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('ALL' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_10 NOTIN (
          'FEMALE' ,'ALL' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
            _ARBFMT_10 = PUT( Date , $10.);
             %DMNORMIP( _ARBFMT_10);
              IF _ARBFMT_10 IN ('2000' ,'2001' ,'2002' ,'2006' ,'1999' ) THEN 
               DO;
               _BRANCH_ =    2; 
              END; 
              ELSE IF _ARBFMT_10 IN ('1990' ,'1998' ,'2004' ,'1997' ,'1992' 
              ) THEN _BRANCH_ = 0; 
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            _ARBFMT_32 = PUT( Disease , $32.);
             %DMNORMIP( _ARBFMT_32);
              IF _ARBFMT_32 IN ('SEPTICEMIA' ,
              'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
               _BRANCH_ =    2; 
              END; 
              ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,
              'OSTEOARTHRITIS' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;
        IF _BRANCH_ LT 0 THEN DO; 
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
           IF MISSING( Gender  ) THEN _BRANCH_ = 2;
          ELSE IF _ARBFMT_10 NOTIN (
            'FEMALE' ,'ALL' 
             ) THEN _BRANCH_ = 2;
        END; 
        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -0.55118259;
          END;
        END;
      END;
    END;
  END;

********** LEAF   145  NODE   638 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2001' ,'2002' ,
    '2004' ,'2006' ,'2010' ,'1997' ,'1999' ,'2005' ,'2007' ,'1991' ,'1992' )
     THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2001' ,'2002' ,'2004' ,'2006' ,
      '2010' ,'1997' ,'1999' ,'2005' ,'2007' ,'1991' ,'1992' ,'1995' ,'1996' ,
      '2003' ,'2008' ,'2009' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('FEMALE' ,'ALL' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'ALL' ,'MALE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2001' ,
          '2002' ,'2006' ,'2010' ,'1997' ,'1999' ,'2005' ,'2007' ,'1991' ,
          '1992' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2004' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
       IF MISSING( Gender  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'ALL' ,'MALE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1993' ,'1994' ,'2010' ,'2005' ,'2007' ) THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.3381226612;
        END;
      END;
    END;
  END;

********** LEAF   146  NODE   636 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2001' ,'2002' ,
    '2004' ,'2006' ,'2010' ,'1997' ,'1999' ,'2005' ,'2007' ,'1991' ,'1992' )
     THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1998' ,'2000' ,'2001' ,'2002' ,'2004' ,'2006' ,
      '2010' ,'1997' ,'1999' ,'2005' ,'2007' ,'1991' ,'1992' ,'1995' ,'1996' ,
      '2003' ,'2008' ,'2009' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('MALE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'ALL' ,'MALE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('2004' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1998' ,'2000' ,
          '2001' ,'2002' ,'2006' ,'2010' ,'1997' ,'1999' ,'2005' ,'2007' ,
          '1991' ,'1992' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.750651116;
      END;
    END;
  END;

********** LEAF   147  NODE   634 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1995' ,'1996' ,'2003' ,'2008' ,'2009' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.7450920111;
    END;
  END;

********** LEAF   148  NODE   642 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 1.1024909525;
    END;
  END;

********** LEAF   149  NODE   646 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' ,'0-17' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1996' ,'1998' ,'2000' ,'2001' ,
        '2004' ,'2005' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.248465365;
        END;
      END;
    END;
  END;

********** LEAF   150  NODE   647 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' ,'0-17' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1994' ,'2002' ,'2006' ,'2008' ,'2009' ,'1999' ) 
         THEN DO;
         _BRANCH_ =    2; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_10 NOTIN (
          '1990' ,'1993' ,'1996' ,'1998' ,'2000' ,'2001' ,'2004' ,'2005' ,
          '1992' ,'1994' ,'2002' ,'2006' ,'2008' ,'2009' ,'1999' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.3990252736;
        END;
      END;
    END;
  END;

********** LEAF   151  NODE   645 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.037193002;
      END;
    END;
  END;

********** LEAF   152  NODE   649 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2010' ,'2007' ,'1991' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,
        '1998' ,'2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,
        '2009' ,'1997' ,'1999' ,'2005' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'18-24' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.891600809;
    END;
  END;

********** LEAF   153  NODE   651 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,
        '1997' ,'1999' ,'2005' ,'1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2010' ,'2007' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.74222077;
      END;
    END;
  END;

********** LEAF   154  NODE   653 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,
        '1997' ,'1999' ,'2005' ,'1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2010' ,'2007' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'CANCER, ALL' ,'SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('85+' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_19 IN ('18-24' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('MALE' ,'ALL' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Disease  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_32 NOTIN (
          'CANCER, ALL' ,'SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'OSTEOARTHRITIS' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.3765505866;
        END;
      END;
    END;
  END;

********** LEAF   155  NODE   654 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,
        '1997' ,'1999' ,'2005' ,'1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2010' ,'2007' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'CANCER, ALL' ,'SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('18-24' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_19 IN ('85+' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('MALE' ,'ALL' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.21707248;
        END;
      END;
    END;
  END;

********** LEAF   156  NODE   656 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 1.0614022897;
    END;
  END;

********** LEAF   157  NODE   660 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' ,'0-17' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('SEPTICEMIA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('MALE' ,'ALL' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '85+' ,'18-24' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.4963167143;
        END;
      END;
    END;
  END;

********** LEAF   158  NODE   661 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' ,'0-17' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('MALE' ,'ALL' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.147017402;
        END;
      END;
    END;
  END;

********** LEAF   159  NODE   659 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.079730644;
      END;
    END;
  END;

********** LEAF   160  NODE   663 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2000' ,'2003' ,'2010' ,'1997' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,
        '1998' ,'2001' ,'2002' ,'2004' ,'2006' ,'2008' ,'2009' ,'1999' ,
        '2005' ,'2007' ,'1991' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'18-24' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.7481258154;
    END;
  END;

********** LEAF   161  NODE   665 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2001' ,'2002' ,'2004' ,'2006' ,'2008' ,'2009' ,'1999' ,'2005' ,
        '2007' ,'1991' ,'1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2003' ,'2010' ,'1997' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.929644748;
      END;
    END;
  END;

********** LEAF   162  NODE   667 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2001' ,'2002' ,'2004' ,'2006' ,'2008' ,'2009' ,'1999' ,'2005' ,
        '2007' ,'1991' ,'1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2003' ,'2010' ,'1997' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('CANCER, ALL' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('ALL' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.9535316723;
        END;
      END;
    END;
  END;

********** LEAF   163  NODE   668 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '0-17' ,'85+' ,'18-24' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2001' ,'2002' ,'2004' ,'2006' ,'2008' ,'2009' ,'1999' ,'2005' ,
        '2007' ,'1991' ,'1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2000' ,'2003' ,'2010' ,'1997' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('SEPTICEMIA' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('ALL' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '85+' ,'18-24' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.303949807;
        END;
      END;
    END;
  END;

********** LEAF   164  NODE   672 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'2000' ,'2001' ,'2003' ,'2004' ,'2008' ,'1997' ,
    '1991' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '1990' ,'2000' ,'2001' ,'2003' ,'2004' ,'2008' ,'1997' ,'1991' ,'1993' ,
    '1994' ,'1995' ,'1996' ,'1998' ,'2002' ,'2006' ,'2009' ,'2010' ,'1999' ,
    '2005' ,'2007' ,'1992' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('18-24' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('0-17' ,'85+' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('2004' ,'2008' ,'1991' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1990' ,'2000' ,'2001' ,'2003' ,'1997' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.789057464;
      END;
    END;
  END;

********** LEAF   165  NODE   673 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'2000' ,'2001' ,'2003' ,'2004' ,'2008' ,'1997' ,
    '1991' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '1990' ,'2000' ,'2001' ,'2003' ,'2004' ,'2008' ,'1997' ,'1991' ,'1993' ,
    '1994' ,'1995' ,'1996' ,'1998' ,'2002' ,'2006' ,'2009' ,'2010' ,'1999' ,
    '2005' ,'2007' ,'1992' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('0-17' ,'85+' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('18-24' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('1990' ,'2000' ,'2001' ,'2003' ,'1997' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2004' ,'2008' ,'1991' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.457128289;
      END;
    END;
  END;

********** LEAF   166  NODE   674 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1993' ,'1994' ,'1995' ,'1996' ,'1998' ,'2002' ,'2006' ,
    '2009' ,'2010' ,'1999' ,'2005' ,'2007' ,'1992' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '1990' ,'2000' ,'2001' ,'2003' ,'2004' ,'2008' ,'1997' ,'1991' ,'1993' ,
    '1994' ,'1995' ,'1996' ,'1998' ,'2002' ,'2006' ,'2009' ,'2010' ,'1999' ,
    '2005' ,'2007' ,'1992' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_32 IN ('CANCER, ALL' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'2000' ,'2001' ,'2003' ,'2004' ,'2008' ,'1997' ,'1991' ,'1993' ,
      '1994' ,'1995' ,'1996' ,'1998' ,'2002' ,'2006' ,'2009' ,'2010' ,'1999' ,
      '2005' ,'2007' ,'1992' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.9939826216;
      END;
    END;
  END;

********** LEAF   167  NODE   676 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1993' ,'1994' ,'1995' ,'1996' ,'1998' ,'2002' ,'2006' ,
    '2009' ,'2010' ,'1999' ,'2005' ,'2007' ,'1992' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '1990' ,'2000' ,'2001' ,'2003' ,'2004' ,'2008' ,'1997' ,'1991' ,'1993' ,
    '1994' ,'1995' ,'1996' ,'1998' ,'2002' ,'2006' ,'2009' ,'2010' ,'1999' ,
    '2005' ,'2007' ,'1992' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_32 IN ('CANCER, ALL' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'2000' ,'2001' ,'2003' ,'2004' ,'2008' ,'1997' ,'1991' ,'1993' ,
      '1994' ,'1995' ,'1996' ,'1998' ,'2002' ,'2006' ,'2009' ,'2010' ,'1999' ,
      '2005' ,'2007' ,'1992' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('1994' ,'1995' ,'1998' ,'2002' ,'2010' ,'1999' ,
        '2005' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        '1994' ,'1995' ,'1998' ,'2002' ,'2010' ,'1999' ,'2005' ,'1993' ,
        '1996' ,'2006' ,'2009' ,'1992' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('MALE' ,'ALL' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('OSTEOARTHRITIS' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
         IF MISSING( Date  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          '1994' ,'1995' ,'1998' ,'2002' ,'2010' ,'1999' ,'2005' ,'1993' ,
          '1996' ,'2006' ,'2009' ,'1992' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.2999192114;
        END;
      END;
    END;
  END;

********** LEAF   168  NODE   677 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1993' ,'1994' ,'1995' ,'1996' ,'1998' ,'2002' ,'2006' ,
    '2009' ,'2010' ,'1999' ,'2005' ,'2007' ,'1992' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    '1990' ,'2000' ,'2001' ,'2003' ,'2004' ,'2008' ,'1997' ,'1991' ,'1993' ,
    '1994' ,'1995' ,'1996' ,'1998' ,'2002' ,'2006' ,'2009' ,'2010' ,'1999' ,
    '2005' ,'2007' ,'1992' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_32 IN ('CANCER, ALL' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'2000' ,'2001' ,'2003' ,'2004' ,'2008' ,'1997' ,'1991' ,'1993' ,
      '1994' ,'1995' ,'1996' ,'1998' ,'2002' ,'2006' ,'2009' ,'2010' ,'1999' ,
      '2005' ,'2007' ,'1992' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('1993' ,'1996' ,'2006' ,'2009' ,'1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        '1994' ,'1995' ,'1998' ,'2002' ,'2010' ,'1999' ,'2005' ,'1993' ,
        '1996' ,'2006' ,'2009' ,'1992' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('MALE' ,'ALL' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('OSTEOARTHRITIS' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.420563413;
        END;
      END;
    END;
  END;

********** LEAF   169  NODE   679 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1996' ,'2000' ,'2007' ,'1992' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.8796320451;
    END;
  END;

********** LEAF   170  NODE   681 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1993' ,'1994' ,'1995' ,'1998' ,'2001' ,'2002' ,'2003' ,
    '2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,'1999' ,'2005' ,'1991' )
     THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1996' ,'2000' ,'2007' ,'1992' ,'1993' ,'1994' ,'1995' ,'1998' ,
      '2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,
      '1999' ,'2005' ,'1991' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('1993' ,'2002' ,'2008' ,'2010' ,'1999' ,'1991' ) THEN 
        DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.549341491;
      END;
    END;
  END;

********** LEAF   171  NODE   685 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1993' ,'1994' ,'1995' ,'1998' ,'2001' ,'2002' ,'2003' ,
    '2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,'1999' ,'2005' ,'1991' )
     THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1996' ,'2000' ,'2007' ,'1992' ,'1993' ,'1994' ,'1995' ,'1998' ,
      '2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,
      '1999' ,'2005' ,'1991' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('1994' ,'1995' ,'1998' ,'2001' ,'2003' ,'2004' ,
      '2006' ,'2009' ,'1997' ,'2005' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '1993' ,'2002' ,'2008' ,'2010' ,'1999' ,'1991' ,'1994' ,'1995' ,
        '1998' ,'2001' ,'2003' ,'2004' ,'2006' ,'2009' ,'1997' ,'2005' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Gender  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          'FEMALE' ,'MALE' ,'ALL' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1994' ,'1995' ,'2003' ,'2009' ,'2005' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_10 NOTIN (
          '1994' ,'1995' ,'2003' ,'2009' ,'2005' ,'1998' ,'2001' ,'2004' ,
          '2006' ,'1997' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            _ARBFMT_19 = PUT( Age_group , $19.);
             %DMNORMIP( _ARBFMT_19);
              IF _ARBFMT_19 IN ('18-24' ) THEN DO;
               _BRANCH_ =    1; 
              END; 
              ELSE IF _ARBFMT_19 IN ('0-17' ,'85+' 
              ) THEN _BRANCH_ = 0; 
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            _ARBFMT_32 = PUT( Disease , $32.);
             %DMNORMIP( _ARBFMT_32);
              IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ) THEN DO;
               _BRANCH_ =    1; 
              END; 
              ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' ,
              'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;
        IF _BRANCH_ LT 0 THEN DO; 
           IF MISSING( Date  ) THEN _BRANCH_ = 1;
          ELSE IF _ARBFMT_10 NOTIN (
            '1994' ,'1995' ,'2003' ,'2009' ,'2005' ,'1998' ,'2001' ,'2004' ,
            '2006' ,'1997' 
             ) THEN _BRANCH_ = 1;
        END; 
        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -0.526877476;
          END;
        END;
      END;
    END;
  END;

********** LEAF   172  NODE   686 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1993' ,'1994' ,'1995' ,'1998' ,'2001' ,'2002' ,'2003' ,
    '2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,'1999' ,'2005' ,'1991' )
     THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1996' ,'2000' ,'2007' ,'1992' ,'1993' ,'1994' ,'1995' ,'1998' ,
      '2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,
      '1999' ,'2005' ,'1991' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('1994' ,'1995' ,'1998' ,'2001' ,'2003' ,'2004' ,
      '2006' ,'2009' ,'1997' ,'2005' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '1993' ,'2002' ,'2008' ,'2010' ,'1999' ,'1991' ,'1994' ,'1995' ,
        '1998' ,'2001' ,'2003' ,'2004' ,'2006' ,'2009' ,'1997' ,'2005' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Gender  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          'FEMALE' ,'MALE' ,'ALL' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
        _ARBFMT_10 = PUT( Date , $10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('1998' ,'2001' ,'2004' ,'2006' ,'1997' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_10 NOTIN (
          '1994' ,'1995' ,'2003' ,'2009' ,'2005' ,'1998' ,'2001' ,'2004' ,
          '2006' ,'1997' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            _ARBFMT_19 = PUT( Age_group , $19.);
             %DMNORMIP( _ARBFMT_19);
              IF _ARBFMT_19 IN ('0-17' ,'85+' ) THEN DO;
               _BRANCH_ =    2; 
              END; 
              ELSE IF _ARBFMT_19 IN ('18-24' 
              ) THEN _BRANCH_ = 0; 
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            _ARBFMT_32 = PUT( Disease , $32.);
             %DMNORMIP( _ARBFMT_32);
              IF _ARBFMT_32 IN ('SEPTICEMIA' ,
              'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
               _BRANCH_ =    2; 
              END; 
              ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;

        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + 0.0941693262;
          END;
        END;
      END;
    END;
  END;

********** LEAF   173  NODE   684 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1993' ,'1994' ,'1995' ,'1998' ,'2001' ,'2002' ,'2003' ,
    '2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,'1999' ,'2005' ,'1991' )
     THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1996' ,'2000' ,'2007' ,'1992' ,'1993' ,'1994' ,'1995' ,'1998' ,
      '2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,
      '1999' ,'2005' ,'1991' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('1994' ,'1995' ,'1998' ,'2001' ,'2003' ,'2004' ,
      '2006' ,'2009' ,'1997' ,'2005' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '1993' ,'2002' ,'2008' ,'2010' ,'1999' ,'1991' ,'1994' ,'1995' ,
        '1998' ,'2001' ,'2003' ,'2004' ,'2006' ,'2009' ,'1997' ,'2005' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('ALL' ) THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.112055447;
        END;
      END;
    END;
  END;

********** LEAF   174  NODE   688 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.7786248043;
    END;
  END;

********** LEAF   175  NODE   690 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'25-44' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'25-44' ,'18-24' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.502610031;
      END;
    END;
  END;

********** LEAF   176  NODE   694 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'25-44' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'25-44' ,'18-24' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Gender  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          'FEMALE' ,'MALE' ,'ALL' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
          IF _ARBFMT_19 IN ('85+' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_19 NOTIN (
          '85+' ,'18-24' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
              IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
               _BRANCH_ =    1; 
              END; 
              ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' ,
              'DEMENTIA AND ALZHEIMER''S DISEASE' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;
        IF _BRANCH_ LT 0 THEN DO; 
           IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
          ELSE IF _ARBFMT_19 NOTIN (
            '85+' ,'18-24' 
             ) THEN _BRANCH_ = 1;
        END; 
        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -0.410898194;
          END;
        END;
      END;
    END;
  END;

********** LEAF   177  NODE   695 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'25-44' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'25-44' ,'18-24' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Gender  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          'FEMALE' ,'MALE' ,'ALL' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
          IF _ARBFMT_19 IN ('18-24' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_19 NOTIN (
          '85+' ,'18-24' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
              IF _ARBFMT_32 IN ('SEPTICEMIA' ,
              'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
               _BRANCH_ =    2; 
              END; 
              ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;

        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + 0.0269739702;
          END;
        END;
      END;
    END;
  END;

********** LEAF   178  NODE   693 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'25-44' ,'18-24' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'25-44' ,'18-24' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('ALL' ) THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.5170472947;
        END;
      END;
    END;
  END;

********** LEAF   179  NODE   699 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1996' ,'2003' ,'2004' ,'2009' ,'1997' ,
    '1999' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'SEPTICEMIA' ,'CANCER, ALL' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('1993' ,'1996' ,'2003' ,'2009' ,'1997' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1990' ,'2004' ,'1999' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('0-17' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('85+' ,'18-24' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 1.7319087208;
      END;
    END;
  END;

********** LEAF   180  NODE   700 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1996' ,'2003' ,'2004' ,'2009' ,'1997' ,
    '1999' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'SEPTICEMIA' ,'CANCER, ALL' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('1990' ,'2004' ,'1999' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1993' ,'1996' ,'2003' ,'2009' ,'1997' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('0-17' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'SEPTICEMIA' ,'CANCER, ALL' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.367691565;
      END;
    END;
  END;

********** LEAF   181  NODE   701 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2002' ,'2006' ,
    '2008' ,'2010' ,'2005' ,'2007' ,'1991' ,'1992' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1996' ,'2003' ,'2004' ,'2009' ,'1997' ,'1999' ,'1994' ,
      '1995' ,'1998' ,'2000' ,'2001' ,'2002' ,'2006' ,'2008' ,'2010' ,'2005' ,
      '2007' ,'1991' ,'1992' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'25-44' ,'18-24' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('2007' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('1994' ,'1995' ,'1998' ,'2000' ,'2001' ,
          '2002' ,'2006' ,'2008' ,'2010' ,'2005' ,'1991' ,'1992' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.761970728;
      END;
    END;
  END;

********** LEAF   182  NODE   703 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2002' ,'2006' ,
    '2008' ,'2010' ,'2005' ,'2007' ,'1991' ,'1992' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1996' ,'2003' ,'2004' ,'2009' ,'1997' ,'1999' ,'1994' ,
      '1995' ,'1998' ,'2000' ,'2001' ,'2002' ,'2006' ,'2008' ,'2010' ,'2005' ,
      '2007' ,'1991' ,'1992' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ,'25-44' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'25-44' ,'18-24' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2002' ,
          '2006' ,'2008' ,'2010' ,'2005' ,'1991' ,'1992' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2007' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'85+' ,'25-44' ,'18-24' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ) 
         THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'CANCER, ALL' ,
        'SEPTICEMIA' ,'OSTEOARTHRITIS' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ,'ALL' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('MALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('1994' ,'2000' ,'2002' ,'2006' ,'2008' ,'2005' 
             ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('1995' ,'1998' ,'2001' ,'2010' ,'1992' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.898335145;
        END;
      END;
    END;
  END;

********** LEAF   183  NODE   704 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2002' ,'2006' ,
    '2008' ,'2010' ,'2005' ,'2007' ,'1991' ,'1992' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1996' ,'2003' ,'2004' ,'2009' ,'1997' ,'1999' ,'1994' ,
      '1995' ,'1998' ,'2000' ,'2001' ,'2002' ,'2006' ,'2008' ,'2010' ,'2005' ,
      '2007' ,'1991' ,'1992' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ,'25-44' ,'18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'85+' ,'25-44' ,'18-24' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          IF _ARBFMT_10 IN ('1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2002' ,
          '2006' ,'2008' ,'2010' ,'2005' ,'1991' ,'1992' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('2007' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'85+' ,'25-44' ,'18-24' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,'OSTEOARTHRITIS' ) 
         THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'CANCER, ALL' ,
        'SEPTICEMIA' ,'OSTEOARTHRITIS' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('MALE' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' ,'ALL' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('1995' ,'1998' ,'2001' ,'2010' ,'1992' ) THEN 
             DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('1994' ,'2000' ,'2002' ,'2006' ,'2008' ,
            '2005' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Disease  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_32 NOTIN (
          'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'CANCER, ALL' ,
          'SEPTICEMIA' ,'OSTEOARTHRITIS' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.4027376523;
        END;
      END;
    END;
  END;

********** LEAF   184  NODE   712 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Gender , $CHAR10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    'FEMALE' ,'MALE' ,'ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,'2000' ,
        '2001' ,'2002' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,
        '1999' ,'2005' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1995' ,'2003' ,'2007' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'85+' ,'25-44' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    1; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.2346113565;
        END;
      END;
    END;
  END;

********** LEAF   185  NODE   713 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Gender , $CHAR10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    'FEMALE' ,'MALE' ,'ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,'2000' ,
        '2001' ,'2002' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,
        '1999' ,'2005' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1995' ,'2003' ,'2007' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'85+' ,'25-44' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Disease  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_32 NOTIN (
          'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,'SEPTICEMIA' ,
          'DEMENTIA AND ALZHEIMER''S DISEASE' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.598747299;
        END;
      END;
    END;
  END;

********** LEAF   186  NODE   711 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Gender , $CHAR10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    'FEMALE' ,'MALE' ,'ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,'2000' ,
        '2001' ,'2002' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,
        '1999' ,'2005' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1995' ,'2003' ,'2007' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ,'25-44' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.752429548;
      END;
    END;
  END;

********** LEAF   187  NODE   708 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Gender , $CHAR10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('ALL' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    'FEMALE' ,'MALE' ,'ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1995' ,'2003' ,'2007' ,'1991' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,
        '1997' ,'1999' ,'2005' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1998' ,'2003' ,
      '2006' ,'1991' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.5573751026;
      END;
    END;
  END;

********** LEAF   188  NODE   709 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Gender , $CHAR10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('ALL' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    'FEMALE' ,'MALE' ,'ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1995' ,'2003' ,'2007' ,'1991' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,
        '1997' ,'1999' ,'2005' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
    _BRANCH_ = -1;
    IF MISSING( Date ) THEN _BRANCH_ = 2;
    ELSE DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 NOTIN (
        '1990' ,'1993' ,'1994' ,'1995' ,'1998' ,'2003' ,'2006' ,'1991' 
         ) THEN _BRANCH_ = 2;
    END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.5009386826;
      END;
    END;
  END;

********** LEAF   189  NODE   715 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1995' ,'2001' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,
        '2000' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,
        '1997' ,'1999' ,'2005' ,'2007' ,'1991' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 1.0278367611;
    END;
  END;

********** LEAF   190  NODE   719 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,'2000' ,
        '2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,
        '1999' ,'2005' ,'2007' ,'1991' ,'1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1995' ,'2001' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' ,'0-17' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('SEPTICEMIA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('CANCER, ALL' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('ALL' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '85+' ,'18-24' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.3151257559;
        END;
      END;
    END;
  END;

********** LEAF   191  NODE   720 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,'2000' ,
        '2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,
        '1999' ,'2005' ,'2007' ,'1991' ,'1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1995' ,'2001' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' ,'0-17' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('ALL' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.173813935;
        END;
      END;
    END;
  END;

********** LEAF   192  NODE   718 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'1998' ,'2000' ,
        '2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,
        '1999' ,'2005' ,'2007' ,'1991' ,'1992' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1995' ,'2001' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.012841482;
      END;
    END;
  END;

********** LEAF   193  NODE   724 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2003' ,
    '2006' ,'2008' ,'2009' ,'1999' ,'2007' ,'1992' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2003' ,'2006' ,'2008' ,
      '2009' ,'1999' ,'2007' ,'1992' ,'1993' ,'1996' ,'2002' ,'2004' ,'2010' ,
      '1997' ,'2005' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN 
        DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.718899609;
      END;
    END;
  END;

********** LEAF   194  NODE   726 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2003' ,
    '2006' ,'2008' ,'2009' ,'1999' ,'2007' ,'1992' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2003' ,'2006' ,'2008' ,
      '2009' ,'1999' ,'2007' ,'1992' ,'1993' ,'1996' ,'2002' ,'2004' ,'2010' ,
      '1997' ,'2005' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,'OSTEOARTHRITIS' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'CANCER, ALL' ,
        'SEPTICEMIA' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ,'ALL' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Gender  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          'FEMALE' ,'ALL' ,'MALE' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0915664983;
        END;
      END;
    END;
  END;

********** LEAF   195  NODE   727 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2003' ,
    '2006' ,'2008' ,'2009' ,'1999' ,'2007' ,'1992' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2003' ,'2006' ,'2008' ,
      '2009' ,'1999' ,'2007' ,'1992' ,'1993' ,'1996' ,'2002' ,'2004' ,'2010' ,
      '1997' ,'2005' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,'OSTEOARTHRITIS' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'CANCER, ALL' ,
        'SEPTICEMIA' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('MALE' ) THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.490169862;
        END;
      END;
    END;
  END;

********** LEAF   196  NODE   723 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1993' ,'1996' ,'2002' ,'2004' ,'2010' ,'1997' ,'2005' )
     THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.4017914159;
    END;
  END;

********** LEAF   197  NODE   733 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1998' ,'2000' ,'2001' ,
    '2003' ,'2006' ,'2008' ,'2010' ,'1999' ,'2005' ,'2007' ,'1992' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2003' ,'2006' ,
      '2008' ,'2010' ,'1999' ,'2005' ,'2007' ,'1992' ,'1996' ,'2002' ,'2004' ,
      '2009' ,'1997' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('1990' ,'1995' ,'1998' ,'2001' ,'2008' ,'1999' ,
      '2005' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '1990' ,'1995' ,'1998' ,'2001' ,'2008' ,'1999' ,'2005' ,'1993' ,'1994' ,
      '2000' ,'2003' ,'2006' ,'2010' ,'2007' ,'1992' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('18-24' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('0-17' ,'85+' ,'25-44' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
        _ARBFMT_32 = PUT( Disease , $32.);
         %DMNORMIP( _ARBFMT_32);
          IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_32 IN ('ASTHMA' ,
          'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('1990' ,'2008' ,'2005' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        '1990' ,'2008' ,'2005' ,'1995' ,'1998' ,'2001' ,'1999' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          _ARBFMT_19 = PUT( Age_group , $19.);
           %DMNORMIP( _ARBFMT_19);
            IF _ARBFMT_19 IN ('0-17' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_19 IN ('85+' ,'18-24' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
          _ARBFMT_32 = PUT( Disease , $32.);
           %DMNORMIP( _ARBFMT_32);
            IF _ARBFMT_32 IN ('CANCER, ALL' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ,'OSTEOARTHRITIS' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0176965492;
        END;
      END;
    END;
  END;

********** LEAF   198  NODE   734 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1998' ,'2000' ,'2001' ,
    '2003' ,'2006' ,'2008' ,'2010' ,'1999' ,'2005' ,'2007' ,'1992' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2003' ,'2006' ,
      '2008' ,'2010' ,'1999' ,'2005' ,'2007' ,'1992' ,'1996' ,'2002' ,'2004' ,
      '2009' ,'1997' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('1990' ,'1995' ,'1998' ,'2001' ,'2008' ,'1999' ,
      '2005' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '1990' ,'1995' ,'1998' ,'2001' ,'2008' ,'1999' ,'2005' ,'1993' ,'1994' ,
      '2000' ,'2003' ,'2006' ,'2010' ,'2007' ,'1992' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('18-24' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('0-17' ,'85+' ,'25-44' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
        _ARBFMT_32 = PUT( Disease , $32.);
         %DMNORMIP( _ARBFMT_32);
          IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_32 IN ('ASTHMA' ,
          'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('1995' ,'1998' ,'2001' ,'1999' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        '1990' ,'2008' ,'2005' ,'1995' ,'1998' ,'2001' ,'1999' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          _ARBFMT_19 = PUT( Age_group , $19.);
           %DMNORMIP( _ARBFMT_19);
            IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_19 IN ('0-17' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
          _ARBFMT_32 = PUT( Disease , $32.);
           %DMNORMIP( _ARBFMT_32);
            IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ,'OSTEOARTHRITIS' ) THEN 
             DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_10 NOTIN (
          '1990' ,'2008' ,'2005' ,'1995' ,'1998' ,'2001' ,'1999' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.287014017;
        END;
      END;
    END;
  END;

********** LEAF   199  NODE   735 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1998' ,'2000' ,'2001' ,
    '2003' ,'2006' ,'2008' ,'2010' ,'1999' ,'2005' ,'2007' ,'1992' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2003' ,'2006' ,
      '2008' ,'2010' ,'1999' ,'2005' ,'2007' ,'1992' ,'1996' ,'2002' ,'2004' ,
      '2009' ,'1997' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('1993' ,'1994' ,'2000' ,'2003' ,'2006' ,'2010' ,
      '2007' ,'1992' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '1990' ,'1995' ,'1998' ,'2001' ,'2008' ,'1999' ,'2005' ,'1993' ,'1994' ,
      '2000' ,'2003' ,'2006' ,'2010' ,'2007' ,'1992' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('0-17' ,'85+' ,'25-44' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('18-24' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
        _ARBFMT_32 = PUT( Disease , $32.);
         %DMNORMIP( _ARBFMT_32);
          IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'OSTEOARTHRITIS' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '1990' ,'1995' ,'1998' ,'2001' ,'2008' ,'1999' ,'2005' ,'1993' ,
        '1994' ,'2000' ,'2003' ,'2006' ,'2010' ,'2007' ,'1992' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'CANCER, ALL' ,'OSTEOARTHRITIS' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
            IF _ARBFMT_10 IN ('1993' ,'1994' ,'2000' ,'2003' ,'2006' ,'2010' 
             ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('2007' ,'1992' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Disease  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_32 NOTIN (
          'ASTHMA' ,'SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'CANCER, ALL' ,'OSTEOARTHRITIS' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.836096711;
        END;
      END;
    END;
  END;

********** LEAF   200  NODE   736 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1998' ,'2000' ,'2001' ,
    '2003' ,'2006' ,'2008' ,'2010' ,'1999' ,'2005' ,'2007' ,'1992' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1995' ,'1998' ,'2000' ,'2001' ,'2003' ,'2006' ,
      '2008' ,'2010' ,'1999' ,'2005' ,'2007' ,'1992' ,'1996' ,'2002' ,'2004' ,
      '2009' ,'1997' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('1993' ,'1994' ,'2000' ,'2003' ,'2006' ,'2010' ,
      '2007' ,'1992' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '1990' ,'1995' ,'1998' ,'2001' ,'2008' ,'1999' ,'2005' ,'1993' ,'1994' ,
      '2000' ,'2003' ,'2006' ,'2010' ,'2007' ,'1992' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('0-17' ,'85+' ,'25-44' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('18-24' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
        _ARBFMT_32 = PUT( Disease , $32.);
         %DMNORMIP( _ARBFMT_32);
          IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'OSTEOARTHRITIS' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        '1990' ,'1995' ,'1998' ,'2001' ,'2008' ,'1999' ,'2005' ,'1993' ,
        '1994' ,'2000' ,'2003' ,'2006' ,'2010' ,'2007' ,'1992' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'CANCER, ALL' ,'OSTEOARTHRITIS' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
            IF _ARBFMT_10 IN ('2007' ,'1992' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('1993' ,'1994' ,'2000' ,'2003' ,'2006' ,
            '2010' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.222159882;
        END;
      END;
    END;
  END;

********** LEAF   201  NODE   730 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1996' ,'2002' ,'2004' ,'2009' ,'1997' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.7158127541;
    END;
  END;

********** LEAF   202  NODE   738 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.7566362736;
    END;
  END;

********** LEAF   203  NODE   742 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' ,'0-17' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '18-24' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('1990' ,'1996' ,'2002' ,'2004' ,'2008' ,'2005' ,
            '1992' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('1993' ,'2000' ,'2003' ,'2006' ,'1997' ,
            '1999' ,'2007' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '18-24' ,'85+' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.158180916;
        END;
      END;
    END;
  END;

********** LEAF   204  NODE   743 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '85+' ,'18-24' ,'0-17' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('85+' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '18-24' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
          _ARBFMT_10 = PUT( Date , $10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('1993' ,'2000' ,'2003' ,'2006' ,'1997' ,'1999' ,
            '2007' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('1990' ,'1996' ,'2002' ,'2004' ,'2008' ,
            '2005' ,'1992' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.4003607807;
        END;
      END;
    END;
  END;

********** LEAF   205  NODE   741 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
    'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.8651092;
      END;
    END;
  END;

********** LEAF   206  NODE   749 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,'2000' ,
    '2001' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,'1999' ,'2005' ,'1992' )
     THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1998' ,'2001' ,
      '2006' ,'2008' ,'1997' ,'1999' ,'2005' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1995' ,'1998' ,'2001' ,'2006' ,'2008' ,'1997' ,
      '1999' ,'2005' ,'1996' ,'2000' ,'2009' ,'2010' ,'1992' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('0-17' ,'85+' ,'18-24' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('25-44' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '1990' ,'1993' ,'1994' ,'1995' ,'1998' ,'2001' ,'2006' ,'2008' ,
        '1997' ,'1999' ,'2005' ,'1996' ,'2000' ,'2009' ,'2010' ,'1992' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('1990' ,'1995' ,'1998' ,'2008' ) THEN DO;
         _BRANCH_ =    1; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0939649004;
        END;
      END;
    END;
  END;

********** LEAF   207  NODE   750 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,'2000' ,
    '2001' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,'1999' ,'2005' ,'1992' )
     THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1998' ,'2001' ,
      '2006' ,'2008' ,'1997' ,'1999' ,'2005' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1995' ,'1998' ,'2001' ,'2006' ,'2008' ,'1997' ,
      '1999' ,'2005' ,'1996' ,'2000' ,'2009' ,'2010' ,'1992' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('0-17' ,'85+' ,'18-24' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('25-44' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '1990' ,'1993' ,'1994' ,'1995' ,'1998' ,'2001' ,'2006' ,'2008' ,
        '1997' ,'1999' ,'2005' ,'1996' ,'2000' ,'2009' ,'2010' ,'1992' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('1993' ,'1994' ,'2001' ,'2006' ,'1997' ,'1999' ,
        '2005' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_10 NOTIN (
          '1990' ,'1995' ,'1998' ,'2008' ,'1993' ,'1994' ,'2001' ,'2006' ,
          '1997' ,'1999' ,'2005' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.173033431;
        END;
      END;
    END;
  END;

********** LEAF   208  NODE   748 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,'2000' ,
    '2001' ,'2006' ,'2008' ,'2009' ,'2010' ,'1997' ,'1999' ,'2005' ,'1992' )
     THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('1996' ,'2000' ,'2009' ,'2010' ,'1992' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1995' ,'1998' ,'2001' ,'2006' ,'2008' ,'1997' ,
      '1999' ,'2005' ,'1996' ,'2000' ,'2009' ,'2010' ,'1992' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('25-44' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('0-17' ,'85+' ,'18-24' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.593309629;
      END;
    END;
  END;

********** LEAF   209  NODE   746 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2002' ,'2003' ,'2004' ,'2007' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Date  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_10 NOTIN (
      '1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,'2000' ,'2001' ,'2006' ,
      '2008' ,'2009' ,'2010' ,'1997' ,'1999' ,'2005' ,'1992' ,'2002' ,'2003' ,
      '2004' ,'2007' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.6597061241;
    END;
  END;

********** LEAF   210  NODE   754 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '85+' ,'18-24' ,'0-17' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,
        '1997' ,'1999' ,'2005' ,'2007' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2010' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '85+' ,'18-24' ,'0-17' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.561358587;
      END;
    END;
  END;

********** LEAF   211  NODE   756 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '85+' ,'18-24' ,'0-17' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,
        '1997' ,'1999' ,'2005' ,'2007' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2010' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '85+' ,'18-24' ,'0-17' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1996' ,'2000' ,'2004' ,'2008' ,'2009' ,
        '1999' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        '1990' ,'1996' ,'2000' ,'2004' ,'2008' ,'2009' ,'1999' ,'1994' ,
        '1998' ,'2001' ,'2003' ,'2006' ,'2005' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('CANCER, ALL' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          '1990' ,'1996' ,'2000' ,'2004' ,'2008' ,'2009' ,'1999' ,'1994' ,
          '1998' ,'2001' ,'2003' ,'2006' ,'2005' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.177789047;
        END;
      END;
    END;
  END;

********** LEAF   212  NODE   757 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('85+' ,'18-24' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '85+' ,'18-24' ,'0-17' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,
        '1997' ,'1999' ,'2005' ,'2007' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2010' ,'1991' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '85+' ,'18-24' ,'0-17' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1994' ,'1998' ,'2001' ,'2003' ,'2006' ,'2005' ) 
         THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        '1990' ,'1996' ,'2000' ,'2004' ,'2008' ,'2009' ,'1999' ,'1994' ,
        '1998' ,'2001' ,'2003' ,'2006' ,'2005' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('SEPTICEMIA' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.3458377301;
        END;
      END;
    END;
  END;

********** LEAF   213  NODE   753 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_19 NOTIN (
    '85+' ,'18-24' ,'0-17' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2010' ,'1991' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,
        '1998' ,'2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,
        '2009' ,'1997' ,'1999' ,'2005' ,'2007' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.9077663614;
    END;
  END;

********** LEAF   214  NODE   763 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Gender , $CHAR10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    'FEMALE' ,'MALE' ,'ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,
        '2010' ,'1997' ,'1999' ,'2005' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2007' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'2000' ,'2003' ,
      '2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1992' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '1990' ,'1993' ,'1994' ,'1996' ,'2000' ,'2003' ,'2004' ,'2006' ,
        '2008' ,'2009' ,'2010' ,'1992' ,'1998' ,'2001' ,'2002' ,'1997' ,
        '1999' ,'2005' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1996' ,'2000' ,'2009' ,'2010' ) 
         THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        '1990' ,'1993' ,'1996' ,'2000' ,'2009' ,'2010' ,'1994' ,'2003' ,
        '2004' ,'2006' ,'2008' ,'1992' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
          _ARBFMT_32 = PUT( Disease , $32.);
           %DMNORMIP( _ARBFMT_32);
            IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          _ARBFMT_19 = PUT( Age_group , $19.);
           %DMNORMIP( _ARBFMT_19);
            IF _ARBFMT_19 IN ('25-44' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_19 IN ('0-17' ,'85+' ,'18-24' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Date  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          '1990' ,'1993' ,'1996' ,'2000' ,'2009' ,'2010' ,'1994' ,'2003' ,
          '2004' ,'2006' ,'2008' ,'1992' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.676591587;
        END;
      END;
    END;
  END;

********** LEAF   215  NODE   764 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Gender , $CHAR10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    'FEMALE' ,'MALE' ,'ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,
        '2010' ,'1997' ,'1999' ,'2005' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2007' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1996' ,'2000' ,'2003' ,
      '2004' ,'2006' ,'2008' ,'2009' ,'2010' ,'1992' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Date  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        '1990' ,'1993' ,'1994' ,'1996' ,'2000' ,'2003' ,'2004' ,'2006' ,
        '2008' ,'2009' ,'2010' ,'1992' ,'1998' ,'2001' ,'2002' ,'1997' ,
        '1999' ,'2005' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_10 IN ('1994' ,'2003' ,'2004' ,'2006' ,'2008' ,'1992' ) 
         THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Date ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_10 NOTIN (
        '1990' ,'1993' ,'1996' ,'2000' ,'2009' ,'2010' ,'1994' ,'2003' ,
        '2004' ,'2006' ,'2008' ,'1992' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
          _ARBFMT_32 = PUT( Disease , $32.);
           %DMNORMIP( _ARBFMT_32);
            IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          _ARBFMT_19 = PUT( Age_group , $19.);
           %DMNORMIP( _ARBFMT_19);
            IF _ARBFMT_19 IN ('0-17' ,'85+' ,'18-24' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_19 IN ('25-44' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.2459879;
        END;
      END;
    END;
  END;

********** LEAF   216  NODE   762 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Gender , $CHAR10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    'FEMALE' ,'MALE' ,'ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,'1998' ,
        '2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,'2009' ,
        '2010' ,'1997' ,'1999' ,'2005' ,'1992' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_10 IN ('2007' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('1998' ,'2001' ,'2002' ,'1997' ,'1999' ,'2005' ) THEN 
        DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.1933059439;
      END;
    END;
  END;

********** LEAF   217  NODE   760 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_10 = PUT( Gender , $CHAR10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('ALL' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_10 NOTIN (
    'FEMALE' ,'MALE' ,'ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('2007' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_10 IN ('1990' ,'1993' ,'1994' ,'1995' ,'1996' ,
        '1998' ,'2000' ,'2001' ,'2002' ,'2003' ,'2004' ,'2006' ,'2008' ,
        '2009' ,'2010' ,'1997' ,'1999' ,'2005' ,'1992' 
        ) THEN _BRANCH_ = 0; 
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 0.6422252489;
    END;
  END;
P_Cases_in_1000s  = _ARB_F_;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

