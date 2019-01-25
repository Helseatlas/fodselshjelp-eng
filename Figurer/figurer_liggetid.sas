/* Global variables */
%let tema=liggetid;
%let agg_var=liggetid;

/**********************/
/*** VAGINAL FØDSEL ***/
/**********************/

%let nevner=vag;

/* Figurer */

/*****************/
/*** PARITET 0 ***/
/*****************/

%let par_rob=paritet;
%let grp=0;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%let fignavn=&nevner;
%let tittel=;
%let rv1=&tema_navn.&nevner;
%let type=&par_rob.&grp; 
%let tabellvar1=&tema_navn.&nevner;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Liggetid" &tabellvar2="Fødsler";
%let xlabel=Antall liggedøgn pr. fødsel.;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema_navn.&nevner._IJUST_BOHF);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema_navn.&nevner._IJUST_BOHF, bildeformat=pdf);

/*****************/
/*** PARITET 1 ***/
/*****************/

%let par_rob=paritet;
%let grp=1;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%let fignavn=&nevner;
%let tittel=;
%let rv1=&tema_navn.&nevner;
%let type=&par_rob.&grp; 
%let tabellvar1=&tema_navn.&nevner;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Liggetid" &tabellvar2="Fødsler";
%let xlabel=Antall liggedøgn pr. fødsel.;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;


%let mappe=&mappe_png;
%ratefig(datasett=&tema_navn.&nevner._IJUST_BOHF);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema_navn.&nevner._IJUST_BOHF, bildeformat=pdf);


/**********************/
/*** KEISERSNITT ***/
/**********************/

%let nevner=ks;

/* Figurer */

/*****************/
/*** PARITET 0 ***/
/*****************/

%let par_rob=paritet;
%let grp=0;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%let fignavn=&nevner;
%let tittel=;
%let rv1=&tema_navn.&nevner;
%let type=&par_rob.&grp; 
%let tabellvar1=&tema_navn.&nevner;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Liggetid" &tabellvar2="Fødsler";
%let xlabel=Antall liggedøgn pr. fødsel.;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema_navn.&nevner._IJUST_BOHF);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema_navn.&nevner._IJUST_BOHF, bildeformat=pdf);

/*****************/
/*** PARITET 1 ***/
/*****************/

%let par_rob=paritet;
%let grp=1;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%let fignavn=&nevner;
%let tittel=;
%let rv1=&tema_navn.&nevner;
%let type=&par_rob.&grp; 
%let tabellvar1=&tema_navn.&nevner;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Liggetid" &tabellvar2="Fødsler";
%let xlabel=Antall liggedøgn pr. fødsel.;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;


%let mappe=&mappe_png;
%ratefig(datasett=&tema_navn.&nevner._IJUST_BOHF);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema_navn.&nevner._IJUST_BOHF, bildeformat=pdf);