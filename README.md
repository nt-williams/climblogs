
# climblogs

<!-- badges: start -->
<!-- badges: end -->

The companion :package: to the ClimbOn shinyMobile app to import collected data into R. Must have direct access to the DropBox folder containing the data for use. 

## Installation

``` r
devtools::install_github("nt-williams/climblogs")
```

## Use

This is a basic example which shows you how to solve a common problem:

``` r
library(climblogs)

climbs()
#>   climber wall_height climb_grade ascend_style finish_climb          entry_date
#> 1    Nick         13m       5.11b      Toprope          Yes 2020-03-03 19:39:15
#> 2     Kat          9m         5.5      Toprope          Yes 2020-03-03 22:24:30
```

