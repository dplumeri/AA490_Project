/*Establish the Lib - CHANGE TO WHEREVER YOUR LIB IS STORED*/
libname SSTaxLim "C:\Users\student\OneDrive - Bryant University\College\Senior\Semester I\AA490\Final Project\Git_Repository\AA490_Project\FP_Libs\SSTaxLimit";
/*So you don't have to say lib.table*/
options user = SSTaxLim;
data SSTaxLimit;
	infile "C:\Users\student\OneDrive - Bryant University\College\Senior\Semester I\AA490\Final Project\Git_Repository\AA490_Project\SS_Tax_Limit_Data.prn"
	truncover 
	firstobs = 2;
	input 	@1 Year $7.
			@36 Employee_SS_Rate 3.1
			@36 CHAR_Employee_SS_Rate $3.
			@56 Employer_SS_Rate 5.3
			@56 CHAR_Employer_SS_Rate $5.
			@75 Total_SSTax_Per_Income 5.2
			@75 CHAR_Total_SSTax_Per_Income $5.
	;
run;
data FixedValues;
set SSTaxLimit;
	if Employee_SS_Rate ^= CHAR_Employee_SS_Rate then 
		Employee_SS_Rate = CHAR_Employee_SS_Rate;
	if Employer_SS_Rate ^= CHAR_Employer_SS_Rate then
		Employer_SS_Rate = CHAR_Employer_SS_Rate;
	if Total_SSTax_Per_Income ^= CHAR_Total_SSTax_Per_Income then
		Total_SSTax_Per_Income = CHAR_Total_SSTax_Per_Income;
run;
data FinalDataset;
set FixedValues (keep = Year Employee_SS_Rate Employer_SS_Rate Total_SSTax_Per_Income);
format 	Employee_SS_Rate 3.1
		Employer_SS_Rate 5.3
		Total_SSTax_Per_Income 5.2
	;
run;
