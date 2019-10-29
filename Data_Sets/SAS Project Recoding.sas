data HistoricRecoding;
	set Census;
	if size = "00_to_04_years" then
		size = "0-17";
	if size = "05_to_09_years" then 
		size = "0-17";
	if size = "10_to_14_years" then
		size = "0-17";
	if size = "14_to_17_years," then 
		size = "0-17";
----------------------------------------
	if size = "18_to_24_years" then
		size = "18-24";
	if size = "20_to_24_years" then 
		size = "18-24";
----------------------------------------
	if size = "25_to_29_years" then
		size = "25-44";
	if size = "25_to_44_years_" then 
		size = "25-44";
	if size = "30_to_34_years" then
		size = "25-44";
	if size = "35_to_39_years" then 
		size = "25-44";
	if size = "40_to_44_years" then 
		size = "25-44";
----------------------------------------
	if size = "45_to_49_years" then
		size = "45-54";
	if size = "50_to_54_years" then 
		size = "45-54";
----------------------------------------
	if size = "55_to_59_years" then
		size = "55-64";
	if size = "60_to_64_years" then 
		size = "55-64";
----------------------------------------
	if size = "55_to_59_years" then
		size = "55-64";
	if size = "60_to_64_years" then 
		size = "55-64";
----------------------------------------
	if size = "55_to_59_years" then
		size = "55-64";
	if size = "60_to_64_years" then 
		size = "55-64";
----------------------------------------
	if size = "65_to_69_years" then
		size = "65-74";
	if size = "70_to_74_years" then 
		size = "65-74";
----------------------------------------
	if size = "75_to_79_years" then
		size = "75-84";
	if size = "80_to_84_years" then
		size = "75-84";
----------------------------------------
	if size = "85_to_89_years" then
		size = "85+";
	if size = "90_to_94_years" then
		size = "85+";
	if size = "95_to_99_years" then
		size = "85+";

data ProjectedRecoding;
	set Population;
	if size = "00	to	04	years" then
		size = "0-17";
	if size = "05	to	13	years" then 
		size = "0-17";
	if size = "	17	to	17	years" then
		size = "0-17";
----------------------------------------
	if size = "18	to	24	years" then
		size = "18-24";
----------------------------------------
	if size = "25	to	44	years" then
		size = "25-44";
----------------------------------------
	if size = "85	years	and	over" then
		size = "85+";
