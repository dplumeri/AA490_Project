*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS2 "C:\Users\student\Desktop\AA490\Project\AA490_Project\Modeling\Labor Force Model\Workspaces\EMWS2";
*------------------------------------------------------------*;
* Ids2: Creating DATA data;
*------------------------------------------------------------*;
data EMWS2.Ids2_DATA (label="")
/ view=EMWS2.Ids2_DATA
;
set SASUSER.DISEASE_HISTORIC_JOIN_1;
run;
