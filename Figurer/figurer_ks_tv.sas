%include "&filbane.makroer\ratefig_todeltSoyle.sas";

/*TODELTE FIGURER*/

%let tema=ks;


/*SAMMENSATT FIGUR, KS (kun AKUTT) og INSTRUMENTELL FORLØSNING (TANG+VAK), PARITET 0*/

%let dsn1=ks_akuttp0_IJUST_bohf;
%let rv1=ks_akuttp0;

%let dsn2=tang_vakuump0_IJUST_bohf;
%let rv2=tang_vakuump0;

%merge(ant_datasett=2, dsn_ut=ks_tv_p0_bohf); 

%let fignavn=ksakutt_tv;
%let type=p0;
%let tittel=;
%let xlabel=Antall pr. 1 000 førstegangsfødende.;
%let label_1=Akutt KS;
%let label_2=Instrumentell;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Akutt KS" &tabellvar2="Instr." ;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;*values=(0 to 18 by 3);

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=ks_tv_p0_bohf);


%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=ks_tv_p0_bohf, bildeformat=pdf );


/*SAMMENSATT FIGUR, KS (kun AKUTT) og INSTRUMENTELL FORLØSNING (TANG+VAK), PARITET 1*/

%let dsn1=ks_akuttp1_IJUST_bohf;
%let rv1=ks_akuttp1;

%let dsn2=tang_vakuump1_IJUST_bohf;
%let rv2=tang_vakuump1;

%merge(ant_datasett=2, dsn_ut=ks_tv_p1_bohf); 

%let fignavn=ksakutt_tv;
%let type=p1;
%let tittel=;
%let xlabel=Antall pr. 1 000 flergangsfødende.;
%let label_1=Akutt KS;
%let label_2=Instrumentell;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Akutt KS" &tabellvar2="Instr." ;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;*values=(0 to 18 by 3);

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=ks_tv_p1_bohf);


%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=ks_tv_p1_bohf, bildeformat=pdf );



