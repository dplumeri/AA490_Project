/*Establish the Lib - CHANGE TO WHEREVER YOUR LIB IS STORED*/
libname WageLim "C:\Users\student\OneDrive - Bryant University\College\Senior\Semester I\AA490\Final Project\Git_Repository\AA490_Project\FP_Libs\SSTaxLimit";
/*So you don't have to say lib.table*/
options user = WageLim;
data WageLimit;
infile "C:\Users\student\OneDrive - Bryant University\College\Senior\Semester I\AA490\Final Project\Git_Repository\AA490_Project\Wage_Limits_Data.prn"
	truncover
	firstobs = 2
;
input 	@15 Year $4.
		@31 SS_Wage_Limit 6.

;
run;
