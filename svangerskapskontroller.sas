%Let sv_lengde=255;
/*%Let forste_trim_grense=199;*/
/*%Let andre_trim_grense=87;*/
%Let sv_dato="1JAN2015"d;
/*%Let gj_aar=2017;*/

/*Datasett til telling av kontakter i svangerskapet*/
%Let dsn=svkont;
/*Registrere dato, alder og bosted i egne variabler for alle fødsler*/
data &dsn;
set kontakter_fodende;
if &ftype=1 then do;
fodedato=EoC_inndato;
fodealder=alder;
fodekomnr=komnr;
fodebydel=bydel;
end;
format fodedato date10.;
run;

/*Sorterer slik at fødselen kommer før/over tilhørende svangerskapskontroller*/
proc sort data=&dsn;
by pid descending EoC_inndato descending fodedato;
run;

/*Kopierer dato for fødsel (fodedato) +++ til alle kontakter under helt til man kommer til en ny fødsel eller en ny PID*/
/*Alle kontroller som ikke følges (i tid) av en fødsel vil få fodedato+++ lik missing*/
data &dsn(drop = tmp_fodedato tmp_fodealder tmp_fodekomnr tmp_fodebydel);
set &dsn;
by pid descending EoC_inndato descending fodedato;

if &ftype=1 then do;
	tmp_fodedato = fodedato;
	tmp_fodealder = fodealder;
	tmp_fodekomnr = fodekomnr;
	tmp_fodebydel = fodebydel;
end;
else do;
	if first.pid then do;	/*Hvis man kommer til ny PID og første kontakt for ny PID ikke er en fødsel, så settes fodedato +++ til missing*/
		fodedato = . ;
		fodealder = . ;
		fodekomnr= . ;
		fodebydel= . ;
		tmp_fodedato = . ;
		tmp_fodealder = . ;
		tmp_fodekomnr = . ;
		tmp_fodebydel = . ;
	end;
	else do;
		fodedato = tmp_fodedato;
		fodealder = tmp_fodealder;
		fodekomnr= tmp_fodekomnr;
		fodebydel = tmp_fodebydel;
	end;
end;	

retain tmp_fodedato	tmp_fodealder tmp_fodekomnr tmp_fodebydel;
run;

/*Regner ut hvor lenge før fødselen den aktuelle kontakten var. */
/*Hvis kontakten ikke er knyttet til en fødsel (har fodedato = .) får variabelen dager_for_fodsel verdien missing*/
data &dsn;
set &dsn;
by pid descending EoC_inndato descending fodedato;

if &ftype = . and fodedato ne . then do;
	dager_for_fodsel=fodedato-EoC_inndato;
end;

run;


/*Teller kontakter, ultralyder og kontroller i svangerskapet*/
data &dsn;
set &dsn;
by pid descending EoC_inndato descending fodedato;

if dager_for_fodsel not in (0,.) then do;
/*Tar med alle kontakter fom: fødselsdato - &sv_lengde. Tar ikke med kontroller som er en del av et døgnopphold.*/	
	if EoC_aktivitetskategori3 ne 1 and dager_for_fodsel le &sv_lengde then  do ;
	  if Kontroll=1 or UL=1 then do;
	    svkontakt_kontr=1;
	    svkontakt=1;
	  end;
	end;
end;


run;

/*Velger ut aktuelle kontakter for videre analyse. Tar med bare de som er knyttet til en fødsel som forekommer etter &sv_dato*/
data &dsn._utvalg;
set &dsn;
by pid descending EoC_inndato descending fodedato;
where fodedato ne . and fodedato ge &sv_dato;	
aar=year(fodedato);		
eoc_aar=year(fodedato); *assign to EoC_aar since aggreger macro uses this as year;
run;

/*Teller antall kontakter i hvert svangerskap*/
proc sql;
   create table &dsn._allekont as 
   select distinct pid, fodedato, fodealder, fodekomnr, fodebydel, count(distinct EoC_Id) as ant_svkontakt
   from &dsn._utvalg
   /*if only counting pregnancy related codes then change svkontakt to svkontakt_kontr here;*/
   where svkontakt_kontr=1
   group by pid, fodedato;
quit;

data &dsn._allekont_kat;
set &dsn._allekont;
if ant_svkontakt = 1 then en_kont=1;
else if ant_svkontakt gt 1 and ant_svkontakt le 5 then to_fem_kont=1;
else if ant_svkontakt gt 5 then mer_fem_kont=1;
aar=year(fodedato);	
run;

/*Teller antall fødsler og antal med hhv. 1 kontakt, 2-5 kontaker og mer enn 5 kontakter*/
proc sql;
   create table &dsn._andel as 
   select distinct aar, fodealder, fodekomnr, fodebydel, SUM(en_kont) as en_kontakt, SUM(to_fem_kont) as to_fem_kontakter, SUM(mer_fem_kont) as mer_fem_kontakter
   from &dsn._allekont_kat
   group by aar,fodealder, fodekomnr, fodebydel;
quit;

data &dsn._andel_agg;
set &dsn._andel;
rename fodealder=alder;
rename fodekomnr=komnr;
rename fodebydel=bydel;
run;

data helseatl.FH_svkont_andel;
set &dsn._andel_agg;
run;

/*Teller antall fødsler og lagrer til innbyggerfil.*/
proc sql;
   create table &dsn._allefodsler as 
   select distinct pid, aar, fodedato, fodealder, fodekomnr, fodebydel
   from &dsn._utvalg
   group by pid, fodedato;
quit;

data &dsn._allefodsler;
set &dsn._allefodsler;
fodsel=1;
run;

proc sql;
   create table &dsn._fodsler as 
   select distinct fodealder, fodekomnr, fodebydel, sum(fodsel) as innbyggere, aar
   from &dsn._allefodsler
   group by aar,fodealder, fodekomnr, fodebydel;
quit;

/*Setter aar=&gj_aar for alle fødslene. Raten blir dermed gjennomsnittsrate for perioden &sv_dato - 31.12 &gj_aar.*/
data helseatl.&dsn._fodsler;
set &dsn._fodsler;
/*aar=&gj_aar;*/
ermann=0;
alder=fodealder;
komnr=fodekomnr;
bydel=fodebydel;

drop fodealder fodekomnr fodebydel;
run;

/*Lager index for å gjøre aggregering raskere*/
proc datasets library=work;
	modify &dsn._utvalg;
	index create pid;
run;


proc sort data=&dsn._utvalg(keep=EoC_Id svkontakt) out=flagg_svkontakt;
  by EOC_Id;
quit;
