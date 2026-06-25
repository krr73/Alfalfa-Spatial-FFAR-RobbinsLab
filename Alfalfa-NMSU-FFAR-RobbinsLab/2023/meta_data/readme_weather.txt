This folder contains weather data for the nearest weather station for
respective field trials. This is the User interface version
These were the IDs used for weather data of respective locations
SNY22 & SNY 23 -Ithaca, NY Station name:GHCND:USC00304174 
AUR22 & AUR 23 -Aurora, NY Station name GHCND:USC00300331 
NMSU22 & NMSU23 Farmington,NM CITY:US350006  

For NMSU, I (Dinesh) found many weather stations in the file(CUAUR_CUSNY_NMSU_2021_2023_weather) as below. 
But overall three locations: Farmington, Aztec and Bloomington. So, I am going to only select one closest to NMSU which after looking at the map is Farmington from NMSU agri station. Since we need temperature data, it won't matter much within different versions of Farmington or even between Farmington, Bloomfield and Aztec. 
SO going with weather station number (USC00293142) for Farmington Ag science center.

US1NMSJ0019 for farmington
US1NMSJ0049 for bloomfield
USC00293142 for FARMINGTON AG SCIENCE CNT, NM US
US1NMSJ0026 for FARMINGTON 3.0 NE, NM US
US1NMSJ0025 for FARMINGTON 1.4 WSW, NM US
US1NMSJ0047 for FARMINGTON 4.1 E, NM US
US1NMSJ0035 for AZTEC 2.3 WSW, NM US
US1NMSJ0046 for BLOOMFIELD 0.8 NE, NM US
US1NMSJ0056 for AZTEC 0.8 ESE, NM US
US1NMSJ0067 for FARMINGTON 1.3 WNW, NM US
US1NMSJ0042 for FARMINGTON 2.0 SW, NM US
US1NMSJ0041 for FARMINGTON 2.7 SSW, NM US
AND MANY MORE


To access go to this website and follow the instructions
https://www.ncdc.noaa.gov/cdo-web/ 
Here select data tools and then select your options like: weather station number, date range, daily summaries, variables (air temperature, ...). Only air temperature needed for GDD. 
OR directly here: https://www.ncei.noaa.gov/cdo-web/datatools/findstation . Then put Farmington, NM, 87401 as location. 
Once you set up which data/datasets you want, the results will be emailed to you

For the purposes of my data, I only need daily max and min temperatures to calculate
growing degree days(GDD). In the future weather data may used more explicitly for modeling phenotypic platiscity.
 Imagebreed can calculate GDD based on if the user included a GHCND in the field trial data, but it's a bit complicated
with perrenial field trial with repeated harvests in the year so 
I am calculating GDD manually.
