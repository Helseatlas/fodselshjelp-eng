/* Global variables */
%let tema=indusert;
%let agg_var=ind;
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
%let labeltabell=&tabellvar1="Indusert" &tabellvar2="Fødsler";
%let xlabel=&tema., pr. 1 000  førstegangsfødende.;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=values=(0 to 300 by 50);

%let just=Ijust;
%let fignavn=&just;
%let tittel=&tema_navn &just;

%let mappe=&mappe_png;
%ratefig(datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=png);
%let mappe=&mappe_pdf;
%ratefig(datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=pdf);

/*** Lager datasett for Instant Atlas *****/

/*Indusert_p0*/
%Let beskrivelse=indusert_p0_rate;
data helseatl.IA_FH_&beskrivelse;
  set &tema_navn._&just._bohf (keep = bohf rateSnitt &tema_navn innbyggere rename=(rateSnitt=Rate &tema_navn=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =19;

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
%let labeltabell=&tabellvar1="Indusert" &tabellvar2="Fødsler";
%let xlabel=&tema., pr. 1 000  flergangsfødende.;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=values=(0 to 300 by 50);


%let just=Ijust;
%let fignavn=&just;
%let tittel=&tema_navn &just;


%let mappe=&mappe_png;
%ratefig(datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=png);
%let mappe=&mappe_pdf;
%ratefig(datasett=&tema_navn._&just._bohf, aar1=2015, aar2=2016, aar3=2017, bildeformat=pdf);


/*** Lager datasett for Instant Atlas *****/

/*Indusert_p1*/
%Let beskrivelse=indusert_p1_rate;
data helseatl.IA_FH_&beskrivelse;
  set &tema_navn._&just._bohf (keep = bohf rateSnitt &tema_navn innbyggere rename=(rateSnitt=Rate &tema_navn=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =20;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;

