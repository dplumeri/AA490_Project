*;
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
