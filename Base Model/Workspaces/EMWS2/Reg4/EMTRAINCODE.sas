*------------------------------------------------------------*;
* Reg4: Create decision matrix;
*------------------------------------------------------------*;
data WORK.Cases_in_1000s(label="Cases_in_1000s");
  length   Cases_in_1000s                       8
           ;

 Cases_in_1000s=0;
output;
 Cases_in_1000s=229;
output;
 Cases_in_1000s=114.5;
output;
;
run;
proc datasets lib=work nolist;
modify Cases_in_1000s(type=PROFIT label=Cases_in_1000s);
run;
quit;
data EM_DMREG / view=EM_DMREG;
set EMWS2.Part_TRAIN(keep=
Age_group Cases_in_1000s Date Disease Gender);
run;
*------------------------------------------------------------* ;
* Reg4: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Age_group(ASC) Date(ASC) Disease(ASC) Gender(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg4: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Cases_in_1000s
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
Cases_in_1000s
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
Disease
Gender
;
model Cases_in_1000s =
Age_group
Date
Disease
Gender
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
