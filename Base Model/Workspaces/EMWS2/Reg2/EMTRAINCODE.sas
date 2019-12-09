*------------------------------------------------------------*;
* Reg2: Create decision matrix;
*------------------------------------------------------------*;
data WORK.LG10_Cases_in_1000s(label="LG10_Cases_in_1000s");
  length   LG10_Cases_in_1000s                  8
           ;

  label    LG10_Cases_in_1000s="Transformed Cases_in_1000s"
           ;
 LG10_Cases_in_1000s=0;
output;
 LG10_Cases_in_1000s=2.62013605497375;
output;
 LG10_Cases_in_1000s=1.17971457004206;
output;
;
run;
proc datasets lib=work nolist;
modify LG10_Cases_in_1000s(type=PROFIT label=LG10_Cases_in_1000s);
run;
quit;
data EM_DMREG / view=EM_DMREG;
set EMWS2.Trans_TRAIN(keep=
Age_group Disease Gender LG10_Cases_in_1000s LG10_Population_in_thousands);
run;
*------------------------------------------------------------* ;
* Reg2: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Age_group(ASC) Disease(ASC) Gender(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg2: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    LG10_Cases_in_1000s LG10_Population_in_thousands
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
LG10_Cases_in_1000s
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
Disease
Gender
;
model LG10_Cases_in_1000s =
Age_group
Disease
Gender
LG10_Population_in_thousands
/error=normal
coding=DEVIATION
nodesignprint
;
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
