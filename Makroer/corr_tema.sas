/* Calculate correlation between 2 temaer within the same paritet */

%macro corr_tema(fil1=,fil2=,aar=,niva=bohf);
data tmp1;
  set &fil1(keep=&niva rate&aar.);
  rename rate&aar.=rate1;
run;

data tmp2;
  set &fil2(keep=&niva rate&aar.);
  rename rate&aar.=rate2;
run;

proc sort data=tmp1;
  by &niva;
run;
proc sort data=tmp2;
  by &niva;
run;


%let tema1=%substr(&fil1,1,8);
%let tema2=%substr(&fil2,1,8);

data &tema1._&tema2.;
  merge tmp1 tmp2;
  by &niva;
  where &niva not in (8888);
run;

%if &aar=snitt %then %do;
  %let title2=&tema1. v.s. &tema2. &aar. &StartÅr - &SluttÅr;
%end;
%else %do;
  %let title2=&tema1. v.s. &tema2. &aar. ;
%end;

ODS Graphics ON /reset=All imagename="&tema1._&tema2._corr&aar" imagefmt=png border=off height=500px;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe_corr";
title "&title2";

PROC CORR DATA=&tema1._&tema2.
	PLOTS=(SCATTER (ellipse=none))
	PEARSON
	SPEARMAN
	VARDEF=DF
	;
	VAR rate1;
	WITH rate2;
RUN;
title;
ods listing close;
%mend;
