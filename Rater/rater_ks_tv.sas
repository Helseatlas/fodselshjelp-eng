/* JS - 08 Mars 2019 */
/* combine ks akutt with tang_vak */
/* population needs to be all birth minus ks planlagt */
/* create the aggregate files in this program, rather than using the aggregere_mfr macro */

/* nevner fil : alle minus planlagt ks */

proc sql;
  create table FH_all_paritet as
  select distinct aar, ermann, bohf, bohf_tekst, aldersgruppe, paritet, alder, bydel, komnr, sum(fodsler) as fodsler
  from helseatl.FH_all_paritet
  group by aar, bohf, alder, paritet, komnr, bydel
  order by aar, bohf, alder, paritet, komnr, bydel;  
quit;

proc sql;
  create table FH_KS_PLANLAGT as
  select distinct aar, ermann, bohf, bohf_tekst, aldersgruppe, paritet, alder, bydel, komnr, sum(num_ks_planlagt) as ks_plan
  from helseatl.FH_KS_PLANLAGT_PARITET
  group by aar, bohf, alder, paritet, komnr, bydel
  order by aar, bohf, alder, paritet, komnr, bydel;  
quit;

data FH_innb_p0 FH_innb_p1;
  merge FH_KS_PLANLAGT(in=a) FH_all_paritet(in=b);
  by aar bohf alder paritet komnr bydel;
  fodsler_noplan=fodsler-ks_plan;
  if paritet=0 then output FH_innb_p0;
  else if paritet=1 then output FH_innb_p1;
run;

proc sql;
create table FH_innb_paritet0_noplan as
select distinct komnr, ermann, alder, aar, bydel, sum(fodsler_noplan) as innbyggere
from FH_innb_p0
group by aar, ermann, alder, komnr, bydel;
quit;

proc sql;
create table FH_innb_paritet1_noplan as
select distinct komnr, ermann, alder, aar, bydel, sum(fodsler_noplan) as innbyggere
from FH_innb_p1
group by aar, ermann, alder, komnr, bydel;
quit;



/***********************************************/
/* KS AKUTT MED NEVNER = ALLE MINUS KSPLANLAGT */
/***********************************************/

%let tema=ks_akutt;
%let agg_var=ks_akutt;

/*****************/
/*** PARITET 0 ***/
/*****************/

%let par_rob=paritet;
%let grp=0;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp)); /* to use for forbuksmal (f.eks. rupturP0 for ruptur paritet 0) it is in rateprogram output file name and variable name */

data FH_&tema._&par_rob.&grp.;
  set helseatl.FH_&tema._&par_rob.;

  *keep the desired group, i.e. par0, par1;
  if &par_rob=&grp then output;
 
run;


/* Rateprogram; */

%let Ratefil=FH_&tema._&par_rob.&grp.;
%Let innbyggerfil=FH_innb_&par_rob.&grp._noplan;


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


/*****************/
/*** PARITET 1 ***/
/*****************/

%let par_rob=paritet;
%let grp=1;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

data FH_&tema._&par_rob.&grp.;
  set helseatl.FH_&tema._&par_rob.;

  *keep the desired group, i.e. par0, par1;
  if &par_rob=&grp then output;
 
run;

/* Rateprogram; */

%let Ratefil=FH_&tema._&par_rob.&grp.;
%Let innbyggerfil=FH_innb_&par_rob.&grp._noplan;


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


/********************************************************************/
/*SAMLET (SUM AV TANG OG VAKUUM) MED NEVNER = ALLE MINUS KSPLANLAGT */
/********************************************************************/

%let tema=tang_vakuum;
%let agg_var=tang_vak;

/*****************/
/*** PARITET 0 ***/
/*****************/

%let par_rob=paritet;
%let grp=0;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp)); /* to use for forbuksmal (f.eks. rupturP0 for ruptur paritet 0) it is in rateprogram output file name and variable name */


data FH_&tema._&par_rob.&grp.;
  set helseatl.FH_&tema._&par_rob.;

  *keep the desired group, i.e. par0, par1;
  if &par_rob=&grp then output;
 
run;


/* Rateprogram; */

%let Ratefil=FH_&tema._&par_rob.&grp.;
%Let innbyggerfil=FH_innb_&par_rob.&grp._noplan;


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


/*****************/
/*** PARITET 1 ***/
/*****************/

%let par_rob=paritet;
%let grp=1;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp)); /* to use for forbuksmal (f.eks. rupturP0 for ruptur paritet 0) it is in rateprogram output file name and variable name */

data FH_&tema._&par_rob.&grp.;
  set helseatl.FH_&tema._&par_rob.;

  *keep the desired group, i.e. par0, par1;
  if &par_rob=&grp then output;
 
run;

/* Rateprogram; */

%let Ratefil=FH_&tema._&par_rob.&grp.;
%Let innbyggerfil=FH_innb_&par_rob.&grp._noplan;

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

