*2019 Las Cruces Normal irrigation AVT in 2023;

*2020 data infile setup;
data LC1920Nharv1;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2020\Normal Yield 2020\2020 Data\2019 Normal AVT data 6_19_20.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1920Nharv2;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2020\Normal Yield 2020\2020 Data\2019 Normal AVT data 7_22_20.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1920Nharv3;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2020\Normal Yield 2020\2020 Data\2019 Normal AVT data 8_21_20.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1920Nharv4;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2020\Normal Yield 2020\2020 Data\2019 Normal AVT data 9_15_20.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1920Nharv5;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2020\Normal Yield 2020\2020 Data\2019 Normal AVT data 10_19_20.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1920Nharv6;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2020\Normal Yield 2020\2020 Data\2019 Normal AVT data 11_17_20.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1920Nharvall; set LC1920Nharv1 LC1920Nharv2 LC1920Nharv3 LC1920Nharv4 LC1920Nharv5 LC1920Nharv6;
  if yr=. then delete;
  if yr=2020 and month='June19' then harv=1; if yr=2020 and harv=1 then dmpltyld=pltyld*0.338872; *convert fresh yield to dmyield;
  if yr=2020 and month='July22' then harv=2; if yr=2020 and harv=2 then dmpltyld=pltyld*0.321438; *convert fresh yield to dmyield;
  if yr=2020 and month='Aug21' then harv=3; if yr=2020 and harv=3 then dmpltyld=pltyld*0.251262; *convert fresh yield to dmyield;
  if yr=2020 and month='Sept15' then harv=4; if yr=2020 and harv=4 then dmpltyld=pltyld*0.31762; *convert fresh yield to dmyield;
  if yr=2020 and month='oct19' then harv=5; if yr=2020 and harv=5 then dmpltyld=pltyld*0.293933; *convert fresh yield to dmyield;
  if yr=2020 and month='Nov17' then harv=6; if yr=2020 and harv=6 then dmpltyld=pltyld*0.26789; *convert fresh yield to dmyield;
  proc sort; by yr harv row range rep ent plot;
  *proc print;

data LC1920Na; set LC1920Nharvall;
  proc sort; by type yr harv row range plot;
  *proc print;

    *code below is for pairing up experimental plots with appropriate covariate plot;

data Lc1920Nb; set LC1920Na;
 if type='C' then delete;
 *entpltyld=pltyld;*use this to check for proper data formating;
 entdmyldTA=dmpltyld*0.418846154; *use 0.418846154 multiplier to convert pounds per plot to tons per acre (52ft2 plot size);
 drop dmpltyld;
 drop pltyld;
 proc sort; by yr harv row range;
 *proc print; 

data LC1920Nc; set LC1920Na;
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

data LC1920Nd; set LC1920Na;
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

data LC1920Nmerge; merge LC1920Nb LC1920Nc LC1920Nd ; by yr harv row range;
  if yr=. then delete;
  if harv=. then delete;
 proc sort; by yr harv plot ent;
 *proc print;

*___________________________2021 data infile setup_____________________________________________;
data LC1921Nharv1;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2021\Normal AVT\2021 data\2019 Normal AVT data H1 5_1_21.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1921Nharv2;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2021\Normal AVT\2021 data\2019 Normal AVT data H2 5_27_21.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1921Nharv3;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2021\Normal AVT\2021 data\2019 Normal AVT data H3 6_24_21.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot fw fwfqyld pltyld;
  drop fw fwfqyld;
  proc sort; by plot;
  *proc print;

data LC1921Nharv4;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2021\Normal AVT\2021 data\2019 Normal AVT data H4 7_22_21.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1921Nharv5;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2021\Normal AVT\2021 data\2019 Normal AVT data H5 8_27_21.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1921Nharv6;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2021\Normal AVT\2021 data\2019 Normal AVT data H6 9_29_21.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1921Nharv7;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2021\Normal AVT\2021 data\2019 Normal AVT data H7 11_12_21.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1921Nharvall; set LC1921Nharv1 LC1921Nharv2 LC1921Nharv3 LC1921Nharv4 LC1921Nharv5 LC1921Nharv6 LC1921Nharv7;
  if yr=. then delete;
  if yr=2021 and month='May 1' then harv=1; if yr=2021 and harv=1 then dmpltyld=pltyld*0.301438; *convert fresh yield to dmyield;
  if yr=2021 and month='May 27' then harv=2; if yr=2021 and harv=2 then dmpltyld=pltyld*0.237894; *convert fresh yield to dmyield;
  if yr=2021 and month='June 24' then harv=3; if yr=2021 and harv=3 then dmpltyld=pltyld*0.236603; *convert fresh yield to dmyield;
  if yr=2021 and month='July 22' then harv=4; if yr=2021 and harv=4 then dmpltyld=pltyld*0.311956; *convert fresh yield to dmyield;
  if yr=2021 and month='Aug 27' then harv=5; if yr=2021 and harv=5 then dmpltyld=pltyld*0.306322; *convert fresh yield to dmyield;
  if yr=2021 and month='Sept 29' then harv=6; if yr=2021 and harv=6 then dmpltyld=pltyld*0.251458; *convert fresh yield to dmyield;
  if yr=2021 and month='Nov 12' then harv=7; if yr=2021 and harv=7 then dmpltyld=pltyld*0.254281; *convert fresh yield to dmyield;
  proc sort; by yr harv row range rep ent plot;
  *proc print;

data LC1921Na; set LC1921Nharvall;
  proc sort; by type yr harv row range plot;
  *proc print;

    *code below is for pairing up experimental plots with appropriate covariate plot;

data Lc1921Nb; set LC1921Na;
 if type='C' then delete;
 *entpltyld=pltyld;*use this to check for proper data formating;
 entdmyldTA=dmpltyld*0.418846154; *use 0.418846154 multiplier to convert pounds per plot to tons per acre (52ft2 plot size);
 drop dmpltyld;
 drop pltyld;
 proc sort; by yr harv row range;
 *proc print; 

data LC1921Nc; set LC1921Na;
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

data LC1921Nd; set LC1921Na;
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

data LC1921Nmerge; merge LC1921Nb LC1921Nc LC1921Nd ; by yr harv row range;
  if yr=. then delete;
  if harv=. then delete;
 proc sort; by yr harv plot ent;
 *proc print;

*___________________________2022 data infile setup_____________________________________________;
data LC1922Nharv1;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2022\Normal AVT\2022 Data\2019 Normal AVT data H1 4_28_22.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1922Nharv2;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2022\Normal AVT\2022 Data\2019 Normal AVT data H2 6_1_22.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1922Nharv3;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2022\Normal AVT\2022 Data\2019 Normal AVT data H3 6_30_22.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot fw fwfqyld pltyld  ;
  drop fw fwfqyld;
  proc sort; by plot;
  *proc print;

data LC1922Nharv4;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2022\Normal AVT\2022 Data\2019 Normal AVT data H4 7_27_22.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1922Nharv5;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2022\Normal AVT\2022 Data\2019 Normal AVT data H5 9_2_22.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1922Nharv6;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2022\Normal AVT\2022 Data\2019 Normal AVT data H6 10_21_22.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1922Nharvall; set LC1922Nharv1 LC1922Nharv2 LC1922Nharv3 LC1922Nharv4 LC1922Nharv5 LC1922Nharv6 ;
  if yr=. then delete;
  if yr=2022 and month='Apr 28' then harv=1; if yr=2022 and harv=1 then dmpltyld=pltyld*0.32565; *convert fresh yield to dmyield;
  if yr=2022 and month='Jun 1' then harv=2; if yr=2022 and harv=2 then dmpltyld=pltyld*0.34127; *convert fresh yield to dmyield;
  if yr=2022 and month='Jun 30' then harv=3; if yr=2022 and harv=3 then dmpltyld=pltyld*0.248984; *convert fresh yield to dmyield;
  if yr=2022 and month='Jul 27' then harv=4; if yr=2022 and harv=4 then dmpltyld=pltyld*0.284042; *convert fresh yield to dmyield;
  if yr=2022 and month='Sep 2' then harv=5; if yr=2022 and harv=5 then dmpltyld=pltyld*0.248422; *convert fresh yield to dmyield;
  if yr=2022 and month='Oct 21' then harv=6; if yr=2022 and harv=6 then dmpltyld=pltyld*0.325319; *convert fresh yield to dmyield;
  proc sort; by yr harv row range rep ent plot;
  *proc print;

data LC1922Na; set LC1922Nharvall;
  proc sort; by type yr harv row range plot;
  *proc print;

    *code below is for pairing up experimental plots with appropriate covariate plot;

data Lc1922Nb; set LC1922Na;
 if type='C' then delete;
 *entpltyld=pltyld;*use this to check for proper data formating;
 entdmyldTA=dmpltyld*0.418846154; *use 0.418846154 multiplier to convert pounds per plot to tons per acre (52ft2 plot size);
 drop dmpltyld;
 drop pltyld;
 proc sort; by yr harv row range;
 *proc print; 

data LC1922Nc; set LC1922Na;
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

data LC1922Nd; set LC1922Na;
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

data LC1922Nmerge; merge LC1922Nb LC1922Nc LC1922Nd ; by yr harv row range;
  if yr=. then delete;
  if harv=. then delete;
 proc sort; by yr harv plot ent;
 *proc print;

*___________________________2023 data infile setup_____________________________________________;
data LC1923Nharv2;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2023\Normal AVT\2023 Data\2019 Normal AVT data H2 6_2_2023.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1923Nharv3;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2023\Normal AVT\2023 Data\2019 Normal AVT data H3 6_30_2023.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot fw fwfqyld pltyld  ;
  drop fw fwfqyld;
  proc sort; by plot;
  *proc print;

data LC1923Nharv4;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2023\Normal AVT\2023 Data\2019 Normal AVT data H4 7_26_2023.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1923Nharv5;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2023\Normal AVT\2023 Data\2019 Normal AVT data H5 8_31_2023.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1923Nharv6;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2023\Normal AVT\2023 Data\2019 Normal AVT data H6 10_6_2023.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  proc sort; by plot;
  *proc print;

data LC1923Nharv7;
  options pagesize=60 linesize=80;
  infile 'C:\Yield\Las Cruces Studies\2019 AVT studies\2023\Normal AVT\2023 Data\2019 Normal AVT data H7 11_6_2023.txt' dsd dlm='09'x truncover;
  input yr month $ rep row range type $ ent plot pltyld ;
  if yr=. then delete;
  proc sort; by plot;
  *proc print;

  
data LC1923Nharvall; set LC1923Nharv2 LC1923Nharv3 LC1923Nharv4 LC1923Nharv5 LC1923Nharv6 LC1923Nharv7;
  if yr=. then delete;
   *convert fresh yield to dmyield;
  if yr=2023 and month='Jun-2' then harv=2; if yr=2023 and harv=2 then dmpltyld=pltyld*0.309274; *convert fresh yield to dmyield;
  if yr=2023 and month='Jun-30' then harv=3; if yr=2023 and harv=3 then dmpltyld=pltyld*0.262542; *convert fresh yield to dmyield;
  if yr=2023 and month='Jul-26' then harv=4; if yr=2023 and harv=4 then dmpltyld=pltyld*0.285916; *convert fresh yield to dmyield;
  if yr=2023 and month='Aug31' then harv=5; if yr=2023 and harv=5 then dmpltyld=pltyld*0.32713; *convert fresh yield to dmyield;
  if yr=2023 and month='Oct 6' then harv=6; if yr=2023 and harv=6 then dmpltyld=pltyld*0.265965; *convert fresh yield to dmyield;
  if yr=2023 and month='Nov 6' then harv=7; if yr=2023 and harv=7 then dmpltyld=pltyld*0.260971; *convert fresh yield to dmyield;
proc sort; by yr harv row range rep ent plot;
  *proc print;

data LC1923Na; set LC1923Nharvall;
  proc sort; by type yr harv row range plot;
  *proc print;

    *code below is for pairing up experimental plots with appropriate covariate plot;

data Lc1923Nb; set LC1923Na;
 if type='C' then delete;
 *entpltyld=pltyld;*use this to check for proper data formating;
 entdmyldTA=dmpltyld*0.418846154; *use 0.418846154 multiplier to convert pounds per plot to tons per acre (52ft2 plot size);
 drop dmpltyld;
 drop pltyld;
 proc sort; by yr harv row range;
 *proc print; 

data LC1923Nc; set LC1923Na;
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

data LC1923Nd; set LC1923Na;
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

data LC1923Nmerge; merge LC1923Nb LC1923Nc LC1923Nd ; by yr harv row range;
  if yr=. then delete;
  if harv=. then delete;
 proc sort; by yr harv plot ent;
 *proc print;

data LC19NSetname; set LC1920Nmerge LC1921Nmerge LC1922Nmerge LC1923Nmerge ;
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
data I1; set LC19NSetname;
if yr=2021 then delete;
if yr=2022 then delete;
if yr=2023 then delete;
*proc print;

*2021 data set;
data I2; set LC19NSetname;
if yr=2020 then delete;
if yr=2022 then delete;
if yr=2023 then delete;
*proc print;

*2022 data set;
data I3; set LC19Nsetname;
if yr=2020 then delete;
if yr=2021 then delete;
if yr=2023 then delete;
*proc print;

*2023 data set;
data I4; set LC19Nsetname;
if yr=2020 then delete;
if yr=2021 then delete;
if yr=2022 then delete;
*proc print;


*___________________________________2020________________________________________;

 *by harvest analysis for LC19 avt Normal in 2020;
/*
data LC1920NANCOVA; set I1;
  proc sort; by yr harv rep name;
 ods listing exclude Estfunc ExpectedmeanSquares RandomModelANOVA;
  proc glm; class rep name; by harv;
  model entdmyldTA = rep ckdmyldTA name /e1;
  *random rep /test;
  means name/lsd;
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
  June19=col1; drop col1;
  July22=col2; drop col2;
  Aug21=col3; drop col3;
  Sep15=col4; drop col4;
  Oct19=col5; drop col5;
  Nov17=col6; drop col6; 
  *proc print;
*/

  *Seasonal total yield analysis for LC19 avt Normal in 2020;
data LC1920Nmeans; set I1;
 proc sort; by name rep harv;
 proc means noprint data=LC1920Nmeans; by name rep;
  var entdmyldTA ckdmyldTA;
  output out=seasonalmeans20 sum=entdmyldTA ckdmyldTA;
  *proc print;

 data LC1920NANCOVA; set seasonalmeans20;
 proc sort; by rep name;
 ods listing exclude Estfunc ExpectedmeanSquares RandomModelANOVA;
  proc glm; class rep name; 
  model entdmyldTA = rep ckdmyldTA name /e1;
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
*/;

*________________________________________2021_________________________________;

 *by harvest analysis for LC19 avt Normal in 2021;
/*
 data LC1921NANCOVA; set I2;
  proc sort; by yr harv rep name;
 ods listing exclude Estfunc ExpectedmeanSquares RandomModelANOVA;
  proc glm; class rep name; by harv;
  model entdmyldTA = rep ckdmyldTA name /e1;
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
  May1=col1; drop col1;
  May27=col2; drop col2;
  June24=col3; drop col3;
  July22=col4; drop col4;
  Aug27=col5; drop col5;
  Sep29=col6; drop col6;
  nov12=col7; drop col7; 
  *proc print;
*/

  *Seasonal total yield analysis for LC19 avt Normal in 2021;
data LC1921Nmeans; set I2;
 proc sort; by name rep harv;
 proc means noprint data=LC1921Nmeans; by name rep;
  var entdmyldTA ckdmyldTA;
  output out=seasonalmeans21 sum=entdmyldTA ckdmyldTA;
  *proc print;

 data LC1921NANCOVA; set seasonalmeans21;
 proc sort; by rep name;
 ods listing exclude Estfunc ExpectedmeanSquares RandomModelANOVA;
  proc glm; class rep name; 
  model entdmyldTA = rep ckdmyldTA name /e1;
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

*________________________________________2022_________________________________;

 *by harvest analysis for LC19 avt Normal in 2022;
/*
 data LC1922NANCOVA; set I3;
  proc sort; by yr harv rep name;
 ods listing exclude Estfunc ExpectedmeanSquares RandomModelANOVA;
  proc glm; class rep name; by harv;
  model entdmyldTA = rep ckdmyldTA name /e1;
  *random rep /test;
  *means name/lsd;
  *lsmeans name/ lines tdiff alpha=0.05;
  title 'LC1922 lsmeans by harvest'; 
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
  apr28=col1; drop col1;
  jun1=col2; drop col2;
  jun30=col3; drop col3;
  jul27=col4; drop col4;
  sep2=col5; drop col5;
  oct21=col6; drop col6; 
  *proc print;
*/
  *Seasonal total yield analysis for LC19 avt Normal in 2022;
data LC1922Nmeans; set I3;
 proc sort; by name rep harv;
 proc means noprint data=LC1922Nmeans; by name rep;
  var entdmyldTA ckdmyldTA;
  output out=seasonalmeans22 sum=entdmyldTA ckdmyldTA;
  *proc print;

 data LC1922NANCOVAa; set seasonalmeans22;
 proc sort; by rep name;
 ods listing exclude Estfunc ExpectedmeanSquares RandomModelANOVA;
  proc glm; class rep name; 
  model entdmyldTA = rep ckdmyldTA name /e1;
  *random rep /test;
  means name/lsd;
  *lsmeans name/ lines tdiff alpha=0.05;
  title 'LC1921lsmeans seasonal total for 2022'; 
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

*________________________________________2023_________________________________;

 *by harvest analysis for LC19 avt Normal in 2023;

 data LC1923NANCOVA; set I4;
  proc sort; by yr harv rep name;
 ods listing exclude Estfunc ExpectedmeanSquares RandomModelANOVA;
  proc glm; class rep name; by harv;
  model entdmyldTA = rep ckdmyldTA name /e1;
  *random rep /test;
  means name/lsd;
  *lsmeans name/ lines tdiff alpha=0.05;
  title 'LC1923 lsmeans by harvest'; 
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
  jun6=col1; drop col1;
  jun30=col2; drop col2;
  jul26=col3; drop col3;
  aug31=col4; drop col4;
  oct6=col5; drop col5;
  nov6=col6; drop col6; 
  *proc print;

  *Seasonal total yield analysis for LC19 avt Normal in 2023;
data LC1923Nmeans; set I4;
 proc sort; by name rep harv;
 proc means noprint data=LC1923Nmeans; by name rep;
  var entdmyldTA ckdmyldTA;
  output out=seasonalmeans23 sum=entdmyldTA ckdmyldTA;
  *proc print;

 data LC1923NANCOVAa; set seasonalmeans23;
 proc sort; by rep name;
 ods listing exclude Estfunc ExpectedmeanSquares RandomModelANOVA;
  proc glm; class rep name; 
  model entdmyldTA = rep ckdmyldTA name /e1;
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

  *______________________________________Overyears______________________________________;

data LC19overyearsN; set I1 I2 I3 I4;
 proc sort; by yr name rep harv ;
 proc means noprint data=LC19overyearsN; by yr name rep ;
 var entdmyldTA ckdmyldTA ;
 output out=yldoveryears sum=entdmyldTA ckdmyldTA; by yr name rep;
*proc print; 

data N1; set yldoveryears;
  proc sort; by rep name yr;
  ods listing exclude Estfunc ExpectedMeanSquares RandomModelANOVA;
  proc glm; class rep name yr; 
  model entdmyldTA = rep ckdmyldTA name rep*name yr rep*yr yr*name /e1;
  random rep yr rep*name rep*yr yr*name /test;
  means name/lsd e=rep*name alpha=0.05;
  test H=name e=rep*name;
  title 'LC19N AVT over years 2020, 2021, 2022 and 2023';
  lsmeans name/out=overyearslsmeanout noprint;
 *proc print;
 
data N2; set overyearslsmeanout; 
  fouryravg=LSMEAN;  drop LSMEAN;
  *proc print; 

*Summary output table for LC19 avt in 2023;
data y; merge byharv23b  seasonaltotal20b seasonaltotal21b seasonaltotal22b seasonaltotal23b N2; by name;
  proc sort; by descending fouryravg;
  proc print; var name TOTAL2020 TOTAL2021 Total2022 jun6 jun30 Jul26 aug31 oct6 nov6 TOTAL2023 fouryravg;
  format TOTAL2020 TOTAL2021 Total2022 jun6 jun30 Jul26 aug31 oct6 nov6 TOTAL2023 fouryravg;
  title 'LC1923 summary output table';

data z; set y;
proc sort; by descending fouryravg;
format TOTAL2020 TOTAL2021 Total2022 jun6 jun30 Jul26 aug31 oct6 nov6 TOTAL2023 fouryravg;
title 'LC1923 summary output table';

run;
quit;


