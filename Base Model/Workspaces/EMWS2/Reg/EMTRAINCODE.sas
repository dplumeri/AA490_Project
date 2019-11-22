*------------------------------------------------------------*;
* Reg: Create decision matrix;
*------------------------------------------------------------*;
data WORK.Sum_Labor_Force_Pop;
  length   Sum_Labor_Force_Pop                  8
           ;

 Sum_Labor_Force_Pop=225000;
output;
 Sum_Labor_Force_Pop=25077000;
output;
 Sum_Labor_Force_Pop=12651000;
output;
;
run;
proc datasets lib=work nolist;
modify Sum_Labor_Force_Pop(type=PROFIT label=Sum_Labor_Force_Pop);
run;
quit;
data EM_DMREG / view=EM_DMREG;
set EMWS2.Part_TRAIN(keep=
Age_group Date Sum_Labor_Force_Pop);
run;
*------------------------------------------------------------* ;
* Reg: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Age_group(ASC) Date(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Sum_Labor_Force_Pop
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
Sum_Labor_Force_Pop
;
run;
quit;
*------------------------------------------------------------*;
* Reg: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg_DMDB
validata = EMWS2.Part_VALIDATE
outest = EMWS2.Reg_EMESTIMATE
outterms = EMWS2.Reg_OUTTERMS
Simple
outmap= EMWS2.Reg_MAPDS namelen=200
;
class
Age_group
Date
;
model Sum_Labor_Force_Pop =
Age_group
Date
/error=normal
coding=DEVIATION
CorrB
nodesignprint
selection=STEPWISE choose=NONE
Hierarchy=CLASS
Rule=NONE
;
;
score data=EMWS2.Part_TEST
out=_null_
outfit=EMWS2.Reg_FITTEST
role = TEST
;
code file="C:\Users\student\Desktop\AA 490\Final Project\AA490_Project\Base Model\Workspaces\EMWS2\Reg\EMPUBLISHSCORE.sas"
group=Reg
;
code file="C:\Users\student\Desktop\AA 490\Final Project\AA490_Project\Base Model\Workspaces\EMWS2\Reg\EMFLOWSCORE.sas"
group=Reg
residual
;
run;
quit;
