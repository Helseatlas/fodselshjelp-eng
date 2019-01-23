/*ENKEL RATEFIGUR, ALLE KONSULTASJONER*/

%let tema=barselkont;

%let dsn1=&tema._tu_bohf;
%let rv1=&tema._tu;

%let dsn2=&tema._tot_bohf;
%let rv2=&tema._tot;

%merge(ant_datasett=2, dsn_ut=&tema._bohf);

%let fignavn=;
%let type=pers;
%let tittel=Antall fødende til poliklinisk konsultasjon i barseltiden  pr. 1000 fødsler. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall fødende på poliklinikk i barseltiden, pr. 1000 fødsler. Aldersjusterte rater.;
%let tabellvar1=&tema._tu;
%let tabellvar2=antall_2_1;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Fødende på polikl." &tabellvar2="Kontakter pr. fødende";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.1;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema._bohf);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema._bohf, bildeformat=pdf);




/*ANDEL FØRSTE 7 DAGER E. FØDSEL*/

%let tema=barselkont;

%let dsn1=&tema._tu_bohf;
%let rv1=&tema._tu;

%let dsn2=&tema.7d_tu_bohf;
%let rv2=&tema.7d_tu;

%merge(ant_datasett=2, dsn_ut=&tema.a7d_bohf);

%let Andel=andel_2_1;
%let fignavn=7d;
%let type=pers;
%let tittel=Andel av de fødende med poliklinisk kont. i barseltiden som har hatt en konsultasjon ila de første 7 dagene etter fødsel. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Andel fødende med poliklinisk kont. i barseltiden som har konsultasjon ila de første 7 dager e. fødsel;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvar3=innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Alle på polikl." &tabellvar2="Ila. første 7 d.";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%andelsfig(datasett=&tema.a7d_bohf);


%let mappe=&mappe_pdf;
%andelsfig(datasett=&tema.a7d_bohf, bildeformat=pdf);



