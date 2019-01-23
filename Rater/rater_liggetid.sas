/*
   tema     is the name on the dataset (FH_&tema._paritet, or FH_&tema._robson)
   agg_var  is the name of the variable (num_&agg_var)
   par_rob  is either paritet, or robson.  It is used to identify the correct file to use.
   grp      is (0,1) for paritet, or (1,2,3,4,9) for robson
   nevner   defines the interested population: vag, ks, alle
*/

%let tema=liggetid;
%let agg_var=liggedogn;

/**********************/
/*** VAGINAL FØDSEL ***/
/**********************/

%let nevner=vag;

/*****************/
/*** PARITET 0 ***/
/*****************/

%let par_rob=paritet;
%let grp=0;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp)); /* to use for forbuksmal (f.eks. rupturP0 for ruptur paritet 0) it is in rateprogram output file name and variable name */

/*VELGER UT AKTUELL PARITET OG FORLØSNINGSMETODE FRA AGGREGERT DATASETT*/
/*REGNER UT GJENNOMSNITTLIG ANTALL LIGGEDØGN FOR AKTUELL POPULASJON*/
data FH_&tema_navn._&nevner;
  set helseatl.FH_&tema.;

  *keep the desired group;
  where &par_rob=&grp and forlosning=1;
  
  liggedogn=liggetid*num_med_liggetid;

run;

/*BRUKER ANTALL MED liggetid OPPGITT SOM NEVNER*/
data innb_&tema_navn._&nevner;
set FH_&tema_navn._&nevner;
where &par_rob=&grp and forlosning=1;
innbyggere=num_med_liggetid;
run;

data innb_&tema_navn._&nevner;
set innb_&tema_navn._&nevner;
keep aar alder ermann komnr bydel innbyggere;
run;


/* Rateprogram; */

%let Ratefil=FH_&tema_navn._&nevner;
%Let innbyggerfil=innb_&tema_navn._&nevner;


%let RV_variabelnavn= &agg_var; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &tema; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &tema_navn.&nevner; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall(ds=&tema_navn.&nevner._IJUST_BOHF, tab=0);


/*****************/
/*** PARITET 1 ***/
/*****************/

%let par_rob=paritet;
%let grp=1;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp)); /* to use for forbuksmal (f.eks. rupturP0 for ruptur paritet 0) it is in rateprogram output file name and variable name */

/*VELGER UT AKTUELL PARITET OG FORLØSNINGSMETODE FRA AGGREGERT DATASETT*/
data FH_&tema_navn._&nevner;
  set helseatl.FH_&tema.;

  *keep the desired group;
  where &par_rob=&grp and forlosning=1;  
  
  liggedogn=liggetid*num_med_liggetid;

run;

/*BRUKER ANTALL MED liggetid OPPGITT SOM NEVNER*/
data innb_&tema_navn._&nevner;
set FH_&tema_navn._&nevner;
where &par_rob=&grp and forlosning=1;
innbyggere=num_med_liggetid;
run;

data innb_&tema_navn._&nevner;
set innb_&tema_navn._&nevner;
keep aar alder ermann komnr bydel innbyggere;
run;


/* Rateprogram; */

%let Ratefil=FH_&tema_navn._&nevner;
%Let innbyggerfil=innb_&tema_navn._&nevner;


%let RV_variabelnavn= &agg_var; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &tema; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &tema_navn.&nevner; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall(ds=&tema_navn.&nevner._IJUST_BOHF, tab=0);

/**********************/
/*** KEISERSNITT ***/
/**********************/

%let nevner=ks;

/*****************/
/*** PARITET 0 ***/
/*****************/

%let par_rob=paritet;
%let grp=0;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp)); /* to use for forbuksmal (f.eks. rupturP0 for ruptur paritet 0) it is in rateprogram output file name and variable name */

/*VELGER UT AKTUELL PARITET OG FORLØSNINGSMETODE FRA AGGREGERT DATASETT*/
data FH_&tema_navn._&nevner;
  set helseatl.FH_&tema.;

  *keep the desired group;
  where &par_rob=&grp and forlosning=2;
    
  liggedogn=liggetid*num_med_liggetid;

run;

/*BRUKER ANTALL MED liggetid OPPGITT SOM NEVNER*/
data innb_&tema_navn._&nevner;
set FH_&tema_navn._&nevner;
where &par_rob=&grp and forlosning=2;
innbyggere=num_med_liggetid;
run;

data innb_&tema_navn._&nevner;
set innb_&tema_navn._&nevner;
keep aar alder ermann komnr bydel innbyggere;
run;


/* Rateprogram; */

%let Ratefil=FH_&tema_navn._&nevner;
%Let innbyggerfil=innb_&tema_navn._&nevner;


%let RV_variabelnavn= &agg_var; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &tema; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &tema_navn.&nevner; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall(ds=&tema_navn.&nevner._IJUST_BOHF, tab=0);


/*****************/
/*** PARITET 1 ***/
/*****************/

%let par_rob=paritet;
%let grp=1;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp)); /* to use for forbuksmal (f.eks. rupturP0 for ruptur paritet 0) it is in rateprogram output file name and variable name */

/*VELGER UT AKTUELL PARITET OG FORLØSNINGSMETODE FRA AGGREGERT DATASETT*/
data FH_&tema_navn._&nevner;
  set helseatl.FH_&tema.;

  *keep the desired group;
  where &par_rob=&grp and forlosning=2;
    
  liggedogn=liggetid*num_med_liggetid;

run;

/*BRUKER ANTALL MED liggetid OPPGITT SOM NEVNER*/
data innb_&tema_navn._&nevner;
set FH_&tema_navn._&nevner;
where &par_rob=&grp and forlosning=2;
innbyggere=num_med_liggetid;
run;

data innb_&tema_navn._&nevner;
set innb_&tema_navn._&nevner;
keep aar alder ermann komnr bydel innbyggere;
run;


/* Rateprogram; */

%let Ratefil=FH_&tema_navn._&nevner;
%Let innbyggerfil=innb_&tema_navn._&nevner;


%let RV_variabelnavn= &agg_var; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &tema; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &tema_navn.&nevner; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall(ds=&tema_navn.&nevner._IJUST_BOHF, tab=0);