/*This code was extracted from a SAS Guide Import Function*/
options user = SS_Dat;
DATA SocialSecurity_data_STEP1;
    LENGTH
        Year               7
        Employee_SS_Rate   8
        Employer_SS_Rate   8
        Total_SSTax_Per_Income   8 ;
    FORMAT
        Year            7.
        Employee_SS_Rate BEST12.
        Employer_SS_Rate BEST12.
        Total_SSTax_Per_Income BEST12. ;
    INFORMAT
        Year            7.
        Employee_SS_Rate BEST12.
        Employer_SS_Rate BEST12.
        Total_SSTax_Per_Income BEST12. ;
    INFILE DATALINES4
        DLM='7F'x
        MISSOVER
        DSD ;
    INPUT
        Year             : 7.
        Employee_SS_Rate : BEST32.
        Employer_SS_Rate : BEST32.
        Total_SSTax_Per_Income : BEST32. ;
DATALINES4;
1937-49112
19501.51.53
1951-531.51.53
1954-56224
1957-582.252.254.5
19592.52.55
1960-61336
19623.1253.1256.25
1963-653.6253.6257.25
19663.853.857.7
19673.93.97.8
19683.83.87.6
19694.24.28.4
19704.24.28.4
1971-724.64.69.2
19734.854.859.7
1974-774.954.959.9
19785.055.0510.1
19795.085.0810.16
19805.085.0810.16
19815.355.3510.7
19825.45.410.8
19835.45.410.8
1984-875.75.711.4
1988-896.066.0612.12
1990-936.26.212.4
1994-966.26.212.4
1997-996.26.212.4
2000-156.26.212.4
;;;;

data socialsecurity_data_STEP2;
set socialsecurity_data_STEP1;
if Year = 1950 then do 
	Year = 1937 to 1949;
	Employee_SS_Rate = 1;
	Employer_SS_Rate = 1;
	Total_SSTax_Per_Income = 2;
output;
end;
if Year > 1950 then do 
	Year = 1951 to 1953;
	Employee_SS_Rate = 1.5;
	Employer_SS_Rate = 1.5;
	Total_SSTax_Per_Income = 3;
output;
end;
if Year >1953 then do
	Year = 1954 to 1956;
	Employee_SS_Rate = 2;
	Employer_SS_Rate = 2;
	Total_SSTax_Per_Income = 4;
output;
end;
if Year >1956 then do
	Year = 1957 to 1958;
	Employee_SS_Rate = 2.25;
	Employer_SS_Rate = 2.25;
	Total_SSTax_Per_Income = 4.5;
output;
end;
if Year >1958 then do 
	Year = 1960 to 1961;
	Employee_SS_Rate = 3;
	Employer_SS_Rate = 3;
	Total_SSTax_Per_Income = 6;
output;
end;
if Year > 1961 then do
	Year = 1963 to 1965;
	Employee_SS_Rate = 3.625;
	Employer_SS_Rate = 3.625;
	Total_SSTax_Per_Income = 7.25;
output;
end;
if Year > 1965 then do
	Year = 1971 to 1972;
	Employee_SS_Rate = 4.6;
	Employer_SS_Rate = 4.6;
	Total_SSTax_Per_Income = 9.2;
output;
end;
if Year > 1972 then do
	Year = 1974 to 1977;
	Employee_SS_Rate = 4.95;
	Employer_SS_Rate = 4.95;
	Total_SSTax_Per_Income = 9.9;
output;
end;
if Year > 1977 then do
	Year = 1984 to 1987;
	Employee_SS_Rate = 5.7;
	Employer_SS_Rate = 5.7;
	Total_SSTax_Per_Income = 11.4;
output;
end;
if Year > 1987 then do
	Year = 1988 to 1989;
	Employee_SS_Rate = 6.06;
	Employer_SS_Rate = 6.06;
	Total_SSTax_Per_Income = 12.12;
output;
end;
if Year > 1989 then do
	Year = 1990 to 2015;
	Employee_SS_Rate = 6.2;
	Employer_SS_Rate = 6.2;
	Total_SSTax_Per_Income = 12.4;
output;
end;
run;
proc sort data = socialsecurity_data_STEP2 nodup out = socialsecurity_data_STEP3;
	by Year;
run;
proc append base = Socialsecurity_data_Step1 data = socialsecurity_data_step3;
run;
data Socialsecurity_data_step4;
set Socialsecurity_data_step1;
if missing(Year)then delete;
run;
proc sql;
create table socialsecurity_data_final as 
select * from socialsecurity_data_step4 
order by Year;
