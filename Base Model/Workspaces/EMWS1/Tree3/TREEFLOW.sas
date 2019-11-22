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
label R_Sum_Labor_Force_Pop = 'Residual: Sum_Labor_Force_Pop' ;
label _WARN_ = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_19 $     19; DROP _ARBFMT_19; 
_ARBFMT_19 = ' '; /* Initialize to avoid warning. */


******             ASSIGN OBSERVATION TO NODE             ******;
_ARBFMT_19 = PUT( Age_group , $19.);
 %DMNORMIP( _ARBFMT_19);
IF _ARBFMT_19 IN ('16 TO 24' ,'65+' ) THEN DO;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
  IF _ARBFMT_19 IN ('16 TO 24' ) THEN DO;
    _NODE_  =                    4;
    _LEAF_  =                    1;
    P_Sum_Labor_Force_Pop  =     3739815.12605042;
    V_Sum_Labor_Force_Pop  =     3878439.56043956;
    END;
  ELSE DO;
    _NODE_  =                    5;
    _LEAF_  =                    2;
    P_Sum_Labor_Force_Pop  =     1107916.03053435;
    V_Sum_Labor_Force_Pop  =     1129936.70886075;
    END;
  END;
ELSE DO;
  _NODE_  =                    3;
  _LEAF_  =                    3;
  P_Sum_Labor_Force_Pop  =     11422003.9370078;
  V_Sum_Labor_Force_Pop  =     11907433.7349397;
  END;

*****  RESIDUALS R_ *************;
IF MISSING( Sum_Labor_Force_Pop ) THEN R_Sum_Labor_Force_Pop  = .;
ELSE R_Sum_Labor_Force_Pop  = Sum_Labor_Force_Pop  - P_Sum_Labor_Force_Pop ;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

