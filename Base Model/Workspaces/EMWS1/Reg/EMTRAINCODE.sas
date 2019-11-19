*------------------------------------------------------------*;
* Reg: Create decision matrix;
*------------------------------------------------------------*;
data WORK.Age_group;
  length   Age_group                        $  32
           COUNT                                8
           DATAPRIOR                            8
           TRAINPRIOR                           8
           DECPRIOR                             8
           DECISION1                            8
           DECISION2                            8
           DECISION3                            8
           DECISION4                            8
           DECISION5                            8
           ;

  label    COUNT="Level Counts"
           DATAPRIOR="Data Proportions"
           TRAINPRIOR="Training Proportions"
           DECPRIOR="Decision Priors"
           DECISION1="85+"
           DECISION2="65-84"
           DECISION3="25-44"
           DECISION4="18-24"
           DECISION5="0-17"
           ;
  format   COUNT 10.
           ;
Age_group="85+"; COUNT=315; DATAPRIOR=0.2; TRAINPRIOR=0.2; DECPRIOR=.; DECISION1=1; DECISION2=0; DECISION3=0; DECISION4=0; DECISION5=0;
output;
Age_group="65-84"; COUNT=315; DATAPRIOR=0.2; TRAINPRIOR=0.2; DECPRIOR=.; DECISION1=0; DECISION2=1; DECISION3=0; DECISION4=0; DECISION5=0;
output;
Age_group="25-44"; COUNT=315; DATAPRIOR=0.2; TRAINPRIOR=0.2; DECPRIOR=.; DECISION1=0; DECISION2=0; DECISION3=1; DECISION4=0; DECISION5=0;
output;
Age_group="18-24"; COUNT=315; DATAPRIOR=0.2; TRAINPRIOR=0.2; DECPRIOR=.; DECISION1=0; DECISION2=0; DECISION3=0; DECISION4=1; DECISION5=0;
output;
Age_group="0-17"; COUNT=315; DATAPRIOR=0.2; TRAINPRIOR=0.2; DECPRIOR=.; DECISION1=0; DECISION2=0; DECISION3=0; DECISION4=0; DECISION5=1;
output;
;
run;
proc datasets lib=work nolist;
modify Age_group(type=PROFIT label=Age_group);
label DECISION1= '85+';
label DECISION2= '65-84';
label DECISION3= '25-44';
label DECISION4= '18-24';
label DECISION5= '0-17';
run;
quit;
data EM_DMREG / view=EM_DMREG;
set EMWS1.Part3_TRAIN(keep=
Age_group OG_Cases_in_Thousands Projected_Sum_Pop );
run;
*------------------------------------------------------------* ;
* Reg: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Age_group(DESC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    OG_Cases_in_Thousands Projected_Sum_Pop
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
Age_group
;
run;
quit;
*------------------------------------------------------------*;
* Reg: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg_DMDB
validata = EMWS1.Part3_VALIDATE
outest = EMWS1.Reg_EMESTIMATE
outterms = EMWS1.Reg_OUTTERMS
Simple
outmap= EMWS1.Reg_MAPDS namelen=200
;
class
Age_group
;
model Age_group =
OG_Cases_in_Thousands
Projected_Sum_Pop
/level=nominal
coding=DEVIATION
CorrB
nodesignprint
selection=STEPWISE choose=NONE
Hierarchy=CLASS
Rule=NONE
;
;
code file="C:\Users\student\Desktop\AA 490\Final Project\AA490_Project\Base Model\Workspaces\EMWS1\Reg\EMPUBLISHSCORE.sas"
group=Reg
;
code file="C:\Users\student\Desktop\AA 490\Final Project\AA490_Project\Base Model\Workspaces\EMWS1\Reg\EMFLOWSCORE.sas"
group=Reg
residual
;
run;
quit;
