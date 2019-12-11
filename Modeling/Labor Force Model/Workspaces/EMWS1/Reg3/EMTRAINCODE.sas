*------------------------------------------------------------*;
* Reg3: Create decision matrix;
*------------------------------------------------------------*;
data WORK.Sum_Labor_Force_Pop(label="Sum_Labor_Force_Pop");
  length   Sum_Labor_Force_Pop                  8
           ;

  label    Sum_Labor_Force_Pop="Industry_Population"
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
Age_group Industry Population Sum_Labor_Force_Pop);
run;
*------------------------------------------------------------* ;
* Reg3: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Age_group(ASC) Industry(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg3: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Population Sum_Labor_Force_Pop
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg3: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg3_DMDB
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
* Reg3: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg3_DMDB
validata = EMWS1.Trans_VALIDATE
outest = EMWS1.Reg3_EMESTIMATE
outterms = EMWS1.Reg3_OUTTERMS
outmap= EMWS1.Reg3_MAPDS namelen=200
;
class
Age_group
Industry
;
model Sum_Labor_Force_Pop =
Age_group
Industry
Population
/error=normal
coding=DEVIATION
nodesignprint
selection=FORWARD choose=NONE
Hierarchy=CLASS
Rule=NONE
;
;
code file="C:\Users\student\Desktop\AA490\Project\AA490_Project\Modeling\Labor Force Model\Workspaces\EMWS1\Reg3\EMPUBLISHSCORE.sas"
group=Reg3
;
code file="C:\Users\student\Desktop\AA490\Project\AA490_Project\Modeling\Labor Force Model\Workspaces\EMWS1\Reg3\EMFLOWSCORE.sas"
group=Reg3
residual
;
run;
quit;
