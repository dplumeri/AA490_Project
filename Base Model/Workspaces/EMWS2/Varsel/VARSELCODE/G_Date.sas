*;
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
