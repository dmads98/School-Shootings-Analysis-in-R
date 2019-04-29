Exploratory Analysis of School Shootings
Significantly Different
March 29, 2018

## Section 1. Introduction

Gun control has been an issue of huge debate in the United States: from
individuals claiming that the possession of guns is necessary to protect
one’s own safety to others who claim that it’s a “right” bestowed by the
constitution, gun control seems to imply different things to different
people. With a huge market of gun sales being run by capitalism, it
doesn’t seem like any number of casualties caused by gun violence will
be sufficient to make up for the monetary loss a ban on guns would have
on our capitalist market — which is to some extent why we still have gun
control issues going on in the United States. Such issue of gun violence
has unfortunately been spilling into our schools, and school shootings
have become the issue of concern for teachers, school districts, and
families in hopes of never having to face such an incident. The lack of
control and support the government and community provided towards this
issue has unfortunately lead to schools carrying the burden of coming up
with preventative measures to ensure their students’ safety — a high
school in South Florida, for example, has brought up and implemented the
idea of a bullet-proof shelter to protect children from harm, and
another school in Texas asked the students to wear a clear backpack to
school. Despite such efforts, school shootings still break out, leading
researchers and school officials to increasingly work more to figure out
the best ways to prevent school shootings from occurring.

The aim of the current project is to look into data of school shootings
from the past to evaluate what factors correlate to higher number of
casualties in school shootings, in hopes that this analysis will help
lead to preventive measures.

Throughout this project, our team will look into the
`schools-shootings-data.csv` as provided by the Washington Post. The
data consists of any act of gunfire at schools (primary, secondary) that
occurred during school hours, or immediately before or after hours,
since the Columbine High massacre on April 20, 1999. As such, 221
incidences of school shootings have been included in the dataset. The
data was collected by using “Nexis, news articles, open-source
databases, law enforcement reports, information from school websites,
and calls to schools and police departments”, as according to Washington
Post. The variables included in this data are as follows:

uid, nces\_school\_id, school\_name, nces\_district\_id, district\_name,
date, school\_year, year, time, day\_of\_week, city, state,
school\_type, enrollment, killed, injured, casualties, shooting\_type,
age\_shooter1, gender\_shooter1, race\_ethnicity\_shooter1,
shooter\_relationship1, shooter\_deceased1, deceased\_notes1,
age\_shooter2, gender\_shooter2, race\_ethnicity\_shooter2,
shooter\_relationship2, shooter\_deceased2, deceased\_notes2, white,
black, Hispanic, Asian, American\_indian\_alaska\_native,
Hawaiian\_native\_pacific\_islander, two\_or\_more, resource\_officer,
weapon, weapon\_source, lat, long, staffing, low\_grade, high\_grade,
lunch, county, state\_fips, county\_fips, ulocale

More information on the description of these variables can be found
under the codebook in the `data` folder.

## Section 2. Data Analysis

### Mutation of Variables

We begin by manipulating some of our variables in order to make them
more useful. For example, many of our variables are raw and thus,
converting them to percentages will be more useful and standardized.

We create the following variables:

<center>

`white_percent` `black_percent` `hispanic_percent` `asian_percent`

``` lunch_percent```

</center>

### Frequency of Annual School Shootings

![](project_files/figure-gfm/quan-shootings-1.png)<!-- -->

### Number of Casualties Across the Years

![](project_files/figure-gfm/freq-casualties-1.png)<!-- -->

### Distribution of Casualties

![](project_files/figure-gfm/dist-casualties-1.png)<!-- -->

### Popular Types of Shootings

```

## \# A tibble: 10 x 2

## \# Groups: shooting\_type \[10\]

## shooting\_type n

## <chr> <int>

## 1 targeted 140

## 2 indiscriminate 45

## 3 accidental 28

## 4 unclear 9

## 5 targeted and indiscriminate 6

## 6 public suicide 4

## 7 accidental or targeted 2

## 8 hostage suicide 2

## 9 public suicide (attempted) 1

## 10 <NA> 1

``` 
Most of the shootings in our dataset were categorized as targeted.

### Popular Days

```

## \# A tibble: 5 x 2

## \# Groups: day\_of\_week \[5\]

## day\_of\_week n

## <chr> <int>

## 1 Tuesday 55

## 2 Wednesday 53

## 3 Monday 48

## 4 Friday 45

## 5 Thursday 37

\`\`\`

There seems to be minimal difference in the number of shootings among
days of the week, but Tuesday and Wednesday are the days with the most
school shootings taking place.

### Multivariate Regression Analysis

These are the variables that we will include in our model:

<center>

`enrollment` `factor(shooting_type)` `staffing` `white_percent`
`black_percent` `hispanic_percent` `asian_percent` `lunch_percent`
`factor(resource_officer)` `factor(day_of_week)`

</center>

### Model Creation and Backwards Selection

First, we eliminate variables that will not be useful in our model, such
as those used for logistical purposes.

### Full Model

We first create a full model, which includes all potential variables.
The `step()` function automates the backwards selection process for us.

<center>

`casualties ~ enrollment + factor(shooting_type) + staffing +
white_percent + black_percent + hispanic_percent + asian_percent +
lunch_percent + factor(resource_officer) + factor(day_of_week)`

</center>

The perfect model is shown below:

`casualties ~ enrollment + factor(shooting_type) + staffing +
lunch_percent + factor(resource_officer)`

Its adjusted r-squared value is 0.1699588.

### Testing of Model

### Conclusion

Our analysis found that the best model included the variables
`enrollment``,`shooting\_type`,`staffing`,`lunch\_percent`and`resource\_officer\`\`\`.
