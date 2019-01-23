/* Prepare the MFR data so that it includes the correct subset and data aggregated to the right level */
/*
   tema     is the name on the dataset (FH_&tema._paritet, or FH_&tema._robson)
   agg_var  is the name of the variable (num_&agg_var)
   par_rob  is either paritet, or robson.  It is used to identify the correct file to use.
   grp      is (0,1) for paritet, or (1,2,3,4,9) for robson
   nevner   defines the interested population: vag, ks, alle
*/


%macro aggregere_mfr(tema=,agg_var=,par_rob=paritet,grp=0,nevner=alle);
data FH_&tema._&par_rob.&grp.;
  set helseatl.FH_&tema._&par_rob.;

  *keep the desired group, i.e. par0, par1, rob1, rob2, rob3, rob4, or rob9;
  where &par_rob=&grp;

run;

%if &par_rob=robson and &nevner=vag %then %do;
data FH_all_&par_rob.&grp.(rename=(num_vag=fodsler));
  set helseatl.FH_all_vag_&par_rob.(drop=fodsler);

  * keep the desired group, i.e. rob1, rob2, rob3, rob4, or rob9;
    where &par_rob=&grp ;
run;
%end;
%else %do;
data FH_all_&par_rob.&grp.;
  set helseatl.FH_all_&par_rob.;

  * keep the desired group, i.e. par0, par1, rob1, rob2, rob3, rob4, or rob9;

  %if &nevner=vag %then %do;
    if forlosning=1 and &par_rob=&grp then output;
  %end;
  %else %if &nevner=ks %then %do;
    if forlosning=2 and &par_rob=&grp then output;
  %end;
  %else %if &nevner=alle %then %do;
    if                  &par_rob=&grp then output;
  %end;
run;
%end;

proc sql;
create table FH_innb_&par_rob.&grp. as
select distinct komnr, ermann, alder, aar, bydel, sum(fodsler) as innbyggere
from FH_all_&par_rob.&grp.
group by aar, ermann, alder, komnr, bydel;
quit;
%mend;