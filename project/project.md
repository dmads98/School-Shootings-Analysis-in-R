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
them to percentages will be more useful and standardized.

### Multivariate Regression Analysis

These are the variables that we will include in our model. We will then
use model selection in order to find the most appropriate model to
perform predictions.

Variables:

`day_of_week` `black_percent` `white_percent` `hispanic_percent`
`asian_percent` `enrollment` `lunch_percent`

``` shooting_type```

```

## 

## Call:

## lm(formula = casualties ~ day\_of\_week + black\_percent + white\_percent,

## data = school\_shootings)

## 

## Coefficients:

## (Intercept) day\_of\_weekMonday day\_of\_weekThursday

## 1.5614 -0.1165 -0.7555

## day\_of\_weekTuesday day\_of\_weekWednesday black\_percent

## 0.4715 -0.2698 -0.8502

## white\_percent

## 1.7832

\`\`\`
