*------------------------------------------------------------*;
* Reg2: Create decision matrix;
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
set EMWS2.Trans_TRAIN(keep=
Age_group Date Population_in_thousands Sum_Labor_Force_Pop);
run;
*------------------------------------------------------------* ;
* Reg2: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Age_group(ASC) Date(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg2: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Population_in_thousands Sum_Labor_Force_Pop
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
Sum_Labor_Force_Pop
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
;
model Sum_Labor_Force_Pop =
Age_group
Date
Population_in_thousands
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
