*------------------------------------------------------------*;
* Reg: Create decision matrix;
*------------------------------------------------------------*;
data WORK.Cases_in_1000s(label="Cases_in_1000s");
  length   Cases_in_1000s                       8
           ;

 Cases_in_1000s=0;
output;
 Cases_in_1000s=801;
output;
 Cases_in_1000s=400.5;
output;
;
run;
proc datasets lib=work nolist;
modify Cases_in_1000s(type=PROFIT label=Cases_in_1000s);
run;
quit;
data EM_DMREG / view=EM_DMREG;
set EMWS2.Part_TRAIN(keep=
Age_group Cases_in_1000s Disease Gender Population_in_thousands);
run;
*------------------------------------------------------------* ;
* Reg: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Age_group(ASC) Disease(ASC) Gender(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Cases_in_1000s Population_in_thousands
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
Cases_in_1000s
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
Disease
Gender
;
model Cases_in_1000s =
Age_group
Disease
Gender
Population_in_thousands
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
