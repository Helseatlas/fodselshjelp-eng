

%Let innbyggerfil=helseatl.svkont_fodsler;
%Let Alderskategorier=31;
%Let rate_pr=1;


/*ALLE KONTAKTER*/

%let agg_var=svkontakt;
%let Ratefil=helseatl.FH_&agg_var;

%let RV_variabelnavn= tot; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd svkontakt_tot_NORGE;
run;

%forholdstall(ds=&forbruksmal._ijust_bohf, tab=1);


/*PRIV KONTAKTER*/

%let agg_var=svkontakt;
%let Ratefil=helseatl.FH_&agg_var;

%let RV_variabelnavn= priv; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd svkontakt_tot_NORGE;
run;

%forholdstall(ds=&forbruksmal._ijust_bohf, tab=1);

/*OFF KONTAKTER*/

%let agg_var=svkontakt;
%let Ratefil=helseatl.FH_&agg_var;

%let RV_variabelnavn= off; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd svkontakt_tot_NORGE;
run;

%forholdstall(ds=&forbruksmal._ijust_bohf, tab=1);


/*ALLE KONTAKTER MED UTVALGTE KODER*/

%let agg_var=svkontr;
%let Ratefil=helseatl.FH_&agg_var;

%let RV_variabelnavn= tot; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd svkontakt_tot_NORGE;
run;

%forholdstall(ds=&forbruksmal._ijust_bohf, tab=1);



/*Kjører på nytt med rate pr. 1000 for sammensatt figur med KUHR-data*/
%Let rate_pr=1000;


/*ALLE KONTAKTER*/

%let agg_var=svkontakt;
%let Ratefil=helseatl.FH_&agg_var;

%let RV_variabelnavn= tot; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn.1k; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn.1k; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd svkontakt_tot_NORGE;
run;


%forholdstall(ds=&forbruksmal._ijust_bohf, tab=1);




*rater for svangerskap med hhv 1, 2-5 og mer enn 5 kontakter;

%Let innbyggerfil=helseatl.svkont_fodsler;
%Let aldersspenn=in(14:60);
%Let Alderskategorier=30;
%Let rate_pr=1000;

/*Ingen KONTAKTER*/

%let Ratefil=helseatl.FH_svkont_andel;

/*En KONTAKT*/


%let RV_variabelnavn= en_kontakt; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = svkont_&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = svkont_en; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd svkontakt_tot_NORGE;
run;

%forholdstall(ds=&forbruksmal._ijust_bohf, tab=1);

/*2-5 KONTAKTER*/


%let RV_variabelnavn= to_fem_kontakter; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = svkont_&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = svkont_to_fem; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd svkontakt_tot_NORGE;
run;

%forholdstall(ds=&forbruksmal._ijust_bohf, tab=1);


/*Mer enn 5 KONTAKTER*/


%let RV_variabelnavn= mer_fem_kontakter; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = svkont_&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = svkont_mer_fem; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd svkontakt_tot_NORGE;
run;

%forholdstall(ds=&forbruksmal._ijust_bohf, tab=1);


