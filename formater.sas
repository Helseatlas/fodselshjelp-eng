
proc format;

value aldersgruppe
1='26 år og yngre, paritet 0'
2='27-30 år, paritet 0'
3='31 år og eldre, paritet 0'
4='29 år og yngre, paritet 1+'
5='30-33 år, paritet 1+'
6='34 år og eldre, paritet 1+'
;

value robson
1='Robson gr.1'
2='Robson gr.2a'
9='Resten'
;

value forlosning
1='Vaginal fødsel'
2='Keisersnitt'
;

value tang_vak
1='Tang'
2='Vakuumekstraksjon'
;

value epidural
1='Epidural ved akutt keisersnitt'
2='Epidural ved vaginal fødsel'
;

value diabetes
1 = 'Diabetes før svangerskapet'
2 = 'Svangerskapsdiabetes'
;

value kmi
1='Undervekt < 18,5'
2='Normalvekt [18,5 - 25)'
3='Overvekt og fedme [25 - 30)'
4='Overvekt og fedme [30 - 35)'
5='Overvekt og fedme 35 +'
;

value fodeland
1='Afrika sør for Sahara'
2='Høyinntektsland'
4='Nord-Afrika og Midt-Østen'
5='Norge'
6='Sentral/Øst-Europa og Sentral-Asia'
7='Sør-Asia'
8='Sørøst-Asia, Øst-Asia og Oseania'
9='Ukjent'
;

value premature
1='Sent premature, GA 34.0-36.6'
2='Tidlig premature, GA < 34.0'
;

run;
