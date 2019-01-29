/*ENKEL RATEFIGUR, ALLE KONSULTASJONER*/

%let tema=svkontakt;
%let rv1=&tema._tot;

%let fignavn=;
%let type=kons;
%let tittel=Antall polikliniske konsultasjoner i svangerskapet pr fødsel. Aldersstandardiserte rater. Gjennomsnitt for perioden 2015-17.;
%let xlabel= Polikliniske konsultasjoner i svangerskapet pr. fødsel. Aldersjusterte rater.;
%let tabellvar1=&tema._tot;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Konsultasjoner" &tabellvar2="Fødsler";
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(datasett=&tema._tot_bohf);

%let mappe=&mappe_pdf;
%ratefig(datasett=&tema._tot_bohf, bildeformat=pdf);



/*SAMMENSATT FIGUR, NPR + KUHR*/

%let dsn1=helseatl.FH_kuhr_jordmor_r;
%let rv1=Konsultasjoner;

%let dsn2=helseatl.FH_kuhr_lege_r;
%let rv2=Konsultasjoner;

%let dsn3=svkontakt_tot1k_bohf;
%let rv3=svkontakt_tot1k;


%merge(ant_datasett=3, dsn_ut=&tema._NPR_KUHR_bohf); 

data &tema._NPR_KUHR_bohf2;
set &tema._NPR_KUHR_bohf;

tot_rate=(rate_1+rate_2+rate_3)/1000;
Ntot_rate=(nrate_1+nrate_2+nrate_3)/1000;

rate_1=(rate_1+rate_2)/1000;
nrate_1=(nrate_1+nrate_2)/1000;

andel_rate1=rate_1/tot_rate;

run;

%let vis_aarsvar_todelt=0;

%let fignavn=NPR_KUHR;
%let type=kons;
%let tittel=;
%let xlabel=Antall kontakter pr. fødsel.;
%let label_1=Jordmor/fastlege (JM/FL);
%let label_2=Spesialisthelsetj. (SH);
%let tabellvar1=tot_antall;
%let tabellvar2=antall_3;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="JM/FL" &tabellvar2="SH" ;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=values=(0,2,4,6,8,10,12,14,16);

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._NPR_KUHR_bohf2, legendplace=location=outside position=bottom down=1);


%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=&tema._NPR_KUHR_bohf2, bildeformat=pdf , legendplace=location=outside position=bottom down=1);


%let vis_aarsvar_todelt=1;

/*SAMMENSATT FIGUR, KUHR (JORDMOR + LEGE)*/

%let dsn1=helseatl.FH_kuhr_jordmor_r;
%let rv1=Konsultasjoner;

%let dsn2=helseatl.FH_kuhr_lege_r;
%let rv2=Konsultasjoner;

%merge(ant_datasett=2, dsn_ut=&tema._KUHR_bohf); 

data &tema._KUHR_bohf2;
set &tema._KUHR_bohf;

tot_rate=tot_rate/1000;
Ntot_rate=Ntot_rate/1000;

rate_1=rate_1/1000;
nrate_1=nrate_1/1000;

run;

%let vis_aarsvar_todelt=0;

%let fignavn=KUHR;
%let type=kons;
%let tittel=;
%let xlabel=Antall kontakter pr. fødsel.;
%let label_1=Jordmor (JM);
%let label_2=Fastlege/legevakt (FL/LV);
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="JM" &tabellvar2="FL/LV" ;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=values=(0,1,2,3,4,5,6,7,8,9);

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._KUHR_bohf2, legendplace=location=outside position=bottom down=1);


%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=&tema._KUHR_bohf2, bildeformat=pdf , legendplace=location=outside position=bottom down=1);


%let vis_aarsvar_todelt=1;





