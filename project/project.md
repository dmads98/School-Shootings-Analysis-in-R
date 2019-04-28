Exploratory Analysis of School Shootings
================
Significantly Different
March 29, 2018

### Frequency of Annual School Shootings

![](project_files/figure-gfm/quan-shootings-1.png)<!-- -->

### Number of Casualties Across the Years

![](project_files/figure-gfm/freq-casualties-1.png)<!-- --> \#\#\#
Distribution of Casualties

![](project_files/figure-gfm/dist-casualties-1.png)<!-- -->

### Popular Types of Shootings

    ## # A tibble: 10 x 2
    ## # Groups:   shooting_type [10]
    ##    shooting_type                   n
    ##    <chr>                       <int>
    ##  1 targeted                      140
    ##  2 indiscriminate                 45
    ##  3 accidental                     28
    ##  4 unclear                         9
    ##  5 targeted and indiscriminate     6
    ##  6 public suicide                  4
    ##  7 accidental or targeted          2
    ##  8 hostage suicide                 2
    ##  9 public suicide (attempted)      1
    ## 10 <NA>                            1

Most of the shootings in our dataset were categorized as targeted.

### Popular Days

    ## # A tibble: 5 x 2
    ## # Groups:   day_of_week [5]
    ##   day_of_week     n
    ##   <chr>       <int>
    ## 1 Tuesday        55
    ## 2 Wednesday      53
    ## 3 Monday         48
    ## 4 Friday         45
    ## 5 Thursday       37

There seems to be minimal difference in the number of shootings among
days of the week, but Tuesday and Wednesday are the days with the most
school shootings taking place.

### Mutation of Variables

We wanted to manipulate some of our variables in order to make them more
useful. For example, many of our variables are raw and thus, converting
them to percentages will be more useful and
    standardized.

    ## Warning in 6:0:0: numerical expression has 7 elements: only the first used

    ## Warning in 12:0:0: numerical expression has 13 elements: only the first
    ## used

    ## Warning in `<.default`(time, 12:0:0): longer object length is not a
    ## multiple of shorter object length

    ## Warning in 12:0:0: numerical expression has 13 elements: only the first
    ## used

    ## Warning in `>=.default`(time, 12:0:0): longer object length is not a
    ## multiple of shorter object length

    ## Warning in 18:0:0: numerical expression has 19 elements: only the first
    ## used

    ## Warning in `>=.default`(time, 18:0:0): longer object length is not a
    ## multiple of shorter object length

    ## Warning in 18:0:0: numerical expression has 19 elements: only the first
    ## used

    ## Warning in `>.default`(time, 18:0:0): longer object length is not a
    ## multiple of shorter object length

    ## # A tibble: 238 x 56
    ##      uid nces_school_id school_name nces_district_id district_name date 
    ##    <dbl> <chr>          <chr>       <chr>            <chr>         <chr>
    ##  1     1 080480000707   Columbine … 0804800          Jefferson Co… 4/20…
    ##  2     2 220054000422   Scotlandvi… 2200540          East Baton R… 4/22…
    ##  3     3 130441001591   Heritage H… 1304410          Rockdale Cou… 5/20…
    ##  4     4 421899003847   John Bartr… 4218990          Philadelphia… 10/4…
    ##  5     5 250279000225   Dorchester… 2502790          Boston        11/3…
    ##  6     6 350069000240   Deming Mid… 3500690          Deming Publi… 11/1…
    ##  7     7 401197000559   Fort Gibso… 4011970          Fort Gibson   12/6…
    ##  8     8 120153001590   Ridgewood … 1201530          Pasco         1/19…
    ##  9     9 062460009581   Alicia Rey… 0624600          Merced City … 1/26…
    ## 10    10 170993000748   Duke Ellin… 1709930          City of Chic… 2/14…
    ## # … with 228 more rows, and 50 more variables: school_year <chr>,
    ## #   year <dbl>, time <time>, day_of_week <chr>, city <chr>, state <chr>,
    ## #   school_type <chr>, enrollment <dbl>, killed <dbl>, injured <dbl>,
    ## #   casualties <dbl>, shooting_type <chr>, age_shooter1 <dbl>,
    ## #   gender_shooter1 <chr>, race_ethnicity_shooter1 <chr>,
    ## #   shooter_relationship1 <chr>, shooter_deceased1 <dbl>,
    ## #   deceased_notes1 <chr>, age_shooter2 <dbl>, gender_shooter2 <chr>,
    ## #   race_ethnicity_shooter2 <chr>, shooter_relationship2 <chr>,
    ## #   shooter_deceased2 <dbl>, deceased_notes2 <chr>, white <dbl>,
    ## #   black <dbl>, hispanic <dbl>, asian <dbl>,
    ## #   american_indian_alaska_native <dbl>,
    ## #   hawaiian_native_pacific_islander <dbl>, two_or_more <dbl>,
    ## #   resource_officer <dbl>, weapon <chr>, weapon_source <chr>, lat <dbl>,
    ## #   long <dbl>, staffing <dbl>, low_grade <chr>, high_grade <chr>,
    ## #   lunch <dbl>, county <chr>, state_fips <chr>, county_fips <chr>,
    ## #   ulocale <dbl>, white_percent <dbl>, black_percent <dbl>,
    ## #   hispanic_percent <dbl>, asian_percent <dbl>, lunch_percent <dbl>,
    ## #   time_of_day <chr>

### Multivariate Regression Analysis

These are the variables that we will include in our model. We will then
use model selection in order to find the most appropriate model to
perform predictions.

  - Eliminate useless variables:

### Full Model

Going to start by creating a model with all variables and then
performing model selection to find the perfect model.

    ## Start:  AIC=590.14
    ## casualties ~ enrollment + factor(shooting_type) + staffing + 
    ##     white_percent + black_percent + hispanic_percent + asian_percent + 
    ##     lunch_percent + factor(resource_officer) + factor(day_of_week)
    ## 
    ##                            Df Sum of Sq    RSS    AIC
    ## - factor(day_of_week)       4     57.03 3183.9 585.74
    ## - asian_percent             1     18.81 3145.7 589.34
    ## <none>                                  3126.9 590.14
    ## - hispanic_percent          1     34.76 3161.7 590.34
    ## - white_percent             1     38.33 3165.2 590.57
    ## - staffing                  1     38.33 3165.2 590.57
    ## - black_percent             1     43.45 3170.4 590.89
    ## - enrollment                1     46.58 3173.5 591.09
    ## - lunch_percent             1     58.24 3185.2 591.82
    ## - factor(resource_officer)  1     83.05 3210.0 593.36
    ## - factor(shooting_type)     8    442.99 3569.9 600.51
    ## 
    ## Step:  AIC=585.74
    ## casualties ~ enrollment + factor(shooting_type) + staffing + 
    ##     white_percent + black_percent + hispanic_percent + asian_percent + 
    ##     lunch_percent + factor(resource_officer)
    ## 
    ##                            Df Sum of Sq    RSS    AIC
    ## - asian_percent             1     11.50 3195.4 584.46
    ## - hispanic_percent          1     22.81 3206.8 585.16
    ## - white_percent             1     28.37 3212.3 585.51
    ## <none>                                  3183.9 585.74
    ## - black_percent             1     32.24 3216.2 585.75
    ## - staffing                  1     34.03 3218.0 585.86
    ## - enrollment                1     35.83 3219.8 585.97
    ## - lunch_percent             1     57.59 3241.5 587.31
    ## - factor(resource_officer)  1     92.57 3276.5 589.44
    ## - factor(shooting_type)     8    441.14 3625.1 595.56
    ## 
    ## Step:  AIC=584.46
    ## casualties ~ enrollment + factor(shooting_type) + staffing + 
    ##     white_percent + black_percent + hispanic_percent + lunch_percent + 
    ##     factor(resource_officer)
    ## 
    ##                            Df Sum of Sq    RSS    AIC
    ## - hispanic_percent          1     11.79 3207.2 583.19
    ## - white_percent             1     16.88 3212.3 583.51
    ## - black_percent             1     20.97 3216.4 583.76
    ## - enrollment                1     31.03 3226.5 584.38
    ## <none>                                  3195.4 584.46
    ## - staffing                  1     32.47 3227.9 584.47
    ## - lunch_percent             1     52.08 3247.5 585.68
    ## - factor(resource_officer)  1    103.35 3298.8 588.79
    ## - factor(shooting_type)     8    467.60 3663.0 595.64
    ## 
    ## Step:  AIC=583.19
    ## casualties ~ enrollment + factor(shooting_type) + staffing + 
    ##     white_percent + black_percent + lunch_percent + factor(resource_officer)
    ## 
    ##                            Df Sum of Sq    RSS    AIC
    ## - white_percent             1      5.13 3212.4 581.51
    ## - black_percent             1     11.33 3218.6 581.89
    ## - enrollment                1     28.01 3235.2 582.92
    ## - staffing                  1     31.63 3238.8 583.14
    ## <none>                                  3207.2 583.19
    ## - lunch_percent             1     52.59 3259.8 584.43
    ## - factor(resource_officer)  1    109.62 3316.8 587.88
    ## - factor(shooting_type)     8    490.35 3697.6 595.50
    ## 
    ## Step:  AIC=581.51
    ## casualties ~ enrollment + factor(shooting_type) + staffing + 
    ##     black_percent + lunch_percent + factor(resource_officer)
    ## 
    ##                            Df Sum of Sq    RSS    AIC
    ## - black_percent             1      6.33 3218.7 579.90
    ## <none>                                  3212.4 581.51
    ## - staffing                  1     33.06 3245.4 581.55
    ## - enrollment                1     34.09 3246.4 581.61
    ## - lunch_percent             1     50.16 3262.5 582.59
    ## - factor(resource_officer)  1    104.58 3316.9 585.88
    ## - factor(shooting_type)     8    485.23 3697.6 593.50
    ## 
    ## Step:  AIC=579.9
    ## casualties ~ enrollment + factor(shooting_type) + staffing + 
    ##     lunch_percent + factor(resource_officer)
    ## 
    ##                            Df Sum of Sq    RSS    AIC
    ## <none>                                  3218.7 579.90
    ## - staffing                  1     38.93 3257.6 580.29
    ## - enrollment                1     40.95 3259.6 580.42
    ## - lunch_percent             1     88.00 3306.7 583.27
    ## - factor(resource_officer)  1     99.73 3318.4 583.97
    ## - factor(shooting_type)     8    510.15 3728.8 593.18

    ## [1] 0.1699588

The perfect model is shown below:

`casualties ~ enrollment + factor(shooting_type) + staffing +
lunch_percent + factor(resource_officer)`

Its adjusted r-squared value is 0.1699588.
