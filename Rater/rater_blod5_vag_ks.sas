/************* INNDELING VAG/KS      **************/
/************* NEVNER ALLE FØDSLER   **************/

%let tema=blod5;
%let agg_var=blodning;
%let nevner=alle;  

/*****************/
/*** VAGINALE  ***/
/*****************/

%let par_rob=paritet;
%let grp=vag;
%let tema_navn=%sysfunc(cat(&tema,&grp,&nevner)); /* to use for forbuksmal (f.eks. rupturP0 for ruptur paritet 0) it is in rateprogram output file name and variable name */

*%aggregere_mfr(tema=&tema,agg_var=&agg_var,par_rob=&par_rob,grp=&grp,nevner=&nevner);

/* Aggregere - can't use the macro since we are splitting by forlosning, not paritet or robson */

data FH_&tema._&par_rob.&grp.;
  set helseatl.FH_&tema._&par_rob.;

  *keep both paritet, but take only vaginal;
  where forlosning=1; /* VAGINAL */

run;


proc sql;
create table FH_innb_&par_rob.&grp. as
select distinct komnr, ermann, alder, aar, bydel, sum(fodsler) as innbyggere
from helseatl.FH_all_&par_rob. 
group by aar, ermann, alder, komnr, bydel;
quit;

/* Rateprogram; */

%let Ratefil=FH_&tema._&par_rob.&grp.;
%Let innbyggerfil=FH_innb_&par_rob.&grp.;


%let RV_variabelnavn= num_&agg_var; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &tema; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &tema_navn; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall(ds=&tema_navn._IJUST_BOHF, tab=0);
%forholdstall(ds=&tema_navn._UJUST_BOHF, tab=0);
%forholdstall(ds=&tema_navn._JUST_BOHF,  tab=0);

/********************/
/*** KEISERSNITT  ***/
/********************/

%let par_rob=paritet;
%let grp=ks;
%let tema_navn=%sysfunc(cat(&tema,&grp,&nevner)); /* to use for forbuksmal (f.eks. rupturP0 for ruptur paritet 0) it is in rateprogram output file name and variable name */

*%aggregere_mfr(tema=&tema,agg_var=&agg_var,par_rob=&par_rob,grp=&grp,nevner=&nevner);

/* Aggregere - can't use the macro since we are splitting by forlosning, not paritet or robson */

data FH_&tema._&par_rob.&grp.;
  set helseatl.FH_&tema._&par_rob.;

  *keep both paritet, but take only ks;
  where forlosning=2; /* KEISERSNITT */

run;


proc sql;
create table FH_innb_&par_rob.&grp. as
select distinct komnr, ermann, alder, aar, bydel, sum(fodsler) as innbyggere
from helseatl.FH_all_&par_rob. 
group by aar, ermann, alder, komnr, bydel;
quit;

/* Rateprogram; */

%let Ratefil=FH_&tema._&par_rob.&grp.;
%Let innbyggerfil=FH_innb_&par_rob.&grp.;


%let RV_variabelnavn= num_&agg_var; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &tema; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &tema_navn; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall(ds=&tema_navn._IJUST_BOHF, tab=0);
%forholdstall(ds=&tema_navn._UJUST_BOHF, tab=0);
%forholdstall(ds=&tema_navn._JUST_BOHF,  tab=0);