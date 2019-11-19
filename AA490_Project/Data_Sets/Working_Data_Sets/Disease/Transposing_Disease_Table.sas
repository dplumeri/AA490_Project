/* The following code assumes you have minimally fixed the labels in a file

called DiseaseLabelsFixed. In this case, we want to transform the table so

that Gender becomes a column header for the Cases_in_1000s values. To do

this,we need to sort by the other three columns: Year, Age, and Disease.

This will leave the Gender column with sets of All, Female, Male repeating

rows before we apply the transformation. */

proc sort data=disease_cases_grouped out=diseaseCasesSorted;

by Year Age Disease;

run;

/* This code will transform the Gender column into three separate columns: All,

Female, Male (the same order the rows appeared in in the sorted table from

above) and leave the Year, Age, and Disease as columns (see the result). */

proc transpose data = diseaseCasesSorted /* result of sort above */

out = diseaseSortedTP /* resulting trnasformed table */

(rename = (col1=All col2=Female col3=Male) DROP=_NAME_);

by Year Age Disease;

run;

data diseaseSortedTPFixed;

set diseaseSortedTP;

/* YOUR CODE GOES HERE to fix missing All, Female, Male counts where possible */
if missing(All) then All = Female + Male;
if missing(Male) then Male = All - Female;
if missing(Female) then Female = All - Male;
if missing(All) and missing(Female) and missing(Male) then All = 0 and Female = 0 and Male = 0;
if All = 0 and missing(Female) and missing(Male) then Female = 0 and Male = 0;
if All = 0 and Female = 0 and missing(Male) then Male = 0;
if not missing(Male) and missing(Female) and missing(All) then Female = 0 and All = 0;
if not missing(Male) and Female = 0 and missing(All) then All = 0;
/*just took even All values and divided by 2, may not be the best way to find these values
if missing(Male) and missing(Female) and not missing(All) and mod(All,2) = 0 then Male = All/2 and Female = All/2;
if not missing(Male) and not missing(All) and missing(Female) and mod(All,2) = 0 then Female = All/2;*/

run;
data _null_;
	set diseaseSortedTPFixed;
	file print;
	if missing(All) then put _N_ " is missing ALL";
run;
proc freq data = diseaseSortedTPFixed;
	tables All Female Male /nocum nopercent;
	run;

run;

/* Once we have corrected the missing values above, we have to restore the table

to it's original format with another transpose statement. */

proc transpose data = diseaseSortedTPFixed /* File with corrected missing values */

out = diseaseCasesFixed /* Name of table after transpose */

(rename = (col1=Cases_in_1000s _NAME_=Gender));

var Male Female All; /* which columns are converted back to multiple rows */

by Year Age Disease; /* Same "by statement" as first transpose */

/* Need the following to avoid label NAME OF FORMER VARIABLE for Gender, try

taking it out, you'll see what I mean! */

label Gender="Gender";

run;
