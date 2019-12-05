*;
/*----G_Disease begin----*/
length _NORM32 $ 32;
%DMNORMCP( Disease , _NORM32 )
drop _NORM32;
select(_NORM32);
when('ASTHMA' ) G_Disease = 2;
when('CANCER, ALL' ) G_Disease = 1;
when('DEMENTIA AND ALZHEIMER''S DISEASE' ) G_Disease = 0;
when('OSTEOARTHRITIS' ) G_Disease = 0;
when('SEPTICEMIA' ) G_Disease = 1;
otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_Disease="Grouped Levels for  Disease";
/*----Disease end----*/
