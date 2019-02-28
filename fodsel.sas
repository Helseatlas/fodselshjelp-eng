%macro fodsel(datasett =);

data &datasett;
set &datasett;

array diagnose {*} Hdiag: Bdiag: Tdiag:;
     do i=1 to dim(diagnose);
	/*Z37 Resultat av forl�sning; levendef�dt, d�df�dt, noen levendef�dt-noen d�df�dt*/
         if substr(diagnose{i},1,4) in ('Z370') then Levende_fodt=1;/*Enkeltf�dsel med levendef�dt barn*/
		 if substr(diagnose{i},1,4) in ('Z371') then Dod_fodt=1;/*Enkeltf�dsel med d�df�dt barn*/
		 if substr(diagnose{i},1,4) in ('Z372') then Levende_fodt=1;/*Tvillingf�dsel med levendef�dte barn*/
		 if substr(diagnose{i},1,4) in ('Z373') then Levende_Dodfodt=1;/*Tvillingf�dsel med ett levendef�dt og ett d�df�dt barn*/
		 if substr(diagnose{i},1,4) in ('Z374') then Dod_fodt=1;/*Tvillingf�dsel med d�df�dte barn*/
		 if substr(diagnose{i},1,4) in ('Z375') then Levende_fodt=1;/*Annen flerf�dsel med levendef�dte barn*/
		 if substr(diagnose{i},1,4) in ('Z376') then Levende_Dodfodt=1;/*Annen flerf�dsel med noen levendef�dte barn*/
		 if substr(diagnose{i},1,4) in ('Z377') then Dod_fodt=1;/*Annen flerf�dsel med d�df�dte barn*/
		 if substr(diagnose{i},1,4) in ('Z379') then uspes=1;/*Uspesifisert resultat av forl�sning*/
     end;

if Levende_fodt=1 or Dod_fodt=1 or Levende_Dodfodt=1 then fodt=1;
if Levende_fodt=1 or               Levende_Dodfodt=1 then Levende=1; 


run;

%mend;

