*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS2 "C:\Users\student\Desktop\AA490\Project\AA490_Project\Modeling\Labor Force\Workspaces\EMWS2";
*------------------------------------------------------------*;
* Ids3: Creating DATA data;
*------------------------------------------------------------*;
data EMWS2.Ids3_DATA (label="")
/ view=EMWS2.Ids3_DATA
;
set SASUSER.DISEASE_CASES_GROUPED;
run;
