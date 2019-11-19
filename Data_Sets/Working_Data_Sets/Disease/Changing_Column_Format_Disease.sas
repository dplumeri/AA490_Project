options user = Disease;
data disease_case_final;
set diseasecasesfixed;
Year_char = put(Year, $4.);
drop Year;
run;
