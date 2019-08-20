/* Global variables */
%let tema=ks_akutt;
%let agg_var=ks_akutt;
%let nevner=alle;


/* Figurer */

/*****************/
/*** PARITET 0 ***/
/*****************/

%let par_rob=paritet;
%let grp=0;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%let rv1=&tema_navn;
%let type=&par_rob.&grp; /*Angir populasjon/nevner*/
%let tabellvar1=&tema_navn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Keisersnitt" &tabellvar2="Fødsler";
%let xlabel=Antall pr. 1 000 førstegangsfødende.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let just=Ijust;
%let fignavn=&just;
%let tittel=&tema_navn &just;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=png);
%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=pdf);

/*** Lager datasett for Instant Atlas *****/

/*ks_akutt_p0*/
%Let beskrivelse=ks_akutt_p0_rate;
data helseatl.IA_FH_&beskrivelse;
  set &tema_navn._&just._bohf (keep = bohf rateSnitt &tema_navn innbyggere rename=(rateSnitt=Rate &tema_navn=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =21;

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

%let rv1=&tema_navn;
%let type=&par_rob.&grp; /*Angir populasjon/nevner*/
%let tabellvar1=&tema_navn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Keisersnitt" &tabellvar2="Fødsler";
%let xlabel=Antall pr. 1 000 flergangsfødende.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;


%let just=Ijust;
%let fignavn=&just;
%let tittel=&tema_navn &just;


%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=png);
%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=pdf);

/*** Lager datasett for Instant Atlas *****/

/*ks_akutt_p1*/
%Let beskrivelse=ks_akutt_p1_rate;
data helseatl.IA_FH_&beskrivelse;
  set &tema_navn._&just._bohf (keep = bohf rateSnitt &tema_navn innbyggere rename=(rateSnitt=Rate &tema_navn=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =22;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;

/*TODELTE FIGURER*/

%let tema=ks;


/*SAMMENSATT FIGUR, AKUTT+ELEKTIVT, PARITET 0*/

%let dsn1=ks_akuttp0_IJUST_bohf;
%let rv1=ks_akuttp0;

%let dsn2=ks_planlagtp0_IJUST_bohf;
%let rv2=ks_planlagtp0;

%merge(ant_datasett=2, dsn_ut=ks_delt_p0_bohf); 


%let fignavn=;
%let type=p0;
%let tittel=;
%let xlabel=Antall pr. 1 000 førstegangsfødende.;
%let label_1=Akutt;
%let label_2=Planlagt;
%let tabellvar1=tot_antall;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Keisersnitt" &tabellvar2="Fødsler" ;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;*values=(0 to 300 by 50); * if run with no aarsvar, then the scale can be 0 to 250;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(sprak=en, datasett=ks_delt_p0_bohf, bildeformat=png );


%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(sprak=en, datasett=ks_delt_p0_bohf, bildeformat=pdf );


/*SAMMENSATT FIGUR, AKUTT+ELEKTIVT, PARITET 1*/

%let dsn1=ks_akuttp1_IJUST_bohf;
%let rv1=ks_akuttp1;

%let dsn2=ks_planlagtp1_IJUST_bohf;
%let rv2=ks_planlagtp1;

%merge(ant_datasett=2, dsn_ut=ks_delt_p1_bohf); 


%let fignavn=;
%let type=p1;
%let tittel=;
%let xlabel=Antall pr. 1 000 flergangsfødende.;
%let label_1=Akutt;
%let label_2=Planlagt;
%let tabellvar1=tot_antall;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Keisersnitt" &tabellvar2="Fødsler" ;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;*values=(0 to 300 by 50); * if run with no aarsvar, then the scale can be 0 to 250;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(sprak=en, datasett=ks_delt_p1_bohf, bildeformat=png );


%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(sprak=en, datasett=ks_delt_p1_bohf, bildeformat=pdf );














%let tema=ks_akutt;



/*ROBSON*/



%let mappe_png=Figurer\png\ROBSON;
%let mappe_pdf=Figurer\pdf\ROBSON;


/*****************/
/*** ROBSON  1 ***/
/*****************/


%let par_rob=robson;
%let grp=1;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%let rv1=&tema_navn;
%let type=&par_rob.&grp; /*Angir populasjon/nevner*/
%let tabellvar1=&tema_navn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Akutte keisersnitt" &tabellvar2="Fødsler";
%let xlabel=Antall pr. 1 000 fødsler, Robsongruppe 1.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;


%let just=Ijust;
%let fignavn=&just;
%let tittel=&tema_navn &just;


%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=png);
%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=pdf);

/*** Lager datasett for Instant Atlas *****/

/*Ukompl_ks_r1*/
%Let beskrivelse=Ukompl_ks_r1_rate;
data helseatl.IA_FH_&beskrivelse;
  set &tema_navn._&just._bohf (keep = bohf rateSnitt &tema_navn innbyggere rename=(rateSnitt=Rate &tema_navn=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =16;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;

/*****************/
/*** ROBSON  2 ***/
/*****************/

%let par_rob=robson;
%let grp=2;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%let rv1=&tema_navn;
%let type=&par_rob.&grp; /*Angir populasjon/nevner*/
%let tabellvar1=&tema_navn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="&tema" &tabellvar2="Alle førstegangsfødende";
%let xlabel=&tema., pr. 1 000 førstegangsfødende igangsatt.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let just=Ijust;
%let fignavn=&just;
%let tittel=&tema_navn &just;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=png);
%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=pdf);

/*****************/
/*** ROBSON  3 ***/
/*****************/


%let par_rob=robson;
%let grp=3;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%let rv1=&tema_navn;
%let type=&par_rob.&grp; /*Angir populasjon/nevner*/
%let tabellvar1=&tema_navn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Akutte keisersnitt" &tabellvar2="Fødsler";
%let xlabel=Antall pr. 1 000 lavrisikofødsler hos flergangsfødende.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;


%let just=Ijust;
%let fignavn=&just;
%let tittel=&tema_navn &just;


%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=png);
%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=pdf);

/*****************/
/*** ROBSON  4 ***/
/*****************/

%let par_rob=robson;
%let grp=4;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%let rv1=&tema_navn;
%let type=&par_rob.&grp; /*Angir populasjon/nevner*/
%let tabellvar1=&tema_navn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="&tema" &tabellvar2="Alle flergangsfødende";
%let xlabel=&tema., pr. 1 000 flergangsfødende igangsatt.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let just=Ijust;
%let fignavn=&just;
%let tittel=&tema_navn &just;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=png);
%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=pdf);


/*****************/
/*** ROBSON  9, par0 ***/
/*****************/

%let par_rob=robson;
%let grp=90;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%let rv1=&tema_navn;
%let type=&par_rob.&grp; /*Angir populasjon/nevner*/
%let tabellvar1=&tema_navn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Akutte keisersnitt" &tabellvar2="Fødsler";
%let xlabel=Antall pr. 1 000 førstegangsfødende.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let just=Ijust;
%let fignavn=&just;
%let tittel=&tema_navn &just;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=png);
%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=pdf);


/*****************/
/*** ROBSON  9, par1 ***/
/*****************/

%let par_rob=robson;
%let grp=91;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%let rv1=&tema_navn;
%let type=&par_rob.&grp; /*Angir populasjon/nevner*/
%let tabellvar1=&tema_navn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Akutte keisersnitt" &tabellvar2="Fødsler";
%let xlabel=Antall pr. 1 000 flergangsfødende.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let just=Ijust;
%let fignavn=&just;
%let tittel=&tema_navn &just;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=png);
%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=pdf);

/*
%let just=Just;
%let fignavn=&just;
%let tittel=&tema_navn &just;

%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017);



%let just=Ujust;
%let fignavn=&just;
%let tittel=&tema_navn &just;

%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017);
*/

%let mappe_png=Figurer\png;
%let mappe_pdf=Figurer\pdf;