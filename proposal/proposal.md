Exploratory Analysis of School Shootings
================
Significantly Different
March 29, 2019

## Section 1. Introduction

Gun control has been an issue of huge debate in the United States: from
individuals claiming that the possession of guns is necessary to protect
one’s own safety to others who claim that it’s a “right” bestowed by the
constitution, “gun control” seems to imply different things to everyone.
With a huge market of gun sales being run by capitalism, it doesn’t seem
like any number of casualties caused by gun violence would be sufficient
to make up for the number of dollars a ban on guns would have on our
capitalist market—which is to some extent why we still have gun control
issues going on in the United States. Such issue of gun violence has
unfortunately been spilling into our schools, and school shootings has
become the issue of concern for teachers, school districts, and families
in hopes of never having to face such an incident. The lack of control
and support the government and community provided towards this issue has
unfortunately lead to schools carrying the burden of coming up with
preventive measures for school shootings to ensure students’ safety—a
high school in South Florida, for example, has brought up and
implemented the idea of a bullet-proof shelter to protect children from
harm, and another school in Texas asked the students to wear a clear
backpack to school. Despite such efforts, school shootings still
breakout, leading researchers and school officials to increasingly work
more to figure out the best ways to prevent school shootings from
occurring.

The aim of the current project is to look into data of school shootings
from the past to evaluate what factors correlate to higher number of
casualties in school shootings, in hopes that this analysis would help
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
under the codebook in the README
    file.

## Section 2. Data analysis plan

``` r
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────────────── tidyverse 1.2.1 ──

    ## ✔ ggplot2 3.1.0     ✔ purrr   0.2.5
    ## ✔ tibble  2.0.0     ✔ dplyr   0.7.8
    ## ✔ tidyr   0.8.2     ✔ stringr 1.3.1
    ## ✔ readr   1.3.1     ✔ forcats 0.3.0

    ## ── Conflicts ────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
school_shootings <- read_csv("../project/school-shootings-data.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   .default = col_character(),
    ##   uid = col_double(),
    ##   year = col_double(),
    ##   time = col_time(format = ""),
    ##   enrollment = col_number(),
    ##   killed = col_double(),
    ##   injured = col_double(),
    ##   casualties = col_double(),
    ##   age_shooter1 = col_double(),
    ##   shooter_deceased1 = col_double(),
    ##   age_shooter2 = col_double(),
    ##   shooter_deceased2 = col_double(),
    ##   white = col_number(),
    ##   black = col_double(),
    ##   hispanic = col_double(),
    ##   asian = col_double(),
    ##   american_indian_alaska_native = col_double(),
    ##   hawaiian_native_pacific_islander = col_double(),
    ##   two_or_more = col_double(),
    ##   resource_officer = col_double(),
    ##   lat = col_double()
    ##   # ... with 4 more columns
    ## )

    ## See spec(...) for full column specifications.

``` r
school_shootings %>%
  filter(!is.na(casualties)) %>%
  ggplot(mapping = aes(x = casualties)) +
  geom_histogram(binwidth = 1) +
  labs(title = "Distribution of casualties") +
  xlab("Casualties") +
  ylab("Frequency")
```

![](proposal_files/figure-gfm/summ-stats-1.png)<!-- -->

``` r
school_shootings %>%
  filter(!is.na(staffing)) %>%
  ggplot(mapping = aes(x = staffing)) +
  geom_histogram(binwidth = 5) +
  labs(title = "Distribution of number of full-time teachers", subtitle = "At each shooting") +
  xlab("Amount of teachers") +
  ylab("Frequency")
```

![](proposal_files/figure-gfm/staff-viz-1.png)<!-- -->

``` r
school_shootings %>%
  filter(!is.na(staffing)) %>%
  summarise(median_staff_num = median(staffing))
```

    ## # A tibble: 1 x 1
    ##   median_staff_num
    ##              <dbl>
    ## 1             54.5

We can also rank states by the number of school shootings that have
occurred there:

``` r
school_shootings %>%
  filter(!is.na(state)) %>%
  group_by(state) %>%
  count() %>%
  arrange(desc(n))
```

    ## # A tibble: 41 x 2
    ## # Groups:   state [41]
    ##    state              n
    ##    <chr>          <int>
    ##  1 California        28
    ##  2 Florida           17
    ##  3 Texas             14
    ##  4 Illinois          11
    ##  5 North Carolina    11
    ##  6 Pennsylvania      11
    ##  7 Louisiana         10
    ##  8 Ohio              10
    ##  9 Georgia            9
    ## 10 Michigan           8
    ## # … with 31 more rows

One more thing that would be interesting to see is the distribution of
the amount of students who qualify for free or reduced lunch.

``` r
school_shootings %>%
  filter(!is.na(lunch)) %>%
  ggplot(mapping = aes(x = lunch)) +
  geom_histogram()
```

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](proposal_files/figure-gfm/lunch-viz-1.png)<!-- -->

However, this might be misleading given that this is a raw number,
whereas a proportion would be more useful.

## Section 3. Data
