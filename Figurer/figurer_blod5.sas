/* Global variables */
%let tema=blod5;
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
%let labeltabell=&tabellvar1=">500 ml" &tabellvar2="F�dsler";
%let xlabel=Antall pr. 1 000 f�rstegangsf�dende med vaginal forl�sning.;
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
%let labeltabell=&tabellvar1=">500 ml" &tabellvar2="F�dsler";
%let xlabel=Antall pr. 1 000 flergangsf�dende med vaginal forl�sning.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;


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
%let labeltabell=&tabellvar1=">500 ml" &tabellvar2="F�dsler";
%let xlabel=Antall pr. 1 000 f�rstegangsf�dende med keisersnitt.;
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
%let labeltabell=&tabellvar1=">500 ml" &tabellvar2="F�dsler";
%let xlabel=Antall pr. 1 000 flergangsf�dende med keisersnitt.;
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

%let tema=blod5_vag;
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
%let labeltabell=&tabellvar1="&tema" &tabellvar2="vaginale f�rstegangsf�dende";
%let xlabel=Antall pr. 1 000 vaginale f�rstegangsf�dende spontan;
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
%let labeltabell=&tabellvar1="&tema" &tabellvar2="vaginale f�rstegangsf�dende";
%let xlabel=Antall pr. 1 000 vaginale f�rstegangsf�dende igangsatt;
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
%let labeltabell=&tabellvar1="&tema" &tabellvar2="vaginale flergangsf�dende";
%let xlabel=Antall pr. 1 000 vaginale flergangsf�dende spontan;
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
%let labeltabell=&tabellvar1="&tema" &tabellvar2="vaginale flergangsf�dende";
%let xlabel=Antall pr. 1 000 vaginale flergangsf�dende igangsatt;
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