*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS2 "C:\Users\student\Desktop\AA 490\Final Project\AA490_Project\Base Model\Workspaces\EMWS2";
*------------------------------------------------------------*;
* Ids2: Creating DATA data;
*------------------------------------------------------------*;
data EMWS2.Ids2_DATA (label="")
/ view=EMWS2.Ids2_DATA
;
set NEWDIS.DISEASE_HISTORIC_JOIN;
run;
