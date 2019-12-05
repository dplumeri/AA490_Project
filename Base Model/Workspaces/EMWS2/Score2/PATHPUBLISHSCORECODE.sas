*------------------------------------------------------------*;
* EM SCORE CODE;
* EM Version: 14.2;
* SAS Release: 9.04.01M4P110916;
* Host: 830-5CG9310VLM;
* Encoding: wlatin1;
* Locale: en_US;
* Project Path: C:\Users\student\Desktop\AA 490\Final Project\AA490_Project;
* Project Name: Base Model;
* Diagram Id: EMWS2;
* Diagram Name: Base Model 2;
* Generated by: student;
* Date: 04DEC2019:13:49:28;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Input Data Source;
* TYPE: SAMPLE;
* NODE: Ids;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Statistics Exploration;
* TYPE: EXPLORE;
* NODE: Stat;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Partition Class;
* TYPE: SAMPLE;
* NODE: Part;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Extension Class;
* TYPE: MODEL;
* NODE: Tree;
*------------------------------------------------------------*;
****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH _WARN_  $    4;

******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_Cases_in_1000s = 'Predicted: Cases_in_1000s' ;
label V_Cases_in_1000s = 'Validated: Cases_in_1000s' ;
label _WARN_ = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_19 $     19; DROP _ARBFMT_19;
_ARBFMT_19 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_10 $     10; DROP _ARBFMT_10;
_ARBFMT_10 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_32 $     32; DROP _ARBFMT_32;
_ARBFMT_32 = ' '; /* Initialize to avoid warning. */


******             ASSIGN OBSERVATION TO NODE             ******;
_ARBFMT_19 = PUT( Age_group , $19.);
 %DMNORMIP( _ARBFMT_19);
IF _ARBFMT_19 IN ('18-24' ) THEN DO;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
  IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
    _ARBFMT_10 = PUT( Gender , $CHAR10.);
     %DMNORMIP( _ARBFMT_10);
    IF _ARBFMT_10 IN ('ALL' ) THEN DO;
      _NODE_  =                   13;
      _LEAF_  =                   16;
      P_Cases_in_1000s  =                 19.5;
      V_Cases_in_1000s  =                 20.2;
      END;
    ELSE DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('MALE' ) THEN DO;
        _NODE_  =                   24;
        _LEAF_  =                   14;
        P_Cases_in_1000s  =                6.125;
        V_Cases_in_1000s  =                  6.4;
        END;
      ELSE DO;
        _NODE_  =                   25;
        _LEAF_  =                   15;
        P_Cases_in_1000s  =     12.7272727272727;
        V_Cases_in_1000s  =                 13.2;
        END;
      END;
    END;
  ELSE DO;
    _ARBFMT_32 = PUT( Disease , $32.);
     %DMNORMIP( _ARBFMT_32);
    IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('ALL' ) THEN DO;
        _NODE_  =                   27;
        _LEAF_  =                   18;
        P_Cases_in_1000s  =     9.36363636363636;
        V_Cases_in_1000s  =                 8.75;
        END;
      ELSE DO;
        _NODE_  =                   26;
        _LEAF_  =                   17;
        P_Cases_in_1000s  =     4.44444444444444;
        V_Cases_in_1000s  =                  5.9;
        END;
      END;
    ELSE DO;
      _NODE_  =                   15;
      _LEAF_  =                   19;
      P_Cases_in_1000s  =     0.41791044776119;
      V_Cases_in_1000s  =     0.14545454545454;
      END;
    END;
  END;
ELSE DO;
  _ARBFMT_32 = PUT( Disease , $32.);
   %DMNORMIP( _ARBFMT_32);
  IF _ARBFMT_32 IN ('ASTHMA' ) THEN DO;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
    IF _ARBFMT_19 IN ('0-17' ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('ALL' ) THEN DO;
        _NODE_  =                   19;
        _LEAF_  =                    5;
        P_Cases_in_1000s  =     178.888888888888;
        V_Cases_in_1000s  =                204.5;
        END;
      ELSE DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
          _NODE_  =                   29;
          _LEAF_  =                    4;
          P_Cases_in_1000s  =               66.625;
          V_Cases_in_1000s  =     62.3333333333333;
          END;
        ELSE DO;
          _NODE_  =                   28;
          _LEAF_  =                    3;
          P_Cases_in_1000s  =     112.888888888888;
          V_Cases_in_1000s  =     110.888888888888;
          END;
        END;
      END;
    ELSE DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
      IF _ARBFMT_10 IN ('MALE' ) THEN DO;
        _NODE_  =                   16;
        _LEAF_  =                    1;
        P_Cases_in_1000s  =                 4.25;
        V_Cases_in_1000s  =     2.57142857142857;
        END;
      ELSE DO;
        _NODE_  =                   17;
        _LEAF_  =                    2;
        P_Cases_in_1000s  =     12.5555555555555;
        V_Cases_in_1000s  =     10.6363636363636;
        END;
      END;
    END;
  ELSE DO;

     DROP _BRANCH_;
    _BRANCH_ = -1;
    _ARBFMT_19 = PUT( Age_group , $19.);
     %DMNORMIP( _ARBFMT_19);
      IF _ARBFMT_19 IN ('0-17' ) THEN DO;
       _BRANCH_ =    1;
      END;
      ELSE IF _ARBFMT_19 IN ('85+' ,'25-44' ) THEN DO;
       _BRANCH_ =    2;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Date ) THEN DO;
      _ARBFMT_10 = PUT( Date , $10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('1990' ,'1991' ,'1992' ,'1997' ,'1998' ,'2000' ,
        '2002' ,'2003' ,'2005' ,'2006' ,'2007' ,'2008' ,'2010' ) THEN DO;
         _BRANCH_ =    1;
        END;
        ELSE IF _ARBFMT_10 IN ('1993' ,'1994' ,'1995' ,'1996' ,'1999' ,
        '2001' ,'2004' ,'2009' ) THEN DO;
         _BRANCH_ =    2;
        END;
      END;
    IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
      _ARBFMT_10 = PUT( Gender , $CHAR10.);
       %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('MALE' ) THEN DO;
         _BRANCH_ =    1;
        END;
        ELSE IF _ARBFMT_10 IN ('FEMALE' ,'ALL' ) THEN DO;
         _BRANCH_ =    2;
        END;
      END;
    IF _BRANCH_ LT 0 THEN _BRANCH_ =    2;

    IF _BRANCH_ EQ    1 THEN DO;

      _BRANCH_ = -1;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
        IF _ARBFMT_32 IN ('CANCER, ALL' ,'SEPTICEMIA' ) THEN DO;
         _BRANCH_ =    1;
        END;
        ELSE IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
        'OSTEOARTHRITIS' ) THEN DO;
         _BRANCH_ =    2;
        END;
      IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ,'ALL' ) THEN DO;
           _BRANCH_ =    1;
          END;
          ELSE IF _ARBFMT_10 IN ('MALE' ) THEN DO;
           _BRANCH_ =    2;
          END;
        END;
      IF _BRANCH_ LT 0 THEN _BRANCH_ =    1;

      IF _BRANCH_ EQ    2 THEN DO;
        _NODE_  =                   21;
        _LEAF_  =                    8;
        P_Cases_in_1000s  =                    0;
        V_Cases_in_1000s  =                    0;
        END;
      ELSE DO;

        _BRANCH_ = -1;
        _ARBFMT_32 = PUT( Disease , $32.);
         %DMNORMIP( _ARBFMT_32);
          IF _ARBFMT_32 IN ('CANCER, ALL' ) THEN DO;
           _BRANCH_ =    1;
          END;
          ELSE IF _ARBFMT_32 IN ('SEPTICEMIA' ) THEN DO;
           _BRANCH_ =    2;
          END;
        IF _BRANCH_ LT 0 AND NOT MISSING(Gender ) THEN DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
            IF _ARBFMT_10 IN ('MALE' ,'FEMALE' ) THEN DO;
             _BRANCH_ =    1;
            END;
            ELSE IF _ARBFMT_10 IN ('ALL' ) THEN DO;
             _BRANCH_ =    2;
            END;
          END;
        IF _BRANCH_ LT 0 THEN _BRANCH_ =    1;

        IF _BRANCH_ EQ    2 THEN DO;
          _NODE_  =                   31;
          _LEAF_  =                    7;
          P_Cases_in_1000s  =      8.8695652173913;
          V_Cases_in_1000s  =     13.2105263157894;
          END;
        ELSE DO;
          _NODE_  =                   30;
          _LEAF_  =                    6;
          P_Cases_in_1000s  =     16.6521739130434;
          V_Cases_in_1000s  =     17.6842105263157;
          END;
        END;
      END;
    ELSE DO;
      _ARBFMT_32 = PUT( Disease , $32.);
       %DMNORMIP( _ARBFMT_32);
      IF _ARBFMT_32 IN ('DEMENTIA AND ALZHEIMER''S DISEASE' ,
      'OSTEOARTHRITIS' ) THEN DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('ALL' ) THEN DO;
          _NODE_  =                   35;
          _LEAF_  =                   13;
          P_Cases_in_1000s  =               32.375;
          V_Cases_in_1000s  =     32.4285714285714;
          END;
        ELSE DO;
          _NODE_  =                   34;
          _LEAF_  =                   12;
          P_Cases_in_1000s  =     15.6896551724137;
          V_Cases_in_1000s  =     15.1111111111111;
          END;
        END;
      ELSE DO;
        _ARBFMT_10 = PUT( Gender , $CHAR10.);
         %DMNORMIP( _ARBFMT_10);
        IF _ARBFMT_10 IN ('ALL' ) THEN DO;
          _NODE_  =                   33;
          _LEAF_  =                   11;
          P_Cases_in_1000s  =                   73;
          V_Cases_in_1000s  =     89.3333333333333;
          END;
        ELSE DO;
          _ARBFMT_10 = PUT( Gender , $CHAR10.);
           %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('FEMALE' ) THEN DO;
            _NODE_  =                   37;
            _LEAF_  =                   10;
            P_Cases_in_1000s  =               50.375;
            V_Cases_in_1000s  =     49.2941176470588;
            END;
          ELSE DO;
            _NODE_  =                   36;
            _LEAF_  =                    9;
            P_Cases_in_1000s  =     29.0555555555555;
            V_Cases_in_1000s  =      28.090909090909;
            END;
          END;
        END;
      END;
    END;
  END;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

drop _LEAF_;
*------------------------------------------------------------*;
* TOOL: Model Compare Class;
* TYPE: ASSESS;
* NODE: MdlComp;
*------------------------------------------------------------*;
drop _temp_;
if (P_Cases_in_1000s ge 92.944444444444) then do;
b_Cases_in_1000s = 1;
end;
else
if (P_Cases_in_1000s ge 69.8125) then do;
b_Cases_in_1000s = 2;
end;
else
if (P_Cases_in_1000s ge 41.375) then do;
b_Cases_in_1000s = 3;
end;
else
if (P_Cases_in_1000s ge 30.7152777777777) then do;
b_Cases_in_1000s = 4;
end;
else
if (P_Cases_in_1000s ge 24.2777777777777) then do;
b_Cases_in_1000s = 5;
end;
else
if (P_Cases_in_1000s ge 18.0760869565217) then do;
b_Cases_in_1000s = 6;
end;
else
if (P_Cases_in_1000s ge 14.2084639498432) then do;
_temp_ = dmran(1234);
b_Cases_in_1000s = floor(7 + 2*_temp_);
end;
else
if (P_Cases_in_1000s ge 12.6414141414141) then do;
b_Cases_in_1000s = 9;
end;
else
if (P_Cases_in_1000s ge 10.9595959595959) then do;
b_Cases_in_1000s = 10;
end;
else
if (P_Cases_in_1000s ge 9.11660079051383) then do;
b_Cases_in_1000s = 11;
end;
else
if (P_Cases_in_1000s ge 5.28472222222222) then do;
b_Cases_in_1000s = 12;
end;
else
if (P_Cases_in_1000s ge 4.34722222222222) then do;
b_Cases_in_1000s = 13;
end;
else
if (P_Cases_in_1000s ge 2.33395522388059) then do;
b_Cases_in_1000s = 14;
end;
else
if (P_Cases_in_1000s ge 0.41791044776119) then do;
b_Cases_in_1000s = 15;
end;
else
if (P_Cases_in_1000s ge 0) then do;
_temp_ = dmran(1234);
b_Cases_in_1000s = floor(17 + 2*_temp_);
end;
else
do;
b_Cases_in_1000s = 20;
end;
*------------------------------------------------------------*;
* TOOL: Score Node;
* TYPE: ASSESS;
* NODE: Score2;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Score2: Creating Fixed Names;
*------------------------------------------------------------*;
LABEL EM_SEGMENT = 'Node';
EM_SEGMENT = _NODE_;
LABEL EM_PREDICTION= "Prediction for Cases_in_1000s";
EM_PREDICTION = P_Cases_in_1000s;
