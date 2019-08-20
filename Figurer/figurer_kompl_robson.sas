/* Gjelder alle figurer */
%let tema=kompl_samlet;


%let mappe_png=Figurer\png\ROBSON;
%let mappe_pdf=Figurer\pdf\ROBSON;

/*****************/
/*** ROBSON 1 ***/
/*****************/

%let dsn2=apgar7r1_IJUST_bohf;
%let rv2=apgar7r1;

%let dsn1=rupturr1_IJUST_bohf;
%let rv1=rupturr1;

%let dsn3=blod15_vagr1_IJUST_bohf;
%let rv3=blod15_vagr1;

%merge(ant_datasett=3, dsn_ut=kompl_r1_bohf); 

data kompl_r1_bohf2;
set kompl_r1_bohf;
tot_antall=antall_1+antall_2+antall_3;
rateSnitt=rate_1+rate_2+rate_3;
rateSnitt2=rate_1+rate_2+rate_3;
snittrate=nrate_1+nrate_2+nrate_3;

rate2015=rate_1_2015+rate_2_2015+rate_3_2015;
rate2016=rate_1_2016+rate_2_2016+rate_3_2016;
rate2017=rate_1_2017+rate_2_2017+rate_3_2017;

min=rate2015;
if rate2016 lt min then min=rate2016;
if rate2017 lt min then min=rate2017;

max=rate2015;
if rate2016 gt max then max=rate2016;
if rate2017 gt max then max=rate2017;

run;

%let forbruksmal=tot_antall;
%forholdstall(ds=kompl_r1_bohf2, tab=0);

%let fignavn=;
%let tittel=;
%let rv1=tot_antall;
%let type=robson1; 
%let tabellvar1=tot_antall;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Kompl." &tabellvar2="Fødsler";
%let xlabel=Antall pr. 1 000 fødsler, Robsongruppe 1.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=kompl_r1_bohf2);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=kompl_r1_bohf2, bildeformat=pdf);

/*****************/
/*** ROBSON 3 ***/
/*****************/

%let dsn2=apgar7r3_IJUST_bohf;
%let rv2=apgar7r3;

%let dsn1=rupturr3_IJUST_bohf;
%let rv1=rupturr3;

%let dsn3=blod15_vagr3_IJUST_bohf;
%let rv3=blod15_vagr3;

%merge(ant_datasett=3, dsn_ut=kompl_r3_bohf); 

data kompl_r3_bohf2;
set kompl_r3_bohf;
tot_antall=antall_1+antall_2+antall_3;
rateSnitt=rate_1+rate_2+rate_3;
rateSnitt2=rate_1+rate_2+rate_3;
snittrate=nrate_1+nrate_2+nrate_3;

rate2015=rate_1_2015+rate_2_2015+rate_3_2015;
rate2016=rate_1_2016+rate_2_2016+rate_3_2016;
rate2017=rate_1_2017+rate_2_2017+rate_3_2017;

min=rate2015;
if rate2016 lt min then min=rate2016;
if rate2017 lt min then min=rate2017;

max=rate2015;
if rate2016 gt max then max=rate2016;
if rate2017 gt max then max=rate2017;

run;

%let forbruksmal=tot_antall;
%forholdstall(ds=kompl_r3_bohf2, tab=0);

%let fignavn=;
%let tittel=;
%let rv1=tot_antall;
%let type=robson3; 
%let tabellvar1=tot_antall;
%let tabellvar2=Innbyggere;
%let tabellvariable= &tabellvar1 &tabellvar2;
%let labeltabell=&tabellvar1="Kompl." &tabellvar2="Fødsler";
%let xlabel=Antall pr. 1 000 fødsler, Robsongruppe 3.;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0;
%let skala=;

%let mappe=&mappe_png;
%ratefig(sprak=en, datasett=kompl_r3_bohf2);

%let mappe=&mappe_pdf;
%ratefig(sprak=en, datasett=kompl_r3_bohf2, bildeformat=pdf);




%let mappe_png=Figurer\png;
%let mappe_pdf=Figurer\pdf;