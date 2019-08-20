/*
tema: brukes til navnsetting
agg_var: angir variabelnavn for aktuelt utvalg, f.eks. antall induserte
nevner: angir nevner, f.eks alle fødsler, vaginale fødsler eller keisersnitt
par_rob: angir om rater skal beregnes etter paritet eller etter robson-gruppe
grp: angir aktuell paritet (0,1) eller robson-gruppe(1,2,3,4)
*/

/************* NEVNER VAGINALE **************/

%let tema=anestesi_vag;
%let agg_var=epi_vag;
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












/************* NEVNER KEISERSNITT **************/

%let tema=anestesi_ksak;
%let agg_var=epi_ksakutt;
%let nevner=ks;  

/*****************/
/*** PARITET 0 ***/
/*****************/

%let par_rob=paritet;
%let grp=0;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp,&nevner)); /* to use for forbuksmal (f.eks. rupturP0 for ruptur paritet 0) it is in rateprogram output file name and variable name */

%aggregere_mfr(tema=&tema,agg_var=&agg_var,par_rob=&par_rob,grp=&grp,nevner=&nevner);

/*Bruker akutte keisersnitt som nevner istedetfor alle keisersnitt*/
data FH_ksak_&par_rob.&grp;
set helseatl.FH_ks_akutt_paritet;
where aar ne 2014 and paritet=&grp;
run;

proc sql;
create table FH_innb_&par_rob.&grp. as
select distinct komnr, ermann, alder, aar, bydel, sum(num_ks_akutt) as innbyggere
from FH_ksak_&par_rob.&grp
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

/*****************/
/*** PARITET 1 ***/
/*****************/

%let par_rob=paritet;
%let grp=1;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp,&nevner));

%aggregere_mfr(tema=&tema,agg_var=&agg_var,par_rob=&par_rob,grp=&grp,nevner=&nevner);

/*Bruker akutte keisersnitt som nevner istedetfor alle keisersnitt*/
data FH_ksak_&par_rob.&grp;
set helseatl.FH_ks_akutt_paritet;
where aar ne 2014 and paritet=&grp;
run;

proc sql;
create table FH_innb_&par_rob.&grp. as
select distinct komnr, ermann, alder, aar, bydel, sum(num_ks_akutt) as innbyggere
from FH_ksak_&par_rob.&grp
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




/*****************/
/*** ROBSON 1 ***/
/*****************/

%let tema=anestesi;
%let agg_var=epidural;
%let nevner=alle;

%let par_rob=robson;
%let grp=1;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp)); /* to use for forbuksmal (f.eks. rupturP0 for ruptur paritet 0) it is in rateprogram output file name and variable name */


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



/*****************/
/*** ROBSON 2 ***/
/*****************/

%let par_rob=robson;
%let grp=2;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp)); /* to use for forbuksmal (f.eks. rupturP0 for ruptur paritet 0) it is in rateprogram output file name and variable name */


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




/*****************/
/*** ROBSON 3 ***/
/*****************/

%let par_rob=robson;
%let grp=3;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp)); /* to use for forbuksmal (f.eks. rupturP0 for ruptur paritet 0) it is in rateprogram output file name and variable name */



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



/*****************/
/*** ROBSON 4 ***/
/*****************/

%let par_rob=robson;
%let grp=4;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp)); /* to use for forbuksmal (f.eks. rupturP0 for ruptur paritet 0) it is in rateprogram output file name and variable name */


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


/*****************/
/*** ROBSON 9, par0 ***/
/*****************/

%let par_rob=robson;
%let grp=90;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp)); /* to use for forbuksmal (f.eks. rupturP0 for ruptur paritet 0) it is in rateprogram output file name and variable name */


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


/*****************/
/*** ROBSON 9, par1 ***/
/*****************/

%let par_rob=robson;
%let grp=91;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp)); /* to use for forbuksmal (f.eks. rupturP0 for ruptur paritet 0) it is in rateprogram output file name and variable name */


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