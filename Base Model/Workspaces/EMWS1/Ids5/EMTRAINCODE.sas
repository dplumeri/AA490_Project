*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS1 "C:\Users\student\Desktop\AA 490\Final Project\AA490_Project\Base Model\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids5: Creating DATA data;
*------------------------------------------------------------*;
data EMWS1.Ids5_DATA (label="")
/ view=EMWS1.Ids5_DATA
;
set LABOR.LABOR_FORCE_FINAL;
run;
