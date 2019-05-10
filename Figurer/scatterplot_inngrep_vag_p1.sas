%macro legg_til_datasett(dsn=, original=datasett, first = 0, utv=);

data qwerty_1;
set &dsn;
run;

data qwerty_1;
set qwerty_1;
bohf_org = bohf;
if bohf_org eq 8888 then rate_nor = rateSnitt;
run;

proc sql;
	create table qwerty_2 as
	select bohf, rateSnitt, max(rate_nor) as rate_nor
	from qwerty_1;
quit;


data qwerty_2;
set qwerty_2;
where bohf ne 30 and bohf ne 8888 and rateSnitt ne .;
if rateSnitt ne . then faktor = rateSnitt/rate_nor;
utvalg = "&utv";
format bohf bohf_kort.;
run;


/*
Hvis &original eksisterer legges nytt datasett på eksisterende
Hvis ikke, blir &original nytt datasett
*/
%if &first eq 0 %then %do;
	data &original;
	set &original qwerty_2;
	keep bohf faktor utvalg;
	run;
%end;
%else %do;
	data &original;
	set qwerty_2;
	keep bohf faktor utvalg;
	run;
%end;

proc datasets nolist;
delete qwerty:;

%mend;

%legg_til_datasett(dsn=ks_akuttp1_ijust_bohf, original=datasett, first = 1, utv=ks_akutt);
%legg_til_datasett(dsn=tang_vakuump1_ijust_bohf, original=datasett, utv=tang_vak);
%legg_til_datasett(dsn=anestesi_vagp1vag_ijust_bohf, original=datasett, utv=epidural);
%legg_til_datasett(dsn=episiotomip1_ijust_bohf, original=datasett, utv=klipp);
%legg_til_datasett(dsn=indusertp1_ijust_bohf, original=datasett, utv=indusert);

data datasett;
set datasett;
faktor2=Round((Faktor),0.1);
x=1;
*if utvalg = "blod15" or utvalg = "apgar7" or utvalg = "ruptur" then do; *x=1; *faktork=faktor2; *end;
*if utvalg = "ks_akutt" or utvalg = "tang_vak" then do; *x=2; *faktori=faktor2; *end;
run;


Options locale=NB_no mlogic symbolgen mprint;

ODS Graphics ON / imagemap reset=All imagename="scatter_inngrep_vag_p1" imagefmt=png  border=off width=14.0cm height=10.0cm;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe_png";
proc sgpanel data=datasett sganno=anno;
panelby bohf / spacing=2 rows=5 columns=5 novarname nowall ;
scatter x=x y=faktor2 / jitter markerattrs=(SYMBOL=circleFilled color=blue);* legendlabel="Store inngrep";
*scatter x=x y=faktork / jitter markerattrs=(SYMBOL=circleFilled color=lightblue) legendlabel="Komplikasjoner";
refline 1 / axis=y;
colaxis display=(noticks nolabel novalues) type=discrete;
rowaxis display=(nolabel ) values=(0.6 to 1.4 by 0.2);
run;
ods listing close;
ods graphics off; 
