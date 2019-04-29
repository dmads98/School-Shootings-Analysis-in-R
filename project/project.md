Exploratory Analysis of School Shootings
================
Significantly Different
March 29, 2018

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
