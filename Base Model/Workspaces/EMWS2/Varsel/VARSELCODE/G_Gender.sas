*;
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
