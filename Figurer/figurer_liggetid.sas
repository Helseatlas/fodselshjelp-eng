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
%let tabellvar1=RateSnitt;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Bed days" &tabellvar2="Births";
%let xlabel=Number of bed days per birth.;
%let formattabell=&tabellvar1 comma8.1 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn.&nevner._IJUST_BOHF);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn.&nevner._IJUST_BOHF, bildeformat=pdf);

/*** Lager datasett for Instant Atlas *****/

/*liggetid_vag_p0*/
%Let beskrivelse=liggetid_vag_p0_rate;
data helseatl.IA_FH_&beskrivelse;
  set &tema_navn.&nevner._IJUST_BOHF (keep = bohf rateSnitt &tema_navn.&nevner innbyggere rename=(rateSnitt=Rate &tema_navn.&nevner=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =31;

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

%let fignavn=&nevner;
%let tittel=;
%let rv1=&tema_navn.&nevner;
%let type=&par_rob.&grp; 
%let tabellvar1=RateSnitt;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Bed days" &tabellvar2="Births";
%let xlabel=Number of bed days per birth.;
%let formattabell=&tabellvar1 comma8.1 &tabellvar2 comma8.0;
%let skala=;


%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn.&nevner._IJUST_BOHF);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn.&nevner._IJUST_BOHF, bildeformat=pdf);

/*** Lager datasett for Instant Atlas *****/

/*liggetid_vag_p1*/
%Let beskrivelse=liggetid_vag_p1_rate;
data helseatl.IA_FH_&beskrivelse;
  set &tema_navn.&nevner._IJUST_BOHF (keep = bohf rateSnitt &tema_navn.&nevner innbyggere rename=(rateSnitt=Rate &tema_navn.&nevner=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =32;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;


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
%let tabellvar1=RateSnitt;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Bed days" &tabellvar2="Births";
%let xlabel=Number of bed days per birth.;
%let formattabell=&tabellvar1 comma8.1 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn.&nevner._IJUST_BOHF);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn.&nevner._IJUST_BOHF, bildeformat=pdf);

/*** Lager datasett for Instant Atlas *****/

/*liggetid_ks_p0*/
%Let beskrivelse=liggetid_ks_p0_rate;
data helseatl.IA_FH_&beskrivelse;
  set &tema_navn.&nevner._IJUST_BOHF (keep = bohf rateSnitt &tema_navn.&nevner innbyggere rename=(rateSnitt=Rate &tema_navn.&nevner=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =33;

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

%let fignavn=&nevner;
%let tittel=;
%let rv1=&tema_navn.&nevner;
%let type=&par_rob.&grp; 
%let tabellvar1=RateSnitt;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Bed days" &tabellvar2="Births";
%let xlabel=Number of bed days per birth.;
%let formattabell=&tabellvar1 comma8.1 &tabellvar2 comma8.0;
%let skala=;


%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema_navn.&nevner._IJUST_BOHF);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema_navn.&nevner._IJUST_BOHF, bildeformat=pdf);

/*** Lager datasett for Instant Atlas *****/

/*liggetid_ks_p1*/
%Let beskrivelse=liggetid_ks_p1_rate;
data helseatl.IA_FH_&beskrivelse;
  set &tema_navn.&nevner._IJUST_BOHF (keep = bohf rateSnitt &tema_navn.&nevner innbyggere rename=(rateSnitt=Rate &tema_navn.&nevner=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =34;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;