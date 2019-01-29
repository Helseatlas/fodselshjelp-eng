

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

%forholdstall;

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

%forholdstall;
