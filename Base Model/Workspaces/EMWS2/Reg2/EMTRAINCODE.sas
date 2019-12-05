*------------------------------------------------------------*;
* Reg2: Create decision matrix;
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
set EMWS2.Trans_TRAIN(keep=
Age_group Cases_in_1000s Date Disease Gender OPT_Population_in_thousands);
run;
*------------------------------------------------------------* ;
* Reg2: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Age_group(ASC) Date(ASC) Disease(ASC) Gender(ASC)
   OPT_Population_in_thousands(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg2: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Cases_in_1000s
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg2: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg2_DMDB
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
* Reg2: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg2_DMDB
validata = EMWS2.Trans_VALIDATE
outest = EMWS2.Reg2_EMESTIMATE
outterms = EMWS2.Reg2_OUTTERMS
outmap= EMWS2.Reg2_MAPDS namelen=200
;
class
Age_group
Date
Disease
Gender
OPT_Population_in_thousands
;
model Cases_in_1000s =
Age_group
Date
Disease
Gender
OPT_Population_in_thousands
/error=normal
coding=DEVIATION
nodesignprint
;
;
score data=EMWS2.Trans_TEST
out=_null_
outfit=EMWS2.Reg2_FITTEST
role = TEST
;
code file="C:\Users\student\Desktop\AA 490\Final Project\AA490_Project\Base Model\Workspaces\EMWS2\Reg2\EMPUBLISHSCORE.sas"
group=Reg2
;
code file="C:\Users\student\Desktop\AA 490\Final Project\AA490_Project\Base Model\Workspaces\EMWS2\Reg2\EMFLOWSCORE.sas"
group=Reg2
residual
;
run;
quit;
