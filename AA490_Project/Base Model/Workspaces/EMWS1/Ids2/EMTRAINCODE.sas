*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS1 "C:\Users\student\Desktop\AA 490\Final Project\AA490_Project\Base Model\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids2: Creating DATA data;
*------------------------------------------------------------*;
data EMWS1.Ids2_DATA (label="")
/ view=EMWS1.Ids2_DATA
;
set LABOR.OG_LABOR_AND_HISTORIC;
run;
