%macro sv_kontroll(datasett =);

data &datasett;
set &datasett;

array diagnose {*} Hdiag: Bdiag: Tdiag:;
     do i=1 to dim(diagnose);
	 	 if substr(diagnose{i},1,3) in ('Z32') then Z32=1;/*Graviditetsundersøkelse og -test*/
	 	 if substr(diagnose{i},1,3) in ('Z33') then Z33=1;/*Graviditet*/
     if substr(diagnose{i},1,3) in ('Z34') then Z34=1;/*Kontroll av normalt svangerskap*/
	   if substr(diagnose{i},1,3) in ('Z35') then Z35=1;/*Kontroll av høyrisikosvangerskap*/
		 if substr(diagnose{i},1,3) in ('Z36') then Z36=1;/*Prenatal diagnostikk*/
		 if substr(diagnose{i},1,2) in ('O1','O2','O3','O4','O6') then O_diag=1;
		 if substr(diagnose{i},1,3) in ('O98','O99') then O_diag=1;
     end;


array Prosedyre {*} NC:;
    do i=1 to dim(prosedyre); 
 		if prosedyre{i} eq 'SMA0BK' then ULabdGravid=1;
		if prosedyre{i} eq 'MADE10' then ULabdGravid=1;
		if prosedyre{i} eq 'SMA0CK' then ULvagGravid=1;
		if prosedyre{i} eq 'LXDE05' then ULvag=1;
		if prosedyre{i} eq 'SLX0BK' then ULvag=1;
end;

array takst {*} Normaltariff:;
    do i=1 to dim(takst); 

		if substr(takst{i},1,4) in ('211a') then Takst211a=1; 
		if substr(takst{i},1,4) in ('211b') then Takst211b=1; 
		if substr(takst{i},1,4) in ('211e') then Takst211e=1;
		if substr(takst{i},1,3) in ('216') then Takst216=1;
		if substr(takst{i},1,4) in ('217a') then Takst217a=1; 
		if substr(takst{i},1,4) in ('217b') then Takst217b=1;
		if substr(takst{i},1,4) in ('217c') then Takst217c=1; 
		if substr(takst{i},1,4) in ('217d') then Takst217d=1; 

end;


/*Bruker if ... else for å utelukke at kontakter kategoriseres som både normal og høyrisiko, både høyrisiko og o-diagnose etc.*/
if z35=1 then Kontroll_hoyrisk=1;
else if O_diag=1 and EoC_aktivitetskategori3 ne 1 then Kontroll_Odiag=1;		/*Tar bare med Poli og Dag for O-diagnoser*/
else if Z36=1 then Kontroll_prenatal=1;
else if Z34=1 then Kontroll_normal=1;
else if Z32=1 or Z33=1 then Graviditet=1;

/*Hvis ingen av tilstandskodene tilsier svangerskapskontroll, 
men kontrollen har takst for svangerskapskontroll så kategoriseres den som Kontroll_hoyrisk eller Kontroll_Odiag*/
else if Takst211e=1 or Takst217a=1 or Takst217b=1 or Takst217c=1 or Takst217d=1 then Kontroll_hoyrisk=1;
else if Takst211a=1 or Takst211b=1 or Takst216=1 then Kontroll_Odiag=1;


if Kontroll_normal=1 or Kontroll_hoyrisk=1 or Kontroll_Odiag=1 or Kontroll_prenatal=1 or Graviditet=1 then Kontroll=1;
if ULabdGravid=1 or ULvagGravid=1 or ULvag=1 then UL=1;


run;

%mend;


