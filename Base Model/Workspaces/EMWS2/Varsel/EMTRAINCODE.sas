*------------------------------------------------------------* ;
* EM: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Age_group(ASC) Disease(ASC) Gender(ASC) OPT_Population_in_thousands(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* EM: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Cases_in_1000s
%mend DMDBVar;
*------------------------------------------------------------*;
* EM: Create DMDB;
*------------------------------------------------------------*;
libname _spdslib SPDE "C:\Users\student\AppData\Local\Temp\SAS Temporary Files\_TD1376_830-5CG9310VLM_\Prc2";
proc dmdb batch data=EMWS2.Trans_TRAIN
dmdbcat=WORK.EM_DMDB
maxlevel = 101
out=_spdslib.EM_DMDB
;
class %DMDBClass;
var %DMDBVar;
target
Cases_in_1000s
;
run;
quit;
*------------------------------------------------------------* ;
* Varsel: Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INPUTS;
    AGE_GROUP DISEASE GENDER OPT_POPULATION_IN_THOUSANDS
%mend INPUTS;
proc dmine data=_spdslib.EM_DMDB dmdbcat=WORK.EM_DMDB
minr2=0.005 maxrows=3000 stopr2=0.0005 NOAOV16 NOINTER USEGROUPS OUTGROUP=EMWS2.Varsel_OUTGROUP outest=EMWS2.Varsel_OUTESTDMINE outeffect=EMWS2.Varsel_OUTEFFECT outrsquare =EMWS2.Varsel_OUTRSQUARE
NOMONITOR
PSHORT
;
var %INPUTS;
target Cases_in_1000s;
code file="C:\Users\student\Desktop\AA 490\Final Project\AA490_Project\Base Model\Workspaces\EMWS2\Varsel\EMFLOWSCORE.sas";
code file="C:\Users\student\Desktop\AA 490\Final Project\AA490_Project\Base Model\Workspaces\EMWS2\Varsel\EMPUBLISHSCORE.sas";
run;
quit;
/*      proc print data =EMWS2.Varsel_OUTEFFECT;      proc print data =EMWS2.Varsel_OUTRSQUARE;      */
run;
