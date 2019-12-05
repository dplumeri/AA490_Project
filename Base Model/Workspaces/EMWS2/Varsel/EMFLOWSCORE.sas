******************************************;
*** Begin Scoring Code from PROC DMINE ***;
******************************************;

length _WARN_ $ 4;
label _WARN_ = "Warnings";


/*----G_OPT_Population_in_thousands begin----*/
length _NORM32 $ 32;
%DMNORMCP( OPT_Population_in_thousands , _NORM32 )
drop _NORM32;
select(_NORM32);
  when('01:LOW-8773.6505' ) G_OPT_Population_in_thousands = 1;
  when('02:8773.6505-34177.5, MISSING' ) G_OPT_Population_in_thousands = 0;
  when('03:34177.5-72628.5' ) G_OPT_Population_in_thousands = 1;
  when('04:72628.5-HIGH' ) G_OPT_Population_in_thousands = 2;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_OPT_Population_in_thousands="Grouped Levels for  
        OPT_Population_in_thousands";
/*----OPT_Population_in_thousands end----*/

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

/*----G_Age_group begin----*/
length _NORM19 $ 19;
%DMNORMCP( Age_group , _NORM19 )
drop _NORM19;
select(_NORM19);
  when('0-17' ) G_Age_group = 1;
  when('18-24' ) G_Age_group = 0;
  when('25-44' ) G_Age_group = 1;
  when('85+' ) G_Age_group = 1;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_Age_group="Grouped Levels for  Age_group";
/*----Age_group end----*/

/*----G_Gender begin----*/
length _NORM10 $ 10;
_NORM10 = put( Gender , $CHAR10. );
%DMNORMIP( _NORM10 )
drop _NORM10;
select(_NORM10);
  when('ALL' ) G_Gender = 1;
  when('FEMALE' ) G_Gender = 0;
  when('MALE' ) G_Gender = 0;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_Gender="Grouped Levels for  Gender";
/*----Gender end----*/

/*----G_Date begin----*/
length _NORM10 $ 10;
%DMNORMCP( Date , _NORM10 )
drop _NORM10;
select(_NORM10);
  when('1990' ) G_Date = 2;
  when('1991' ) G_Date = 2;
  when('1992' ) G_Date = 2;
  when('1993' ) G_Date = 4;
  when('1994' ) G_Date = 1;
  when('1995' ) G_Date = 3;
  when('1996' ) G_Date = 3;
  when('1997' ) G_Date = 4;
  when('1998' ) G_Date = 3;
  when('1999' ) G_Date = 0;
  when('2000' ) G_Date = 3;
  when('2001' ) G_Date = 3;
  when('2002' ) G_Date = 1;
  when('2003' ) G_Date = 5;
  when('2004' ) G_Date = 5;
  when('2005' ) G_Date = 0;
  when('2006' ) G_Date = 5;
  when('2007' ) G_Date = 5;
  when('2008' ) G_Date = 2;
  when('2009' ) G_Date = 5;
  when('2010' ) G_Date = 3;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_Date="Grouped Levels for  Date";
/*----Date end----*/


****************************************;
*** End Scoring Code from PROC DMINE ***;
****************************************;
