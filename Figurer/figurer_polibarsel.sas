/*ENKEL RATEFIGUR, UNIKE PASIENTER*/

%let tema=barselkont;

%let dsn1=&tema._tu_ijust_bohf;
%let rv1=&tema._tu;

%let dsn2=&tema._tot_ijust_bohf;
%let rv2=&tema._tot;

%let dsn3=&tema.7d_tu_ijust_bohf;
%let rv3=&tema.7d_tu;

%merge(ant_datasett=3, dsn_ut=&tema._bohf);

%let anno=anno_NPR;
%let fignavn=;
%let type=pers;
%let tittel=Antall fødende til poliklinisk konsultasjon i barseltiden  pr. 1000 fødsler. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall på poliklinikk i barseltiden, pr. 1000 fødsler.;
%let tabellvar1=&tema._tu;
%let tabellvar2=andel_3_1;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Antall på polikl." &tabellvar2="Andel uke 1";
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 NLpct8.1;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema._bohf);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema._bohf, bildeformat=pdf);

/*** Lager datasett for Instant Atlas *****/

/*barselkont_f_poli*/
%Let beskrivelse=barselkont_f_poli_rate;
data helseatl.IA_FH_&beskrivelse;
  set &tema._tu_ijust_bohf (keep = bohf rateSnitt &tema._tu innbyggere rename=(rateSnitt=Rate &tema._tu=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =35;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;


/*ENKEL RATEFIGUR, UNIKE PASIENTER DØGNOPPHOLD*/

%let tema=barseldogn;

%let dsn1=&tema._tu_ijust_bohf;
%let rv1=&tema._tu;

%let anno=anno_NPR;
%let fignavn=dogn;
%let type=pers;
%let tittel=Antall fødende med reinnleggelse i barseltiden  pr. 1000 fødsler. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall fødende med reinnleggelse i barseltiden, pr. 1000 fødsler.;
%let tabellvar1=&tema._tu;
*%let tabellvar2=andel_3_1;
%let tabellvariable= &tabellvar1;* &tabellvar2;
%let labeltabell=&tabellvar1="Innlagte";* &tabellvar2="Andel uke 1";
%let formattabell=&tabellvar1 comma8.0;* &tabellvar2 NLpct8.1;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema._tu_ijust_bohf);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema._tu_ijust_bohf, bildeformat=pdf);

/*ENKEL RATEFIGUR, DØGNOPPHOLD*/

%let tema=barseldogn;

%let dsn1=&tema._tot_ijust_bohf;
%let rv1=&tema._tot;

%let anno=anno_NPR;
%let fignavn=dogn;
%let type=innl;
%let tittel=Antall reinnleggelser i barseltiden  pr. 1000 fødsler. Aldersstandardiserte rater. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall reinnleggelser i barseltiden, pr. 1000 fødsler.;
%let tabellvar1=&tema._tot;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Reinnleggelser" &tabellvar2="Fødsler";
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema._tot_ijust_bohf);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema._tot_ijust_bohf, bildeformat=pdf);

/*** Lager datasett for Instant Atlas *****/

/*barseldogn_reinnl*/
%Let beskrivelse=barseldogn_reinnl_rate;
data helseatl.IA_FH_&beskrivelse;
  set &tema._tot_ijust_bohf (keep = bohf rateSnitt &tema._tot innbyggere rename=(rateSnitt=Rate &tema._tot=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =37;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;

/*ENKEL RATEFIGUR, UNIKE PASIENTER BARN*/

%let tema=barn;

%let dsn1=helseatl.FH_&tema._unik_poli_6uker;
%let rv1=&tema._unik_poli;

%let dsn2=helseatl.FH_&tema._dagpoli_6uker;
%let rv2=&tema._dagpoli;

%let dsn3=helseatl.FH_&tema._unik_poli_1uke_6uker;
%let rv3=&tema._unik_poli_1uke;

%merge(ant_datasett=3, dsn_ut=&tema._bohf);

%let anno=anno_NPR;
%let fignavn=;
%let type=pers;
%let tittel=Antall nyfødte til poliklinisk konsultasjon i barseltiden  pr. 1000 fødsler. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall nyfødte på poliklinikk i barseltiden, pr. 1000 fødsler.;
%let tabellvar1=&tema._unik_poli;
%let tabellvar2=andel_3_1;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Nyfødte på polikl." &tabellvar2="Andel uke 1";
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 NLpct8.1;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema._bohf);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema._bohf, bildeformat=pdf);

/*** Lager datasett for Instant Atlas *****/

/*barselkont_nyf_poli*/
%Let beskrivelse=barselkont_nyf_poli_rate;
data helseatl.IA_FH_&beskrivelse;
  set helseatl.FH_&tema._unik_poli_6uker (keep = bohf rateSnitt &tema._unik_poli innbyggere rename=(rateSnitt=Rate &tema._unik_poli=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =36;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;

/*ENKEL RATEFIGUR, INNLEGGELSER BARN*/

%let tema=barn;

%let dsn1=helseatl.FH_&tema._dogn_6uker;
%let rv1=&tema._dogn;

%let dsn2=helseatl.FH_&tema._etter_liggetid_6uker;
%let rv2=&tema._etter_liggetid;

%merge(ant_datasett=2, dsn_ut=&tema._dogn_bohf);

%let anno=anno_NPR;
%let fignavn=dogn;
%let type=innl;
%let tittel=Antall reinnleggelser av nyfødte i barseltiden  pr. 1000 fødsler. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Antall reinnleggelser av nyfødte i barseltiden, pr. 1000 fødsler.;
%let tabellvar1=&tema._dogn;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Reinnleggelser" &tabellvar2="Nyfødte";
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema._dogn_bohf);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema._dogn_bohf, bildeformat=pdf);

/*** Lager datasett for Instant Atlas *****/

/*barselkont_nyf_poli*/
%Let beskrivelse=barseldogn_nyf_reinnl_rate;
data helseatl.IA_FH_&beskrivelse;
  set helseatl.FH_&tema.2_dogn_6uker (keep = bohf rateSnitt &tema.2_dogn innbyggere rename=(rateSnitt=Rate &tema.2_dogn=Antall)); 

BoHF_Navn=vvalue(BoHF);
Gruppe = 2;
Niva =39;

numeric = "numeric";
Tom_rad = "";
Tom_rute = "";
run;

/*ANDEL FØRSTE 7 DAGER E. FØDSEL*/

%let tema=barselkont;

%let dsn1=&tema._tu_ijust_bohf;
%let rv1=&tema._tu;

%let dsn2=&tema.7d_tu_ijust_bohf;
%let rv2=&tema.7d_tu;

%merge(ant_datasett=2, dsn_ut=&tema.a7d_bohf);

%let anno=anno_NPR;
%let Andel=andel_2_1;
%let fignavn=7d;
%let type=pers;
%let tittel=Andel av de fødende med poliklinisk kont. i barseltiden som har hatt en konsultasjon ila de første 7 dagene etter fødsel. Gjennomsnitt per år i perioden 2015-17.;
%let xlabel= Andel på poliklinikk ila de første 7 dager e. fødsel;
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvar3=innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Alle på polikl." &tabellvar2="Ila. første 7 d.";
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%andelsfig(datasett=&tema.a7d_bohf);


%let mappe=&mappe_pdf;
%andelsfig(datasett=&tema.a7d_bohf, bildeformat=pdf);



/*SAMMENSATT FIGUR, NPR + KUHR, KONTAKTER*/

%let dsn1=helseatl.FH_kuhr_barsel_r;
%let rv1=Kontakter;

%let dsn2=barselkont_tot_ijust_bohf;
%let rv2=barselkont_tot;


%merge(ant_datasett=2, dsn_ut=&tema._NPR_KUHR_bohf); 


%let vis_aarsvar_todelt=0;

%let anno=anno_KUHRNPR;
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
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(sprak=en, datasett=&tema._NPR_KUHR_bohf, legendplace=location=outside position=bottom down=1);


%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(sprak=en, datasett=&tema._NPR_KUHR_bohf, bildeformat=pdf , legendplace=location=outside position=bottom down=1);

/*SAMMENSATT FIGUR, NPR + KUHR MED W99, KONTAKTER*/

%let dsn1=helseatl.FH_kuhr_barsel_r;
%let rv1=Kontakter;

%let dsn2=helseatl.FH_kuhr_w99;
%let rv2=Kontakter;

%let dsn3=barselkont_tot_ijust_bohf;
%let rv3=barselkont_tot;


%merge(ant_datasett=3, dsn_ut=&tema._NPR_KUHRW99_bohf); 

data &tema._NPR_KUHRW99_bohf;
set &tema._NPR_KUHRW99_bohf;

tot_rate=rate_1+rate_2+rate_3;
Ntot_rate=nrate_1+nrate_2+nrate_3;

rate_1=rate_1+rate_2;
nrate_1=nrate_1+nrate_2;

antall_1=antall_1+antall_2;

run;

%let vis_aarsvar_todelt=0;

%let anno=anno_KUHRNPR;
%let fignavn=NPR_KUHRW99;
%let type=kons;
%let tittel=;
%let xlabel=Antall kontakter pr. 1000 fødsler.;
%let label_1=Fastlege/legevakt (FL/LV);
%let label_2=Spesialisthelsetj. (SH);
%let tabellvar1=antall_1;
%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="FL/LV" &tabellvar2="SH" ;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(sprak=en, datasett=&tema._NPR_KUHRW99_bohf, legendplace=location=outside position=bottom down=1);


%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(sprak=en, datasett=&tema._NPR_KUHRW99_bohf, bildeformat=pdf , legendplace=location=outside position=bottom down=1);


%let vis_aarsvar_todelt=1;


/*SAMMENSATT FIGUR, NPR + KUHR, PASIENTER*/

%let dsn1=helseatl.FH_kuhr_barsel_rp;
%let rv1=Pasienter;

%let dsn2=barselkont_tu_ijust_bohf;
%let rv2=barselkont_tu;

%let dsn3=helseatl.FH_kuhr_barsel_r;
%let rv3=Kontakter;

%let dsn4=barselkont_tot_ijust_bohf;
%let rv4=barselkont_tot;


%merge(ant_datasett=4, dsn_ut=&tema._NPR_KUHR_p_bohf); 

data &tema._NPR_KUHR_p_bohf2;
set &tema._NPR_KUHR_p_bohf;

tot_kont=rate_3+rate_4;
tot_pers=rate_1+rate_2;
k_pr_prs=tot_kont/tot_pers;

run;

%let vis_aarsvar_todelt=0;

%let anno=anno_KUHRNPR;
%let fignavn=NPR_KUHR;
%let type=pas;
%let tittel=;
%let xlabel=Antall fødende til fastlege/legevakt eller poliklinikk pr. 1000 fødsler.;
%let label_1=Fastlege/legevakt;
%let label_2=Spesialisthelsetj.;
%let tabellvar1=tot_antall;
%let tabellvar2=k_pr_prs;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Kontakter" &tabellvar2="Kont. pr. pas." ;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.1;
%let skala=;

%let mappe=&mappe_png;
%ratefig_todeltSoyle(sprak=en, datasett=&tema._NPR_KUHR_p_bohf2, legendplace=location=outside position=bottom down=1);


%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(sprak=en, datasett=&tema._NPR_KUHR_p_bohf2, bildeformat=pdf , legendplace=location=outside position=bottom down=1);


%let vis_aarsvar_todelt=1;

/*KUHR, PASIENTER*/

%let dsn1=helseatl.FH_kuhr_barsel_rp;
%let rv1=Pasienter;

%let dsn2=helseatl.FH_kuhr_barsel_r;
%let rv2=Kontakter;


%merge(ant_datasett=2, dsn_ut=&tema._KUHR_p_bohf); 

data &tema._KUHR_p_bohf2;
set &tema._KUHR_p_bohf;

k_pr_prs=rate_2/rate_1;

run;

/*Setter makrovariabel forbruksmal lik rv1 for at forholdstallmakro skal funke*/
%let forbruksmal=Pasienter;

%forholdstall(ds=&tema._KUHR_p_bohf2, tab=0);

%let anno=anno_KUHRNPR;
%let fignavn=KUHR;
%let type=pas;
%let tittel=;
%let xlabel=Antall til fastlege/legevakt pr. 1000 fødsler.;
%let tabellvar1=antall_1;
%let tabellvar2=k_pr_prs;
%let tabellvariable= &tabellvar1;* &tabellvar2;
%let labeltabell=&tabellvar1="Antall hos fastlege/legevakt";* &tabellvar2="Kont. pr. pas." ;
%let formattabell=&tabellvar1 comma8.0;* &tabellvar2 comma8.1;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=&tema._KUHR_p_bohf2);


%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=&tema._KUHR_p_bohf2, bildeformat=pdf);
