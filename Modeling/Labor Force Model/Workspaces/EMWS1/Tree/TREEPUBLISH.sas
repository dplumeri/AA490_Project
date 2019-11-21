****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH _WARN_  $    4; 

******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_Sum_Labor_Force_Pop = 'Predicted: Sum_Labor_Force_Pop' ;
label V_Sum_Labor_Force_Pop = 'Validated: Sum_Labor_Force_Pop' ;
label _WARN_ = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_19 $     19; DROP _ARBFMT_19; 
_ARBFMT_19 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_10 $     10; DROP _ARBFMT_10; 
_ARBFMT_10 = ' '; /* Initialize to avoid warning. */


******             ASSIGN OBSERVATION TO NODE             ******;

 DROP _BRANCH_;
_BRANCH_ = -1;
_ARBFMT_19 = PUT( Age_group , $19.);
 %DMNORMIP( _ARBFMT_19);
  IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
   _BRANCH_ =    1; 
  END; 
  ELSE IF _ARBFMT_19 IN ('25 TO 44' ,'45 TO 64' ) THEN DO;
   _BRANCH_ =    2; 
  END; 
IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
    IF Population_in_thousands  <           40086.4235 THEN DO;
     _BRANCH_ =    1; 
    END; 
    ELSE IF           40086.4235 <= Population_in_thousands  THEN DO;
     _BRANCH_ =    2; 
    END; 
   ELSE _BRANCH_ =    2; 
  END;
IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
  _ARBFMT_10 = PUT( Date , $10.);
   %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('2000' ,'2001' ,'2004' ,'2008' ,'2010' ,'2012' ,'2013' )
     THEN DO;
     _BRANCH_ =    1; 
    END; 
    ELSE IF _ARBFMT_10 IN ('2002' ,'2003' ,'2005' ,'2006' ,'2007' ,'2009' ,
    '2011' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  END;
IF _BRANCH_ LT 0 THEN _BRANCH_ =    2; 

IF _BRANCH_ EQ    1 THEN DO;

  _BRANCH_ = -1;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
     _BRANCH_ =    1; 
    END; 
    ELSE IF _ARBFMT_19 IN ('65+' ) THEN DO;
     _BRANCH_ =    2; 
    END; 
  IF _BRANCH_ LT 0 AND NOT MISSING(Population_in_thousands ) THEN DO;
      IF Population_in_thousands  <           20523.8625 THEN DO;
       _BRANCH_ =    1; 
      END; 
      ELSE IF           20523.8625 <= Population_in_thousands  THEN DO;
       _BRANCH_ =    2; 
      END; 
     ELSE _BRANCH_ =    2; 
    END;
  IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
    _ARBFMT_10 = PUT( Date , $10.);
     %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('2000' ,'2003' ,'2006' ,'2008' ,'2013' ) THEN DO;
       _BRANCH_ =    1; 
      END; 
      ELSE IF _ARBFMT_10 IN ('2001' ,'2002' ,'2004' ,'2005' ,'2007' ,'2009' ,
      '2010' ,'2011' ,'2012' ) THEN DO;
       _BRANCH_ =    2; 
      END; 
    END;
  IF _BRANCH_ LT 0 THEN _BRANCH_ =    2; 

  IF _BRANCH_ EQ    1 THEN DO;
    _NODE_  =                    4;
    _LEAF_  =                    1;
    P_Sum_Labor_Force_Pop  =     3696637.03703703;
    V_Sum_Labor_Force_Pop  =     3985733.33333333;
    END;
  ELSE DO;
    _NODE_  =                    5;
    _LEAF_  =                    2;
    P_Sum_Labor_Force_Pop  =     1100870.12987012;
    V_Sum_Labor_Force_Pop  =     1158357.14285714;
    END;
  END;
ELSE DO;
  _NODE_  =                    3;
  _LEAF_  =                    3;
  P_Sum_Labor_Force_Pop  =     11279545.1505016;
  V_Sum_Labor_Force_Pop  =     12439991.7355371;
  END;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

