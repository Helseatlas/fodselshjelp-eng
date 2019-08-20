
%Let innbyggerfil=helseatl.polibarsel_fodsler;


/* Oppslag aldersbegrensning */
%Let Alderskategorier=31;

%Let rate_pr=1000;

/*********
 * Total kontakter i barseltid *
**********/

%let agg_var=barselkont;
%let Ratefil=helseatl.FH_&agg_var;

%let RV_variabelnavn= tot; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._&RV_variabelnavn; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._&RV_variabelnavn; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd barselkont_tot_NORGE;
run;

data &forbruksmal._bohf;
set &forbruksmal._ijust_bohf;
run;

%forholdstall(ds=&forbruksmal._ijust_bohf, tab=0);

/*********
 * Total personer m polikl kontakt i barseltid *
**********/

%let agg_var=barselkont;
%let Ratefil=helseatl.FH_&agg_var;

%let RV_variabelnavn= tot_unik; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._tu; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._tu; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd barselkont_tu_NORGE;
run;

data &forbruksmal._bohf;
set &forbruksmal._ijust_bohf;
run;

%forholdstall(ds=&forbruksmal._ijust_bohf, tab=0);

/*********
 * Total personer m polikl kontakt første 7 dager i barseltid *
**********/

%let agg_var=barselkont7d;
%let Ratefil=helseatl.FH_&agg_var;

%let RV_variabelnavn= tot_unik; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._tu; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._tu; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;



proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd barselkont7d_tu_NORGE;
run;


/*%forholdstall;*/

/*********
 * Total personer m døgnopphold i barseltid *
**********/

%let agg_var=barseldogn;
%let Ratefil=helseatl.FH_&agg_var;

%let RV_variabelnavn= tot_unik; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._tu; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._tu; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd barselkont_tu_NORGE;
run;

data &forbruksmal._bohf;
set &forbruksmal._ijust_bohf;
run;

%forholdstall(ds=&forbruksmal._ijust_bohf, tab=0);


/*********
 * Total personer m døgnopphold i barseltid *
**********/

%let agg_var=barseldogn;
%let Ratefil=helseatl.FH_&agg_var;

%let RV_variabelnavn= tot; /*navn på ratevariabel i det aggregerte datasettet*/
%Let ratevariabel = &agg_var._tot; /*Brukes til å lage "pene" overskrifter*/
%Let forbruksmal = &agg_var._tot; /*Brukes til å lage tabell-overskrift i Årsvarfig, gir også navn til 'ut'-datasett*/

%utvalgx;
%omraadeNorge;
%rateberegninger;

proc datasets nolist;
delete RV: Norge: figur: Andel Alder: Bo: HN: Kom: Fylke: VK: bydel: snudd barselkont_tu_NORGE;
run;

data &forbruksmal._bohf;
set &forbruksmal._ijust_bohf;
run;

%forholdstall(ds=&forbruksmal._ijust_bohf, tab=0);


