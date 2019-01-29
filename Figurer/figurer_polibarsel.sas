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



/*SAMMENSATT FIGUR, NPR + KUHR, KONTAKTER*/

%let dsn1=helseatl.FH_kuhr_barsel_r;
%let rv1=Kontakter;

%let dsn2=barselkont_tot_bohf;
%let rv2=barselkont_tot;


%merge(ant_datasett=2, dsn_ut=&tema._NPR_KUHR_bohf); 


%let vis_aarsvar_todelt=0;

%let fignavn=NPR_KUHR;
%let type=kons;
%let tittel=;
%let xlabel=Antall kontakter pr. 1000 fødsler.;
%let label_1=Fastlege/legevakt (FL/LV);
%let label_2=Spesialisthelsetj. (SH);
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="FL/LV" &tabellvar2="SH" ;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._NPR_KUHR_bohf, legendplace=location=outside position=bottom down=1);


%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=&tema._NPR_KUHR_bohf, bildeformat=pdf , legendplace=location=outside position=bottom down=1);


%let vis_aarsvar_todelt=1;


/*SAMMENSATT FIGUR, NPR + KUHR, PASIENTER*/

%let dsn1=helseatl.FH_kuhr_barsel_rp;
%let rv1=Pasienter;

%let dsn2=barselkont_tu_bohf;
%let rv2=barselkont_tu;

%let dsn3=helseatl.FH_kuhr_barsel_r;
%let rv3=Kontakter;

%let dsn4=barselkont_tot_bohf;
%let rv4=barselkont_tot;


%merge(ant_datasett=4, dsn_ut=&tema._NPR_KUHR_p_bohf); 

data &tema._NPR_KUHR_p_bohf2;
set &tema._NPR_KUHR_p_bohf;

tot_kont=rate_3+rate_4;
tot_pers=rate_1+rate_2;
k_pr_prs=tot_kont/tot_pers;

run;

%let vis_aarsvar_todelt=0;

%let fignavn=NPR_KUHR;
%let type=pas;
%let tittel=;
%let xlabel=Antall fødende til fastlege/legevakt eller poliklinisk konsultasjon pr. 1000 fødsler.;
%let label_1=Fastlege/legevakt;
%let label_2=Spesialisthelsetj.;
%let tabellvar1=tot_antall;
%let tabellvar2=k_pr_prs;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Kontakter" &tabellvar2="Kont. pr. pas." ;
%let formattabell=&tabellvar1 NLnum8.0 &tabellvar2 NLnum8.1;
%let skala=;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._NPR_KUHR_p_bohf2, legendplace=location=outside position=bottom down=1);


%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=&tema._NPR_KUHR_p_bohf2, bildeformat=pdf , legendplace=location=outside position=bottom down=1);


%let vis_aarsvar_todelt=1;
