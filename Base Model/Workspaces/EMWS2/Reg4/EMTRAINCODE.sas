*------------------------------------------------------------*;
* Reg4: Create decision matrix;
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
* Reg4: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Age_group(ASC) Date(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg4: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Sum_Labor_Force_Pop
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg4: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg4_DMDB
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
* Reg4: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg4_DMDB
validata = EMWS2.Part_VALIDATE
outest = EMWS2.Reg4_EMESTIMATE
outterms = EMWS2.Reg4_OUTTERMS
outmap= EMWS2.Reg4_MAPDS namelen=200
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
nodesignprint
selection=BACKWARD choose=NONE
Hierarchy=CLASS
Rule=NONE
;
;
score data=EMWS2.Part_TEST
out=_null_
outfit=EMWS2.Reg4_FITTEST
role = TEST
;
code file="C:\Users\student\Desktop\AA 490\Final Project\AA490_Project\Base Model\Workspaces\EMWS2\Reg4\EMPUBLISHSCORE.sas"
group=Reg4
;
code file="C:\Users\student\Desktop\AA 490\Final Project\AA490_Project\Base Model\Workspaces\EMWS2\Reg4\EMFLOWSCORE.sas"
group=Reg4
residual
;
run;
quit;
