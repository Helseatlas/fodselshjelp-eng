/*
tema: brukes til navnsetting
agg_var: angir variabelnavn for aktuelt utvalg, f.eks. antall induserte
nevner: angir nevner, f.eks alle fødsler, vaginale fødsler eller keisersnitt
par_rob: angir om rater skal beregnes etter paritet eller etter robson-gruppe
grp: angir aktuell paritet (0,1) eller robson-gruppe(1,2,3,4)
*/

/************* NEVNER VAGINALE **************/

%let tema=blod15;
%let agg_var=blodning;
%let nevner=vag;  

/*****************/
/*** PARITET 0 ***/
/*****************/

%let par_rob=paritet;
%let grp=0;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp,&nevner)); /* to use for forbuksmal (f.eks. rupturP0 for ruptur paritet 0) it is in rateprogram output file name and variable name */

%aggregere_mfr(tema=&tema,agg_var=&agg_var,par_rob=&par_rob,grp=&grp,nevner=&nevner);


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

/*BLØDNING VED VAG FORLØSNING DELT PÅ ALLE FØDSLER - TIL FIG_TOTALRATE*/

data FH_alle_par0;
set helseatl.FH_all_paritet;
if paritet=0 then output;
run;

proc sql;
create table FH_alleinnb_par0 as
select distinct komnr, ermann, alder, aar, bydel, sum(fodsler) as innbyggere
from FH_alle_par0
group by aar, ermann, alder, komnr, bydel;
quit;

%let Ratefil=FH_&tema._&par_rob.&grp.;
%Let innbyggerfil=FH_alleinnb_par0;


%let RV_variabelnavn= num_&agg_var; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &tema; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &tema_navn._alle; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall(ds=&tema_navn._alle_IJUST_BOHF, tab=0);



/*****************/
/*** PARITET 1 ***/
/*****************/

%let par_rob=paritet;
%let grp=1;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp,&nevner));

%aggregere_mfr(tema=&tema,agg_var=&agg_var,par_rob=&par_rob,grp=&grp,nevner=&nevner);


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

/*BLØDNING VED VAG FORLØSNING DELT PÅ ALLE FØDSLER - TIL FIG_TOTALRATE*/

data FH_alle_par1;
set helseatl.FH_all_paritet;
if paritet=1 then output;
run;

proc sql;
create table FH_alleinnb_par1 as
select distinct komnr, ermann, alder, aar, bydel, sum(fodsler) as innbyggere
from FH_alle_par1
group by aar, ermann, alder, komnr, bydel;
quit;

%let Ratefil=FH_&tema._&par_rob.&grp.;
%Let innbyggerfil=FH_alleinnb_par1;


%let RV_variabelnavn= num_&agg_var; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &tema; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &tema_navn._alle; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall(ds=&tema_navn._alle_IJUST_BOHF, tab=0);

/************* NEVNER KEISERSNITT **************/

%let tema=blod15;
%let agg_var=blodning;
%let nevner=ks;  

/*****************/
/*** PARITET 0 ***/
/*****************/

%let par_rob=paritet;
%let grp=0;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp,&nevner)); /* to use for forbuksmal (f.eks. rupturP0 for ruptur paritet 0) it is in rateprogram output file name and variable name */

%aggregere_mfr(tema=&tema,agg_var=&agg_var,par_rob=&par_rob,grp=&grp,nevner=&nevner);


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

/*****************/
/*** PARITET 1 ***/
/*****************/

%let par_rob=paritet;
%let grp=1;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp,&nevner));

%aggregere_mfr(tema=&tema,agg_var=&agg_var,par_rob=&par_rob,grp=&grp,nevner=&nevner);


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








/************* INNDELING ROBSON  **************/
/************* NEVNER = ALLE  **************/


%let tema=blod15_vag;
%let agg_var=vag_blodning;
%let nevner=alle;  


/*****************/
/*** ROBSON  1 ***/
/*****************/

%let par_rob=robson;
%let grp=1;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%aggregere_mfr(tema=&tema,agg_var=&agg_var,par_rob=&par_rob,grp=&grp,nevner=&nevner);


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
/*****************/
/*** ROBSON  2 ***/
/*****************/

%let par_rob=robson;
%let grp=2;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%aggregere_mfr(tema=&tema,agg_var=&agg_var,par_rob=&par_rob,grp=&grp,nevner=&nevner);


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
/*****************/
/*** ROBSON  3 ***/
/*****************/

%let par_rob=robson;
%let grp=3;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%aggregere_mfr(tema=&tema,agg_var=&agg_var,par_rob=&par_rob,grp=&grp,nevner=&nevner);


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
/*****************/
/*** ROBSON  4 ***/
/*****************/

%let par_rob=robson;
%let grp=4;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%aggregere_mfr(tema=&tema,agg_var=&agg_var,par_rob=&par_rob,grp=&grp,nevner=&nevner);


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





