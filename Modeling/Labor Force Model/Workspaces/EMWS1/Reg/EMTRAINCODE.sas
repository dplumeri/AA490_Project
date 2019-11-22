*------------------------------------------------------------*;
* Reg: Create decision matrix;
*------------------------------------------------------------*;
data WORK.Sum_Labor_Force_Pop(label="Sum_Labor_Force_Pop");
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
set EMWS1.Trans_TRAIN(keep=
Age_group Date OPT_Population_in_thousands Sum_Labor_Force_Pop);
run;
*------------------------------------------------------------* ;
* Reg: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Age_group(ASC) Date(ASC) OPT_Population_in_thousands(ASC)
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
validata = EMWS1.Trans_VALIDATE
outest = EMWS1.Reg_EMESTIMATE
outterms = EMWS1.Reg_OUTTERMS
outmap= EMWS1.Reg_MAPDS namelen=200
;
class
Age_group
Date
OPT_Population_in_thousands
;
model Sum_Labor_Force_Pop =
Age_group
Date
OPT_Population_in_thousands
/error=normal
coding=DEVIATION
nodesignprint
selection=STEPWISE choose=NONE
Hierarchy=CLASS
Rule=NONE
;
;
code file="C:\Users\student\Desktop\AA490\Project\AA490_Project\Modeling\Labor Force Model\Workspaces\EMWS1\Reg\EMPUBLISHSCORE.sas"
group=Reg
;
code file="C:\Users\student\Desktop\AA490\Project\AA490_Project\Modeling\Labor Force Model\Workspaces\EMWS1\Reg\EMFLOWSCORE.sas"
group=Reg
residual
;
run;
quit;
