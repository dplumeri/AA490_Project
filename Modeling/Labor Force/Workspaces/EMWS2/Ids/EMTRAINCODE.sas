*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS2 "C:\Users\student\Desktop\AA490\Project\AA490_Project\Modeling\Labor Force\Workspaces\EMWS2";
*------------------------------------------------------------*;
* Ids: Creating DATA data;
*------------------------------------------------------------*;
data EMWS2.Ids_DATA (label="")
/ view=EMWS2.Ids_DATA
;
set SASUSER.LABOR_HISTORIC_FINAL_VARC;
run;
