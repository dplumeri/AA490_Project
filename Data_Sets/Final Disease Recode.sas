Libname DataSet "C:\Users\student\Desktop\AA 490\Final Project\AA490_Project\Data_Sets\Original_Data_Sets";

options user = DataSet;

data PopRecodeFINAL;
	set dataset.Census_population;
	if age_group = "00_to_04_years" then age_group = "0-17";
	if age_group = "05_to_09_years" then age_group = "0-17";
	if age_group = "10_to_14_years" then age_group = "0-17";
	if age_group = "14_to_17_years" then age_group = "0-17";

	if age_group = "18_to_24_years" then age_group = "18-24";

	if age_group = "25_to_44_years_" then age_group = "25-44";

	if age_group = "45_to_49_years" then age_group = "45-54";
	if age_group = "50_to_54_years" then age_group = "45-54";

	if age_group= "55_to_59_years" then age_group = "55-64";
	if age_group = "60_to_64_years" then age_group = "55-64";

	if age_group = "55_to_59_years" then age_group = "55-64";
	if age_group = "60_to_64_years" then age_group = "55-64";

	if age_group = "65_to_69_years" then age_group = "65-74";
	if age_group = "70_to_74_years" then age_group = "65-74";

	if age_group = "75_to_79_years" then age_group = "75-84";
	if age_group = "80_to_84_years" then age_group = "75-84";

	if age_group = "85_to_89_years" then age_group = "85+";
	if age_group = "90_to_94_years" then age_group = "85+";
	if age_group = "95_to_99_years" then age_group = "85+";
	if age_group = "Over_99_years" then age_group = "85+";
	output;
	run;

	data PopRecFINAL;
	set DataSet.PopRecodeFINAL;
	if age_group in ("Population_all_ages", "16_years_and_over", "18_years_and_over",
					 "65_years_and_over", "85_years_and_over", "5_to_13_years", "15_to_19_years"
					 "15_to_44_years", "20_to_24_years", "25_to_29_years", "30_to_34_years", "35_to_39_years", "40_to_44_years") 
		or missing (age_group) then
		delete;
		run;


data ProjPropRecodeFINAL;
	set dataset.projected_population;
	if age_group = "00 to 04 years" then age_group = "0-17";
	if age_group = "05 to 13 years" then age_group = "0-17";
	if age_group = "14 to 17 years" then age_group = "0-17";

	if age_group = "18 to 24 years" then age_group = "18-24";

	if age_group = "25 to 44 years" then age_group = "25-44";

	if age_group = "45 to 64 years" then age_group = "45-64";

	if age_group = "85 years and over" then age_group = "85+";
	output;
	run;

	data PPopFINAL;
	set DataSet.ProjPropRecodeFINAL;
	if age_group in ("15 to 44 years", "18 to 64 years", "population all ages", "65 years and over", "85 years and over", "Under 18 years", "16 years and over", "18 years and over", "Over 99 years") 
		or missing (age_group) then
		delete;
		run;
