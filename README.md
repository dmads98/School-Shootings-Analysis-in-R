# project

Starter docs, code, and data for the final project.

https://www2.stat.duke.edu/courses/Spring19/sta199.001/project/project.html

Header	Description	Source
name	Name of deceased	Guardian
age	Age of deceased	Guardian
gender	Gender of deceased	Guardian
raceethnicity	Race/ethnicity of deceased	Guardian
month	Month of killing	Guardian
day	Day of incident	Guardian
year	Year of incident	Guardian
streetaddress	Address/intersection where incident occurred	Guardian
city	City where incident occurred	Guardian
state	State where incident occurred	Guardian
latitude	Latitude, geocoded from address	
longitude	Longitude, geocoded from address	
state_fp	State FIPS code	Census
county_fp	County FIPS code	Census
tract_ce	Tract ID code	Census
geo_id	Combined tract ID code	
county_id	Combined county ID code	
namelsad	Tract description	Census
lawenforcementagency	Agency involved in incident	Guardian
cause	Cause of death	Guardian
armed	How/whether deceased was armed	Guardian
pop	Tract population	Census
share_white	Share of pop that is non-Hispanic white	Census
share_bloack	Share of pop that is black (alone, not in combination)	Census
share_hispanic	Share of pop that is Hispanic/Latino (any race)	Census
p_income	Tract-level median personal income	Census
h_income	Tract-level median household income	Census
county_income	County-level median household income	Census
comp_income	h_income / county_income	Calculated from Census
county_bucket	Household income, quintile within county	Calculated from Census
nat_bucket	Household income, quintile nationally	Calculated from Census
pov	Tract-level poverty rate (official)	Census
urate	Tract-level unemployment rate	Calculated from Census
college	Share of 25+ pop with BA or higher	Calculated from Census
Note regarding income calculations:

All income fields are in inflation-adjusted 2013 dollars.

comp_income is simply tract-level median household income as a share of county-level median household income.

county_bucket provides where the tract's median household income falls in the distribution (by quintile) of all tracts in the county. (1 indicates a tract falls in the poorest 20% of tracts within the county.) Distribution is not weighted by population.

nat_bucket is the same but for all U.S. counties.
