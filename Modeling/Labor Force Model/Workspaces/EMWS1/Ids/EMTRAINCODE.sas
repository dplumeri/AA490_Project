*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS1 "C:\Users\student\Desktop\AA490\Project\AA490_Project\Modeling\Labor Force Model\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids: Creating DATA data;
*------------------------------------------------------------*;
data EMWS1.Ids_DATA (label="")
;
set SASUSER.OG_LABOR_JOIN;
drop Date;
drop Gender;
run;
