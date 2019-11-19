*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS1 "C:\Users\student\Desktop\AA 490\Final Project\AA490_Project\Base Model\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids: Creating DATA data;
*------------------------------------------------------------*;
data EMWS1.Ids_DATA (label="")
/ view=EMWS1.Ids_DATA
;
set DISEASE.OG_DISEASE_AND_PROJECTED;
run;
