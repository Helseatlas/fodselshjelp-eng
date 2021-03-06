/*
   tema     is the name on the dataset (FH_&tema._paritet, or FH_&tema._robson)
   agg_var  is the name of the variable (num_&agg_var)
   par_rob  is either paritet, or robson.  It is used to identify the correct file to use.
   grp      is (0,1) for paritet, or (1,2,3,4,9) for robson
   nevner   defines the interested population: vag, ks, alle
*/

%let tema=apgar4;
%let agg_var=apgar4;
%let nevner=alle;

/*****************/
/*** PARITET 0 ***/
/*****************/

%let par_rob=paritet;
%let grp=0;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp)); /* to use for forbuksmal (f.eks. rupturP0 for ruptur paritet 0) it is in rateprogram output file name and variable name */



%aggregere_mfr(tema=&tema,agg_var=&agg_var,par_rob=&par_rob,grp=&grp,nevner=&nevner);

/*BRUKER ANTALL MED APGAR-SCORE OPPGITT SOM NEVNER*/
data innb_&tema._&par_rob.&grp;
set FH_&tema._&par_rob.&grp.;
innbyggere=num_med_apgar;
run;

data innb_&tema._&par_rob.&grp;
set innb_&tema._&par_rob.&grp;
keep aar alder ermann komnr bydel innbyggere;
run;


/* Rateprogram; */

%let Ratefil=FH_&tema._&par_rob.&grp.;
%Let innbyggerfil=innb_&tema._&par_rob.&grp;


%let RV_variabelnavn= num_&agg_var; /*navn p� ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &tema; /*Brukes til � lage "pene" overskrifter*/
%Let forbruksmal = &tema_navn; /*Brukes til � lage tabell-overskrift i �rsvarfig, gir ogs� navn til 'ut'-datasett*/

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


%aggregere_mfr(tema=&tema,agg_var=&agg_var,par_rob=&par_rob,grp=&grp,nevner=&nevner);

/*BRUKER ANTALL MED APGAR-SCORE OPPGITT SOM NEVNER*/
data innb_&tema._&par_rob.&grp;
set FH_&tema._&par_rob.&grp.;
innbyggere=num_med_apgar;
run;

data innb_&tema._&par_rob.&grp;
set innb_&tema._&par_rob.&grp;
keep aar alder ermann komnr bydel innbyggere;
run;


/* Rateprogram; */

%let Ratefil=FH_&tema._&par_rob.&grp.;
%Let innbyggerfil=innb_&tema._&par_rob.&grp;

%let RV_variabelnavn= num_&agg_var; /*navn p� ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &tema; /*Brukes til � lage "pene" overskrifter*/
%Let forbruksmal = &tema_navn; /*Brukes til � lage tabell-overskrift i �rsvarfig, gir ogs� navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall(ds=&tema_navn._IJUST_BOHF, tab=0);



/*****************/
/*** ROBSON 1 ***/
/*****************/

%let par_rob=robson;
%let grp=1;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp)); /* to use for forbuksmal (f.eks. rupturP0 for ruptur paritet 0) it is in rateprogram output file name and variable name */



%aggregere_mfr(tema=&tema,agg_var=&agg_var,par_rob=&par_rob,grp=&grp,nevner=&nevner);

/*BRUKER ANTALL MED APGAR-SCORE OPPGITT SOM NEVNER*/
data innb_&tema._&par_rob.&grp;
set FH_&tema._&par_rob.&grp.;
innbyggere=num_med_apgar;
run;

data innb_&tema._&par_rob.&grp;
set innb_&tema._&par_rob.&grp;
keep aar alder ermann komnr bydel innbyggere;
run;


/* Rateprogram; */

%let Ratefil=FH_&tema._&par_rob.&grp.;
%Let innbyggerfil=innb_&tema._&par_rob.&grp;


%let RV_variabelnavn= num_&agg_var; /*navn p� ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &tema; /*Brukes til � lage "pene" overskrifter*/
%Let forbruksmal = &tema_navn; /*Brukes til � lage tabell-overskrift i �rsvarfig, gir ogs� navn til 'ut'-datasett*/

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

/*BRUKER ANTALL MED APGAR-SCORE OPPGITT SOM NEVNER*/
data innb_&tema._&par_rob.&grp;
set FH_&tema._&par_rob.&grp.;
innbyggere=num_med_apgar;
run;

data innb_&tema._&par_rob.&grp;
set innb_&tema._&par_rob.&grp;
keep aar alder ermann komnr bydel innbyggere;
run;


/* Rateprogram; */

%let Ratefil=FH_&tema._&par_rob.&grp.;
%Let innbyggerfil=innb_&tema._&par_rob.&grp;

%let RV_variabelnavn= num_&agg_var; /*navn p� ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &tema; /*Brukes til � lage "pene" overskrifter*/
%Let forbruksmal = &tema_navn; /*Brukes til � lage tabell-overskrift i �rsvarfig, gir ogs� navn til 'ut'-datasett*/

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

/*BRUKER ANTALL MED APGAR-SCORE OPPGITT SOM NEVNER*/
data innb_&tema._&par_rob.&grp;
set FH_&tema._&par_rob.&grp.;
innbyggere=num_med_apgar;
run;

data innb_&tema._&par_rob.&grp;
set innb_&tema._&par_rob.&grp;
keep aar alder ermann komnr bydel innbyggere;
run;


/* Rateprogram; */

%let Ratefil=FH_&tema._&par_rob.&grp.;
%Let innbyggerfil=innb_&tema._&par_rob.&grp;


%let RV_variabelnavn= num_&agg_var; /*navn p� ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &tema; /*Brukes til � lage "pene" overskrifter*/
%Let forbruksmal = &tema_navn; /*Brukes til � lage tabell-overskrift i �rsvarfig, gir ogs� navn til 'ut'-datasett*/

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

/*BRUKER ANTALL MED APGAR-SCORE OPPGITT SOM NEVNER*/
data innb_&tema._&par_rob.&grp;
set FH_&tema._&par_rob.&grp.;
innbyggere=num_med_apgar;
run;

data innb_&tema._&par_rob.&grp;
set innb_&tema._&par_rob.&grp;
keep aar alder ermann komnr bydel innbyggere;
run;


/* Rateprogram; */

%let Ratefil=FH_&tema._&par_rob.&grp.;
%Let innbyggerfil=innb_&tema._&par_rob.&grp;

%let RV_variabelnavn= num_&agg_var; /*navn p� ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &tema; /*Brukes til � lage "pene" overskrifter*/
%Let forbruksmal = &tema_navn; /*Brukes til � lage tabell-overskrift i �rsvarfig, gir ogs� navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd ;
run;

%forholdstall(ds=&tema_navn._IJUST_BOHF, tab=0);

