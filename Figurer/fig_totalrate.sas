%let tema=st_inngr;

/*SAMMENSATT FIGUR, PARITET 0*/

%let dsn1=ks_akuttp0_IJUST_bohf;
%let rv1=ks_akuttp0;

%let dsn2=tang_vakuump0alle_IJUST_bohf;
%let rv2=tang_vakuump0alle;

%let dsn3=ks_planlagtp0_IJUST_bohf;
%let rv3=ks_planlagtp0;

%let dsn4=ukomplp0_IJUST_bohf;
%let rv4=ukomplp0;

%merge(ant_datasett=4, dsn_ut=&tema._p0_bohf); 

data &tema._p0_bohf2;
set &tema._p0_bohf;
tot_rate=rate_1+rate_2+rate_3+rate_4;
ntot_rate=nrate_1+nrate_2+nrate_3+nrate_4;
rate_1=rate_4;
nrate_1=nrate_4;
andel_rate1=rate_1/tot_rate;
run;

%let dsn1=apgar7p0_IJUST_bohf;
%let rv1=apgar7p0;

%let dsn2=rupturp0alle_IJUST_bohf;
%let rv2=rupturp0alle;

%let dsn3=blod15p0vag_alle_IJUST_bohf;
%let rv3=blod15p0vag_alle;

%merge(ant_datasett=3, dsn_ut=kompl_p0_bohf); 

data kompl_p0_bohf2;
set kompl_p0_bohf;
tot_kompl=rate_1+rate_2+rate_3;
keep bohf tot_kompl;
run;

proc sort data=&tema._p0_bohf2;
by bohf;
quit;

proc sort data=kompl_p0_bohf2;
by bohf;
quit;

data inngr_kompl_bohf;
merge &tema._p0_bohf2 kompl_p0_bohf2;
total=tot_rate+tot_kompl;
plass_rate=10;
run;

%let fignavn=;
%let type=p0;
%let tittel=;
%let xlabel=Antall pr. 1 000  førstegangsfødende.;
%let label_1=Ukompliserte;
%let label_2=KS og Instr. forl.;
%let tabellvar1=total;
%let tabellvar2=tot_rate;
%let tabellvar3=tot_kompl;
%let tabellvariable= &tabellvar1 &tabellvar2 &tabellvar3;
%let labeltabell=&tabellvar1="Total" &tabellvar2="Total - kompl." &tabellvar3="Kompl." ;
%let formattabell=&tabellvar1 comma8.0 &tabellvar2 comma8.0 &tabellvar3 comma8.0;
%let skala=;*values=(0 to 18 by 3);

proc sort data=inngr_kompl_bohf;
by descending total;
run;

%let mappe=&mappe_png;
ODS Graphics ON /reset=All imagename="&tema._&type._&fignavn" imagefmt=png border=off height=500px;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=inngr_kompl_bohf noborder noautolegend sganno=&anno pad=(Bottom=5%);
hbarparm category=bohf response=tot_rate / fillattrs=(color=CX95BDE6) missing name="hp1" legendlabel="&label_2" outlineattrs=(color=CX00509E); 
hbarparm category=bohf response=Ntot_rate / fillattrs=(color=CXC3C3C3) outlineattrs=(color=CX4C4C4C);
hbarparm category=bohf response=rate_1 / fillattrs=(color=CX00509E) missing name="hp2" legendlabel="&label_1" outlineattrs=(color=CX00509E); 
hbarparm category=bohf response=nrate_1 / fillattrs=(color=CX4C4C4C) outlineattrs=(color=CX4C4C4C);
	scatter x=plass_rate y=bohf /datalabel=andel_rate1 datalabelpos=right markerattrs=(size=0) 
        datalabelattrs=(color=white weight=bold size=8);
		keylegend "hp2" "hp1"/ location=outside position=bottom down=1 noborder titleattrs=(size=7);
	 Yaxistable &tabellvariable /Label location=inside labelpos=bottom position=right valueattrs=(size=8 family=arial) labelattrs=(size=8);

     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=8 weight=bold) type=discrete discreteorder=data valueattrs=(size=9);
	 xaxis offsetmin=0.02 offsetmax=0.02 &skala valueattrs=(size=8) label="&xlabel" labelattrs=(size=8 weight=bold);

		Label &labeltabell;
		Format &formattabell andel_rate1 nandel_rate1 nlpct8.1;
run;Title; ods listing close;

%let mappe=&mappe_pdf;
ODS Graphics ON /reset=All imagename="&tema._&type._&fignavn" imagefmt=pdf border=off height=500px;
ODS Listing Image_dpi=300 GPATH="&bildelagring.&mappe";
title "&tittel";
proc sgplot data=inngr_kompl_bohf noborder noautolegend sganno=&anno pad=(Bottom=5%);
hbarparm category=bohf response=tot_rate / fillattrs=(color=CX95BDE6) missing name="hp1" legendlabel="&label_2" outlineattrs=(color=CX00509E); 
hbarparm category=bohf response=Ntot_rate / fillattrs=(color=CXC3C3C3) outlineattrs=(color=CX4C4C4C);
hbarparm category=bohf response=rate_1 / fillattrs=(color=CX00509E) missing name="hp2" legendlabel="&label_1" outlineattrs=(color=CX00509E); 
hbarparm category=bohf response=nrate_1 / fillattrs=(color=CX4C4C4C) outlineattrs=(color=CX4C4C4C);
	scatter x=plass_rate y=bohf /datalabel=andel_rate1 datalabelpos=right markerattrs=(size=0) 
        datalabelattrs=(color=white weight=bold size=8);
		keylegend "hp2" "hp1"/ location=outside position=bottom down=1 noborder titleattrs=(size=7);
	 Yaxistable &tabellvariable /Label location=inside labelpos=bottom position=right valueattrs=(size=8 family=arial) labelattrs=(size=8);

     yaxis display=(noticks noline) label='Opptaksområde' labelattrs=(size=8 weight=bold) type=discrete discreteorder=data valueattrs=(size=9);
	 xaxis offsetmin=0.02 offsetmax=0.02 &skala valueattrs=(size=8) label="&xlabel" labelattrs=(size=8 weight=bold);

		Label &labeltabell;
		Format &formattabell andel_rate1 nandel_rate1 nlpct8.1;
run;Title; ods listing close;







/*SAMMENSATT FIGUR, PARITET 1*/

%let dsn1=ks_akuttp1_IJUST_bohf;
%let rv1=ks_akuttp1;

%let dsn2=tang_vakuump1alle_IJUST_bohf;
%let rv2=tang_vakuump1alle;

%let dsn3=ks_planlagtp1_IJUST_bohf;
%let rv3=ks_planlagtp1;

%let dsn4=ukomplp1_IJUST_bohf;
%let rv4=ukomplp1;

%merge(ant_datasett=4, dsn_ut=&tema._p1_bohf); 

data &tema._p1_bohf2;
set &tema._p1_bohf;
tot_rate=rate_1+rate_2+rate_3+rate_4;
ntot_rate=nrate_1+nrate_2+nrate_3+nrate_4;
rate_1=rate_4;
nrate_1=nrate_4;
andel_rate1=rate_1/tot_rate;
run;


%let fignavn=;
%let type=p1;
%let tittel=;
%let xlabel=Antall pr. 1 000  flergangsfødende.;
%let label_1=Ukompliserte;
%let label_2=KS og Instr. forl.;
%let tabellvar1=tot_rate;
*%let tabellvar2=antall_2;
%let tabellvariable= &tabellvar1;* &tabellvar2;
%let labeltabell=&tabellvar1="tot. rate";* &tabellvar2="Hyst." ;
%let formattabell=&tabellvar1 comma8.0;* &tabellvar2 comma8.0;
%let skala=;*values=(0 to 18 by 3);

%let mappe=&mappe_png;
%ratefig_todeltSoyle(sprak=en, datasett=&tema._p1_bohf2);


%let mappe=&mappe_pdf;
%ratefig_todeltSoyle(sprak=en, datasett=&tema._p1_bohf2, bildeformat=pdf );

