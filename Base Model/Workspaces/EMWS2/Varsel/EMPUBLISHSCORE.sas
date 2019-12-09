******************************************;
*** Begin Scoring Code from PROC DMINE ***;
******************************************;

length _WARN_ $ 4;
label _WARN_ = "Warnings";


/*----G_Age_group begin----*/
length _NORM19 $ 19;
%DMNORMCP( Age_group , _NORM19 )
drop _NORM19;
select(_NORM19);
  when('0-17' ) G_Age_group = 1;
  when('18-24' ) G_Age_group = 0;
  when('25-44' ) G_Age_group = 1;
  when('45-64' ) G_Age_group = 2;
  when('65-84' ) G_Age_group = 3;
  when('85+' ) G_Age_group = 1;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_Age_group="Grouped Levels for  Age_group";
/*----Age_group end----*/

/*----G_Disease begin----*/
length _NORM32 $ 32;
%DMNORMCP( Disease , _NORM32 )
drop _NORM32;
select(_NORM32);
  when('ASTHMA' ) G_Disease = 1;
  when('CANCER, ALL' ) G_Disease = 2;
  when('DEMENTIA AND ALZHEIMER''S DISEASE' ) G_Disease = 0;
  when('OSTEOARTHRITIS' ) G_Disease = 1;
  when('SEPTICEMIA' ) G_Disease = 1;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_Disease="Grouped Levels for  Disease";
/*----Disease end----*/


****************************************;
*** End Scoring Code from PROC DMINE ***;
****************************************;
