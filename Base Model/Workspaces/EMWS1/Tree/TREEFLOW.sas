****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH _WARN_  $    4; 

******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_OG_Cases_in_Thousands = 'Predicted: OG_Cases_in_Thousands' ;
label V_OG_Cases_in_Thousands = 'Validated: OG_Cases_in_Thousands' ;
label R_OG_Cases_in_Thousands = 'Residual: OG_Cases_in_Thousands' ;
label _WARN_ = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_6 $      6; DROP _ARBFMT_6; 
_ARBFMT_6 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_19 $     19; DROP _ARBFMT_19; 
_ARBFMT_19 = ' '; /* Initialize to avoid warning. */


******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(Projected_Sum_Pop ) AND 
             2194576.5 <= Projected_Sum_Pop  THEN DO;
  _ARBFMT_6 = PUT( Gender , $CHAR6.);
   %DMNORMIP( _ARBFMT_6);
  IF _ARBFMT_6 IN ('ALL' ) THEN DO;
    IF  NOT MISSING(Year ) AND 
                    2004.5 <= Year  THEN DO;
      IF  NOT MISSING(Year ) AND 
        Year  <               2007.5 THEN DO;
        _NODE_  =                   26;
        _LEAF_  =                   18;
        P_OG_Cases_in_Thousands  =                83900;
        V_OG_Cases_in_Thousands  =                83400;
        END;
      ELSE DO;
        _NODE_  =                   27;
        _LEAF_  =                   19;
        P_OG_Cases_in_Thousands  =                93720;
        V_OG_Cases_in_Thousands  =                92760;
        END;
      END;
    ELSE DO;
      IF  NOT MISSING(Year ) AND 
                      2002.5 <= Year  THEN DO;
        _NODE_  =                   25;
        _LEAF_  =                   17;
        P_OG_Cases_in_Thousands  =                79920;
        V_OG_Cases_in_Thousands  =                81120;
        END;
      ELSE DO;
        IF  NOT MISSING(Year ) AND 
                        1999.5 <= Year  THEN DO;
          _NODE_  =                   39;
          _LEAF_  =                   16;
          P_OG_Cases_in_Thousands  =                69984;
          V_OG_Cases_in_Thousands  =                71070;
          END;
        ELSE DO;
          _NODE_  =                   38;
          _LEAF_  =                   15;
          P_OG_Cases_in_Thousands  =              74357.5;
          V_OG_Cases_in_Thousands  =                73430;
          END;
        END;
      END;
    END;
  ELSE DO;
    _ARBFMT_6 = PUT( Gender , $CHAR6.);
     %DMNORMIP( _ARBFMT_6);
    IF _ARBFMT_6 IN ('FEMALE' ) THEN DO;
      IF  NOT MISSING(Year ) AND 
                      2003.5 <= Year  THEN DO;
        _NODE_  =                   29;
        _LEAF_  =                   21;
        P_OG_Cases_in_Thousands  =     47704.6153846153;
        V_OG_Cases_in_Thousands  =                48942;
        END;
      ELSE DO;
        _NODE_  =                   28;
        _LEAF_  =                   20;
        P_OG_Cases_in_Thousands  =     41105.7142857142;
        V_OG_Cases_in_Thousands  =              41143.2;
        END;
      END;
    ELSE DO;
      IF  NOT MISSING(Year ) AND 
                      2003.5 <= Year  THEN DO;
        IF  NOT MISSING(Year ) AND 
                        2007.5 <= Year  THEN DO;
          _NODE_  =                   41;
          _LEAF_  =                   24;
          P_OG_Cases_in_Thousands  =                41448;
          V_OG_Cases_in_Thousands  =                41448;
          END;
        ELSE DO;
          _NODE_  =                   40;
          _LEAF_  =                   23;
          P_OG_Cases_in_Thousands  =      36550.909090909;
          V_OG_Cases_in_Thousands  =                36290;
          END;
        END;
      ELSE DO;
        _NODE_  =                   30;
        _LEAF_  =                   22;
        P_OG_Cases_in_Thousands  =     32671.4285714285;
        V_OG_Cases_in_Thousands  =              32476.8;
        END;
      END;
    END;
  END;
ELSE DO;
  _ARBFMT_19 = PUT( Age_group , $19.);
   %DMNORMIP( _ARBFMT_19);
  IF _ARBFMT_19 IN ('18-24' ) THEN DO;
    _ARBFMT_6 = PUT( Gender , $CHAR6.);
     %DMNORMIP( _ARBFMT_6);
    IF _ARBFMT_6 IN ('ALL' ) THEN DO;
      IF  NOT MISSING(Year ) AND 
        Year  <               1996.5 THEN DO;
        _NODE_  =                   20;
        _LEAF_  =                   10;
        P_OG_Cases_in_Thousands  =               1112.5;
        V_OG_Cases_in_Thousands  =     1023.33333333333;
        END;
      ELSE DO;
        _NODE_  =                   21;
        _LEAF_  =                   11;
        P_OG_Cases_in_Thousands  =     828.333333333333;
        V_OG_Cases_in_Thousands  =     784.615384615384;
        END;
      END;
    ELSE DO;
      _ARBFMT_6 = PUT( Gender , $CHAR6.);
       %DMNORMIP( _ARBFMT_6);
      IF _ARBFMT_6 IN ('MALE' ) THEN DO;
        _NODE_  =                   23;
        _LEAF_  =                   14;
        P_OG_Cases_in_Thousands  =               281.25;
        V_OG_Cases_in_Thousands  =                298.5;
        END;
      ELSE DO;
        IF  NOT MISSING(Year ) AND 
          Year  <                 1996 THEN DO;
          _NODE_  =                   36;
          _LEAF_  =                   12;
          P_OG_Cases_in_Thousands  =     709.285714285714;
          V_OG_Cases_in_Thousands  =     664.285714285714;
          END;
        ELSE DO;
          _NODE_  =                   37;
          _LEAF_  =                   13;
          P_OG_Cases_in_Thousands  =     392.222222222222;
          V_OG_Cases_in_Thousands  =                  480;
          END;
        END;
      END;
    END;
  ELSE DO;
    _ARBFMT_6 = PUT( Gender , $CHAR6.);
     %DMNORMIP( _ARBFMT_6);
    IF _ARBFMT_6 IN ('ALL' ) THEN DO;
      _NODE_  =                    8;
      _LEAF_  =                    1;
      P_OG_Cases_in_Thousands  =                 7311;
      V_OG_Cases_in_Thousands  =            7465.3125;
      END;
    ELSE DO;
      _ARBFMT_6 = PUT( Gender , $CHAR6.);
       %DMNORMIP( _ARBFMT_6);
      IF _ARBFMT_6 IN ('FEMALE' ) THEN DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('0-17' ) THEN DO;
          IF  NOT MISSING(Year ) AND 
                          2004.5 <= Year  THEN DO;
            _NODE_  =                   43;
            _LEAF_  =                    3;
            P_OG_Cases_in_Thousands  =                 1848;
            V_OG_Cases_in_Thousands  =              1841.25;
            END;
          ELSE DO;
            _NODE_  =                   42;
            _LEAF_  =                    2;
            P_OG_Cases_in_Thousands  =     3002.72727272727;
            V_OG_Cases_in_Thousands  =     3035.45454545454;
            END;
          END;
        ELSE DO;
          IF  NOT MISSING(Year ) AND 
            Year  <               1998.5 THEN DO;
            _NODE_  =                   44;
            _LEAF_  =                    4;
            P_OG_Cases_in_Thousands  =     4423.44827586206;
            V_OG_Cases_in_Thousands  =                 4510;
            END;
          ELSE DO;
            _NODE_  =                   45;
            _LEAF_  =                    5;
            P_OG_Cases_in_Thousands  =     5169.05660377358;
            V_OG_Cases_in_Thousands  =     5135.58139534883;
            END;
          END;
        END;
      ELSE DO;
        _ARBFMT_19 = PUT( Age_group , $19.);
         %DMNORMIP( _ARBFMT_19);
        IF _ARBFMT_19 IN ('0-17' ) THEN DO;
          IF  NOT MISSING(Year ) AND 
                          2007.5 <= Year  THEN DO;
            _NODE_  =                   47;
            _LEAF_  =                    7;
            P_OG_Cases_in_Thousands  =                 2544;
            V_OG_Cases_in_Thousands  =                 2550;
            END;
          ELSE DO;
            _NODE_  =                   46;
            _LEAF_  =                    6;
            P_OG_Cases_in_Thousands  =                 4236;
            V_OG_Cases_in_Thousands  =              4298.75;
            END;
          END;
        ELSE DO;
          IF  NOT MISSING(Year ) AND 
                          2003.5 <= Year  THEN DO;
            _NODE_  =                   49;
            _LEAF_  =                    9;
            P_OG_Cases_in_Thousands  =     2956.07142857142;
            V_OG_Cases_in_Thousands  =     3011.73913043478;
            END;
          ELSE DO;
            _NODE_  =                   48;
            _LEAF_  =                    8;
            P_OG_Cases_in_Thousands  =     2311.42857142857;
            V_OG_Cases_in_Thousands  =     2336.42857142857;
            END;
          END;
        END;
      END;
    END;
  END;

*****  RESIDUALS R_ *************;
IF MISSING( OG_Cases_in_Thousands ) THEN R_OG_Cases_in_Thousands  = .;
ELSE R_OG_Cases_in_Thousands  = OG_Cases_in_Thousands  - 
        P_OG_Cases_in_Thousands ;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

