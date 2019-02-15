/* Calculate correlation between paritet 0 and paritet 1 within the same tema */
/* aar = 2015, 2016, etc, or snitt */
/* pop = leave empty/undefined in most cases.  use for blødning where the file names are flagged with 2 different population (vag or ks) */

%macro corr_bohf(aar=,pop=);
data &tema.p0;
  set &tema.p0&pop._&just._bohf(keep=bohf rate&aar.);
  rename rate&aar.=p0;
run;

data &tema.p1;
  set &tema.p1&pop._&just._bohf(keep=bohf rate&aar.);
  rename rate&aar.=p1;
run;

proc sort data=&tema.p0;
  by bohf;
run;
proc sort data=&tema.p1;
  by bohf;
run;

data &tema.&pop._p0_p1;
  merge &tema.p0 &tema.p1;
  by bohf;
  where bohf not in (8888);
run;

%if &aar=snitt %then %do;
  %let title2=&tema. &aar. &pop. &StartÅr - &SluttÅr;
%end;
%else %do;
  %let title2=&tema. &aar. &pop.;
%end;

ODS Graphics ON /reset=All imagename="&tema.&pop._corr&aar" imagefmt=png border=off height=500px;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe_corr";
title "&title2";

PROC CORR DATA=&tema.&pop._p0_p1
	PLOTS=(SCATTER (ellipse=none))
	PEARSON
	SPEARMAN
	VARDEF=DF
	;
	VAR p0;
	WITH p1;
RUN;
title;
ods listing close;

%mend;


