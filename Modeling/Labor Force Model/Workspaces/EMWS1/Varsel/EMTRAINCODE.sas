*------------------------------------------------------------* ;
* EM: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Age_group(ASC) Date(ASC) OPT_Population_in_thousands(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* EM: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Sum_Labor_Force_Pop
%mend DMDBVar;
*------------------------------------------------------------*;
* EM: Create DMDB;
*------------------------------------------------------------*;
libname _spdslib SPDE "C:\Users\student\AppData\Local\Temp\SAS Temporary Files\_TD12928_WINDOWS-MLD7D7P_\Prc2";
proc dmdb batch data=EMWS1.Trans_TRAIN
dmdbcat=WORK.EM_DMDB
maxlevel = 101
out=_spdslib.EM_DMDB
;
class %DMDBClass;
var %DMDBVar;
target
Sum_Labor_Force_Pop
;
run;
quit;
*------------------------------------------------------------* ;
* Varsel: Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INPUTS;
    AGE_GROUP DATE OPT_POPULATION_IN_THOUSANDS
%mend INPUTS;
proc dmine data=_spdslib.EM_DMDB dmdbcat=WORK.EM_DMDB
minr2=0.005 maxrows=3000 stopr2=0.0005 NOAOV16 NOINTER USEGROUPS OUTGROUP=EMWS1.Varsel_OUTGROUP outest=EMWS1.Varsel_OUTESTDMINE outeffect=EMWS1.Varsel_OUTEFFECT outrsquare =EMWS1.Varsel_OUTRSQUARE
NOMONITOR
PSHORT
;
var %INPUTS;
target Sum_Labor_Force_Pop;
code file="C:\Users\student\Desktop\AA490\Project\AA490_Project\Modeling\Labor Force Model\Workspaces\EMWS1\Varsel\EMFLOWSCORE.sas";
code file="C:\Users\student\Desktop\AA490\Project\AA490_Project\Modeling\Labor Force Model\Workspaces\EMWS1\Varsel\EMPUBLISHSCORE.sas";
run;
quit;
/*      proc print data =EMWS1.Varsel_OUTEFFECT;      proc print data =EMWS1.Varsel_OUTRSQUARE;      */
run;
