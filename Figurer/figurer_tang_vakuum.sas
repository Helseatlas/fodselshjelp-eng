/* Global variables */
%let tema=tang_vakuum;
%let agg_var=tang_vak;
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
%let labeltabell=&tabellvar1="&tema" &tabellvar2="vag førstegangsfødsler";
%let xlabel=Antall pr. 1 000  førstegangsfødsler.;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema_navn._IJUST_bohf);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema_navn._IJUST_bohf, bildeformat=pdf);

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
%let labeltabell=&tabellvar1="&tema" &tabellvar2="vag flergangsfødsler";
%let xlabel=Antall pr. 1 000  flergangsfødsler.;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema_navn._IJUST_bohf);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema_navn._IJUST_bohf, bildeformat=pdf);

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
%let labeltabell=&tabellvar1="&tema" &tabellvar2="vag førstegangsfødsler";
%let xlabel=Antall pr. 1 000  førstegangsfødsler.;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema_navn._IJUST_bohf);

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
%let labeltabell=&tabellvar1="&tema" &tabellvar2="vag førstegangsfødsler";
%let xlabel=Antall pr. 1 000  førstegangsfødsler.;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema_navn._IJUST_bohf);

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
%let labeltabell=&tabellvar1="&tema" &tabellvar2="vag flergangsfødsler";
%let xlabel=Antall pr. 1 000  flergangsfødsler.;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema_navn._IJUST_bohf);

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
%ratefig(datasett=&tema_navn._IJUST_bohf);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema_navn._IJUST_bohf, bildeformat=pdf);



/*SAMMENSATT FIGUR, TANG OG VAKUUM, PARITET 0*/

%let dsn1=vakp0_IJUST_bohf;
%let rv1=vakp0;

%let dsn2=tangp0_IJUST_bohf;
%let rv2=tangp0;

%merge(ant_datasett=2, dsn_ut=&tema._delt_p0_bohf); 


%let fignavn=;
%let type=p0;
%let tittel=;
%let xlabel=Antall pr. 1 000  førstegangsfødsler.;
%let label_1=Vakuum;
%let label_2=Tang;
%let tabellvar1=tot_antall;
*%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1;* &tabellvar2;
%let labeltabell=&tabellvar1="&tema";* &tabellvar2="Hyst." ;
%let formattabell=&tabellvar1 NLnum8.0;* &tabellvar2 NLnum8.0;
%let skala=;*values=(0 to 18 by 3);

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._delt_p0_bohf);


%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=&tema._delt_p0_bohf, bildeformat=pdf );

/*SAMMENSATT FIGUR, TANG OG VAKUUM, PARITET 1*/

%let dsn1=vakp1_IJUST_bohf;
%let rv1=vakp1;

%let dsn2=tangp1_IJUST_bohf;
%let rv2=tangp1;

%merge(ant_datasett=2, dsn_ut=&tema._delt_p1_bohf); 


%let fignavn=;
%let type=p1;
%let tittel=;
%let xlabel=Antall pr. 1 000  flergangsfødsler.;
%let label_1=Vakuum;
%let label_2=Tang;
%let tabellvar1=tot_antall;
*%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1;* &tabellvar2;
%let labeltabell=&tabellvar1="&tema";* &tabellvar2="Hyst." ;
%let formattabell=&tabellvar1 NLnum8.0;* &tabellvar2 NLnum8.0;
%let skala=;*values=(0 to 18 by 3);

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._delt_p1_bohf);


%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=&tema._delt_p1_bohf, bildeformat=pdf );


