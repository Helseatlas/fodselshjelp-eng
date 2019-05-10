/* Global variables */
%let tema=episiotomi;
%let agg_var=episiotomi;
%let nevner=vag;

/* Figurer */

/*****************/
/*** PARITET 0 ***/
/*****************/

%let par_rob=paritet;
%let grp=0;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%let fignavn=;
%let tittel=;
%let rv1=&tema_navn;
%let type=&par_rob.&grp; 
%let tabellvar1=&tema_navn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Klipping" &tabellvar2="Fødsler";
%let xlabel=Antall pr. 1 000  førstegangsfødende som fødte vaginalt.;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema_navn._IJUST_bohf);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema_navn._IJUST_bohf, bildeformat=pdf);

/*** Lager datasett for Instant Atlas *****/

/*episiotomi_p0*/
%Let beskrivelse=episiotomi_p0_rate;
data helseatl.IA_FH_&beskrivelse;
  set &tema_navn._&just._bohf (keep = bohf rateSnitt &tema_navn innbyggere rename=(rateSnitt=Rate &tema_navn=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =25;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;

/*****************/
/*** PARITET 1 ***/
/*****************/

%let par_rob=paritet;
%let grp=1;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%let fignavn=;
%let tittel=;
%let rv1=&tema_navn;
%let type=&par_rob.&grp; 
%let tabellvar1=&tema_navn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Klipping" &tabellvar2="Fødsler";
%let xlabel=Antall pr. 1 000  flergangsfødende som fødte vaginalt.;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema_navn._IJUST_bohf);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema_navn._IJUST_bohf, bildeformat=pdf);

/*** Lager datasett for Instant Atlas *****/

/*episiotomi_p111*/
%Let beskrivelse=episiotomi_p1_rate;
data helseatl.IA_FH_&beskrivelse;
  set &tema_navn._&just._bohf (keep = bohf rateSnitt &tema_navn innbyggere rename=(rateSnitt=Rate &tema_navn=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =26;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;

%let mappe_png=Figurer\png\ROBSON;
%let mappe_pdf=Figurer\pdf\ROBSON;

/*****************/
/*** ROBSON 1 ***/
/*****************/

%let par_rob=robson;
%let grp=1;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%let fignavn=;
%let tittel=;
%let rv1=&tema_navn;
%let type=&par_rob.&grp; 
%let tabellvar1=&tema_navn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Klipping" &tabellvar2="Fødsler";
%let xlabel=Antall pr. 1 000 fødsler, Robsongruppe 1.;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema_navn._IJUST_bohf, bildeformat=png);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema_navn._IJUST_bohf, bildeformat=pdf);

/*****************/
/*** ROBSON 2 ***/
/*****************/

%let par_rob=robson;
%let grp=2;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%let fignavn=;
%let tittel=;
%let rv1=&tema_navn;
%let type=&par_rob.&grp; 
%let tabellvar1=&tema_navn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Klipping" &tabellvar2="Fødsler";
%let xlabel=Antall pr. 1 000  førstegangsfødsler.;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema_navn._IJUST_bohf, bildeformat=png);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema_navn._IJUST_bohf, bildeformat=pdf);

/*** ROBSON 3 ***/
/*****************/

%let par_rob=robson;
%let grp=3;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%let fignavn=;
%let tittel=;
%let rv1=&tema_navn;
%let type=&par_rob.&grp; 
%let tabellvar1=&tema_navn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Klipping" &tabellvar2="Fødsler";
%let xlabel=Antall pr. 1 000 fødsler, Robsongruppe 3.;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema_navn._IJUST_bohf, bildeformat=png);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema_navn._IJUST_bohf, bildeformat=pdf);

/*****************/
/*** ROBSON 4 ***/
/*****************/

%let par_rob=robson;
%let grp=4;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%let fignavn=;
%let tittel=;
%let rv1=&tema_navn;
%let type=&par_rob.&grp; 
%let tabellvar1=&tema_navn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="&tema" &tabellvar2="vag flergangsfødsler";
%let xlabel=Antall pr. 1 000  flergangsfødsler.;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema_navn._IJUST_bohf, bildeformat=png);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema_navn._IJUST_bohf, bildeformat=pdf);

/*****************/
/*** ROBSON 9, par0 ***/
/*****************/

%let par_rob=robson;
%let grp=90;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%let fignavn=;
%let tittel=;
%let rv1=&tema_navn;
%let type=&par_rob.&grp; 
%let tabellvar1=&tema_navn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="&tema" &tabellvar2="førstegangsfødsler";
%let xlabel=Antall pr. 1 000  førstegangsfødsler.;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema_navn._IJUST_bohf, bildeformat=png);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema_navn._IJUST_bohf, bildeformat=pdf);

/*****************/
/*** ROBSON 9, par1 ***/
/*****************/

%let par_rob=robson;
%let grp=91;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%let fignavn=;
%let tittel=;
%let rv1=&tema_navn;
%let type=&par_rob.&grp; 
%let tabellvar1=&tema_navn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="&tema" &tabellvar2="flergangsfødsler";
%let xlabel=Antall pr. 1 000  flergangsfødsler.;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema_navn._IJUST_bohf, bildeformat=png);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema_navn._IJUST_bohf, bildeformat=pdf);

%let mappe_png=Figurer\png;
%let mappe_pdf=Figurer\pdf;