/* Gjelder alle figurer */
%let tema=apgar7;
%let agg_var=apgar7;
%let nevner=alle;

%let just=Ijust;
%let fignavn=&just;
%let tittel=&tema_navn &just;

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
%let labeltabell=&tabellvar1="Low Apgar" &tabellvar2="Births";
%let xlabel=Number per 1,000 primiparous women.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._IJUST_bohf);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._IJUST_bohf, bildeformat=pdf);

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
%let labeltabell=&tabellvar1="Low Apgar" &tabellvar2="Births";
%let xlabel=Number per 1,000 multiparous women.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._IJUST_bohf);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._IJUST_bohf, bildeformat=pdf);

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
%let labeltabell=&tabellvar1="&tema" &tabellvar2="Births";
%let xlabel=Number per 1,000 primiparous women.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._IJUST_bohf);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._IJUST_bohf, bildeformat=pdf);

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
%let labeltabell=&tabellvar1="&tema" &tabellvar2="Alle førstegangsfødende";
%let xlabel=Number per 1,000 primiparous women.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._IJUST_bohf);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._IJUST_bohf, bildeformat=pdf);

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
%let labeltabell=&tabellvar1="&tema" &tabellvar2="Alle flergangsfødende";
%let xlabel=Number per 1,000 multiparous women.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._IJUST_bohf);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._IJUST_bohf, bildeformat=pdf);

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
%let labeltabell=&tabellvar1="&tema" &tabellvar2="Alle flergangsfødende";
%let xlabel=Number per 1,000 multiparous women.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._IJUST_bohf);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._IJUST_bohf, bildeformat=pdf);



%let mappe_png=Figurer\png;
%let mappe_pdf=Figurer\pdf;