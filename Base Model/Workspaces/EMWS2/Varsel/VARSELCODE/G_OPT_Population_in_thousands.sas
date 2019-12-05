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
