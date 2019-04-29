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
`lunch_percent`

</center>

### Frequency of Annual School Shootings

![](project_files/figure-gfm/quan-shootings-1.png)<!-- -->

### Number of Casualties Across the Years

![](project_files/figure-gfm/freq-casualties-1.png)<!-- -->

### Distribution of Casualties

![](project_files/figure-gfm/dist-casualties-1.png)<!-- -->

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

`casualties ~ enrollment + factor(shooting_type) + staffing +
white_percent + black_percent + hispanic_percent + asian_percent +
lunch_percent + factor(resource_officer) + factor(day_of_week) +
(enrollment * staffing) + (lunch_percent * factor(resource_officer))`

### Backwards Selection

The perfect model is shown below:

`casualties ~ enrollment + staffing + lunch_percent +
factor(resource_officer) + enrollment:staffing +
lunch_percent:factor(resource_officer) + factor(shooting_type)`

Its adjusted r-squared value is 0.1979681.
