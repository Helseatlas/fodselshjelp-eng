/*TODELTE FIGURER*/

%let tema=ks;


/*SAMMENSATT FIGUR, KS (AKUTT+ELEKTIVT) og INSTRUMENTELL FORLØSNING (TANG+VAK), PARITET 0*/

%let dsn1=ks_akuttp0_IJUST_bohf;
%let rv1=ks_akuttp0;

%let dsn2=ks_planlagtp0_IJUST_bohf;
%let rv2=ks_planlagtp0;

%merge(ant_datasett=2, dsn_ut=ks_delt_p0_bohf); 

data ks_delt_p0_bohf;
  set ks_delt_p0_bohf(keep=bohf tot:);
  rename tot_rate=RateSnitt
  		 tot_rate_2015=rate2015
  		 tot_rate_2016=rate2016
  		 tot_rate_2017=rate2017
		 tot_antall=ks_p0;
run;


%let dsn1=ks_delt_p0_bohf;
%let rv1=ks_p0;

%let dsn2=tang_vakuump0_IJUST_bohf;
%let rv2=tang_vakuump0;

%merge(ant_datasett=2, dsn_ut=ks_tv_p0_bohf); 

%let fignavn=ks_tv;
%let type=p0;
%let tittel=;
%let xlabel=Antall pr. 1 000  førstegangsfødende.;
%let label_1=ks;
%let label_2=tangvak;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Keisersnitt" &tabellvar2="Instr.forl." ;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;*values=(0 to 18 by 3);

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=ks_tv_p0_bohf);


%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=ks_tv_p0_bohf, bildeformat=pdf );


/*SAMMENSATT FIGUR, KS (AKUTT+ELEKTIVT) og INSTRUMENTELL FORLØSNING (TANG+VAK), PARITET 1*/

%let dsn1=ks_akuttp1_IJUST_bohf;
%let rv1=ks_akuttp1;

%let dsn2=ks_planlagtp1_IJUST_bohf;
%let rv2=ks_planlagtp1;

%merge(ant_datasett=2, dsn_ut=ks_delt_p1_bohf); 

data ks_delt_p1_bohf;
  set ks_delt_p1_bohf(keep=bohf tot:);
  rename tot_rate=RateSnitt
  		 tot_rate_2015=rate2015
  		 tot_rate_2016=rate2016
  		 tot_rate_2017=rate2017
		 tot_antall=ks_p1;
run;


%let dsn1=ks_delt_p1_bohf;
%let rv1=ks_p1;

%let dsn2=tang_vakuump1_IJUST_bohf;
%let rv2=tang_vakuump1;

%merge(ant_datasett=2, dsn_ut=ks_tv_p1_bohf); 

%let fignavn=ks_tv;
%let type=p1;
%let tittel=;
%let xlabel=Antall pr. 1 000 flergangsfødende.;
%let label_1=ks;
%let label_2=tangvak;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Keisersnitt" &tabellvar2="Instr.forl." ;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;*values=(0 to 18 by 3);

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=ks_tv_p1_bohf);


%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=ks_tv_p1_bohf, bildeformat=pdf );



