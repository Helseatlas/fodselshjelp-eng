/* Global variables */
%let tema=blod15;
%let agg_var=blodning;


/************* NEVNER VAGINALE **************/

%let nevner=vag;  

/* Figurer */

/*****************/
/*** PARITET 0 ***/
/*****************/

%let par_rob=paritet;
%let grp=0;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp,&nevner));

%let rv1=&tema_navn;
%let type=&par_rob.&grp.&nevner; /*Angir populasjon/nevner*/
%let tabellvar1=&tema_navn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Haemorrhage" &tabellvar2="Births";
%let xlabel=Number per 1,000 primiparous women who gave birth vaginally.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;*values=(0 to 60 by 10);

%let just=Ijust;
%let fignavn=&just;
%let tittel=&tema_navn &just;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=png);
%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=pdf);



/*****************/
/*** PARITET 1 ***/
/*****************/


%let par_rob=paritet;
%let grp=1;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp,&nevner));

%let rv1=&tema_navn;
%let type=&par_rob.&grp.&nevner; /*Angir populasjon/nevner*/
%let tabellvar1=&tema_navn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Haemorrhage" &tabellvar2="Births";
%let xlabel=Number per 1,000 multiparous women who gave birth vaginally.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;*values=(0 to 60 by 10);


%let just=Ijust;
%let fignavn=&just;
%let tittel=&tema_navn &just;


%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=png);
%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=pdf);





/************* NEVNER KEISERSNITT **************/
%let nevner=ks;  


/* Figurer */

/*****************/
/*** PARITET 0 ***/
/*****************/

%let par_rob=paritet;
%let grp=0;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp,&nevner));

%let rv1=&tema_navn;
%let type=&par_rob.&grp.&nevner; /*Angir populasjon/nevner*/
%let tabellvar1=&tema_navn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1=">1500 ml" &tabellvar2="Births";
%let xlabel=Antall pr. 1 000 førstegangsfødende med keisersnitt.;
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
/*** PARITET 1 ***/
/*****************/


%let par_rob=paritet;
%let grp=1;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp,&nevner));

%let rv1=&tema_navn;
%let type=&par_rob.&grp.&nevner; /*Angir populasjon/nevner*/
%let tabellvar1=&tema_navn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1=">1500 ml" &tabellvar2="Births";
%let xlabel=Antall pr. 1 000 flergangsfødende med keisersnitt.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;


%let just=Ijust;
%let fignavn=&just;
%let tittel=&tema_navn &just;


%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=png);
%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=pdf);


%let mappe_png=Figurer_eng\png\ROBSON;
%let mappe_pdf=Figurer_eng\pdf\ROBSON;

/*****************/
/*** ROBSON  1 ***/
/*****************/

%let tema=blod15_vag;
%let agg_var=vag_blodning;
%let nevner=vag;  

%let par_rob=robson;
%let grp=1;
%let tema_navn=%sysfunc(cat(&tema,%substr(&par_rob,1,1),&grp));

%let rv1=&tema_navn;
%let type=&par_rob.&grp; /*Angir populasjon/nevner*/
%let tabellvar1=&tema_navn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="&tema" &tabellvar2="vaginale førstegangsfødsler";
%let xlabel=Antall blødning 1500ml+ pr. 1 000 vaginale førstegangsfødsler spontan;
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
%let labeltabell=&tabellvar1="&tema" &tabellvar2="vaginale førstegangsfødsler";
%let xlabel=Antall blødning 1500ml+ pr. 1 000 vaginale førstegangsfødsler igangsatt;
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
%let labeltabell=&tabellvar1="&tema" &tabellvar2="vaginale flergangsfødsler";
%let xlabel=Antall blødning 1500ml+ pr. 1 000 vaginale flergangsfødsler spontan;
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
%let labeltabell=&tabellvar1="&tema" &tabellvar2="vaginale flergangsfødsler";
%let xlabel=Antall blødning 1500ml+ pr. 1 000 vaginale flergangsfødsler igangsatt;
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

%let mappe_png=Figurer_eng\png;
%let mappe_pdf=Figurer_eng\pdf;
