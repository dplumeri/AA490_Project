*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS2 "C:\Users\student\Desktop\AA 490\Final Project\AA490_Project\Base Model\Workspaces\EMWS2";
*------------------------------------------------------------*;
* Ids: Creating DATA data;
*------------------------------------------------------------*;
data EMWS2.Ids_DATA (label="")
/ view=EMWS2.Ids_DATA
;
set DATASET.OG_LABOR_JOIN;
run;