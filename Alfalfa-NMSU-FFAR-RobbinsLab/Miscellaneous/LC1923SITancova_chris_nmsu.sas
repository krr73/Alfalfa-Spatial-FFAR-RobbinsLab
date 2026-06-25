*2019 Las Cruces Early Termination irrigation AVT in 2023;

*____________________________________________2020________________________________________________;
data LC1920ETharv1;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2020\ET Yield 2020\2020 Data\2019 ET AVT data 6_18_20.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1920ETharv2;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2020\ET Yield 2020\2020 Data\2019 ET AVT data 7_21_20.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1920ETharv3;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2020\ET Yield 2020\2020 Data\2019 ET AVT data 10_17_20.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1920ETh123; set LC1920ETharv1 LC1920ETharv2 LC1920ETharv3 ;
  if yr=. then delete;
  if yr=2020 and month='June18' then harv=1; if yr=2020 and harv=1 then dmpltyld=pltyld*0.294646; *convert fresh yield to dmyield;
  if yr=2020 and month='July21' then harv=2; if yr=2020 and harv=2 then dmpltyld=pltyld*0.327157; *convert fresh yield to dmyield;
  if yr=2020 and month='oct17' then harv=3; if yr=2020 and harv=3 then dmpltyld=pltyld*0.321159; *convert fresh yield to dmyield;
  proc sort; by yr harv row range rep ent plot;
  *proc print;

data LC1920ETa; set LC1920ETh123;
  proc sort; by type yr harv row range plot;
  *proc print;

    *code below is for pairing up experimental plots with appropriate covariate plot;

data Lc1920ETb; set LC1920ETa;
 if type='C' then delete;
 *entpltyld=pltyld;*use this to check for proper data formating;
 entdmyldTA=dmpltyld*0.418846154; *use 0.418846154 multiplier to convert pounds per plot to tons per acre (52ft2 plot size);
 drop dmpltyld;
 drop pltyld;
 proc sort; by yr harv row range;
 *proc print; 

data LC1920ETc; set LC1920ETa;
 if type='E' then delete;
 *ckpltyld=pltyld;*use this to check for proper data formating;
 ckdmyldTA=dmpltyld*0.418846154; *use 0.418846154 multiplier to convert pounds per plot to tons per acre (52ft2 plot size);
 row=row+1;
 ckent=ent;
 ckplot=plot;
 drop rep type ent plot dmpltyld;
 drop pltyld;
 proc sort; by yr harv row range;
 *proc print; 

data LC1920ETd; set LC1920ETa;
 if type='E' then delete;
 *ckpltyld=pltyld;*use this to check for proper data formating;
 ckdmyldTA=dmpltyld*0.418846154; *use 0.418846154 multiplier to convert pounds per plot to tons per acre (52ft2 plot size);
 row=row-1;
 ckent=ent;
 ckplot=plot;
 drop rep type ent plot dmpltyld;
 drop pltyld;
 proc sort; by yr harv row range;
 *proc print;

data LC1920ETmerge; merge LC1920ETb LC1920ETc LC1920ETd ; by yr harv row range;
  if yr=. then delete;
  if harv=. then delete;
 proc sort; by yr harv plot ent;
 *proc print;

*_________________________________________________2021_____________________________________________;

data LC1921ETharv1;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2021\ET AVT\2021 Data\2019 ET AVT data h1 4_30_21.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1921ETharv2;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2021\ET AVT\2021 Data\2019 ET AVT data H2 5_27_21.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1921ETharv3;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2021\ET AVT\2021 Data\2019 ET AVT data H3 6_25_21.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1921ETharv4;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2021\ET AVT\2021 Data\2019 ET AVT data H4 7_22_21.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1921ETharv5;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2021\ET AVT\2021 Data\2019 ET AVT data H5 8_26_21.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1921ETharv7;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2021\ET AVT\2021 Data\2019 ET AVT data H7 11_11_21.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1921ETharvall; set LC1921ETharv1 LC1921ETharv2 LC1921ETharv3 LC1921ETharv4 LC1921ETharv5 LC1921ETharv7;
  if yr=. then delete;
  if yr=2021 and month='30-Apr' then harv=1; if yr=2021 and harv=1 then dmpltyld=pltyld*0.28258; *convert fresh yield to dmyield;
  if yr=2021 and month='27-May' then harv=2; if yr=2021 and harv=2 then dmpltyld=pltyld*0.209549; *convert fresh yield to dmyield;
  if yr=2021 and month='25-Jun' then harv=3; if yr=2021 and harv=3 then dmpltyld=pltyld*0.250094; *convert fresh yield to dmyield;
  if yr=2021 and month='22-Jul' then harv=4; if yr=2021 and harv=4 then dmpltyld=pltyld*0.376674; *convert fresh yield to dmyield;
  if yr=2021 and month='26-Sep' then harv=5; if yr=2021 and harv=5 then dmpltyld=pltyld*0.465959; *convert fresh yield to dmyield;
  if yr=2021 and month='11-Nov' then harv=7; if yr=2021 and harv=7 then dmpltyld=pltyld*0.21975; *convert fresh yield to dmyield;
  proc sort; by yr harv row range rep ent plot;
  *proc print;

data LC1921ETa; set LC1921ETharvall;
  proc sort; by type yr harv row range plot;
  *proc print;

    *code below is for pairing up experimental plots with appropriate covariate plot;

data Lc1921ETb; set LC1921ETa;
 if type='C' then delete;
 *entpltyld=pltyld;*use this to check for proper data formating;
 entdmyldTA=dmpltyld*0.418846154; *use 0.418846154 multiplier to convert pounds per plot to tons per acre (52ft2 plot size);
 drop dmpltyld;
 drop pltyld;
 proc sort; by yr harv row range;
 *proc print; 

data LC1921ETc; set LC1921ETa;
 if type='E' then delete;
 *ckpltyld=pltyld;*use this to check for proper data formating;
 ckdmyldTA=dmpltyld*0.418846154; *use 0.418846154 multiplier to convert pounds per plot to tons per acre (52ft2 plot size);
 row=row+1;
 ckent=ent;
 ckplot=plot;
 drop rep type ent plot dmpltyld;
 drop pltyld;
 proc sort; by yr harv row range;
 *proc print; 

data LC1921ETd; set LC1921ETa;
 if type='E' then delete;
 *ckpltyld=pltyld;*use this to check for proper data formating;
 ckdmyldTA=dmpltyld*0.418846154; *use 0.418846154 multiplier to convert pounds per plot to tons per acre (52ft2 plot size);
 row=row-1;
 ckent=ent;
 ckplot=plot;
 drop rep type ent plot dmpltyld;
 drop pltyld;
 proc sort; by yr harv row range;
 *proc print;

data LC1921ETmerge; merge LC1921ETb LC1921ETc LC1921ETd ; by yr harv row range;
  if yr=. then delete;
  if harv=. then delete;
 proc sort; by yr harv plot ent;
 *proc print;


*_________________________________________________2022_____________________________________________;

data LC1922ETharv1;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2022\ET AVT\2022 Data\2019 ET AVT data h1 4_27_22.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1922ETharv2;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2022\ET AVT\2022 Data\2019 ET AVT data H2 6_1_22.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1922ETharv3;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2022\ET AVT\2022 Data\2019 ET AVT data H3 6_30_22.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1922ETharv4;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2022\ET AVT\2022 Data\2019 ET AVT data H4 7_27_22.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1922ETharv6;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2022\ET AVT\2022 Data\2019 ET AVT data H6 10_20_22.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1922ETharvall; set LC1922ETharv1 LC1922ETharv2 LC1922ETharv3 LC1922ETharv4 LC1922ETharv6 ;
  if yr=. then delete;
  if yr=2022 and month='27-Apr' then harv=1; if yr=2022 and harv=1 then dmpltyld=pltyld*0.282346; *convert fresh yield to dmyield;
  if yr=2022 and month='1-Jun' then harv=2; if yr=2022 and harv=2 then dmpltyld=pltyld*0.389957; *convert fresh yield to dmyield;
  if yr=2022 and month='30-Jun' then harv=3; if yr=2022 and harv=3 then dmpltyld=pltyld*0.259308; *convert fresh yield to dmyield;
  if yr=2022 and month='27-Jul' then harv=4; if yr=2022 and harv=4 then dmpltyld=pltyld*0.54194; *convert fresh yield to dmyield;
  if yr=2022 and month='20-Oct' then harv=6; if yr=2022 and harv=6 then dmpltyld=pltyld*0.308328; *convert fresh yield to dmyield;
  proc sort; by yr harv row range rep ent plot;
  *proc print;

data LC1922ETa; set LC1922ETharvall;
  proc sort; by type yr harv row range plot;
  *proc print;

    *code below is for pairing up experimental plots with appropriate covariate plot;

data Lc1922ETb; set LC1922ETa;
 if type='C' then delete;
 *entpltyld=pltyld;*use this to check for proper data formating;
 entdmyldTA=dmpltyld*0.418846154; *use 0.418846154 multiplier to convert pounds per plot to tons per acre (52ft2 plot size);
 drop dmpltyld;
 drop pltyld;
 proc sort; by yr harv row range;
 *proc print; 

data LC1922ETc; set LC1922ETa;
 if type='E' then delete;
 *ckpltyld=pltyld;*use this to check for proper data formating;
 ckdmyldTA=dmpltyld*0.418846154; *use 0.418846154 multiplier to convert pounds per plot to tons per acre (52ft2 plot size);
 row=row+1;
 ckent=ent;
 ckplot=plot;
 drop rep type ent plot dmpltyld;
 drop pltyld;
 proc sort; by yr harv row range;
 *proc print; 

data LC1922ETd; set LC1922ETa;
 if type='E' then delete;
 *ckpltyld=pltyld;*use this to check for proper data formating;
 ckdmyldTA=dmpltyld*0.418846154; *use 0.418846154 multiplier to convert pounds per plot to tons per acre (52ft2 plot size);
 row=row-1;
 ckent=ent;
 ckplot=plot;
 drop rep type ent plot dmpltyld;
 drop pltyld;
 proc sort; by yr harv row range;
 *proc print;

data LC1922ETmerge; merge LC1922ETb LC1922ETc LC1922ETd ; by yr harv row range;
  if yr=. then delete;
  if harv=. then delete;
 proc sort; by yr harv plot ent;
 *proc print;


*_________________________________________________2023_____________________________________________;

data LC1923ETharv2;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2023\ET AVT\2023 Data\2019 ET AVT data H2 6_2_2023.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1923ETharv3;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2023\ET AVT\2023 Data\2019 ET AVT data H3 7_1_2023.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1923ETharv4;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2023\ET AVT\2023 Data\2019 ET AVT data H4 7_27_2023.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1923ETharv6;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2023\ET AVT\2023 Data\2019 ET AVT data H6 10_6_2023.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1923ETharv7;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2023\ET AVT\2023 Data\2019 ET AVT data H7 11_7_2023.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1923ETharvall; set LC1923ETharv2 LC1923ETharv3 LC1923ETharv4 LC1923ETharv6 LC1923ETharv7;
  if yr=. then delete;
  if yr=2023 and month='2-Jun' then harv=2; if yr=2023 and harv=2 then dmpltyld=pltyld*0.277541; *convert fresh yield to dmyield;
  if yr=2023 and month='1-Jul' then harv=3; if yr=2023 and harv=3 then dmpltyld=pltyld*0.26684; *convert fresh yield to dmyield;
  if yr=2023 and month='27-Jul' then harv=4; if yr=2023 and harv=4 then dmpltyld=pltyld*0.422911; *convert fresh yield to dmyield;
  if yr=2023 and month='6-Oct' then harv=6; if yr=2023 and harv=6 then dmpltyld=pltyld*0.229618; *convert fresh yield to dmyield;
  if yr=2023 and month='7-Nov' then harv=7; if yr=2023 and harv=7 then dmpltyld=pltyld*0.236971; *convert fresh yield to dmyield;
  proc sort; by yr harv row range rep ent plot;
  *proc print;

data LC1923ETa; set LC1923ETharvall;
  proc sort; by type yr harv row range plot;
  *proc print;

    *code below is for pairing up experimental plots with appropriate covariate plot;

data Lc1923ETb; set LC1923ETa;
 if type='C' then delete;
 *entpltyld=pltyld;*use this to check for proper data formating;
 entdmyldTA=dmpltyld*0.418846154; *use 0.418846154 multiplier to convert pounds per plot to tons per acre (52ft2 plot size);
 drop dmpltyld;
 drop pltyld;
 proc sort; by yr harv row range;
 *proc print; 

data LC1923ETc; set LC1923ETa;
 if type='E' then delete;
 *ckpltyld=pltyld;*use this to check for proper data formating;
 ckdmyldTA=dmpltyld*0.418846154; *use 0.418846154 multiplier to convert pounds per plot to tons per acre (52ft2 plot size);
 row=row+1;
 ckent=ent;
 ckplot=plot;
 drop rep type ent plot dmpltyld;
 drop pltyld;
 proc sort; by yr harv row range;
 *proc print; 

data LC1923ETd; set LC1923ETa;
 if type='E' then delete;
 *ckpltyld=pltyld;*use this to check for proper data formating;
 ckdmyldTA=dmpltyld*0.418846154; *use 0.418846154 multiplier to convert pounds per plot to tons per acre (52ft2 plot size);
 row=row-1;
 ckent=ent;
 ckplot=plot;
 drop rep type ent plot dmpltyld;
 drop pltyld;
 proc sort; by yr harv row range;
 *proc print;

data LC1923ETmerge; merge LC1923ETb LC1923ETc LC1923ETd ; by yr harv row range;
  if yr=. then delete;
  if harv=. then delete;
 proc sort; by yr harv plot ent;
 *proc print;


data LC19ETSetname; set LC1920ETmerge LC1921ETmerge LC1922ETmerge LC1923ETmerge ;
 length name $ 25;
 if ent=1 then name='AFX 149092';
 if ent=2 then name='AFX 779';
 if ent=3 then name='AmeriStand 803T';
 if ent=4 then name='Mesquite';
 if ent=5 then name='NM 1701PAR';
 if ent=6 then name='NM 1702PAR';
 if ent=7 then name='NM 1703PAR';
 if ent=8 then name='NM 1704PAR';
 if ent=9 then name='NM 1705PAR';
 if ent=10 then name='NM 170506PAR';
 if ent=11 then name='NM 1712PAR';
 if ent=12 then name='NM 1713PAR';
 if ent=13 then name='NM 1715PAR';
 if ent=14 then name='NuMex Bill Melton CA2019';
 if ent=15 then name='NuMex Bill Melton FG2011';
 if ent=16 then name='NuMex Bill Melton FG2012';
 if ent=17 then name='SW1011';
 if ent=18 then name='SW8421S';
 if ent=19 then name='SW8888';
 if ent=20 then name='SW9720';
 if ent=21 then name='SW9812';
 if ent=22 then name='SW9813';
 if ent=23 then name='TMA 990';
 if ent=24 then name='Dona Ana';
 proc sort; by yr harv rep ent;
 *proc print;

*2020 data set;
data I1; set LC19ETSetname;
if yr=2021 then delete;
if yr=2022 then delete;
if yr=2023 then delete;
*proc print;

*2021 data set;
data I2; set LC19ETSetname;
if yr=2020 then delete;
if yr=2022 then delete;
if yr=2023 then delete;
*proc print;

*2022 data set;
data I3; set LC19ETsetname;
if yr=2020 then delete;
if yr=2021 then delete;
if yr=2023 then delete;
*proc print;

*2023 data set;
data I4; set LC19ETsetname;
if yr=2020 then delete;
if yr=2021 then delete;
if yr=2022 then delete;
*proc print;

*_____________________________________________2020___________________________________________;

 *by harvest analysis for LC19 avt ET in 2020;
/*
 data LC1920ETANCOVA; set I1;
 proc sort; by yr harv rep name;
 ods listing exclude Estfunc ExpectedmeanSquares RandomModelANOVA;
  proc glm; class rep name; by harv;
  model entdmyldTA = rep ckdmyldTA name  /e1;
  *random rep /test;
  *means name/lsd;
  *lsmeans name/ lines tdiff alpha=0.05;
  title 'LC1920lsmeans by harvest'; 
  lsmeans name/out=byharv20out noprint;
  *proc print;
 
 data byharv20a; set byharv20out;
  drop STDERR;
  drop _NAME_;
  drop harv;
  proc sort; by name;
  proc transpose out=byharvsummary20; by name;
  *proc print;

data byharv20b; set byharvsummary20;
  drop _NAME_;
  June18=col1; drop col1;
  July21=col2; drop col2;
  Oct17=col3; drop col3;
  *proc print;
*/
  *Seasonal total yield analysis for LC19 avt ET in 2020;
data LC1920ETmeans; set I1 ;
 proc sort; by name rep harv;
 proc means noprint data=LC1920ETmeans; by name rep;
  var entdmyldTA ckdmyldTA;
  output out=seasonalmeans20 sum=entdmyldTA ckdmyldTA;
  *proc print;

 data LC1920ETANCOVA; set seasonalmeans20;
 proc sort; by rep name;
 ods listing exclude Estfunc ExpectedmeanSquares RandomModelANOVA;
  proc glm; class rep name; 
  model entdmyldTA = rep ckdmyldTA name  /e1;
  *random rep /test;
  means name/lsd;
  *lsmeans name/ lines tdiff alpha=0.05;
  title 'LC1920lsmeans seasonal total for 2020'; 
  lsmeans name/out=byseasonaltotal20out noprint;

data seasonaltotal20b; set byseasonaltotal20out;
  drop _NAME_;
  drop STDERR;
  TOTAL2020=LSMEAN; drop LSMEAN;
  *proc print;

 *Calculate covariate means as reference ;
/*
data check1; set I1 ;
proc sort; by harv rep;
proc means print;
var ckdmyldTA; by harv ;
*proc print;
 
data check2; set seasonalmeans20;
proc sort; by rep;
proc means print;
var ckdmyldTA; 
*proc print;
 */

*________________________________________________2021_____________________________________;

*by harvest analysis for LC19 avt ET in 2021;
/*
 data LC1921ETANCOVA; set I2;
 proc sort; by yr harv rep name;
 ods listing exclude Estfunc ExpectedmeanSquares RandomModelANOVA;
  proc glm; class rep name; by harv;
  model entdmyldTA = rep ckdmyldTA name  /e1;
  *random rep /test;
  means name/lsd;
  *lsmeans name/ lines tdiff alpha=0.05;
  title 'LC1921lsmeans by harvest'; 
  lsmeans name/out=byharv21out noprint;
  *proc print;
 
 data byharv21a; set byharv21out;
  drop STDERR;
  drop _NAME_;
  drop harv;
  proc sort; by name;
  proc transpose out=byharvsummary21; by name;
  *proc print;

data byharv21b; set byharvsummary21;
  drop _NAME_;
  Apr30=col1; drop col1;
  May27=col2; drop col2;
  June25=col3; drop col3;
  July22=col4; drop col4;
  Aug26=col5; drop col5;
  Nov11=col6; drop col6;
  *proc print;
*/

  *Seasonal total yield analysis for LC19 avt ET in 2021;
data LC1921ETmeans; set I2 ;
 proc sort; by name rep harv;
 proc means noprint data=LC1921ETmeans; by name rep;
  var entdmyldTA ckdmyldTA;
  output out=seasonalmeans21 sum=entdmyldTA ckdmyldTA;
  *proc print;

 data LC1921ETANCOVA; set seasonalmeans21;
 proc sort; by rep name;
 ods listing exclude Estfunc ExpectedmeanSquares RandomModelANOVA;
  proc glm; class rep name; 
  model entdmyldTA = rep ckdmyldTA name  /e1;
  *random rep /test;
  means name/lsd;
  *lsmeans name/ lines tdiff alpha=0.05;
  title 'LC1921lsmeans seasonal total for 2021'; 
  lsmeans name/out=byseasonaltotal21out noprint;

data seasonaltotal21b; set byseasonaltotal21out;
  drop _NAME_;
  drop STDERR;
  TOTAL2021=LSMEAN; drop LSMEAN;
  *proc print;

 *Calculate covariate means as reference ;
/*
data check1; set I2 ;
proc sort; by harv rep;
proc means print;
var ckdmyldTA; by harv ;
*proc print;
 
data check2; set seasonalmeans21;
proc sort; by rep;
proc means print;
var ckdmyldTA; 
*proc print;
 */

*________________________________________________2022_____________________________________;

*by harvest analysis for LC19 avt ET in 2022;
/*
 data LC1922ETANCOVA; set I3;
 proc sort; by yr harv rep name;
 ods listing exclude Estfunc ExpectedmeanSquares RandomModelANOVA;
  proc glm; class rep name; by harv;
  model entdmyldTA = rep ckdmyldTA name  /e1;
  *random rep /test;
  means name/lsd;
  *lsmeans name/ lines tdiff alpha=0.05;
  title 'LC1922lsmeans by harvest'; 
  lsmeans name/out=byharv22out noprint;
  *proc print;
 
 data byharv22a; set byharv22out;
  drop STDERR;
  drop _NAME_;
  drop harv;
  proc sort; by name;
  proc transpose out=byharvsummary22; by name;
  *proc print;

data byharv22b; set byharvsummary22;
  drop _NAME_;
  Apr27=col1; drop col1;
  June1=col2; drop col2;
  June30=col3; drop col3;
  July27=col4; drop col4;
  Oct20=col5; drop col5;
  *proc print;
*/
  *Seasonal total yield analysis for LC19 avt ET in 2022;
data LC1922ETmeans; set I3 ;
 proc sort; by name rep harv;
 proc means noprint data=LC1922ETmeans; by name rep;
  var entdmyldTA ckdmyldTA;
  output out=seasonalmeans22 sum=entdmyldTA ckdmyldTA;
  *proc print;

 data LC1922ETANCOVA; set seasonalmeans22;
 proc sort; by rep name;
 ods listing exclude Estfunc ExpectedmeanSquares RandomModelANOVA;
  proc glm; class rep name; 
  model entdmyldTA = rep ckdmyldTA name  /e1;
  *random rep /test;
  means name/lsd;
  *lsmeans name/ lines tdiff alpha=0.05;
  title 'LC1922lsmeans seasonal total for 2022'; 
  lsmeans name/out=byseasonaltotal22out noprint;

data seasonaltotal22b; set byseasonaltotal22out;
  drop _NAME_;
  drop STDERR;
  TOTAL2022=LSMEAN; drop LSMEAN;
  *proc print;

 *Calculate covariate means as reference ;
/*
data check1; set I3 ;
proc sort; by harv rep;
proc means print;
var ckdmyldTA; by harv ;
*proc print;
 
data check2; set seasonalmeans22;
proc sort; by rep;
proc means print;
var ckdmyldTA; 
*proc print;
 */

*_________________________________________________2023_______________________________________________;
*by harvest analysis for LC19 avt ET in 2023;

 data LC1923ETANCOVA; set I4;
 proc sort; by yr harv rep name;
 ods listing exclude Estfunc ExpectedmeanSquares RandomModelANOVA;
 *proc print;

  proc glm; class rep name; by harv;
  model entdmyldTA = rep ckdmyldTA name  /e1;
  *random rep /test;
  means name/lsd;
  *lsmeans name/ lines tdiff alpha=0.05;
  title 'LC1923lsmeans by harvest'; 
  lsmeans name/out=byharv23out noprint;
  *proc print;
 
 data byharv23a; set byharv23out;
  drop STDERR;
  drop _NAME_;
  drop harv;
  proc sort; by name;
  proc transpose out=byharvsummary23; by name;
  *proc print;

data byharv23b; set byharvsummary23;
  drop _NAME_;
  Jun2=col1; drop col1;
  Jul1=col2; drop col2;
  Jul27=col3; drop col3;
  Oct6=col4; drop col4;
  Nov7=col5; drop col5;
  *proc print;

  *Seasonal total yield analysis for LC19 avt ET in 2023;
data LC1923ETmeans; set I4 ;
 proc sort; by name rep harv;
 proc means noprint data=LC1923ETmeans; by name rep;
  var entdmyldTA ckdmyldTA;
  output out=seasonalmeans23 sum=entdmyldTA ckdmyldTA;
  *proc print;

 data LC1923ETANCOVA; set seasonalmeans23;
 proc sort; by rep name;
 ods listing exclude Estfunc ExpectedmeanSquares RandomModelANOVA;
  proc glm; class rep name; 
  model entdmyldTA = rep ckdmyldTA name  /e1;
  *random rep /test;
  means name/lsd;
  *lsmeans name/ lines tdiff alpha=0.05;
  title 'LC1923lsmeans seasonal total for 2023'; 
  lsmeans name/out=byseasonaltotal23out noprint;

data seasonaltotal23b; set byseasonaltotal23out;
  drop _NAME_;
  drop STDERR;
  TOTAL2023=LSMEAN; drop LSMEAN;
  *proc print;

 *Calculate covariate means as reference ;
/*
data check1; set I4 ;
proc sort; by harv rep;
proc means print;
var ckdmyldTA; by harv ;
*proc print;
 
data check2; set seasonalmeans23;
proc sort; by rep;
proc means print;
var ckdmyldTA; 
*proc print;
 */

*________________________________________Overyears______________________________________;

data LC19overyearsET; set I1 I2 I3 I4;
 proc sort; by yr name rep harv ;
 proc means noprint data=LC19overyearsET; by yr name rep ;
 var entdmyldTA ckdmyldTA ;
 output out=yldoveryears sum=entdmyldTA ckdmyldTA; by yr name rep;
*proc print; 

data ET1; set yldoveryears;
  proc sort; by rep name yr;
  ods listing exclude Estfunc ExpectedMeanSquares RandomModelANOVA;
  proc glm; class rep name yr; 
  model entdmyldTA = rep ckdmyldTA name rep*name yr rep*yr yr*name /e1;
  random rep yr rep*name rep*yr yr*name /test;
  means name/lsd e=rep*name alpha=0.05;
  test H=name e=rep*name;
  title 'LC19ET AVT over years 2020, 2021, 2022 and 2023';
  lsmeans name/out=overyearslsmeanout noprint;
 *proc print;
 
data ET2; set overyearslsmeanout; 
  fouryravg=LSMEAN;  drop LSMEAN;
  *proc print; 

*Summary output table for LC19 avt ET in 2023;
data y; merge seasonaltotal20b seasonaltotal21b seasonaltotal22b byharv23b seasonaltotal23b ET2; by name;
  proc sort; by descending fouryravg;
  proc print; var name TOTAL2020 Total2021 Total2022 Jun2 Jul1 Jul27 Oct6 Nov7 Total2023 fouryravg;
  format TOTAL2020 Total2021 Total2022 jun2 jul1 jul27 oct6 nov7 Total2023 fouryravg ;
  title 'LC1922 ET summary output table';

data z; set y;
proc sort; by descending fouryravg;

run;
quit;


