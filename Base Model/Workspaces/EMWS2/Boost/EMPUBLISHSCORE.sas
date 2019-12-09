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
LENGTH _ARBFMT_19 $     19; DROP _ARBFMT_19; 
_ARBFMT_19 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_32 $     32; DROP _ARBFMT_32; 
_ARBFMT_32 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_10 $     10; DROP _ARBFMT_10; 
_ARBFMT_10 = ' '; /* Initialize to avoid warning. */


 DROP _ARB_F_;
 DROP _ARB_BADF_;
     _ARB_F_ = 71.166890983;
     _ARB_BADF_ = 0;
******             ASSIGN OBSERVATION TO NODE             ******;
 DROP _ARB_P_;
 _ARB_P_ = 0;
 DROP _ARB_PPATH_; _ARB_PPATH_ = 1;

********** LEAF     1  NODE   412 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

   DROP _BRANCH_;
  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
     DROP _ARB_SURR_;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <                869.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -2.231443197;
      END;
    END;
  END;

********** LEAF     2  NODE   414 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF                869.5 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF              8687.92 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -6.952054952;
        END;
      END;
    END;
  END;

********** LEAF     3  NODE   415 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF                869.5 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('25-44' ,'85+' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <              8687.92 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'25-44' ,'85+' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -4.818750954;
        END;
      END;
    END;
  END;

********** LEAF     4  NODE   411 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 10.977104005;
    END;
  END;

********** LEAF     5  NODE   419 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
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
      'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <                  963 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.780939737;
      END;
    END;
  END;

********** LEAF     6  NODE   423 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF                  963 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF            8805.1505 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('OSTEOARTHRITIS' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
            'SEPTICEMIA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -6.249878665;
        END;
      END;
    END;
  END;

********** LEAF     7  NODE   424 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF                  963 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('25-44' ,'85+' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <            8805.1505 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
            'SEPTICEMIA' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('OSTEOARTHRITIS' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'25-44' ,'85+' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -4.246049958;
        END;
      END;
    END;
  END;

********** LEAF     8  NODE   421 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
      Population_in_thousands  <                28815 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('ALL' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('65-84' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('45-64' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 3.9599907451;
      END;
    END;
  END;

********** LEAF     9  NODE   422 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
                     28815 <= Population_in_thousands  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('ALL' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('45-64' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('65-84' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 12.022933835;
      END;
    END;
  END;

********** LEAF    10  NODE   430 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
    'SEPTICEMIA' ,'CANCER, ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF                943.5 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <             13309.49 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('18-24' ,'85+' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_19 IN ('0-17' ,'25-44' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Disease  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_32 NOTIN (
          'ASTHMA' ,'SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'OSTEOARTHRITIS' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -3.039317122;
        END;
      END;
    END;
  END;

********** LEAF    11  NODE   431 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
    'SEPTICEMIA' ,'CANCER, ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF                943.5 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF             13309.49 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('0-17' ,'25-44' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_19 IN ('18-24' ,'85+' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -5.137253911;
        END;
      END;
    END;
  END;

********** LEAF    12  NODE   429 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
    'SEPTICEMIA' ,'CANCER, ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF                943.5 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0961194248;
      END;
    END;
  END;

********** LEAF    13  NODE   427 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
    'SEPTICEMIA' ,'CANCER, ALL' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <                943.5 THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 12.373211279;
    END;
  END;

********** LEAF    14  NODE   435 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
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
      'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <                983.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.5854472542;
      END;
    END;
  END;

********** LEAF    15  NODE   437 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF                983.5 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
         _BRANCH_ =    1; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -5.823998292;
        END;
      END;
    END;
  END;

********** LEAF    16  NODE   438 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF                983.5 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Disease  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_32 NOTIN (
          'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
          'SEPTICEMIA' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -3.411792612;
        END;
      END;
    END;
  END;

********** LEAF    17  NODE   434 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 10.52524;
    END;
  END;

********** LEAF    18  NODE   444 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'25-44' ,'85+' ,'18-24' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF            31706.173 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'25-44' ,'85+' ,'18-24' 
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
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <                869.5 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.502168931;
        END;
      END;
    END;
  END;

********** LEAF    19  NODE   445 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'25-44' ,'85+' ,'18-24' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF            31706.173 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'25-44' ,'85+' ,'18-24' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF                869.5 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Disease  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_32 NOTIN (
          'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'OSTEOARTHRITIS' ,'SEPTICEMIA' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -3.750026919;
        END;
      END;
    END;
  END;

********** LEAF    20  NODE   443 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_19 IN ('18-24' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'25-44' ,'85+' ,'18-24' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <            31706.173 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -5.394494239;
      END;
    END;
  END;

********** LEAF    21  NODE   441 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 5.8061099685;
    END;
  END;

********** LEAF    22  NODE   451 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
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
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <            55419.401 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Gender  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' ,'ALL' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF             7905.977 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
          _ARBFMT_32 = PUT( Disease , $32.);
           %DMNORMIP( _ARBFMT_32);
            IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('ASTHMA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'25-44' ,'85+' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -4.524429298;
        END;
      END;
    END;
  END;

********** LEAF    23  NODE   452 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
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
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <            55419.401 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Gender  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' ,'ALL' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('25-44' ,'85+' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <             7905.977 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
          _ARBFMT_32 = PUT( Disease , $32.);
           %DMNORMIP( _ARBFMT_32);
            IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
            'SEPTICEMIA' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -3.217552405;
        END;
      END;
    END;
  END;

********** LEAF    24  NODE   450 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
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
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF            55419.401 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.750059461;
      END;
    END;
  END;

********** LEAF    25  NODE   448 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 6.3785248616;
    END;
  END;

********** LEAF    26  NODE   458 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'OSTEOARTHRITIS' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <             84273.17 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'OSTEOARTHRITIS' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('0-17' ,'65-84' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'65-84' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF            67065.263 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.6914101821;
        END;
      END;
    END;
  END;

********** LEAF    27  NODE   460 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'OSTEOARTHRITIS' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <             84273.17 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'OSTEOARTHRITIS' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'65-84' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <            67065.263 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'65-84' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
          IF _ARBFMT_19 IN ('18-24' ,'85+' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_19 NOTIN (
          '18-24' ,'85+' ,'25-44' ,'45-64' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
              IF Population_in_thousands  <            30094.527 THEN DO;
               _BRANCH_ =    1; 
              END; 
            ELSE _BRANCH_ = 0;
            END;
          END;
        IF _BRANCH_ LT 0 THEN DO; 
           IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
          ELSE IF _ARBFMT_19 NOTIN (
            '18-24' ,'85+' ,'25-44' ,'45-64' 
             ) THEN _BRANCH_ = 1;
        END; 
        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -3.53143131;
          END;
        END;
      END;
    END;
  END;

********** LEAF    28  NODE   461 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'OSTEOARTHRITIS' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <             84273.17 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'OSTEOARTHRITIS' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'65-84' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <            67065.263 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'65-84' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
          IF _ARBFMT_19 IN ('25-44' ,'45-64' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_19 NOTIN (
          '18-24' ,'85+' ,'25-44' ,'45-64' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
              IF            30094.527 <= Population_in_thousands  THEN DO;
               _BRANCH_ =    2; 
              END; 
            ELSE _BRANCH_ = 0;
            END;
          END;

        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -2.257924837;
          END;
        END;
      END;
    END;
  END;

********** LEAF    29  NODE   457 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'OSTEOARTHRITIS' ,'SEPTICEMIA' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF             84273.17 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -4.803069128;
      END;
    END;
  END;

********** LEAF    30  NODE   455 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 5.7249058944;
    END;
  END;

********** LEAF    31  NODE   467 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
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
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <            44531.901 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Gender  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' ,'ALL' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ) 
         THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
        'SEPTICEMIA' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          _ARBFMT_19 = PUT( Age_group , $19.);
           %DMNORMIP( _ARBFMT_19);
            IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_19 IN ('45-64' ,'65-84' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
            IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('MALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Disease  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_32 NOTIN (
          'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
          'SEPTICEMIA' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -3.974271651;
        END;
      END;
    END;
  END;

********** LEAF    32  NODE   468 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
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
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <            44531.901 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Gender  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' ,'ALL' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
        'SEPTICEMIA' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          _ARBFMT_19 = PUT( Age_group , $19.);
           %DMNORMIP( _ARBFMT_19);
            IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
            IF _ARBFMT_10 IN ('MALE' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -2.196361524;
        END;
      END;
    END;
  END;

********** LEAF    33  NODE   466 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
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
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF            44531.901 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.0724652396;
      END;
    END;
  END;

********** LEAF    34  NODE   464 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 6.2590299109;
    END;
  END;

********** LEAF    35  NODE   472 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
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
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <            1248.4875 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.971561998;
      END;
    END;
  END;

********** LEAF    36  NODE   474 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
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
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF            1248.4875 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
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

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF              8719.42 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
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
          '0-17' ,'18-24' ,'25-44' ,'85+' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -4.708446568;
        END;
      END;
    END;
  END;

********** LEAF    37  NODE   475 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
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
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF            1248.4875 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
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

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('25-44' ,'85+' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <              8719.42 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
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
         _ARB_F_ + -1.863303178;
        END;
      END;
    END;
  END;

********** LEAF    38  NODE   471 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 4.4779894206;
    END;
  END;

********** LEAF    39  NODE   481 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
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
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <           44593.4365 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Gender  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' ,'ALL' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ) 
         THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
        'SEPTICEMIA' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          _ARBFMT_19 = PUT( Age_group , $19.);
           %DMNORMIP( _ARBFMT_19);
            IF _ARBFMT_19 IN ('18-24' ,'25-44' ,'85+' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_19 IN ('0-17' ,'45-64' ,'65-84' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
            IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('MALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -3.896636152;
        END;
      END;
    END;
  END;

********** LEAF    40  NODE   482 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
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
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <           44593.4365 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Gender  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' ,'ALL' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_32 IN ('OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
        'SEPTICEMIA' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          _ARBFMT_19 = PUT( Age_group , $19.);
           %DMNORMIP( _ARBFMT_19);
            IF _ARBFMT_19 IN ('0-17' ,'45-64' ,'65-84' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_19 IN ('18-24' ,'25-44' ,'85+' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
            IF _ARBFMT_10 IN ('MALE' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Disease  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_32 NOTIN (
          'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
          'SEPTICEMIA' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.869870745;
        END;
      END;
    END;
  END;

********** LEAF    41  NODE   480 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
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
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF           44593.4365 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.01369995;
      END;
    END;
  END;

********** LEAF    42  NODE   478 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 5.6822894308;
    END;
  END;

********** LEAF    43  NODE   488 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
        'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'25-44' ,'85+' ,'18-24' ,'45-64' ,'65-84' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF           34012.8235 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.734191442;
        END;
      END;
    END;
  END;

********** LEAF    44  NODE   489 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
        'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('18-24' ,'45-64' ,'65-84' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'25-44' ,'85+' ,'18-24' ,'45-64' ,'65-84' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <           34012.8235 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'25-44' ,'85+' ,'18-24' ,'45-64' ,'65-84' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -4.461653694;
        END;
      END;
    END;
  END;

********** LEAF    45  NODE   487 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_32 IN ('OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 1.028367113;
      END;
    END;
  END;

********** LEAF    46  NODE   485 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 6.2688833595;
    END;
  END;

********** LEAF    47  NODE   497 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
      Population_in_thousands  <           42049.0305 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
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
       IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'25-44' ,'85+' ,'18-24' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <            8773.6505 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'25-44' ,'85+' ,'18-24' ,'45-64' 
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
          IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
              IF             1935.407 <= Population_in_thousands  THEN DO;
               _BRANCH_ =    1; 
              END; 
            ELSE _BRANCH_ = 0;
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            _ARBFMT_32 = PUT( Disease , $32.);
             %DMNORMIP( _ARBFMT_32);
              IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,
              'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ) THEN DO;
               _BRANCH_ =    1; 
              END; 
              ELSE IF _ARBFMT_32 IN ('OSTEOARTHRITIS' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;
        IF _BRANCH_ LT 0 THEN DO; 
           IF MISSING( Gender  ) THEN _BRANCH_ = 1;
          ELSE IF _ARBFMT_10 NOTIN (
            'FEMALE' ,'ALL' ,'MALE' 
             ) THEN _BRANCH_ = 1;
        END; 
        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -1.356174904;
          END;
        END;
      END;
    END;
  END;

********** LEAF    48  NODE   498 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
      Population_in_thousands  <           42049.0305 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
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
       IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'25-44' ,'85+' ,'18-24' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <            8773.6505 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'25-44' ,'85+' ,'18-24' ,'45-64' 
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
          IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
              IF Population_in_thousands  <             1935.407 THEN DO;
               _BRANCH_ =    2; 
              END; 
            ELSE _BRANCH_ = 0;
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            _ARBFMT_32 = PUT( Disease , $32.);
             %DMNORMIP( _ARBFMT_32);
              IF _ARBFMT_32 IN ('OSTEOARTHRITIS' ) THEN DO;
               _BRANCH_ =    2; 
              END; 
              ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,
              'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;

        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -2.66020415;
          END;
        END;
      END;
    END;
  END;

********** LEAF    49  NODE   496 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
      Population_in_thousands  <           42049.0305 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
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
       IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ,'45-64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'25-44' ,'85+' ,'18-24' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF            8773.6505 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -3.556674069;
        END;
      END;
    END;
  END;

********** LEAF    50  NODE   494 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
                42049.0305 <= Population_in_thousands  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
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
       _ARB_F_ + 1.7388612999;
      END;
    END;
  END;

********** LEAF    51  NODE   492 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 6.4713267402;
    END;
  END;

********** LEAF    52  NODE   504 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
        'CANCER, ALL' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'85+' ,'18-24' ,'25-44' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <              8719.42 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('SEPTICEMIA' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('ASTHMA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'85+' ,'18-24' ,'25-44' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.330710912;
        END;
      END;
    END;
  END;

********** LEAF    53  NODE   505 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
        'CANCER, ALL' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ,'25-44' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'85+' ,'18-24' ,'25-44' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF              8719.42 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ) 
             THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.863327525;
        END;
      END;
    END;
  END;

********** LEAF    54  NODE   503 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -3.763672233;
      END;
    END;
  END;

********** LEAF    55  NODE   501 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 3.7764667652;
    END;
  END;

********** LEAF    56  NODE   513 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
      Population_in_thousands  <           44411.7335 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
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
       IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'25-44' ,'85+' ,'45-64' ,'18-24' 
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
          '0-17' ,'25-44' ,'85+' ,'45-64' ,'18-24' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
        _ARBFMT_32 = PUT( Disease , $32.);
         %DMNORMIP( _ARBFMT_32);
          IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
        IF _BRANCH_ LT 0 THEN DO; 
           IF MISSING( Disease  ) THEN _BRANCH_ = 1;
          ELSE IF _ARBFMT_32 NOTIN (
            'ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' 
             ) THEN _BRANCH_ = 1;
        END; 
        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -0.794965658;
          END;
        END;
      END;
    END;
  END;

********** LEAF    57  NODE   514 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
      Population_in_thousands  <           44411.7335 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
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
       IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'25-44' ,'85+' ,'45-64' ,'18-24' 
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
          '0-17' ,'25-44' ,'85+' ,'45-64' ,'18-24' 
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

        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -2.407893792;
          END;
        END;
      END;
    END;
  END;

********** LEAF    58  NODE   512 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
      Population_in_thousands  <           44411.7335 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
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
       IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'25-44' ,'85+' ,'45-64' ,'18-24' 
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
         _ARB_F_ + -2.980783844;
        END;
      END;
    END;
  END;

********** LEAF    59  NODE   510 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
                44411.7335 <= Population_in_thousands  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
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
       _ARB_F_ + 1.1307353116;
      END;
    END;
  END;

********** LEAF    60  NODE   508 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 6.9608024287;
    END;
  END;

********** LEAF    61  NODE   520 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
      Population_in_thousands  <           44361.9365 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
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
       IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF              8757.92 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
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
         _ARB_F_ + -2.566273941;
        END;
      END;
    END;
  END;

********** LEAF    62  NODE   522 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
      Population_in_thousands  <           44361.9365 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
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
       IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('25-44' ,'85+' ,'45-64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <              8757.92 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
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
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
           ) THEN _BRANCH_ = 2;
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
          IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
              IF             1900.618 <= Population_in_thousands  THEN DO;
               _BRANCH_ =    1; 
              END; 
            ELSE _BRANCH_ = 0;
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
              IF _ARBFMT_19 IN ('25-44' ,'85+' ) THEN DO;
               _BRANCH_ =    1; 
              END; 
              ELSE IF _ARBFMT_19 IN ('45-64' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;
        IF _BRANCH_ LT 0 THEN DO; 
           IF MISSING( Gender  ) THEN _BRANCH_ = 1;
          ELSE IF _ARBFMT_10 NOTIN (
            'FEMALE' ,'ALL' ,'MALE' 
             ) THEN _BRANCH_ = 1;
        END; 
        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -0.57534295;
          END;
        END;
      END;
    END;
  END;

********** LEAF    63  NODE   523 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
      Population_in_thousands  <           44361.9365 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
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
       IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('25-44' ,'85+' ,'45-64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <              8757.92 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
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
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
           ) THEN _BRANCH_ = 2;
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
          IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
              IF Population_in_thousands  <             1900.618 THEN DO;
               _BRANCH_ =    2; 
              END; 
            ELSE _BRANCH_ = 0;
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
              IF _ARBFMT_19 IN ('45-64' ) THEN DO;
               _BRANCH_ =    2; 
              END; 
              ELSE IF _ARBFMT_19 IN ('25-44' ,'85+' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;

        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -2.345668351;
          END;
        END;
      END;
    END;
  END;

********** LEAF    64  NODE   519 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
                44361.9365 <= Population_in_thousands  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
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
       _ARB_F_ + 1.8818039899;
      END;
    END;
  END;

********** LEAF    65  NODE   517 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 5.6773749115;
    END;
  END;

********** LEAF    66  NODE   531 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
        'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
          IF _ARBFMT_19 IN ('0-17' ,'85+' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_19 NOTIN (
          '0-17' ,'85+' ,'18-24' ,'25-44' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
              IF Population_in_thousands  <            8805.1505 THEN DO;
               _BRANCH_ =    1; 
              END; 
            ELSE _BRANCH_ = 0;
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
              IF _ARBFMT_32 IN ('SEPTICEMIA' ) THEN DO;
               _BRANCH_ =    1; 
              END; 
              ELSE IF _ARBFMT_32 IN ('ASTHMA' ,
              'DEMENTIA AND ALZHEIMER''S DISEASE' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;

        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + 0.2053730629;
          END;
        END;
      END;
    END;
  END;

********** LEAF    67  NODE   532 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
        'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
          IF _ARBFMT_19 IN ('18-24' ,'25-44' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_19 NOTIN (
          '0-17' ,'85+' ,'18-24' ,'25-44' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
              IF            8805.1505 <= Population_in_thousands  THEN DO;
               _BRANCH_ =    2; 
              END; 
            ELSE _BRANCH_ = 0;
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
              IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' 
               ) THEN DO;
               _BRANCH_ =    2; 
              END; 
              ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;
        IF _BRANCH_ LT 0 THEN DO; 
           IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
          ELSE IF _ARBFMT_19 NOTIN (
            '0-17' ,'85+' ,'18-24' ,'25-44' 
             ) THEN _BRANCH_ = 2;
        END; 
        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -1.501567759;
          END;
        END;
      END;
    END;
  END;

********** LEAF    68  NODE   530 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
        'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
         _BRANCH_ =    2; 
        END; 

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -5.262245259;
        END;
      END;
    END;
  END;

********** LEAF    69  NODE   528 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_32 IN ('OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.777407527;
      END;
    END;
  END;

********** LEAF    70  NODE   526 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 4.8985156946;
    END;
  END;

********** LEAF    71  NODE   538 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'OSTEOARTHRITIS' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(Population_in_thousands ) AND 
        Population_in_thousands  <                29792 THEN DO;
         _BRANCH_ =    1; 
        END; 
       IF MISSING(Population_in_thousands ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          _ARBFMT_19 = PUT( Age_group , $19.);
           %DMNORMIP( _ARBFMT_19);
            IF _ARBFMT_19 IN ('18-24' ,'85+' ,'65-84' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'45-64' 
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
         IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -2.114524388;
        END;
      END;
    END;
  END;

********** LEAF    72  NODE   539 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'OSTEOARTHRITIS' ,'SEPTICEMIA' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(Population_in_thousands ) AND 
                       29792 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
       IF MISSING(Population_in_thousands ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          _ARBFMT_19 = PUT( Age_group , $19.);
           %DMNORMIP( _ARBFMT_19);
            IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'45-64' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_19 IN ('18-24' ,'85+' ,'65-84' 
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
         _ARB_F_ + 0.519194256;
        END;
      END;
    END;
  END;

********** LEAF    73  NODE   537 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -3.267070101;
      END;
    END;
  END;

********** LEAF    74  NODE   535 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 4.602758407;
    END;
  END;

********** LEAF    75  NODE   547 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
        'CANCER, ALL' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'85+' ,'18-24' ,'25-44' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <              8838.92 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
            'SEPTICEMIA' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('ASTHMA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.9145197295;
        END;
      END;
    END;
  END;

********** LEAF    76  NODE   548 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
        'CANCER, ALL' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ,'25-44' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'85+' ,'18-24' ,'25-44' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF              8838.92 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
            'SEPTICEMIA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'85+' ,'18-24' ,'25-44' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.181900929;
        END;
      END;
    END;
  END;

********** LEAF    77  NODE   544 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -3.795291167;
      END;
    END;
  END;

********** LEAF    78  NODE   545 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
      Population_in_thousands  <                28815 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('ALL' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('65-84' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('45-64' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.732469045;
      END;
    END;
  END;

********** LEAF    79  NODE   546 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
                     28815 <= Population_in_thousands  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('ALL' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('45-64' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('65-84' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 8.9714389974;
      END;
    END;
  END;

********** LEAF    80  NODE   556 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'85+' ,'18-24' ,'25-44' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <              8719.42 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
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

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0216131559;
        END;
      END;
    END;
  END;

********** LEAF    81  NODE   557 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ,'25-44' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'85+' ,'18-24' ,'25-44' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF              8719.42 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
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
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'85+' ,'18-24' ,'25-44' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.05242601;
        END;
      END;
    END;
  END;

********** LEAF    82  NODE   553 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -5.241928069;
      END;
    END;
  END;

********** LEAF    83  NODE   554 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'85+' ,'25-44' ,'45-64' ,'65-84' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <            16038.683 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'ALL' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -4.152739963;
      END;
    END;
  END;

********** LEAF    84  NODE   555 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('25-44' ,'45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'85+' ,'25-44' ,'45-64' ,'65-84' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF            16038.683 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'ALL' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'85+' ,'25-44' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 10.045752678;
      END;
    END;
  END;

********** LEAF    85  NODE   563 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'OSTEOARTHRITIS' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF              12331.5 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'45-64' ,'65-84' ) THEN 
           DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('85+' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'OSTEOARTHRITIS' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'SEPTICEMIA' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(Population_in_thousands ) AND 
        Population_in_thousands  <           32172.5945 THEN DO;
         _BRANCH_ =    1; 
        END; 
       IF MISSING(Population_in_thousands ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          _ARBFMT_19 = PUT( Age_group , $19.);
           %DMNORMIP( _ARBFMT_19);
            IF _ARBFMT_19 IN ('18-24' ,'85+' ,'65-84' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'45-64' 
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
         IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.803560294;
        END;
      END;
    END;
  END;

********** LEAF    86  NODE   564 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'OSTEOARTHRITIS' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF              12331.5 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'45-64' ,'65-84' ) THEN 
           DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('85+' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'OSTEOARTHRITIS' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'SEPTICEMIA' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(Population_in_thousands ) AND 
                  32172.5945 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
       IF MISSING(Population_in_thousands ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          _ARBFMT_19 = PUT( Age_group , $19.);
           %DMNORMIP( _ARBFMT_19);
            IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'45-64' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_19 IN ('18-24' ,'85+' ,'65-84' 
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
         _ARB_F_ + 1.6559006547;
        END;
      END;
    END;
  END;

********** LEAF    87  NODE   565 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ) 
        THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'OSTEOARTHRITIS' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <              12331.5 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('85+' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'45-64' ,'65-84' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('0-17' ,'45-64' ,'65-84' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'45-64' ,'65-84' ,'18-24' ,'25-44' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF            13164.753 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -4.403511966;
        END;
      END;
    END;
  END;

********** LEAF    88  NODE   566 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ) 
        THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'OSTEOARTHRITIS' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <              12331.5 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('85+' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'45-64' ,'65-84' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('18-24' ,'25-44' ,'85+' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'45-64' ,'65-84' ,'18-24' ,'25-44' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <            13164.753 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'45-64' ,'65-84' ,'18-24' ,'25-44' ,'85+' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.720932113;
        END;
      END;
    END;
  END;

********** LEAF    89  NODE   560 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 6.6469922745;
    END;
  END;

********** LEAF    90  NODE   570 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
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
       _ARB_F_ + 0.5344728008;
      END;
    END;
  END;

********** LEAF    91  NODE   574 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF            8773.6505 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
          IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_32 NOTIN (
          'CANCER, ALL' ,'OSTEOARTHRITIS' ,
          'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
              IF             28236.68 <= Population_in_thousands  THEN DO;
               _BRANCH_ =    1; 
              END; 
            ELSE _BRANCH_ = 0;
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
            _ARBFMT_10 = PUT( Gender , $CHAR10.);
             %DMNORMIP( _ARBFMT_10);
              IF _ARBFMT_10 IN ('FEMALE' ,'ALL' ) THEN DO;
               _BRANCH_ =    1; 
              END; 
              ELSE IF _ARBFMT_10 IN ('MALE' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;
        IF _BRANCH_ LT 0 THEN DO; 
           IF MISSING( Disease  ) THEN _BRANCH_ = 1;
          ELSE IF _ARBFMT_32 NOTIN (
            'CANCER, ALL' ,'OSTEOARTHRITIS' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' 
             ) THEN _BRANCH_ = 1;
        END; 
        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -3.679067921;
          END;
        END;
      END;
    END;
  END;

********** LEAF    92  NODE   575 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF            8773.6505 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
          IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'SEPTICEMIA' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_32 NOTIN (
          'CANCER, ALL' ,'OSTEOARTHRITIS' ,
          'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
              IF Population_in_thousands  <             28236.68 THEN DO;
               _BRANCH_ =    2; 
              END; 
            ELSE _BRANCH_ = 0;
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
            _ARBFMT_10 = PUT( Gender , $CHAR10.);
             %DMNORMIP( _ARBFMT_10);
              IF _ARBFMT_10 IN ('MALE' ) THEN DO;
               _BRANCH_ =    2; 
              END; 
              ELSE IF _ARBFMT_10 IN ('FEMALE' ,'ALL' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;

        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -1.467354423;
          END;
        END;
      END;
    END;
  END;

********** LEAF    93  NODE   573 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('85+' ,'45-64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <            8773.6505 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.0120910186;
        END;
      END;
    END;
  END;

********** LEAF    94  NODE   569 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 4.5623756489;
    END;
  END;

********** LEAF    95  NODE   583 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF                  963 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF            8805.1505 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
            'SEPTICEMIA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.3516237378;
        END;
      END;
    END;
  END;

********** LEAF    96  NODE   584 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF                  963 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('25-44' ,'85+' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <            8805.1505 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
            'SEPTICEMIA' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('ASTHMA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'25-44' ,'85+' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.920492391;
        END;
      END;
    END;
  END;

********** LEAF    97  NODE   580 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF                  963 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -4.555421366;
      END;
    END;
  END;

********** LEAF    98  NODE   581 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <                  963 THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF            33098.083 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
          IF _ARBFMT_32 IN ('OSTEOARTHRITIS' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_32 IN ('CANCER, ALL' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -3.427743803;
      END;
    END;
  END;

********** LEAF    99  NODE   582 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <                  963 THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ,'45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <            33098.083 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
          IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_32 IN ('OSTEOARTHRITIS' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 8.1675303448;
      END;
    END;
  END;

********** LEAF   100  NODE   590 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
        'CANCER, ALL' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'85+' ,'18-24' ,'25-44' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <            8805.1505 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('SEPTICEMIA' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('ASTHMA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.34928037;
        END;
      END;
    END;
  END;

********** LEAF   101  NODE   591 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
        'CANCER, ALL' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ,'25-44' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'85+' ,'18-24' ,'25-44' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF            8805.1505 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ) 
             THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'85+' ,'18-24' ,'25-44' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.625963809;
        END;
      END;
    END;
  END;

********** LEAF   102  NODE   589 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -3.020716137;
      END;
    END;
  END;

********** LEAF   103  NODE   587 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 2.6934288632;
    END;
  END;

********** LEAF   104  NODE   597 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
        'CANCER, ALL' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'85+' ,'18-24' ,'25-44' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <            8805.1505 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('SEPTICEMIA' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('ASTHMA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.785451338;
        END;
      END;
    END;
  END;

********** LEAF   105  NODE   598 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
        'CANCER, ALL' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ,'25-44' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'85+' ,'18-24' ,'25-44' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF            8805.1505 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ) 
             THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'85+' ,'18-24' ,'25-44' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.629041262;
        END;
      END;
    END;
  END;

********** LEAF   106  NODE   596 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -2.986951199;
      END;
    END;
  END;

********** LEAF   107  NODE   594 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 2.6578198578;
    END;
  END;

********** LEAF   108  NODE   606 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <            74653.636 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'85+' ,'18-24' ,'25-44' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <              8719.42 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.2962955126;
        END;
      END;
    END;
  END;

********** LEAF   109  NODE   607 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <            74653.636 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ,'25-44' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'85+' ,'18-24' ,'25-44' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF              8719.42 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('ASTHMA' ,'SEPTICEMIA' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'85+' ,'18-24' ,'25-44' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.688180075;
        END;
      END;
    END;
  END;

********** LEAF   110  NODE   603 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <            74653.636 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -4.529852767;
      END;
    END;
  END;

********** LEAF   111  NODE   604 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF            74653.636 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'85+' ,'25-44' ,'45-64' ,'65-84' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <           16090.6415 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
          IF _ARBFMT_32 IN ('OSTEOARTHRITIS' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_32 IN ('CANCER, ALL' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -2.839745639;
      END;
    END;
  END;

********** LEAF   112  NODE   605 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF            74653.636 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('25-44' ,'45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'85+' ,'25-44' ,'45-64' ,'65-84' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF           16090.6415 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
          IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_32 IN ('OSTEOARTHRITIS' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'85+' ,'25-44' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 7.5090716125;
      END;
    END;
  END;

********** LEAF   113  NODE   613 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF              8687.92 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
            'SEPTICEMIA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'25-44' ,'85+' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.3175874957;
        END;
      END;
    END;
  END;

********** LEAF   114  NODE   614 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('25-44' ,'85+' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <              8687.92 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
            'SEPTICEMIA' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.590148681;
        END;
      END;
    END;
  END;

********** LEAF   115  NODE   612 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -3.448920799;
      END;
    END;
  END;

********** LEAF   116  NODE   610 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 1.86310924;
    END;
  END;

********** LEAF   117  NODE   620 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
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

      _BRANCH_ = -1;
        IF  NOT MISSING(Population_in_thousands ) AND 
        Population_in_thousands  <            35792.231 THEN DO;
         _BRANCH_ =    1; 
        END; 
       IF MISSING(Population_in_thousands ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('18-24' ,'85+' ,'45-64' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_19 IN ('0-17' ,'25-44' 
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
         IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.415816404;
        END;
      END;
    END;
  END;

********** LEAF   118  NODE   621 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
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

      _BRANCH_ = -1;
        IF  NOT MISSING(Population_in_thousands ) AND 
                   35792.231 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
       IF MISSING(Population_in_thousands ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('0-17' ,'25-44' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_19 IN ('18-24' ,'85+' ,'45-64' 
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
         _ARB_F_ + 1.5339727327;
        END;
      END;
    END;
  END;

********** LEAF   119  NODE   622 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF            8773.6505 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -3.164238231;
        END;
      END;
    END;
  END;

********** LEAF   120  NODE   623 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'OSTEOARTHRITIS' ,'CANCER, ALL' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('25-44' ,'85+' ,'45-64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <            8773.6505 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.873664008;
        END;
      END;
    END;
  END;

********** LEAF   121  NODE   617 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 4.4215981657;
    END;
  END;

********** LEAF   122  NODE   629 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <           78311.3715 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
        'CANCER, ALL' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'85+' ,'18-24' ,'25-44' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <            8843.6505 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
            'SEPTICEMIA' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('ASTHMA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'85+' ,'18-24' ,'25-44' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.4525998948;
        END;
      END;
    END;
  END;

********** LEAF   123  NODE   630 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <           78311.3715 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
        'CANCER, ALL' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ,'25-44' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'85+' ,'18-24' ,'25-44' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF            8843.6505 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
            'SEPTICEMIA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.467846206;
        END;
      END;
    END;
  END;

********** LEAF   124  NODE   628 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
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
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF           78311.3715 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -3.141693616;
      END;
    END;
  END;

********** LEAF   125  NODE   626 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 2.6894499757;
    END;
  END;

********** LEAF   126  NODE   634 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <           44643.2335 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF           16090.6415 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('0-17' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.71482678;
      END;
    END;
  END;

********** LEAF   127  NODE   638 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <           44643.2335 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('MALE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <           16090.6415 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' ) THEN 
           DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('0-17' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Gender  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(Population_in_thousands ) AND 
        Population_in_thousands  <            15290.553 THEN DO;
         _BRANCH_ =    1; 
        END; 
       IF MISSING(Population_in_thousands ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          _ARBFMT_19 = PUT( Age_group , $19.);
           %DMNORMIP( _ARBFMT_19);
            IF _ARBFMT_19 IN ('18-24' ,'85+' ,'65-84' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'45-64' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
          _ARBFMT_32 = PUT( Disease , $32.);
           %DMNORMIP( _ARBFMT_32);
            IF _ARBFMT_32 IN ('CANCER, ALL' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.95412841;
        END;
      END;
    END;
  END;

********** LEAF   128  NODE   639 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <           44643.2335 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('MALE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <           16090.6415 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' ) THEN 
           DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('0-17' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Gender  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(Population_in_thousands ) AND 
                   15290.553 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
       IF MISSING(Population_in_thousands ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          _ARBFMT_19 = PUT( Age_group , $19.);
           %DMNORMIP( _ARBFMT_19);
            IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'45-64' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_19 IN ('18-24' ,'85+' ,'65-84' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
          _ARBFMT_32 = PUT( Disease , $32.);
           %DMNORMIP( _ARBFMT_32);
            IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.54522599;
        END;
      END;
    END;
  END;

********** LEAF   129  NODE   636 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF           44643.2335 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
      Population_in_thousands  <           40843.2715 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('18-24' ,'85+' ,'65-84' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'45-64' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
        _ARBFMT_32 = PUT( Disease , $32.);
         %DMNORMIP( _ARBFMT_32);
          IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'OSTEOARTHRITIS' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 2.6902831552;
      END;
    END;
  END;

********** LEAF   130  NODE   637 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF           44643.2335 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
                40843.2715 <= Population_in_thousands  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'45-64' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('18-24' ,'85+' ,'65-84' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
        _ARBFMT_32 = PUT( Disease , $32.);
         %DMNORMIP( _ARBFMT_32);
          IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'OSTEOARTHRITIS' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.2182623877;
      END;
    END;
  END;

********** LEAF   131  NODE   645 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
      Population_in_thousands  <           41699.0005 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('ALL' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'85+' ,'45-64' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('25-44' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
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
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <                983.5 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -2.409664995;
        END;
      END;
    END;
  END;

********** LEAF   132  NODE   647 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
      Population_in_thousands  <           41699.0005 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('ALL' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'85+' ,'45-64' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('25-44' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF                983.5 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Disease  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_32 NOTIN (
          'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'OSTEOARTHRITIS' ,'SEPTICEMIA' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
          IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'45-64' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_19 NOTIN (
          '0-17' ,'25-44' ,'45-64' ,'18-24' ,'85+' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
              IF           19106.1415 <= Population_in_thousands  THEN DO;
               _BRANCH_ =    1; 
              END; 
            ELSE _BRANCH_ = 0;
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
           _ARB_F_ + -1.779937213;
          END;
        END;
      END;
    END;
  END;

********** LEAF   133  NODE   648 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
      Population_in_thousands  <           41699.0005 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'MALE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('ALL' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'85+' ,'45-64' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('25-44' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF                983.5 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Disease  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_32 NOTIN (
          'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'OSTEOARTHRITIS' ,'SEPTICEMIA' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
          IF _ARBFMT_19 IN ('18-24' ,'85+' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_19 NOTIN (
          '0-17' ,'25-44' ,'45-64' ,'18-24' ,'85+' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
              IF Population_in_thousands  <           19106.1415 THEN DO;
               _BRANCH_ =    2; 
              END; 
            ELSE _BRANCH_ = 0;
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
            '0-17' ,'25-44' ,'45-64' ,'18-24' ,'85+' 
             ) THEN _BRANCH_ = 2;
        END; 
        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + 0.7123860426;
          END;
        END;
      END;
    END;
  END;

********** LEAF   134  NODE   644 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
                41699.0005 <= Population_in_thousands  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('ALL' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
          IF _ARBFMT_19 IN ('25-44' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'85+' ,'45-64' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.7401074076;
      END;
    END;
  END;

********** LEAF   135  NODE   642 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 5.6388240392;
    END;
  END;

********** LEAF   136  NODE   656 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <           44411.7335 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' ) THEN 
           DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('0-17' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF                869.5 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
        'CANCER, ALL' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF            34750.179 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ) 
             THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.2341109318;
        END;
      END;
    END;
  END;

********** LEAF   137  NODE   657 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <           44411.7335 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' ) THEN 
           DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('0-17' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF                869.5 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
        'CANCER, ALL' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('85+' ,'45-64' ,'65-84' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <            34750.179 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('SEPTICEMIA' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('ASTHMA' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -3.486510006;
        END;
      END;
    END;
  END;

********** LEAF   138  NODE   653 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <           44411.7335 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
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
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('0-17' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <                869.5 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.375074085;
      END;
    END;
  END;

********** LEAF   139  NODE   654 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF           44411.7335 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'45-64' ,'65-84' ,'18-24' ,'25-44' ,'85+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF            29545.273 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
        _ARBFMT_32 = PUT( Disease , $32.);
         %DMNORMIP( _ARBFMT_32);
          IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,'OSTEOARTHRITIS' ,
          'SEPTICEMIA' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'45-64' ,'65-84' ,'18-24' ,'25-44' ,'85+' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 4.4010302694;
      END;
    END;
  END;

********** LEAF   140  NODE   655 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF           44411.7335 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'45-64' ,'65-84' ,'18-24' ,'25-44' ,'85+' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <            29545.273 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
        _ARBFMT_32 = PUT( Disease , $32.);
         %DMNORMIP( _ARBFMT_32);
          IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,'OSTEOARTHRITIS' ,
          'SEPTICEMIA' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.598531295;
      END;
    END;
  END;

********** LEAF   141  NODE   665 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <                81543 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF              8719.42 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
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
         _ARB_F_ + 0.5515314474;
        END;
      END;
    END;
  END;

********** LEAF   142  NODE   666 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <                81543 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('25-44' ,'85+' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <              8719.42 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
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
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'25-44' ,'85+' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.320375126;
        END;
      END;
    END;
  END;

********** LEAF   143  NODE   662 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <                81543 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -4.066232747;
      END;
    END;
  END;

********** LEAF   144  NODE   663 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF                81543 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'85+' ,'25-44' ,'45-64' ,'65-84' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <            15245.481 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
          IF _ARBFMT_32 IN ('OSTEOARTHRITIS' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_32 IN ('CANCER, ALL' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -2.141803047;
      END;
    END;
  END;

********** LEAF   145  NODE   664 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF                81543 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('25-44' ,'45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'85+' ,'25-44' ,'45-64' ,'65-84' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF            15245.481 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
          IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_32 IN ('OSTEOARTHRITIS' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'85+' ,'25-44' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 4.731322308;
      END;
    END;
  END;

********** LEAF   146  NODE   670 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <           44361.9365 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF           16090.6415 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
        _ARBFMT_32 = PUT( Disease , $32.);
         %DMNORMIP( _ARBFMT_32);
          IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,
          'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.219991868;
      END;
    END;
  END;

********** LEAF   147  NODE   671 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <           44361.9365 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('MALE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <           16090.6415 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
        _ARBFMT_32 = PUT( Disease , $32.);
         %DMNORMIP( _ARBFMT_32);
          IF _ARBFMT_32 IN ('CANCER, ALL' ,
          'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Gender  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.800924203;
      END;
    END;
  END;

********** LEAF   148  NODE   672 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF           44361.9365 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF            67065.263 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
        _ARBFMT_32 = PUT( Disease , $32.);
         %DMNORMIP( _ARBFMT_32);
          IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'OSTEOARTHRITIS' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.736009573;
      END;
    END;
  END;

********** LEAF   149  NODE   673 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF           44361.9365 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ,'45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <            67065.263 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
        _ARBFMT_32 = PUT( Disease , $32.);
         %DMNORMIP( _ARBFMT_32);
          IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,'SEPTICEMIA' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'OSTEOARTHRITIS' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 6.5865057404;
      END;
    END;
  END;

********** LEAF   150  NODE   677 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
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
       _ARB_F_ + 0.8257793827;
      END;
    END;
  END;

********** LEAF   151  NODE   679 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'25-44' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'25-44' ,'18-24' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF           32683.1325 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -2.100201546;
        END;
      END;
    END;
  END;

********** LEAF   152  NODE   681 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ,'85+' ,'45-64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'25-44' ,'18-24' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <           32683.1325 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'25-44' ,'18-24' ,'85+' ,'45-64' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
          IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_32 NOTIN (
          'CANCER, ALL' ,'OSTEOARTHRITIS' ,
          'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
              IF             1276.213 <= Population_in_thousands  THEN DO;
               _BRANCH_ =    1; 
              END; 
            ELSE _BRANCH_ = 0;
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
              IF _ARBFMT_19 IN ('18-24' ,'45-64' ) THEN DO;
               _BRANCH_ =    1; 
              END; 
              ELSE IF _ARBFMT_19 IN ('85+' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;
        IF _BRANCH_ LT 0 THEN DO; 
           IF MISSING( Disease  ) THEN _BRANCH_ = 1;
          ELSE IF _ARBFMT_32 NOTIN (
            'CANCER, ALL' ,'OSTEOARTHRITIS' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' 
             ) THEN _BRANCH_ = 1;
        END; 
        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + 0.2422993815;
          END;
        END;
      END;
    END;
  END;

********** LEAF   153  NODE   682 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ,'85+' ,'45-64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'25-44' ,'18-24' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <           32683.1325 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'25-44' ,'18-24' ,'85+' ,'45-64' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
          IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'SEPTICEMIA' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_32 NOTIN (
          'CANCER, ALL' ,'OSTEOARTHRITIS' ,
          'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
              IF Population_in_thousands  <             1276.213 THEN DO;
               _BRANCH_ =    2; 
              END; 
            ELSE _BRANCH_ = 0;
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
              IF _ARBFMT_19 IN ('85+' ) THEN DO;
               _BRANCH_ =    2; 
              END; 
              ELSE IF _ARBFMT_19 IN ('18-24' ,'45-64' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;

        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -0.489653243;
          END;
        END;
      END;
    END;
  END;

********** LEAF   154  NODE   676 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 3.1393333019;
    END;
  END;

********** LEAF   155  NODE   690 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <             60809.52 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(Population_in_thousands ) AND 
        Population_in_thousands  <                33406 THEN DO;
         _BRANCH_ =    1; 
        END; 
       IF MISSING(Population_in_thousands ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('18-24' ,'85+' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_19 IN ('0-17' ,'25-44' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
            'SEPTICEMIA' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('ASTHMA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.197557364;
        END;
      END;
    END;
  END;

********** LEAF   156  NODE   691 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <             60809.52 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(Population_in_thousands ) AND 
                       33406 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
       IF MISSING(Population_in_thousands ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('0-17' ,'25-44' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_19 IN ('18-24' ,'85+' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
            'SEPTICEMIA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.9651537037;
        END;
      END;
    END;
  END;

********** LEAF   157  NODE   687 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <             60809.52 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -4.179599585;
      END;
    END;
  END;

********** LEAF   158  NODE   688 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF             60809.52 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'85+' ,'25-44' ,'45-64' ,'65-84' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <              12971.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
          IF _ARBFMT_32 IN ('OSTEOARTHRITIS' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_32 IN ('CANCER, ALL' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.831374337;
      END;
    END;
  END;

********** LEAF   159  NODE   689 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF             60809.52 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('25-44' ,'45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'85+' ,'25-44' ,'45-64' ,'65-84' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF              12971.5 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
          IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_32 IN ('OSTEOARTHRITIS' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'85+' ,'25-44' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 6.7960915403;
      END;
    END;
  END;

********** LEAF   160  NODE   699 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF            8805.1505 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ,'ALL' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('MALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.4189470048;
        END;
      END;
    END;
  END;

********** LEAF   161  NODE   700 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('25-44' ,'85+' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <            8805.1505 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('MALE' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' ,'ALL' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'25-44' ,'85+' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.321275322;
        END;
      END;
    END;
  END;

********** LEAF   162  NODE   696 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -3.672015947;
      END;
    END;
  END;

********** LEAF   163  NODE   697 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF            35555.169 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
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

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -2.258884555;
      END;
    END;
  END;

********** LEAF   164  NODE   698 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ,'45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <            35555.169 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
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
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 4.8773578137;
      END;
    END;
  END;

********** LEAF   165  NODE   706 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF              8719.42 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
            'SEPTICEMIA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.7933024162;
        END;
      END;
    END;
  END;

********** LEAF   166  NODE   707 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('25-44' ,'85+' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <              8719.42 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
            'SEPTICEMIA' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'25-44' ,'85+' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.304163324;
        END;
      END;
    END;
  END;

********** LEAF   167  NODE   705 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.926755788;
      END;
    END;
  END;

********** LEAF   168  NODE   703 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 2.8671115064;
    END;
  END;

********** LEAF   169  NODE   711 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <           44411.7335 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
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

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.404363772;
      END;
    END;
  END;

********** LEAF   170  NODE   715 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <           44411.7335 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('25-44' ,'85+' ,'45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 2;
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
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF                943.5 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
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
         _ARB_F_ + -2.659156117;
        END;
      END;
    END;
  END;

********** LEAF   171  NODE   716 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <           44411.7335 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('25-44' ,'85+' ,'45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 2;
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
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <                943.5 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.231560059;
        END;
      END;
    END;
  END;

********** LEAF   172  NODE   713 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF           44411.7335 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF           65963.2815 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
        _ARBFMT_32 = PUT( Disease , $32.);
         %DMNORMIP( _ARBFMT_32);
          IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,'OSTEOARTHRITIS' ,
          'SEPTICEMIA' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.816803681;
      END;
    END;
  END;

********** LEAF   173  NODE   714 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF           44411.7335 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ,'45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <           65963.2815 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
        _ARBFMT_32 = PUT( Disease , $32.);
         %DMNORMIP( _ARBFMT_32);
          IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,'OSTEOARTHRITIS' ,
          'SEPTICEMIA' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 3.9659438629;
      END;
    END;
  END;

********** LEAF   174  NODE   720 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <            44300.401 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF             1947.618 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
        _ARBFMT_32 = PUT( Disease , $32.);
         %DMNORMIP( _ARBFMT_32);
          IF _ARBFMT_32 IN ('CANCER, ALL' ,
          'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' ,'SEPTICEMIA' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.364995309;
      END;
    END;
  END;

********** LEAF   175  NODE   721 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <            44300.401 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF _ARBFMT_10 IN ('MALE' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Gender ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <             1947.618 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
        _ARBFMT_32 = PUT( Disease , $32.);
         %DMNORMIP( _ARBFMT_32);
          IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN 
           DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,
          'DEMENTIA AND ALZHEIMER''S DISEASE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Gender  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_10 NOTIN (
        'FEMALE' ,'MALE' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.36437545;
      END;
    END;
  END;

********** LEAF   176  NODE   722 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF            44300.401 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
      Population_in_thousands  <              47542.5 THEN DO;
       _BRANCH_ =    1; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('18-24' ,'85+' ,'65-84' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'45-64' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
        _ARBFMT_32 = PUT( Disease , $32.);
         %DMNORMIP( _ARBFMT_32);
          IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 3.3423019432;
      END;
    END;
  END;

********** LEAF   177  NODE   723 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF            44300.401 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
      IF  NOT MISSING(Population_in_thousands ) AND 
                   47542.5 <= Population_in_thousands  THEN DO;
       _BRANCH_ =    2; 
      END; 
     IF MISSING(Population_in_thousands ) THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'45-64' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('18-24' ,'85+' ,'65-84' 
          ) THEN _BRANCH_ = 0; 
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
        _ARBFMT_32 = PUT( Disease , $32.);
         %DMNORMIP( _ARBFMT_32);
          IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'OSTEOARTHRITIS' ,'SEPTICEMIA' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.02635015;
      END;
    END;
  END;

********** LEAF   178  NODE   731 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <           44411.7335 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
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
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <            41226.072 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
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
         _ARB_F_ + -1.587605735;
        END;
      END;
    END;
  END;

********** LEAF   179  NODE   732 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <           44411.7335 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
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
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF            41226.072 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.5599197701;
        END;
      END;
    END;
  END;

********** LEAF   180  NODE   728 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <           44411.7335 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.958014309;
      END;
    END;
  END;

********** LEAF   181  NODE   729 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF           44411.7335 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <            28331.354 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'85+' ,'45-64' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_19 IN ('25-44' ,'65-84' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
        'CANCER, ALL' ,'OSTEOARTHRITIS' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.996259033;
      END;
    END;
  END;

********** LEAF   182  NODE   730 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF           44411.7335 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
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
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF            28331.354 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
          IF _ARBFMT_19 IN ('25-44' ,'65-84' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'85+' ,'45-64' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 6.1975826392;
      END;
    END;
  END;

********** LEAF   183  NODE   736 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <                887.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 1.0911360477;
      END;
    END;
  END;

********** LEAF   184  NODE   740 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF                887.5 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF            8773.6505 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
           ) THEN _BRANCH_ = 1;
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
          IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
              IF Population_in_thousands  <                12933 THEN DO;
               _BRANCH_ =    1; 
              END; 
            ELSE _BRANCH_ = 0;
            END;
          END;

        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -2.938352742;
          END;
        END;
      END;
    END;
  END;

********** LEAF   185  NODE   741 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF                887.5 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF            8773.6505 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
           ) THEN _BRANCH_ = 1;
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
          IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
              IF                12933 <= Population_in_thousands  THEN DO;
               _BRANCH_ =    2; 
              END; 
            ELSE _BRANCH_ = 0;
            END;
          END;
        IF _BRANCH_ LT 0 THEN DO; 
           IF MISSING( Disease  ) THEN _BRANCH_ = 2;
          ELSE IF _ARBFMT_32 NOTIN (
            'CANCER, ALL' ,'SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
            'OSTEOARTHRITIS' 
             ) THEN _BRANCH_ = 2;
        END; 
        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -0.357056035;
          END;
        END;
      END;
    END;
  END;

********** LEAF   186  NODE   739 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF                887.5 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('85+' ,'45-64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <            8773.6505 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.1921672694;
        END;
      END;
    END;
  END;

********** LEAF   187  NODE   735 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 2.6366839436;
    END;
  END;

********** LEAF   188  NODE   749 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <           78311.3715 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(Population_in_thousands ) AND 
        Population_in_thousands  <                36359 THEN DO;
         _BRANCH_ =    1; 
        END; 
       IF MISSING(Population_in_thousands ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('18-24' ,'85+' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_19 IN ('0-17' ,'25-44' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('FEMALE' ,'ALL' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_10 IN ('MALE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.229757922;
        END;
      END;
    END;
  END;

********** LEAF   189  NODE   750 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <           78311.3715 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(Population_in_thousands ) AND 
                       36359 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
       IF MISSING(Population_in_thousands ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('0-17' ,'25-44' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_19 IN ('18-24' ,'85+' 
            ) THEN _BRANCH_ = 0; 
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('MALE' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_10 IN ('FEMALE' ,'ALL' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + 0.7593728038;
        END;
      END;
    END;
  END;

********** LEAF   190  NODE   746 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <           78311.3715 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
      'CANCER, ALL' ,'OSTEOARTHRITIS' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -3.332052801;
      END;
    END;
  END;

********** LEAF   191  NODE   747 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF           78311.3715 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'25-44' ,'85+' ,'18-24' ,'45-64' ,'65-84' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF            33098.083 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'ALL' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
          ELSE IF _ARBFMT_10 IN ('MALE' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'25-44' ,'85+' ,'18-24' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -2.277815614;
      END;
    END;
  END;

********** LEAF   192  NODE   748 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
  IF _ARBFMT_32 NOTIN (
    'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ,
    'CANCER, ALL' ,'OSTEOARTHRITIS' 
    ) THEN _ARB_SURR_ = 1; 
  IF _ARB_SURR_ NE 0 THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF           78311.3715 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('18-24' ,'45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'25-44' ,'85+' ,'18-24' ,'45-64' ,'65-84' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <            33098.083 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('MALE' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
          ELSE IF _ARBFMT_10 IN ('FEMALE' ,'ALL' 
          ) THEN _BRANCH_ = 0; 
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 5.5545855971;
      END;
    END;
  END;

********** LEAF   193  NODE   756 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <           44643.2335 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'45-64' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'25-44' ,'45-64' ,'18-24' ,'85+' ,'65-84' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF           20763.2735 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('CANCER, ALL' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_32 IN ('ASTHMA' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'25-44' ,'45-64' ,'18-24' ,'85+' ,'65-84' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.713672743;
        END;
      END;
    END;
  END;

********** LEAF   194  NODE   757 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <           44643.2335 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('18-24' ,'85+' ,'65-84' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'25-44' ,'45-64' ,'18-24' ,'85+' ,'65-84' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <           20763.2735 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
            IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_32 IN ('CANCER, ALL' ,
            'DEMENTIA AND ALZHEIMER''S DISEASE' 
            ) THEN _BRANCH_ = 0; 
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.760415298;
        END;
      END;
    END;
  END;

********** LEAF   195  NODE   755 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF Population_in_thousands  <           44643.2335 THEN DO;
         _BRANCH_ =    1; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Gender  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_10 NOTIN (
      'FEMALE' ,'MALE' ,'ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.020527576;
      END;
    END;
  END;

********** LEAF   196  NODE   753 ***************;
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
    IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
        IF           44643.2335 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
      ELSE _BRANCH_ = 0;
      END;
    END;

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 2.2830102336;
    END;
  END;

********** LEAF   197  NODE   761 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF           33755.8905 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
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
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 1.1289744549;
      END;
    END;
  END;

********** LEAF   198  NODE   762 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ) THEN DO;
     _BRANCH_ =    1; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('85+' ,'45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <           33755.8905 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
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
       _ARB_F_ + -3.537001369;
      END;
    END;
  END;

********** LEAF   199  NODE   765 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'CANCER, ALL' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(Population_in_thousands ) AND 
        Population_in_thousands  <           15450.6975 THEN DO;
         _BRANCH_ =    1; 
        END; 
       IF MISSING(Population_in_thousands ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('18-24' ,'85+' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_19 IN ('0-17' ,'25-44' 
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
         _ARB_F_ + -0.334793339;
        END;
      END;
    END;
  END;

********** LEAF   200  NODE   766 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'CANCER, ALL' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(Population_in_thousands ) AND 
                  15450.6975 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
       IF MISSING(Population_in_thousands ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('0-17' ,'25-44' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_19 IN ('18-24' ,'85+' 
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
         IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.950350939;
        END;
      END;
    END;
  END;

********** LEAF   201  NODE   764 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ,'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 2;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'CANCER, ALL' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' 
       ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 3.8264885512;
      END;
    END;
  END;

********** LEAF   202  NODE   772 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
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
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <             1276.213 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(Population_in_thousands ) AND 
        Population_in_thousands  <           33731.2805 THEN DO;
         _BRANCH_ =    1; 
        END; 
       IF MISSING(Population_in_thousands ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('18-24' ,'85+' ) THEN DO;
             _BRANCH_ =    1; 
            END; 
            ELSE IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'45-64' 
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
         IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.441263208;
        END;
      END;
    END;
  END;

********** LEAF   203  NODE   773 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
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
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <             1276.213 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF  NOT MISSING(Population_in_thousands ) AND 
                  33731.2805 <= Population_in_thousands  THEN DO;
         _BRANCH_ =    2; 
        END; 
       IF MISSING(Population_in_thousands ) THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
            IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'45-64' ) THEN DO;
             _BRANCH_ =    2; 
            END; 
            ELSE IF _ARBFMT_19 IN ('18-24' ,'85+' 
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
         _ARB_F_ + 1.2438272362;
        END;
      END;
    END;
  END;

********** LEAF   204  NODE   774 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
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
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF             1276.213 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
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

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'25-44' ,'85+' ,'18-24' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF             37665.37 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'25-44' ,'85+' ,'18-24' ,'45-64' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.812689657;
        END;
      END;
    END;
  END;

********** LEAF   205  NODE   775 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
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
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF             1276.213 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
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

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ,'45-64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'25-44' ,'85+' ,'18-24' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <             37665.37 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.321295612;
        END;
      END;
    END;
  END;

********** LEAF   206  NODE   769 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 2.7018068415;
    END;
  END;

********** LEAF   207  NODE   783 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
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
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <           54985.7335 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Gender  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          'FEMALE' ,'MALE' ,'ALL' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
          IF  NOT MISSING(Population_in_thousands ) AND 
          Population_in_thousands  <           37679.0875 THEN DO;
           _BRANCH_ =    1; 
          END; 
         IF MISSING(Population_in_thousands ) THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
              IF _ARBFMT_19 IN ('18-24' ,'85+' ) THEN DO;
               _BRANCH_ =    1; 
              END; 
              ELSE IF _ARBFMT_19 IN ('0-17' ,'25-44' 
              ) THEN _BRANCH_ = 0; 
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
              IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' 
               ,'SEPTICEMIA' ) THEN DO;
               _BRANCH_ =    1; 
              END; 
              ELSE IF _ARBFMT_32 IN ('OSTEOARTHRITIS' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;
        IF _BRANCH_ LT 0 THEN DO; 
           IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 1;
        END; 
        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + 1.1175761873;
          END;
        END;
      END;
    END;
  END;

********** LEAF   208  NODE   784 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
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
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <           54985.7335 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Gender  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_10 NOTIN (
          'FEMALE' ,'MALE' ,'ALL' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
          IF  NOT MISSING(Population_in_thousands ) AND 
                    37679.0875 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
         IF MISSING(Population_in_thousands ) THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
              IF _ARBFMT_19 IN ('0-17' ,'25-44' ) THEN DO;
               _BRANCH_ =    2; 
              END; 
              ELSE IF _ARBFMT_19 IN ('18-24' ,'85+' 
              ) THEN _BRANCH_ = 0; 
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(Disease ) THEN DO;
              IF _ARBFMT_32 IN ('OSTEOARTHRITIS' ) THEN DO;
               _BRANCH_ =    2; 
              END; 
              ELSE IF _ARBFMT_32 IN ('ASTHMA' ,
              'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;

        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + 0.1909531093;
          END;
        END;
      END;
    END;
  END;

********** LEAF   209  NODE   782 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
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
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF           54985.7335 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.66535793;
        END;
      END;
    END;
  END;

********** LEAF   210  NODE   780 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
    'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Disease  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
      'SEPTICEMIA' ,'CANCER, ALL' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('45-64' ,'65-84' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -2.666257221;
      END;
    END;
  END;

********** LEAF   211  NODE   778 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 1.9037762085;
    END;
  END;

********** LEAF   212  NODE   792 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
        'SEPTICEMIA' ,'CANCER, ALL' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'85+' ,'25-44' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <           40158.0495 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'85+' ,'25-44' ,'45-64' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
          IF _ARBFMT_32 IN ('ASTHMA' ,'OSTEOARTHRITIS' ) THEN DO;
           _BRANCH_ =    1; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_32 NOTIN (
          'ASTHMA' ,'OSTEOARTHRITIS' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'SEPTICEMIA' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
              IF              12474.5 <= Population_in_thousands  THEN DO;
               _BRANCH_ =    1; 
              END; 
            ELSE _BRANCH_ = 0;
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
              IF _ARBFMT_19 IN ('0-17' ,'18-24' ) THEN DO;
               _BRANCH_ =    1; 
              END; 
              ELSE IF _ARBFMT_19 IN ('85+' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;
        IF _BRANCH_ LT 0 THEN DO; 
           IF MISSING( Disease  ) THEN _BRANCH_ = 1;
          ELSE IF _ARBFMT_32 NOTIN (
            'ASTHMA' ,'OSTEOARTHRITIS' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
            'SEPTICEMIA' 
             ) THEN _BRANCH_ = 1;
        END; 
        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + 0.7484924476;
          END;
        END;
      END;
    END;
  END;

********** LEAF   213  NODE   793 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
        'SEPTICEMIA' ,'CANCER, ALL' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'85+' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'85+' ,'25-44' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <           40158.0495 THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'85+' ,'25-44' ,'45-64' 
           ) THEN _BRANCH_ = 1;
      END; 
      IF _BRANCH_ GT 0 THEN DO;

        _BRANCH_ = -1;
          IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'SEPTICEMIA' ) THEN DO;
           _BRANCH_ =    2; 
          END; 
        _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
        IF _ARBFMT_32 NOTIN (
          'ASTHMA' ,'OSTEOARTHRITIS' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
          'SEPTICEMIA' 
          ) THEN _ARB_SURR_ = 1; 
        IF _ARB_SURR_ NE 0 THEN DO; 
          IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
              IF Population_in_thousands  <              12474.5 THEN DO;
               _BRANCH_ =    2; 
              END; 
            ELSE _BRANCH_ = 0;
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
              IF _ARBFMT_19 IN ('85+' ) THEN DO;
               _BRANCH_ =    2; 
              END; 
              ELSE IF _ARBFMT_19 IN ('0-17' ,'18-24' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;

        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + 0.167458474;
          END;
        END;
      END;
    END;
  END;

********** LEAF   214  NODE   791 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,'OSTEOARTHRITIS' ,
        'SEPTICEMIA' ,'CANCER, ALL' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('25-44' ,'45-64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'85+' ,'25-44' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF           40158.0495 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.124596235;
        END;
      END;
    END;
  END;

********** LEAF   215  NODE   789 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
       _BRANCH_ =    2; 
      END; 

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -2.066229804;
      END;
    END;
  END;

********** LEAF   216  NODE   787 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 1.8757163977;
    END;
  END;

********** LEAF   217  NODE   797 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <                887.5 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.6839976061;
      END;
    END;
  END;

********** LEAF   218  NODE   801 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF                887.5 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF            8773.6505 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
           ) THEN _BRANCH_ = 1;
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
          IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
              IF           82574.3365 <= Population_in_thousands  THEN DO;
               _BRANCH_ =    1; 
              END; 
            ELSE _BRANCH_ = 0;
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
              IF _ARBFMT_19 IN ('0-17' ) THEN DO;
               _BRANCH_ =    1; 
              END; 
              ELSE IF _ARBFMT_19 IN ('18-24' ,'25-44' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;

        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -2.612069475;
          END;
        END;
      END;
    END;
  END;

********** LEAF   219  NODE   802 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF                887.5 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF            8773.6505 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
           ) THEN _BRANCH_ = 1;
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
          IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
              IF Population_in_thousands  <           82574.3365 THEN DO;
               _BRANCH_ =    2; 
              END; 
            ELSE _BRANCH_ = 0;
            END;
          IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
              IF _ARBFMT_19 IN ('18-24' ,'25-44' ) THEN DO;
               _BRANCH_ =    2; 
              END; 
              ELSE IF _ARBFMT_19 IN ('0-17' 
              ) THEN _BRANCH_ = 0; 
            END;
          END;
        IF _BRANCH_ LT 0 THEN DO; 
           IF MISSING( Disease  ) THEN _BRANCH_ = 2;
          ELSE IF _ARBFMT_32 NOTIN (
            'CANCER, ALL' ,'SEPTICEMIA' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
            'OSTEOARTHRITIS' 
             ) THEN _BRANCH_ = 2;
        END; 
        IF _BRANCH_ GT 0 THEN DO;
           _ARB_F_ + -0.179811956;
          END;
        END;
      END;
    END;
  END;

********** LEAF   220  NODE   800 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF                887.5 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 2;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 2;
    END; 
    IF _BRANCH_ GT 0 THEN DO;

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('85+' ,'45-64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <            8773.6505 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.169236045;
        END;
      END;
    END;
  END;

********** LEAF   221  NODE   796 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 1.7257795111;
    END;
  END;

********** LEAF   222  NODE   806 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population_in_thousands ) AND 
    Population_in_thousands  <           29334.5895 THEN DO;
     _BRANCH_ =    1; 
    END; 
   IF MISSING(Population_in_thousands ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('18-24' ,'85+' ,'65-84' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'45-64' 
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

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'OSTEOARTHRITIS' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF                943.5 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'OSTEOARTHRITIS' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.487395491;
      END;
    END;
  END;

********** LEAF   223  NODE   807 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population_in_thousands ) AND 
    Population_in_thousands  <           29334.5895 THEN DO;
     _BRANCH_ =    1; 
    END; 
   IF MISSING(Population_in_thousands ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('18-24' ,'85+' ,'65-84' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
        ELSE IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'45-64' 
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

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ) 
        THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'OSTEOARTHRITIS' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <                943.5 THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -0.120012186;
      END;
    END;
  END;

********** LEAF   224  NODE   808 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population_in_thousands ) AND 
              29334.5895 <= Population_in_thousands  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(Population_in_thousands ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'45-64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_19 IN ('18-24' ,'85+' ,'65-84' 
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
     IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('ASTHMA' ,'CANCER, ALL' ,'OSTEOARTHRITIS' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'OSTEOARTHRITIS' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <           83800.6475 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;
    IF _BRANCH_ LT 0 THEN DO; 
       IF MISSING( Disease  ) THEN _BRANCH_ = 1;
      ELSE IF _ARBFMT_32 NOTIN (
        'ASTHMA' ,'CANCER, ALL' ,'OSTEOARTHRITIS' ,
        'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' 
         ) THEN _BRANCH_ = 1;
    END; 
    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 2.0765177384;
      END;
    END;
  END;

********** LEAF   225  NODE   809 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
    IF  NOT MISSING(Population_in_thousands ) AND 
              29334.5895 <= Population_in_thousands  THEN DO;
     _BRANCH_ =    2; 
    END; 
   IF MISSING(Population_in_thousands ) THEN DO; 
    IF _BRANCH_ LT 0 AND NOT MISSING(Age_group ) THEN DO;
      _ARBFMT_19 = PUT( Age_group , $19.);
       %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('0-17' ,'25-44' ,'45-64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
        ELSE IF _ARBFMT_19 IN ('18-24' ,'85+' ,'65-84' 
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
     IF MISSING( Population_in_thousands  ) THEN _BRANCH_ = 2;
  END; 
  IF _BRANCH_ GT 0 THEN DO;

    _BRANCH_ = -1;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' ) 
        THEN DO;
       _BRANCH_ =    2; 
      END; 
    _ARB_SURR_ = 0;  IF MISSING(Disease ) THEN _ARB_SURR_ = 1; 
    IF _ARBFMT_32 NOTIN (
      'ASTHMA' ,'CANCER, ALL' ,'OSTEOARTHRITIS' ,
      'DEMENTIA AND ALZHEIMER''S DISEASE' ,'SEPTICEMIA' 
      ) THEN _ARB_SURR_ = 1; 
    IF _ARB_SURR_ NE 0 THEN DO; 
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF           83800.6475 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + -1.296131246;
      END;
    END;
  END;

********** LEAF   226  NODE   813 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
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
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF Population_in_thousands  <            1211.4555 THEN DO;
           _BRANCH_ =    1; 
          END; 
        ELSE _BRANCH_ = 0;
        END;
      END;

    IF _BRANCH_ GT 0 THEN DO;
       _ARB_F_ + 0.3445651743;
      END;
    END;
  END;

********** LEAF   227  NODE   815 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
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
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF            1211.4555 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
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

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('0-17' ,'25-44' ) THEN DO;
         _BRANCH_ =    1; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'25-44' ,'18-24' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF           32683.1325 <= Population_in_thousands  THEN DO;
             _BRANCH_ =    1; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;

      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -1.628469451;
        END;
      END;
    END;
  END;

********** LEAF   228  NODE   816 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
  IF _BRANCH_ LT 0 THEN DO; 
     IF MISSING( Age_group  ) THEN _BRANCH_ = 1;
    ELSE IF _ARBFMT_19 NOTIN (
      '0-17' ,'18-24' ,'25-44' ,'85+' ,'45-64' ,'65-84' 
       ) THEN _BRANCH_ = 1;
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
      IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
          IF            1211.4555 <= Population_in_thousands  THEN DO;
           _BRANCH_ =    2; 
          END; 
        ELSE _BRANCH_ = 0;
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

      _BRANCH_ = -1;
        IF _ARBFMT_19 IN ('18-24' ,'85+' ,'45-64' ) THEN DO;
         _BRANCH_ =    2; 
        END; 
      _ARB_SURR_ = 0;  IF MISSING(Age_group ) THEN _ARB_SURR_ = 1; 
      IF _ARBFMT_19 NOTIN (
        '0-17' ,'25-44' ,'18-24' ,'85+' ,'45-64' 
        ) THEN _ARB_SURR_ = 1; 
      IF _ARB_SURR_ NE 0 THEN DO; 
        IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
            IF Population_in_thousands  <           32683.1325 THEN DO;
             _BRANCH_ =    2; 
            END; 
          ELSE _BRANCH_ = 0;
          END;
        END;
      IF _BRANCH_ LT 0 THEN DO; 
         IF MISSING( Age_group  ) THEN _BRANCH_ = 2;
        ELSE IF _ARBFMT_19 NOTIN (
          '0-17' ,'25-44' ,'18-24' ,'85+' ,'45-64' 
           ) THEN _BRANCH_ = 2;
      END; 
      IF _BRANCH_ GT 0 THEN DO;
         _ARB_F_ + -0.168046839;
        END;
      END;
    END;
  END;

********** LEAF   229  NODE   812 ***************;
IF _ARB_BADF_ EQ 0 THEN DO; 

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('65-84' ) THEN DO;
     _BRANCH_ =    2; 
    END; 

  IF _BRANCH_ GT 0 THEN DO;
     _ARB_F_ + 2.7668797787;
    END;
  END;
P_Cases_in_1000s  = _ARB_F_;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

