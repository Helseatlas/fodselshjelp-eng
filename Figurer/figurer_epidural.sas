


/************* NEVNER VAGINALE **************/
%let tema=anestesi_vag;
%let agg_var=epi_vag;

%let nevner=vag;  

%let mappe_png=Figurer\png;
%let mappe_pdf=Figurer\pdf;

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
%let labeltabell=&tabellvar1="Epidural" &tabellvar2="F�dsler";
%let xlabel=Antall pr. 1 000 f�rstegangsf�dende som f�dte vaginalt.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;*values=(0 to 700 by 100);

%let just=Ijust;
%let fignavn=&just;
%let tittel=&tema_navn &just;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=png);
%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=pdf);

/*** Lager datasett for Instant Atlas *****/

/*epidural_p0*/
%Let beskrivelse=epidural_p0_rate;
data helseatl.IA_FH_&beskrivelse;
  set &tema_navn._&just._bohf (keep = bohf rateSnitt &tema_navn innbyggere rename=(rateSnitt=Rate &tema_navn=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =27;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;


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
%let labeltabell=&tabellvar1="Epidural" &tabellvar2="F�dsler";
%let xlabel=Antall pr. 1 000 flergangsf�dende som f�dte vaginalt.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;*values=(0 to 700 by 100);


%let just=Ijust;
%let fignavn=&just;
%let tittel=&tema_navn &just;


%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=png);
%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=pdf);


/*** Lager datasett for Instant Atlas *****/

/*epidural_p1*/
%Let beskrivelse=epidural_p1_rate;
data helseatl.IA_FH_&beskrivelse;
  set &tema_navn._&just._bohf (keep = bohf rateSnitt &tema_navn innbyggere rename=(rateSnitt=Rate &tema_navn=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =28;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;


/************* NEVNER KEISERSNITT **************/
%let tema=anestesi_ksak;
%let agg_var=epi_ksakutt;
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
%let labeltabell=&tabellvar1="Epidural" &tabellvar2="F�dsler";
%let xlabel=Antall pr. 1 000 f�rstegangsf�dende med akutt keisersnitt.;
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
%let labeltabell=&tabellvar1="Epidural" &tabellvar2="F�dsler";
%let xlabel=Antall pr. 1 000 flergangsf�dende med akutt keisersnitt.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;


%let just=Ijust;
%let fignavn=&just;
%let tittel=&tema_navn &just;


%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=png);
%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=pdf);



%let mappe_png=Figurer\png\ROBSON;
%let mappe_pdf=Figurer\pdf\ROBSON;

%let tema=anestesi;
%let agg_var=epidural;

%let nevner=alle;  


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
%let labeltabell=&tabellvar1="Epidural" &tabellvar2="F�dsler";
%let xlabel=Antall pr. 1 000 f�dsler, Robsongruppe 1.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._IJUST_bohf, bildeformat=png);

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
%let labeltabell=&tabellvar1="Epidural" &tabellvar2="F�dsler";
%let xlabel=Antall pr. 1 000  f�rstegangsf�dsler.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._IJUST_bohf, bildeformat=png);

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
%let labeltabell=&tabellvar1="Epidural" &tabellvar2="F�dsler";
%let xlabel=Antall pr. 1 000 f�dsler, Robsongruppe 3.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._IJUST_bohf, bildeformat=png);

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
%let labeltabell=&tabellvar1="&tema" &tabellvar2="vag flergangsf�dsler";
%let xlabel=Antall pr. 1 000  flergangsf�dsler.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._IJUST_bohf, bildeformat=png);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._IJUST_bohf, bildeformat=pdf);

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
%let labeltabell=&tabellvar1="Epidural" &tabellvar2="F�dsler";
%let xlabel=Antall pr. 1 000  f�rstegangsf�dsler.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._IJUST_bohf, bildeformat=png);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._IJUST_bohf, bildeformat=pdf);

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
%let labeltabell=&tabellvar1="Epidural" &tabellvar2="F�dsler";
%let xlabel=Antall pr. 1 000  flergangsf�dsler.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn._IJUST_bohf, bildeformat=png);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn._IJUST_bohf, bildeformat=pdf);

%let mappe_png=Figurer\png;
%let mappe_pdf=Figurer\pdf;