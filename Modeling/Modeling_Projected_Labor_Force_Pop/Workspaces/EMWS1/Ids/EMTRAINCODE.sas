*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS1 "C:\Users\student\Desktop\AA Capstone\Project\GitRepository\aa490_project\Modeling\Modeling_Projected_Labor_Force_Pop\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids: Creating DATA data;
*------------------------------------------------------------*;
data EMWS1.Ids_DATA (label="")
/ view=EMWS1.Ids_DATA
;
set MODLF.OG_LABOR_JOIN;
run;
