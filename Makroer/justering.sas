/* Data prep for indirect and unadjusted rates */

/* rateprogram outputs the adjusted rates to a certain format for the figure macros to use.
   rateprogram calculates indirect rates, and keeps the unadjusted rate also, but are kept in a different format.
   this macro is used to turn the data into the desired format so that we can use the same figure macro for the indirected adjusted rates.

   This can eventually be incorporated into rateprogram.
   */

%macro justering(just=, justvar=);
*bohf rate;
proc sort data=bohf_agg_rate;
  by bohf;
run;
proc transpose data=bohf_agg_rate prefix=rate out=bohf(drop=_name_ _label_);
  by bohf;
  id aar;
  var &justvar;
run; 

*national avg;
proc transpose data=norge_agg_rate prefix=rate out=norge(drop=_name_);
  id aar;
  var &justvar;
run; 
data norge;
  set norge;
  bohf=8888;
  format bohf $bohf.;
run;

data &tema._bohf_&par_rob.&grp._&just;
  set bohf 
      norge;
run;

proc sql;
  create table &tema_navn._bohf_&just as
  select a.&tema_navn, a.innbyggere, b.*
  from &tema_navn._bohf a, &tema._bohf_&par_rob.&grp._&just b
  where a.bohf=b.bohf;
quit;

data &tema_navn._bohf_&just;
  set &tema_navn._bohf_&just;
  if bohf=8888 then snittrate=rateSnitt;
  min=min(rate2015, rate2016, rate2017);
  max=max(rate2015, rate2016, rate2017);
run;

%forholdstall(ds=&tema_navn._bohf_&just);
%mend;


