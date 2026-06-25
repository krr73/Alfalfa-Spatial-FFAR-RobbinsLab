This folder contains weather data for the nearest weather station for
respective field trials. This is the User interface version
These were the IDs used for weather data of respective locations
SNY22 & SNY 23 -Ithaca, NY Station name:GHCND:USC00304174 
AUR22 & AUR 23 -Aurora, NY Station name GHCND:USC00300331

For NY, I (Dinesh) used zip-code for the weather data. To access go to this website and follow the instructions
ttps://www.ncei.noaa.gov/cdo-web/search.
- Search Tools
- Date Range ( select 2022-2023: can filter later)
- Daily summaries
- Station
- Station Name
- Add to cart
- Open cart
- Fill information (csv, date range, continue, station, Units(metric))
- Select air temp (check max min..)
- continue
- check info and Submit through your email.
- Open email > file > download

Here select search tools and then select your options like: weather station number, date range, daily summaries, variables (air temperature, ...). Only air temperature needed for GDD. 
Once you set up which data/datasets you want (select Air temp(max, min), the results will be emailed to you. Then open the email, go to file Download and click it. 

For the purposes of my data, I only need daily max and min temperatures to calculate
growing degree days(GDD). In the future weather data may used more explicitly for modeling phenotypic platiscity.
 Imagebreed can calculate GDD based on if the user included a GHCND in the field trial data, but it's a bit complicated
with perrenial field trial with repeated harvests in the year so 
I am calculating GDD manually.

https://www.ncei.noaa.gov/cdo-web/search?datasetid=GHCND