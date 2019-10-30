Libname DataSet "C:\Users\student\Desktop\AA Capstone\Project\GitRepository\aa490_project\Data_Sets";
options user = Tmp2;

data PopRecode10to19;
set dataset.census_population;
	if age_group = "10_to_14_years" then 
	age_group = "10 to 19";
	if age_group = "14_to_17_years" then
	age_group = "10 to 19";
	if ge_group = "14_to_17_years" then
	age_group = "10 to 19";
	if age_group = "15_to_19_years" then 
	age_group = "10 to 19";
	output;
	run;

data PopRecode20to24;
set DataSet.PopRecode10to19;
	if age_group = "20_to_24_years" then
	age_group = "20 to 24";
	output; 
	run;

Data PopRecode25to34;
set DataSet.PopRecode20to24;
	if age_group = "25_to_29_years" then
	age_group = "25 to 34";
	if age_group = "30_to_34_years" then
	age_group = "25 to 34";
	output;
	run;

data PopRecode35to44;
set DataSet.PopRecode25to34;
	if age_group = "35_to_39_years" then 
	age_group = "35 to 44";
	if age_group = "40_to_44_years" then
	age_group = "35 to 44";
	output; 
	run; 

data PopRecode45to54;
set DataSet.PopRecode35to44;
	if age_group = "45_to_49_years" then
	age_group = "45 to 54";
	if age_group = "50_to_54_years" then
	age_group = "45 to 54";
	output;
	run;
Data PopRecode55to64;
set dataset.PopRecode45to54;
	if age_group = "55_to_59_years" then
	age_group = "55 to 64";
	if age_group = "60_to_64_years" then
	age_group = "55 to 64";
	output;
	run;
Data PopRecode65plus;
set DataSet.PopRecode55to64;
	if age_group = "65_to_69_years" then
	age_group = "65+";
	if age_group = "70_to_74_years" then
	age_group = "65+";
	if age_group = "75_to_79_years" then
	age_group = "65+";
	if age_group = "80_to_84_years" then
	age_group = "65+";
	if age_group = "85_to_89_years" then
	age_group = "65+";
	if age_group = "90_to_94_years" then
	age_group = "65+";
	if age_group = "95_to_99_years" then
	age_group = "65+";
	if age_group = "Over_99_years" then
	age_group = "65+";
	output;
	run;

	/* Combining into one statement */

data PopRecode;
set dataset.census_population;

	if age_group = "14_to_17_years" then
	age_group = "14 to 19";
	if age_group = "15_to_19_years" then 
	age_group = "14 to 19";

	if age_group = "20_to_24_years" then
	age_group = "20 to 24";

	if age_group = "25_to_29_years" then
	age_group = "25 to 34";
	if age_group = "30_to_34_years" then
	age_group = "25 to 34";

	if age_group = "35_to_39_years" then 
	age_group = "35 to 44";
	if age_group = "40_to_44_years" then
	age_group = "35 to 44";

	if age_group = "45_to_49_years" then
	age_group = "45 to 54";
	if age_group = "50_to_54_years" then
	age_group = "45 to 54";
	
	if age_group = "45_to_49_years" then
	age_group = "45 to 54";
	if age_group = "50_to_54_years" then
	age_group = "45 to 54";

	if age_group = "55_to_59_years" then
	age_group = "55 to 64";
	if age_group = "60_to_64_years" then
	age_group = "55 to 64";

	if age_group = "65_to_69_years" then
	age_group = "65+";
	if age_group = "70_to_74_years" then
	age_group = "65+";
	if age_group = "75_to_79_years" then
	age_group = "65+";
	if age_group = "80_to_84_years" then
	age_group = "65+";
	if age_group = "85_to_89_years" then
	age_group = "65+";
	if age_group = "90_to_94_years" then
	age_group = "65+";
	if age_group = "95_to_99_years" then
	age_group = "65+";
	if age_group = "Over_99_years" then
	age_group = "65+";
	
	output;
	run;

data PopAgeRecode;
set DataSet.PopRecode;
	if age_group in ("Population_all_ages", "16_years_and_over", "18_years_and_over",
					 "65_years_and_over", "85_years_and_over", "5_to_13_years", "00_to_04_years"
					 "05_to_09_years", "15_to_44_years", "18_to_24_years", "10_to_14_years") 
		or missing (age_group) then
		delete;
		run;
data PopAgeRecode_AllGender;
	set PopAgeRecode;
		if Gender = "both sexes" then output;
run;


	



	


		
	
	
