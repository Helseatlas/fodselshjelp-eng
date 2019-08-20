/*ENKEL RATEFIGUR, ALLE KONSULTASJONER*/

%let tema=svkontakt;

%let dsn1=svkontakt_tot_ijust_bohf;
%let rv1=svkontakt_tot;

%let dsn2=svkontakt_priv_ijust_bohf;
%let rv2=svkontakt_priv;

%merge(ant_datasett=2, dsn_ut=&tema._totpriv_bohf); 

%let anno=anno_NPR;
%let fignavn=;
%let type=kons;
%let tittel=Antall polikliniske konsultasjoner i svangerskapet pr fødsel. Aldersstandardiserte rater. Gjennomsnitt for perioden 2015-17.;
%let xlabel= Antall kontakter pr. svangerskap.;
%let tabellvar1=&tema._tot;
%let tabellvar2=andel_2_1;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Kontakter" &tabellvar2="Andel priv";
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 NLpct8.1;
%let skala=values=(0,1,2,3,4,5,6);

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema._totpriv_bohf);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema._totpriv_bohf, bildeformat=pdf);

/*ENKEL RATEFIGUR, ALLE KONSULTASJONER MED ANDEL UTVALGTE KODER*/
/*
%let tema=svkontakt;

%let dsn1=svkontakt_tot_ijust_bohf;
%let rv1=svkontakt_tot;

%let dsn2=svkontr_tot_ijust_bohf;
%let rv2=svkontr_tot;

%merge(ant_datasett=2, dsn_ut=&tema._koder_bohf); 

%let anno=anno_NPR;
%let fignavn=utv_koder;
%let type=kons;
%let tittel=Antall polikliniske konsultasjoner i svangerskapet pr fødsel. Aldersstandardiserte rater. Gjennomsnitt for perioden 2015-17.;
%let xlabel= Antall kontakter pr. svangerskap.;
%let tabellvar1=&tema._tot;
%let tabellvar2=andel_2_1;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Kontakter" &tabellvar2="Utv. koder";
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 NLpct8.1;
%let skala=values=(0,1,2,3,4,5,6,7,8);

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema._koder_bohf);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema._koder_bohf, bildeformat=pdf);
*/
/*ENKEL RATEFIGUR, KONS MED UTV KODER, MED ANDEL UTVALGTE KODER*/
/*
%let tema=svkontakt;

%let dsn2=svkontakt_tot_ijust_bohf;
%let rv2=svkontakt_tot;

%let dsn1=svkontr_tot_ijust_bohf;
%let rv1=svkontr_tot;

%merge(ant_datasett=2, dsn_ut=&tema._koder2_bohf); 

%let anno=anno_NPR;
%let fignavn=med_koder;
%let type=kons;
%let tittel=Antall polikliniske konsultasjoner i svangerskapet pr fødsel. Aldersstandardiserte rater. Gjennomsnitt for perioden 2015-17.;
%let xlabel= Antall kontakter pr. svangerskap.;
%let tabellvar1=svkontr_tot;
%let tabellvar2=andel_1_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Kontakter" &tabellvar2="Utv. koder";
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 NLpct8.1;
%let skala=values=(0,1,2,3,4,5,6,7,8);

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema._koder2_bohf);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema._koder2_bohf, bildeformat=pdf);

*/
/*SAMMENSATT FIGUR, NPR OFF PRIV*/

%let dsn1=svkontakt_off_ijust_bohf;
%let rv1=svkontakt_off;

%let dsn2=svkontakt_priv_ijust_bohf;
%let rv2=svkontakt_priv;

%merge(ant_datasett=2, dsn_ut=&tema._offpriv_bohf); 

%let anno=anno_NPR;
%let fignavn=offpriv;
%let type=kons;
%let tittel=;
%let xlabel=Antall kontakter pr. svangerskap.;
%let label_1=Offentlig sykehus;
%let label_2=Avtalespesialist;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Off. sykehus" &tabellvar2="Avt. Spes" ;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=values=(0,1,2,3,4,5,6);

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._offpriv_bohf, legendplace=location=outside position=bottom down=1);


%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=&tema._offpriv_bohf, bildeformat=pdf , legendplace=location=outside position=bottom down=1);



/*SAMMENSATT FIGUR, NPR + KUHR*/

%let dsn1=helseatl.FH_kuhr_jordmor_r;
%let rv1=Konsultasjoner;

%let dsn2=helseatl.FH_kuhr_lege_r;
%let rv2=Konsultasjoner;

%let dsn3=svkontakt_tot1k_ijust_bohf;
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

%let anno=anno_KUHRNPR;
%let fignavn=NPR_KUHR;
%let type=kons;
%let tittel=;
%let xlabel=Antall kontakter pr. svangerskap.;
%let label_1=Jordmor/fastlege (JM/FL);
%let label_2=Spesialisthelsetj. (SH);
%let tabellvar1=tot_antall;
%let tabellvar2=antall_3;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="JM/FL" &tabellvar2="SH" ;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=values=(0,2,4,6,8,10,12,14);

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

%let anno=anno_KUHRNPR;
%let fignavn=KUHR;
%let type=kons;
%let tittel=;
%let xlabel=Antall kontakter pr. svangerskap.;
%let label_1=Jordmor (JM);
%let label_2=Fastlege/legevakt (FL/LV);
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="JM" &tabellvar2="FL/LV" ;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=values=(0,1,2,3,4,5,6,7,8,9);

%let mappe=&mappe_png;
%ratefig_todeltSoyle(datasett=&tema._KUHR_bohf2, legendplace=location=outside position=bottom down=1);


%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(datasett=&tema._KUHR_bohf2, bildeformat=pdf , legendplace=location=outside position=bottom down=1);


%let vis_aarsvar_todelt=1;



/*ENKEL RATEFIGUR, Fødende med en kontakt*/

%let tema=svkont;

%let rv1=svkont_en;

%let anno=anno_NPR;
%let fignavn=en;
%let type=kons;
%let tittel=Antall fødende med en kontakt i svangerskapet. Aldersstandardiserte rater. Gjennomsnitt for perioden 2015-17.;
%let xlabel= Antall pr. 1000 gravide.;
%let tabellvar1=&rv1;
%let tabellvar2=innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="En kontakt" &tabellvar2="Fødende";
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=svkont_en_ijust_bohf);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=svkont_en_ijust_bohf, bildeformat=pdf);

/*ENKEL RATEFIGUR, Fødende med emer enn 5 kontakter*/

%let tema=svkont;

%let rv1=svkont_mer_fem;

%let anno=anno_NPR;
%let fignavn=mer_fem;
%let type=kons;
%let tittel=Antall fødende med 6 eller flere kontakter i svangerskapet. Aldersstandardiserte rater. Gjennomsnitt for perioden 2015-17.;
%let xlabel= Antall pr. 1000 gravide.;
%let tabellvar1=&rv1;
%let tabellvar2=innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="6 kont. eller mer" &tabellvar2="Fødende";
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=svkont_mer_fem_ijust_bohf);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=svkont_mer_fem_ijust_bohf, bildeformat=pdf);

/*** Lager datasett for Instant Atlas *****/

/*Gravide med 6+ kont i speshelsetj.*/
%Let beskrivelse=mer_fem_svkont_rate;
data helseatl.IA_FH_&beskrivelse;
  set svkont_mer_fem_ijust_bohf (keep = bohf rateSnitt svkont_mer_fem innbyggere rename=(rateSnitt=Rate svkont_mer_fem=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =11;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;

/*Gravide med 1 kont i speshelsetj.*/
%Let beskrivelse=en_svkont_rate;
data helseatl.IA_FH_&beskrivelse;
  set svkont_en_ijust_bohf (keep = bohf rateSnitt svkont_en innbyggere rename=(rateSnitt=Rate svkont_en=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =10;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;

/*Spesialisthelsetjenesten*/
%Let beskrivelse=spes_rate;
data helseatl.IA_FH_&beskrivelse;
  set svkontakt_tot_ijust_bohf (keep = bohf rateSnitt svkontakt_tot innbyggere rename=(rateSnitt=Rate svkontakt_tot=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =9;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;

/*Fastlege/Legevakt*/
%Let beskrivelse=FLLV_rate;
data helseatl.IA_FH_&beskrivelse;
  set helseatl.FH_kuhr_lege_r (keep = bohf rateSnitt Konsultasjoner innbyggere rename=(rateSnitt=Rate Konsultasjoner=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =8;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";

Rate=Rate/1000;
run;

/*Jordmor*/
%Let beskrivelse=jordmor_rate;
data helseatl.IA_FH_&beskrivelse;
  set helseatl.FH_kuhr_jordmor_r (keep = bohf rateSnitt Konsultasjoner innbyggere rename=(rateSnitt=Rate Konsultasjoner=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =7;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";

Rate=Rate/1000;
run;

