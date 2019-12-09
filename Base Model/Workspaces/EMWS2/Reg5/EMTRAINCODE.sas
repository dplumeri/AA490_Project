*------------------------------------------------------------*;
* Reg5: Create decision matrix;
*------------------------------------------------------------*;
data WORK.Cases_in_1000s(label="Cases_in_1000s");
  length   Cases_in_1000s                       8
           ;

 Cases_in_1000s=0;
output;
 Cases_in_1000s=416;
output;
 Cases_in_1000s=208;
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
* Reg5: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Age_group(ASC) Disease(ASC) Gender(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg5: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Cases_in_1000s Population_in_thousands
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg5: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg5_DMDB
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
* Reg5: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg5_DMDB
validata = EMWS2.Part_VALIDATE
outest = EMWS2.Reg5_EMESTIMATE
outterms = EMWS2.Reg5_OUTTERMS
outmap= EMWS2.Reg5_MAPDS namelen=200
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
Age_group*Disease
Age_group*Gender
Disease*Gender
/error=normal
coding=DEVIATION
nodesignprint
;
;
code file="C:\Users\student\Desktop\AA 490\Final Project\AA490_Project\Base Model\Workspaces\EMWS2\Reg5\EMPUBLISHSCORE.sas"
group=Reg5
;
code file="C:\Users\student\Desktop\AA 490\Final Project\AA490_Project\Base Model\Workspaces\EMWS2\Reg5\EMFLOWSCORE.sas"
group=Reg5
residual
;
run;
quit;
