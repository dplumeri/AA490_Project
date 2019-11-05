Libname DataSet "C:\Users\student\Desktop\AA Capstone\Project\GitRepository\aa490_project\Data_Sets\labor_force_pop";
options user = dataset;

	/* Combining into one statement */

data PopRecode;
set dataset.census_population;

	if age_group = "14_to_17_years" then 
	age_group = "14 to 24";

	if age_group = "18_to_24_years" then 
	age_group = "14 to 24";

	if age_group = "25_to_44_years" then
	age_group = "25 to 44";

	if age_group = "45_to_49_years" then
	age_group = "45 to 64";
	if age_group = "50_to_54_years" then
	age_group = "45 to 64";
	if age_group = "55_to_59_years" then 
	age_group = "45 to 64";
	if age_group = "60_to_64_years" then
	age_group = "45 to 64";
	
	if age_group = "65_years_and_over" then
	age_group = "65+";

	output; 
	run;
	

data LaborForceHistoricRecode;
set DataSet.PopRecode;
	if age_group in ("Population_all_ages", "16_years_and_over", "18_years_and_over",	
					 "85_years_and_over", "5_to_13_years", "00_to_04_years",
					 "05_to_09_years", "15_to_44_years", "10_to_14_years", "15_to_19_years", 
					 "20_to_24_years", "25_to_29_years", "30_to_34_years", "35_to_39_years", 
					 "40_to_44_years", "65_to_69_years", "70_to_74_years", "75_to_79_years", 
					 "80_to_84_years", "85_to_89_years", "90_to_94_years", "95_to_99_years", 
				     "Over_99_years") 
		or missing (age_group) then
		delete;
		run;
data PopAgeRecode_AllGender;
	set dataset.PopAgeRecode;
		if Gender = "both sexes" then output;
run;


data LaborForceProjectedRecode;
set DataSet.Projected_Population;
	if age_group = "14 to 17 years" then
	age_group = "14 to 24";
	if age_group = "18 to 24 years" then
	age_group = "14 to 24";
	if age_group = "65 years and over" then
	age_group = "65+";
	if age_group in ("population all ages", "00 to 04 years", "05 to 13 years", "15 to 44 years", "16 years and over",
					 "18 to 64 years", "18 years and over", "85 years and over", "Over 99 years", "Under 18 years") then 
					 delete; 
					 run;
	
	


		
	
	
